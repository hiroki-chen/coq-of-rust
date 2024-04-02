(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  (*
  Enum MathError
  {
    ty_params := [];
    variants :=
      [
        {
          name := "DivisionByZero";
          item := StructTuple [];
          discriminant := None;
        };
        {
          name := "NonPositiveLogarithm";
          item := StructTuple [];
          discriminant := None;
        };
        {
          name := "NegativeSquareRoot";
          item := StructTuple [];
          discriminant := None;
        }
      ];
  }
  *)
  
  Module Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self : Ty.t := Ty.path "result_chaining_with_question_mark::checked::MathError".
    
    (*     Debug *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
            [
              M.read (| f |);
              M.read (|
                M.match_operator (|
                  self,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (| M.read (| mk_str "DivisionByZero" |) |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (| M.read (| mk_str "NonPositiveLogarithm" |) |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.read (| γ |) in
                        M.alloc (| M.read (| mk_str "NegativeSquareRoot" |) |)))
                  ]
                |)
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Axiom MathResult :
    (Ty.path "result_chaining_with_question_mark::checked::MathResult") =
      (Ty.apply
        (Ty.path "core::result::Result")
        [ Ty.path "f64"; Ty.path "result_chaining_with_question_mark::checked::MathError" ]).
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Definition div (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x; y ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.eq (M.read (| y |)) (M.read (| UnsupportedLiteral |))
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [
                        Value.StructTuple
                          "result_chaining_with_question_mark::checked::MathError::DivisionByZero"
                          []
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [ BinOp.Panic.div (| M.read (| x |), M.read (| y |) |) ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.lt (M.read (| x |)) (M.read (| UnsupportedLiteral |))
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [
                        Value.StructTuple
                          "result_chaining_with_question_mark::checked::MathError::NegativeSquareRoot"
                          []
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [
                        M.call_closure (|
                          M.get_associated_function (| Ty.path "f64", "sqrt", [] |),
                          [ M.read (| x |) ]
                        |)
                      ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.le (M.read (| x |)) (M.read (| UnsupportedLiteral |))
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [
                        Value.StructTuple
                          "result_chaining_with_question_mark::checked::MathError::NonPositiveLogarithm"
                          []
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [
                        M.call_closure (|
                          M.get_associated_function (| Ty.path "f64", "ln", [] |),
                          [ M.read (| x |) ]
                        |)
                      ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Definition op_ (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x; y ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.read (|
          let ratio :=
            M.copy (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::ops::try_trait::Try",
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "f64";
                          Ty.path "result_chaining_with_question_mark::checked::MathError"
                        ],
                      [],
                      "branch",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_function (| "result_chaining_with_question_mark::checked::div", [] |),
                        [ M.read (| x |); M.read (| y |) ]
                      |)
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match (|
                          γ,
                          "core::ops::control_flow::ControlFlow::Break",
                          0
                        |) in
                      let residual := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.never_to_any (|
                          M.read (|
                            M.return_ (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::ops::try_trait::FromResidual",
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.path "f64";
                                      Ty.path
                                        "result_chaining_with_question_mark::checked::MathError"
                                    ],
                                  [
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.path "core::convert::Infallible";
                                        Ty.path
                                          "result_chaining_with_question_mark::checked::MathError"
                                      ]
                                  ],
                                  "from_residual",
                                  []
                                |),
                                [ M.read (| residual |) ]
                              |)
                            |)
                          |)
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match (|
                          γ,
                          "core::ops::control_flow::ControlFlow::Continue",
                          0
                        |) in
                      let val := M.copy (| γ0_0 |) in
                      val))
                ]
              |)
            |) in
          let ln :=
            M.copy (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::ops::try_trait::Try",
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "f64";
                          Ty.path "result_chaining_with_question_mark::checked::MathError"
                        ],
                      [],
                      "branch",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_function (| "result_chaining_with_question_mark::checked::ln", [] |),
                        [ M.read (| ratio |) ]
                      |)
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match (|
                          γ,
                          "core::ops::control_flow::ControlFlow::Break",
                          0
                        |) in
                      let residual := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.never_to_any (|
                          M.read (|
                            M.return_ (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::ops::try_trait::FromResidual",
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.path "f64";
                                      Ty.path
                                        "result_chaining_with_question_mark::checked::MathError"
                                    ],
                                  [
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.path "core::convert::Infallible";
                                        Ty.path
                                          "result_chaining_with_question_mark::checked::MathError"
                                      ]
                                  ],
                                  "from_residual",
                                  []
                                |),
                                [ M.read (| residual |) ]
                              |)
                            |)
                          |)
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match (|
                          γ,
                          "core::ops::control_flow::ControlFlow::Continue",
                          0
                        |) in
                      let val := M.copy (| γ0_0 |) in
                      val))
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_function (| "result_chaining_with_question_mark::checked::sqrt", [] |),
              [ M.read (| ln |) ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      pub fn op(x: f64, y: f64) {
          match op_(x, y) {
              Err(why) => panic!(
                  "{}",
                  match why {
                      MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                      MathError::DivisionByZero => "division by zero",
                      MathError::NegativeSquareRoot => "square root of negative number",
                  }
              ),
              Ok(value) => println!("{}", value),
          }
      }
  *)
  Definition op (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x; y ] =>
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.read (|
          M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_function (| "result_chaining_with_question_mark::checked::op_", [] |),
                [ M.read (| x |); M.read (| y |) ]
              |)
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.get_struct_tuple_field_or_break_match (|
                      γ,
                      "core::result::Result::Err",
                      0
                    |) in
                  let why := M.copy (| γ0_0 |) in
                  M.alloc (|
                    M.never_to_any (|
                      M.call_closure (|
                        M.get_function (|
                          "core::panicking::panic_display",
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                        |),
                        [
                          M.match_operator (|
                            why,
                            [
                              fun γ => ltac:(M.monadic (mk_str "logarithm of non-positive number"));
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (| M.read (| mk_str "division by zero" |) |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (|
                                    M.read (| mk_str "square root of negative number" |)
                                  |)))
                            ]
                          |)
                        ]
                      |)
                    |)
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.get_struct_tuple_field_or_break_match (|
                      γ,
                      "core::result::Result::Ok",
                      0
                    |) in
                  let value := M.copy (| γ0_0 |) in
                  let _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_v1",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array [ M.read (| mk_str "" |); M.read (| mk_str "
" |) ]
                                |));
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_display",
                                          [ Ty.path "f64" ]
                                        |),
                                        [ value ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
End checked.

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "result_chaining_with_question_mark::checked::op", [] |),
              [ M.read (| UnsupportedLiteral |); M.read (| UnsupportedLiteral |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
