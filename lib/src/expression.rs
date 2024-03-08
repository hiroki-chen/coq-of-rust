use crate::coq;
use crate::env::*;
use crate::path::*;
use crate::pattern::*;
use crate::render::*;
use crate::ty::*;
use core::panic;
use rustc_middle::query::plumbing::IntoQueryParam;
use std::rc::Rc;

/// Struct [FreshVars] represents a set of fresh variables
#[derive(Debug)]
pub(crate) struct FreshVars(u64);

impl FreshVars {
    pub(crate) fn new() -> Self {
        FreshVars(0)
    }

    fn next(&self) -> (String, Self) {
        (format!("α{}", self.0), FreshVars(self.0 + 1))
    }
}

/// Struct [MatchArm] represents a pattern-matching branch: [pat] is the
/// matched pattern and [body] the expression on which it is mapped
#[derive(Debug, Eq, Hash, PartialEq)]
pub(crate) struct MatchArm {
    pub(crate) pattern: Rc<Pattern>,
    pub(crate) body: Rc<Expr>,
}

/// [LoopControlFlow] represents the expressions responsible for
/// the flow of control in a loop
#[derive(Clone, Copy, Debug, Eq, Hash, PartialEq)]
pub(crate) enum LoopControlFlow {
    Continue,
    Break,
}

#[derive(Clone, Copy, Debug, Eq, Hash, PartialEq)]
pub(crate) enum Purity {
    Pure,
    Effectful,
}

#[derive(Debug, Eq, Hash, PartialEq)]
pub(crate) struct LiteralInteger {
    pub(crate) name: String,
    pub(crate) negative_sign: bool,
    pub(crate) value: u128,
}

#[derive(Debug, Eq, Hash, PartialEq)]
pub(crate) enum Literal {
    Bool(bool),
    Integer(LiteralInteger),
    Char(char),
    String(String),
    Error,
}

#[derive(Debug, Eq, Hash, PartialEq)]
pub(crate) struct Expr {
    pub(crate) kind: Rc<ExprKind>,
    pub(crate) ty: Option<Rc<CoqType>>,
}

/// Enum [ExprKind] represents the AST of rust terms.
#[derive(Debug, Eq, Hash, PartialEq)]
pub(crate) enum ExprKind {
    Pure(Rc<Expr>),
    LocalVar(String),
    Var(Path),
    GetFunction(Path),
    Constructor(Path),
    VarWithTy {
        path: Path,
        ty_name: String,
        ty: Rc<CoqType>,
    },
    TraitMethod {
        trait_name: Path,
        method_name: String,
        self_and_generic_tys: Vec<(String, Rc<CoqType>)>,
    },
    AssociatedFunction {
        ty: Rc<CoqType>,
        func: String,
    },
    Literal(Literal),
    Call {
        func: Rc<Expr>,
        args: Vec<Rc<Expr>>,
        purity: Purity,
        from_user: bool,
    },
    /// An operator that takes one argument that is supposed to be in monadic
    /// form once the monadic translation is done.
    MonadicOperator {
        name: String,
        arg: Rc<Expr>,
    },
    Lambda {
        args: Vec<(String, Option<Rc<CoqType>>)>,
        body: Rc<Expr>,
        is_for_match: bool,
    },
    Array {
        elements: Vec<Rc<Expr>>,
    },
    Tuple {
        elements: Vec<Rc<Expr>>,
    },
    Let {
        is_monadic: bool,
        name: Option<String>,
        init: Rc<Expr>,
        body: Rc<Expr>,
    },
    If {
        condition: Rc<Expr>,
        success: Rc<Expr>,
        failure: Rc<Expr>,
    },
    Loop {
        body: Rc<Expr>,
    },
    Match {
        scrutinee: Rc<Expr>,
        arms: Vec<Rc<MatchArm>>,
    },
    Index {
        base: Rc<Expr>,
        index: Rc<Expr>,
    },
    ControlFlow(LoopControlFlow),
    StructStruct {
        path: Path,
        fields: Vec<(String, Rc<Expr>)>,
        base: Option<Rc<Expr>>,
        struct_or_variant: StructOrVariant,
    },
    StructTuple {
        path: Path,
        fields: Vec<Rc<Expr>>,
        struct_or_variant: StructOrVariant,
    },
    StructUnit {
        path: Path,
        struct_or_variant: StructOrVariant,
    },
    Use(Rc<Expr>),
    Return(Rc<Expr>),
    /// Useful for error messages or annotations
    Message(String),
}

impl ExprKind {
    pub(crate) fn tt() -> Rc<Self> {
        Rc::new(ExprKind::LocalVar("tt".to_string())).alloc(Some(CoqType::unit()))
    }
}

impl Expr {
    /// The Coq value [tt] (the inhabitant of the [unit] type) is used as default
    /// value
    pub(crate) fn tt() -> Rc<Self> {
        Rc::new(Expr {
            kind: ExprKind::tt(),
            ty: Some(CoqType::unit().val()),
        })
    }

    pub(crate) fn local_var(name: &str) -> Rc<Expr> {
        Rc::new(Expr {
            kind: Rc::new(ExprKind::LocalVar(name.to_string())),
            ty: None,
        })
    }

    pub(crate) fn has_return(&self) -> bool {
        match self.kind.as_ref() {
            ExprKind::Pure(expr) => expr.has_return(),
            ExprKind::LocalVar(_) => false,
            ExprKind::Var(_) => false,
            ExprKind::GetFunction(_) => false,
            ExprKind::Constructor(_) => false,
            ExprKind::VarWithTy {
                path: _,
                ty_name: _,
                ty: _,
            } => false,
            ExprKind::TraitMethod { .. } => false,
            ExprKind::AssociatedFunction { ty: _, func: _ } => false,
            ExprKind::Literal(_) => false,
            ExprKind::Call {
                func,
                args,
                purity: _,
                from_user: _,
            } => func.has_return() || args.iter().any(|arg| arg.has_return()),
            ExprKind::MonadicOperator { name: _, arg } => arg.has_return(),
            ExprKind::Lambda {
                args: _,
                body,
                is_for_match,
            } => *is_for_match && body.has_return(),
            ExprKind::Array { elements } => elements.iter().any(|element| element.has_return()),
            ExprKind::Tuple { elements } => elements.iter().any(|element| element.has_return()),
            ExprKind::Let {
                is_monadic: _,
                name: _,
                init,
                body,
            } => init.has_return() || body.has_return(),
            ExprKind::If {
                condition,
                success,
                failure,
            } => condition.has_return() || success.has_return() || failure.has_return(),
            ExprKind::Loop { body } => body.has_return(),
            ExprKind::Match { scrutinee, arms } => {
                scrutinee.has_return() || arms.iter().any(|arm| arm.body.has_return())
            }
            ExprKind::Index { base, index } => base.has_return() || index.has_return(),
            ExprKind::ControlFlow(_) => false,
            ExprKind::StructStruct {
                path: _,
                fields,
                base,
                struct_or_variant: _,
            } => {
                fields.iter().any(|(_, field)| field.has_return())
                    || base.iter().any(|base| base.has_return())
            }
            ExprKind::StructTuple {
                path: _,
                fields,
                struct_or_variant: _,
            } => fields.iter().any(|field| field.has_return()),
            ExprKind::StructUnit {
                path: _,
                struct_or_variant: _,
            } => false,
            ExprKind::Use(expr) => expr.has_return(),
            ExprKind::Return(_) => true,
            ExprKind::Message(_) => false,
        }
    }
}

fn pure(e: Rc<Expr>) -> Rc<Expr> {
    Rc::new(Expr {
        ty: e.ty.clone(),
        kind: Rc::new(ExprKind::Pure(e)),
    })
}

/// creates a monadic let statement with [e1] as the initializer
/// and the result of [f] as the body
fn monadic_let_in_stmt(
    fresh_vars: FreshVars,
    e1: Rc<Expr>,
    f: impl FnOnce(FreshVars, Rc<Expr>) -> (Rc<Expr>, FreshVars),
) -> (Rc<Expr>, FreshVars) {
    match e1.kind.as_ref() {
        ExprKind::Pure(e) => f(fresh_vars, e.clone()),
        ExprKind::Let {
            is_monadic,
            name,
            init,
            body,
        } => {
            let (body, fresh_vars) = monadic_let_in_stmt(fresh_vars, body.clone(), f);
            (
                Rc::new(Expr {
                    ty: body.ty.clone(),
                    kind: Rc::new(ExprKind::Let {
                        is_monadic: *is_monadic,
                        name: name.clone(),
                        init: init.clone(),
                        body,
                    }),
                }),
                fresh_vars,
            )
        }
        _ => {
            let (var_name, fresh_vars) = fresh_vars.next();
            let (body, fresh_vars) = f(
                fresh_vars,
                Rc::new(Expr {
                    kind: Rc::new(ExprKind::LocalVar(var_name.clone())),
                    ty: None,
                }),
            );
            (
                Rc::new(Expr {
                    ty: body.ty.clone(),
                    kind: Rc::new(ExprKind::Let {
                        is_monadic: true,
                        name: Some(var_name),
                        init: e1,
                        body,
                    }),
                }),
                fresh_vars,
            )
        }
    }
}

fn monadic_let(
    fresh_vars: FreshVars,
    e1: Rc<Expr>,
    f: impl FnOnce(FreshVars, Rc<Expr>) -> (Rc<Expr>, FreshVars),
) -> (Rc<Expr>, FreshVars) {
    let (e1, fresh_vars) = mt_expression(fresh_vars, e1);
    monadic_let_in_stmt(fresh_vars, e1, f)
}

fn monadic_optional_let(
    fresh_vars: FreshVars,
    e1: Option<Rc<Expr>>,
    f: impl FnOnce(FreshVars, Option<Rc<Expr>>) -> (Rc<Expr>, FreshVars),
) -> (Rc<Expr>, FreshVars) {
    match e1 {
        None => f(fresh_vars, None),
        Some(e1) => monadic_let(fresh_vars, e1, |fresh_vars, e1| f(fresh_vars, Some(e1))),
    }
}

type DynLetFn = Box<dyn FnOnce(FreshVars, Vec<Rc<Expr>>) -> (Rc<Expr>, FreshVars)>;

fn monadic_lets(fresh_vars: FreshVars, es: Vec<Rc<Expr>>, f: DynLetFn) -> (Rc<Expr>, FreshVars) {
    match &es[..] {
        [] => f(fresh_vars, vec![]),
        [e1, es @ ..] => monadic_let(fresh_vars, e1.clone(), |fresh_vars, e1| {
            monadic_lets(
                fresh_vars,
                es.to_vec(),
                Box::new(|fresh_vars, es| f(fresh_vars, [vec![e1], es].concat())),
            )
        }),
    }
}

/// Monadic translation of an expression
///
/// The convention is to do transformation in a deep first fashion, so
/// all functions dealing with monadic translation expect that their
/// arguments already have been transformed. Not respecting this rule
/// may lead to infinite loops because of the mutual recursion between
/// the functions. In practice this means translating every sub-expression
/// before translating the expression itself.
pub(crate) fn mt_expression(fresh_vars: FreshVars, expr: Rc<Expr>) -> (Rc<Expr>, FreshVars) {
    let ty = expr.ty.clone().map(mt_ty);

    match expr.kind.as_ref() {
        ExprKind::Pure(_) => panic!("Expressions should not be monadic yet."),
        ExprKind::LocalVar(_) => (pure(expr), fresh_vars),
        ExprKind::Var(_) => (expr, fresh_vars),
        ExprKind::GetFunction(_) => (expr, fresh_vars),
        ExprKind::Constructor(_) => (pure(expr), fresh_vars),
        ExprKind::VarWithTy {
            path,
            ty_name,
            ty: var_ty,
        } => (
            pure(Rc::new(Expr {
                kind: Rc::new(ExprKind::VarWithTy {
                    path: path.clone(),
                    ty_name: ty_name.clone(),
                    ty: mt_ty(var_ty.clone()),
                }),
                ty,
            })),
            fresh_vars,
        ),
        ExprKind::TraitMethod {
            trait_name,
            method_name,
            self_and_generic_tys,
        } => (
            Rc::new(Expr {
                kind: Rc::new(ExprKind::TraitMethod {
                    trait_name: trait_name.clone(),
                    method_name: method_name.clone(),
                    self_and_generic_tys: self_and_generic_tys
                        .iter()
                        .map(|(name, ty)| (name.clone(), mt_ty(ty.clone())))
                        .collect(),
                }),
                ty,
            }),
            fresh_vars,
        ),
        ExprKind::AssociatedFunction { .. } => (pure(expr.clone()), fresh_vars),
        ExprKind::Literal { .. } => (pure(expr.clone()), fresh_vars),
        ExprKind::Call {
            func,
            args,
            purity,
            from_user,
        } => {
            let purity = *purity;
            let from_user = *from_user;

            monadic_let(fresh_vars, func.clone(), |fresh_vars, func| {
                monadic_lets(
                    fresh_vars,
                    args.clone(),
                    Box::new(move |fresh_vars, args| {
                        (
                            {
                                let call = Rc::new(Expr {
                                    kind: Rc::new(ExprKind::Call {
                                        func: func.clone(),
                                        args,
                                        purity,
                                        from_user,
                                    }),
                                    ty,
                                });

                                match purity {
                                    Purity::Pure => pure(call),
                                    Purity::Effectful => call,
                                }
                            },
                            fresh_vars,
                        )
                    }),
                )
            })
        }
        ExprKind::MonadicOperator { name, arg } => {
            let (arg, fresh_vars) = mt_expression(fresh_vars, arg.clone());
            (
                Rc::new(Expr {
                    kind: Rc::new(ExprKind::MonadicOperator {
                        name: name.clone(),
                        arg,
                    }),
                    ty,
                }),
                fresh_vars,
            )
        }
        ExprKind::Lambda {
            args,
            body,
            is_for_match,
        } => {
            let (body, _) = mt_expression(FreshVars::new(), body.clone());
            (
                pure(Rc::new(Expr {
                    kind: Rc::new(ExprKind::Lambda {
                        args: args.clone(),
                        body,
                        is_for_match: *is_for_match,
                    }),
                    ty,
                })),
                fresh_vars,
            )
        }
        ExprKind::Array { elements } => monadic_lets(
            fresh_vars,
            elements.clone(),
            Box::new(|fresh_vars, elements| {
                (
                    pure(Rc::new(Expr {
                        kind: Rc::new(ExprKind::Array { elements }),
                        ty,
                    })),
                    fresh_vars,
                )
            }),
        ),
        ExprKind::Tuple { elements } => monadic_lets(
            fresh_vars,
            elements.clone(),
            Box::new(|fresh_vars, elements| {
                (
                    pure(Rc::new(Expr {
                        kind: Rc::new(ExprKind::Tuple { elements }),
                        ty,
                    })),
                    fresh_vars,
                )
            }),
        ),
        ExprKind::Let {
            is_monadic,
            name,
            init,
            body,
        } => {
            if *is_monadic {
                panic!("The let statement should not be monadic yet.")
            }
            let (init, _fresh_vars) = mt_expression(FreshVars::new(), init.clone());
            let (body, _fresh_vars) = mt_expression(FreshVars::new(), body.clone());
            let pure_init: Option<Rc<Expr>> = get_pure_from_stmt(init.clone());
            (
                match pure_init {
                    Some(pure_init) => Rc::new(Expr {
                        kind: Rc::new(ExprKind::Let {
                            is_monadic: false,
                            name: name.clone(),
                            init: pure_init,
                            body,
                        }),
                        ty,
                    }),
                    None => Rc::new(Expr {
                        kind: Rc::new(ExprKind::Let {
                            is_monadic: true,
                            name: name.clone(),
                            init,
                            body,
                        }),
                        ty,
                    }),
                },
                fresh_vars,
            )
        }
        ExprKind::If {
            condition,
            success,
            failure,
        } => monadic_let(fresh_vars, condition.clone(), |fresh_vars, condition| {
            let (success, _fresh_vars) = mt_expression(FreshVars::new(), success.clone());
            let (failure, _fresh_vars) = mt_expression(FreshVars::new(), failure.clone());
            (
                Rc::new(Expr {
                    kind: Rc::new(ExprKind::If {
                        condition,
                        success,
                        failure,
                    }),
                    ty: ty.clone(),
                }),
                fresh_vars,
            )
        }),
        ExprKind::Loop { body, .. } => {
            let (body, fresh_vars) = mt_expression(fresh_vars, body.clone());
            (
                Rc::new(Expr {
                    kind: Rc::new(ExprKind::Loop { body }),
                    ty,
                }),
                fresh_vars,
            )
        }
        ExprKind::Match { scrutinee, arms } => {
            monadic_let(fresh_vars, scrutinee.clone(), |fresh_vars, scrutinee| {
                (
                    Rc::new(Expr {
                        kind: Rc::new(ExprKind::Match {
                            scrutinee,
                            arms: arms
                                .iter()
                                .map(|arm| {
                                    let (body, _fresh_vars) =
                                        mt_expression(FreshVars::new(), arm.body.clone());
                                    Rc::new(MatchArm {
                                        pattern: arm.pattern.clone(),
                                        body,
                                    })
                                })
                                .collect(),
                        }),
                        ty: ty.clone(),
                    }),
                    fresh_vars,
                )
            })
        }
        ExprKind::Index { base, index } => {
            monadic_let(fresh_vars, base.clone(), |fresh_vars, base| {
                (
                    pure(Rc::new(Expr {
                        kind: Rc::new(ExprKind::Index {
                            base,
                            index: index.clone(),
                        }),
                        ty,
                    })),
                    fresh_vars,
                )
            })
        }
        // control flow expressions are responsible for side effects, so they are monadic already
        ExprKind::ControlFlow(lcf_expression) => (
            Rc::new(Expr {
                kind: Rc::new(ExprKind::ControlFlow(*lcf_expression)),
                ty,
            }),
            fresh_vars,
        ),
        ExprKind::StructStruct {
            path,
            fields,
            base,
            struct_or_variant,
        } => {
            let path = path.clone();
            let fields = fields.clone();
            let base = base.clone();
            let struct_or_variant = *struct_or_variant;
            let fields_values: Vec<Rc<Expr>> =
                fields.iter().map(|(_, field)| field.clone()).collect();

            monadic_lets(
                fresh_vars,
                fields_values,
                Box::new(move |fresh_vars, fields_values| {
                    monadic_optional_let(fresh_vars, base, |fresh_vars, base| {
                        let fields_names: Vec<String> =
                            fields.iter().map(|(name, _)| name.clone()).collect();
                        (
                            pure(Rc::new(Expr {
                                kind: Rc::new(ExprKind::StructStruct {
                                    path,
                                    fields: fields_names
                                        .iter()
                                        .zip(fields_values.iter())
                                        .map(|(name, value)| (name.clone(), value.clone()))
                                        .collect(),
                                    base,
                                    struct_or_variant,
                                }),
                                ty,
                            })),
                            fresh_vars,
                        )
                    })
                }),
            )
        }
        ExprKind::StructTuple {
            path,
            fields,
            struct_or_variant,
        } => {
            let path = path.clone();
            let struct_or_variant = *struct_or_variant;

            monadic_lets(
                fresh_vars,
                fields.clone(),
                Box::new(move |fresh_vars, fields| {
                    (
                        pure(Rc::new(Expr {
                            kind: Rc::new(ExprKind::StructTuple {
                                path,
                                fields,
                                struct_or_variant,
                            }),
                            ty,
                        })),
                        fresh_vars,
                    )
                }),
            )
        }
        ExprKind::StructUnit { .. } => (pure(expr.clone()), fresh_vars),
        ExprKind::Use(expr) => monadic_let(fresh_vars, expr.clone(), |fresh_vars, expr| {
            (
                pure(Rc::new(Expr {
                    kind: Rc::new(ExprKind::Use(expr)),
                    ty,
                })),
                fresh_vars,
            )
        }),
        ExprKind::Return(expr) => monadic_let(fresh_vars, expr.clone(), |fresh_vars, expr| {
            (
                Rc::new(Expr {
                    kind: Rc::new(ExprKind::Return(expr)),
                    ty,
                }),
                fresh_vars,
            )
        }),
        ExprKind::Message(_) => (pure(expr.clone()), fresh_vars),
    }
}

/// Get the pure part of a statement, if possible, as a statement.
fn get_pure_from_stmt(statement: Rc<Expr>) -> Option<Rc<Expr>> {
    match statement.kind.as_ref() {
        ExprKind::Pure(e) => Some(e.clone()),
        ExprKind::Let {
            is_monadic: true, ..
        } => None,
        ExprKind::Let {
            is_monadic: false,
            name,
            init,
            body,
        } => get_pure_from_stmt(body.clone()).map(|body| {
            Rc::new(Expr {
                kind: Rc::new(ExprKind::Let {
                    is_monadic: false,
                    name: name.clone(),
                    init: init.clone(),
                    body,
                }),
                ty: statement.ty.clone(),
            })
        }),
        _ => None,
    }
}

pub(crate) fn apply_on_thir<'a, F, A>(
    env: &Env<'a>,
    local_def_id: impl IntoQueryParam<rustc_span::def_id::LocalDefId>,
    f: F,
) -> Result<A, String>
where
    F: FnOnce(&rustc_middle::thir::Thir<'a>, &rustc_middle::thir::ExprId) -> A,
{
    let thir = env.tcx.thir_body(local_def_id);
    let Ok((thir, expr_id)) = thir else {
        return Result::Err("thir failed to compile".to_string());
    };
    let result = std::panic::catch_unwind(panic::AssertUnwindSafe(|| thir.borrow()));

    match result {
        Ok(thir) => Result::Ok(f(&thir, &expr_id)),
        Err(error) => Result::Err(format!("thir failed to compile: {:?}", error)),
    }
}

pub(crate) fn compile_hir_id(env: &Env, hir_id: rustc_hir::hir_id::HirId) -> Rc<Expr> {
    let local_def_id = hir_id.owner.def_id;
    let result = apply_on_thir(env, local_def_id, |thir, expr_id| {
        crate::thir_expression::compile_expr(env, thir, expr_id)
    });

    match result {
        Ok(expr) => expr,
        Err(error) => Rc::new(Expr {
            kind: Rc::new(ExprKind::Message(error)),
            ty: None,
        }),
    }
}

impl MatchArm {
    fn to_doc(&self) -> Doc {
        return nest([
            nest([
                text("|"),
                line(),
                self.pattern.to_doc(false),
                line(),
                text("=>"),
            ]),
            line(),
            self.body.to_doc(false),
        ]);
    }
}

impl LoopControlFlow {
    pub fn to_doc<'a>(self) -> Doc<'a> {
        match self {
            LoopControlFlow::Break => text("M.break"),
            LoopControlFlow::Continue => text("M.continue"),
        }
    }
}

impl Literal {
    fn to_doc(&self, with_paren: bool) -> Doc {
        match self {
            Literal::Bool(b) => text(format!("{b}")),
            Literal::Integer(LiteralInteger {
                name,
                negative_sign,
                value,
            }) => paren(
                with_paren,
                nest([
                    text("Value.Integer"),
                    line(),
                    text(format!("Integer.{name}")),
                    line(),
                    if *negative_sign {
                        text(format!("(-{value})"))
                    } else {
                        text(value.to_string())
                    },
                ]),
            ),
            Literal::Char(c) => text(format!("\"{c}\"%char")),
            Literal::String(s) => string_to_doc(with_paren, s.as_str()),
            Literal::Error => text("UnsupportedLiteral"),
        }
    }
}

impl Expr {
    pub(crate) fn to_doc(&self, with_paren: bool) -> Doc {
        self.kind.to_doc(with_paren)
    }
}

impl ExprKind {
    pub(crate) fn to_doc(&self, with_paren: bool) -> Doc {
        match self {
            ExprKind::Pure(expr) => paren(
                with_paren,
                nest([text("M.pure"), line(), expr.to_doc(true)]),
            ),
            ExprKind::LocalVar(ref name) => text(name),
            ExprKind::Var(path) => paren(
                with_paren,
                nest([text("M.var"), line(), text(format!("\"{path}\""))]),
            ),
            ExprKind::GetFunction(path) => paren(
                with_paren,
                nest([text("M.get_function"), line(), text(format!("\"{path}\""))]),
            ),
            ExprKind::Constructor(path) => path.to_doc(),
            ExprKind::VarWithTy { path, ty_name, ty } => paren(
                with_paren,
                nest([
                    path.to_doc(),
                    line(),
                    nest([
                        text(format!("({ty_name} :=")),
                        line(),
                        ty.to_coq().to_doc(false),
                        text(")"),
                    ]),
                ]),
            ),
            ExprKind::TraitMethod {
                trait_name,
                method_name,
                self_and_generic_tys,
            } => paren(
                with_paren,
                nest([
                    text("M.get_trait_method"),
                    line(),
                    text(format!("\"{trait_name}\"")),
                    line(),
                    text(format!("\"{method_name}\"")),
                    line(),
                    list(
                        self_and_generic_tys
                            .iter()
                            .map(|(name, ty)| {
                                nest([
                                    text(format!("(* {name} *)")),
                                    line(),
                                    ty.to_coq().to_doc(false),
                                ])
                            })
                            .collect(),
                    ),
                ]),
            ),
            ExprKind::AssociatedFunction { ty, func } => nest([
                ty.to_coq().to_doc(true),
                text("::["),
                text(format!("\"{func}\"")),
                text("]"),
            ]),
            ExprKind::Literal(literal) => literal.to_doc(with_paren),
            ExprKind::Call {
                func,
                args,
                purity: _,
                from_user,
            } => paren(
                with_paren,
                nest([
                    if *from_user {
                        concat([text("M.call"), line()])
                    } else {
                        nil()
                    },
                    func.to_doc(true),
                    line(),
                    if *from_user {
                        list(args.iter().map(|arg| arg.to_doc(false)).collect())
                    } else {
                        intersperse(args.iter().map(|arg| arg.to_doc(true)), [line()])
                    },
                ]),
            ),
            ExprKind::MonadicOperator { name, arg } => {
                paren(with_paren, nest([text(name), line(), arg.to_doc(true)]))
            }
            ExprKind::Lambda {
                args,
                body,
                is_for_match: _,
            } => {
                if args.is_empty() {
                    paren(with_paren, body.to_doc(true))
                } else {
                    paren(
                        with_paren,
                        nest([
                            nest([
                                text("fun"),
                                line(),
                                intersperse(
                                    args.iter().map(|(name, ty)| match ty {
                                        None => text(name),
                                        Some(ty) => nest([
                                            text("("),
                                            text(name),
                                            text(" :"),
                                            line(),
                                            ty.to_coq().to_doc(false),
                                            text(")"),
                                        ]),
                                    }),
                                    [line()],
                                ),
                                text(" =>"),
                            ]),
                            line(),
                            body.to_doc(true),
                        ]),
                    )
                }
            }
            ExprKind::Array { elements } => list(
                elements
                    .iter()
                    .map(|element| element.to_doc(false))
                    .collect(),
            ),
            ExprKind::Tuple { elements } => paren(
                true,
                nest([intersperse(
                    elements.iter().map(|element| element.to_doc(false)),
                    [text(","), line()],
                )]),
            ),
            ExprKind::Let {
                is_monadic,
                name,
                init,
                body,
            } => paren(
                with_paren,
                group([
                    nest([
                        nest([
                            nest([
                                text("let"),
                                optional_insert(!*is_monadic, text("*")),
                                line(),
                                text(match name {
                                    Some(name) => name,
                                    None => "_",
                                }),
                            ]),
                            text(" :="),
                        ]),
                        line(),
                        init.to_doc(false),
                        text(" in"),
                    ]),
                    hardline(),
                    body.to_doc(false),
                ]),
            ),
            ExprKind::If {
                condition,
                success,
                failure,
            } => paren(
                with_paren,
                group([
                    group([
                        nest([text("if"), line(), condition.to_doc(false)]),
                        line(),
                        text("then"),
                    ]),
                    nest([hardline(), success.to_doc(false)]),
                    hardline(),
                    nest([text("else"), hardline(), failure.to_doc(false)]),
                ]),
            ),
            ExprKind::Loop { body } => paren(
                with_paren,
                nest([text("M.loop"), line(), paren(true, body.to_doc(with_paren))]),
            ),
            ExprKind::Match { scrutinee, arms } => group([
                group([
                    nest([text("match"), line(), scrutinee.to_doc(false)]),
                    line(),
                    text("with"),
                ]),
                hardline(),
                intersperse(arms.iter().map(|arm| arm.to_doc()), [hardline()]),
                hardline(),
                text("end"),
            ]),
            ExprKind::Index { base, index } => {
                nest([base.to_doc(true), text("["), index.to_doc(false), text("]")])
            }
            ExprKind::ControlFlow(lcf_expression) => lcf_expression.to_doc(),
            ExprKind::StructStruct {
                path,
                fields,
                base,
                struct_or_variant,
            } => match base {
                None => paren(
                    with_paren,
                    nest([
                        text("Value.StructRecord"),
                        line(),
                        text(format!("\"{path}\"")),
                        line(),
                        list(
                            fields
                                .iter()
                                .map(|(name, expr)| {
                                    nest([
                                        text("("),
                                        text(format!("\"{name}\"")),
                                        text(","),
                                        line(),
                                        expr.to_doc(false),
                                        text(")"),
                                    ])
                                })
                                .collect(),
                        ),
                    ]),
                ),
                Some(base) => paren(
                    with_paren && !fields.is_empty(),
                    nest([
                        base.to_doc(true),
                        concat(fields.iter().map(|(name, expr)| {
                            concat([
                                line(),
                                group([
                                    nest([
                                        text("<| "),
                                        path.to_doc(),
                                        text("."),
                                        text(name),
                                        text(" :="),
                                        line(),
                                        expr.to_doc(false),
                                    ]),
                                    line(),
                                    text("|>"),
                                ]),
                            ])
                        })),
                    ]),
                ),
            },
            ExprKind::StructTuple {
                path,
                fields,
                struct_or_variant,
            } => coq::Expression::just_name("Value.StructTuple")
                .apply_many(&[
                    coq::Expression::String(path.to_string()),
                    coq::Expression::List {
                        exprs: fields
                            .iter()
                            .map(|expr| coq::Expression::Code(expr.to_doc(false)))
                            .collect(),
                    },
                ])
                .to_doc(with_paren),
            ExprKind::StructUnit {
                path,
                struct_or_variant,
            } => concat([
                path.to_doc(),
                match struct_or_variant {
                    StructOrVariant::Struct => text(".Build"),
                    StructOrVariant::Variant { .. } => nil(),
                },
            ]),
            ExprKind::Use(expr) => {
                paren(with_paren, nest([text("M.use"), line(), expr.to_doc(true)]))
            }
            ExprKind::Return(value) => paren(
                with_paren,
                nest([text("return_"), line(), value.to_doc(true)]),
            ),
            ExprKind::Message(message) => text(format!("\"{message}\"")),
        }
    }
}
