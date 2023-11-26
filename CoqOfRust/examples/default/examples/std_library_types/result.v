(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  
  Module  Impl_core_fmt_Debug_for_result_checked_MathError_t.
  Section Impl_core_fmt_Debug_for_result_checked_MathError_t.
    Ltac Self := exact result.checked.MathError.t.
    
    (*
        Debug
    *)
    Definition fmt
        (self : ref ltac:(Self))
        (f : mut_ref core.fmt.Formatter.t)
        : M ltac:(core.fmt.Result) :=
      let* self : M.Val (ref ltac:(Self)) := M.alloc self in
      let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
      M.function_body
        (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
        let* α1 := M.read self in
        let* α2 : M.Val (ref str.t) :=
          match α1 with
          | result.checked.MathError.DivisionByZero  =>
            let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
            M.alloc α0
          | result.checked.MathError.NonPositiveLogarithm  =>
            let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
            M.alloc α0
          | result.checked.MathError.NegativeSquareRoot  =>
            let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
            M.alloc α0
          end in
        let* α3 : ref str.t := M.read α2 in
        core.fmt.Formatter.t::["write_str"] α0 α3).
    
    Global Instance AssociatedFunction_fmt :
      Notations.DoubleColon ltac:(Self) "fmt" := {
      Notations.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_checked_MathError_t.
  End Impl_core_fmt_Debug_for_result_checked_MathError_t.
  
  Ltac MathResult :=
    exact (core.result.Result.t f64.t result.checked.MathError.t).
  
  (*
      pub fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              // This operation would `fail`, instead let's return the reason of
              // the failure wrapped in `Err`
              Err(MathError::DivisionByZero)
          } else {
              // This operation is valid, return the result wrapped in `Ok`
              Ok(x / y)
          }
      }
  *)
  Definition div (x : f64.t) (y : f64.t) : M ltac:(result.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    let* y : M.Val f64.t := M.alloc y in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.eq y α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err result.checked.MathError.DivisionByZero)
        else
          let* α0 : M.Val f64.t := BinOp.div x y in
          let* α1 : f64.t := M.read α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
  
  (*
      pub fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt (x : f64.t) : M ltac:(result.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.lt x α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err result.checked.MathError.NegativeSquareRoot)
        else
          let* α0 : f64.t := M.read x in
          let* α1 : f64.t := f64.t::["sqrt"] α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
  
  (*
      pub fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln (x : f64.t) : M ltac:(result.checked.MathResult) :=
    let* x : M.Val f64.t := M.alloc x in
    M.function_body
      (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
      let* α1 : M.Val bool.t := BinOp.le x α0 in
      let* α2 : M.Val bool.t := use α1 in
      let* α3 : bool.t := M.read α2 in
      let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
        if (α3 : bool) then
          M.alloc
            (core.result.Result.Err
              result.checked.MathError.NonPositiveLogarithm)
        else
          let* α0 : f64.t := M.read x in
          let* α1 : f64.t := f64.t::["ln"] α0 in
          M.alloc (core.result.Result.Ok α1) in
      M.read α4).
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.

Module  Impl_core_fmt_Debug_for_result_checked_MathError_t.
Section Impl_core_fmt_Debug_for_result_checked_MathError_t.
  Ltac Self := exact result.checked.MathError.t.
  
  (*
      Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 := M.read self in
      let* α2 : M.Val (ref str.t) :=
        match α1 with
        | result.checked.MathError.DivisionByZero  =>
          let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
          M.alloc α0
        | result.checked.MathError.NonPositiveLogarithm  =>
          let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
          M.alloc α0
        | result.checked.MathError.NegativeSquareRoot  =>
          let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
          M.alloc α0
        end in
      let* α3 : ref str.t := M.read α2 in
      core.fmt.Formatter.t::["write_str"] α0 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_result_checked_MathError_t.
End Impl_core_fmt_Debug_for_result_checked_MathError_t.

Ltac MathResult :=
  exact (core.result.Result.t f64.t result.checked.MathError.t).

(*
    pub fn div(x: f64, y: f64) -> MathResult {
        if y == 0.0 {
            // This operation would `fail`, instead let's return the reason of
            // the failure wrapped in `Err`
            Err(MathError::DivisionByZero)
        } else {
            // This operation is valid, return the result wrapped in `Ok`
            Ok(x / y)
        }
    }
*)
Definition div (x : f64.t) (y : f64.t) : M ltac:(result.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  let* y : M.Val f64.t := M.alloc y in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.eq y α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc (core.result.Result.Err result.checked.MathError.DivisionByZero)
      else
        let* α0 : M.Val f64.t := BinOp.div x y in
        let* α1 : f64.t := M.read α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
    pub fn sqrt(x: f64) -> MathResult {
        if x < 0.0 {
            Err(MathError::NegativeSquareRoot)
        } else {
            Ok(x.sqrt())
        }
    }
*)
Definition sqrt (x : f64.t) : M ltac:(result.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.lt x α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc
          (core.result.Result.Err result.checked.MathError.NegativeSquareRoot)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := f64.t::["sqrt"] α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
    pub fn ln(x: f64) -> MathResult {
        if x <= 0.0 {
            Err(MathError::NonPositiveLogarithm)
        } else {
            Ok(x.ln())
        }
    }
*)
Definition ln (x : f64.t) : M ltac:(result.checked.MathResult) :=
  let* x : M.Val f64.t := M.alloc x in
  M.function_body
    (let* α0 : M.Val f64.t := M.alloc 0 (* 0.0 *) in
    let* α1 : M.Val bool.t := BinOp.le x α0 in
    let* α2 : M.Val bool.t := use α1 in
    let* α3 : bool.t := M.read α2 in
    let* α4 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
      if (α3 : bool) then
        M.alloc
          (core.result.Result.Err result.checked.MathError.NonPositiveLogarithm)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := f64.t::["ln"] α0 in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4).

(*
fn op(x: f64, y: f64) -> f64 {
    // This is a three level match pyramid!
    match checked::div(x, y) {
        Err(why) => panic!("{:?}", why),
        Ok(ratio) => match checked::ln(ratio) {
            Err(why) => panic!("{:?}", why),
            Ok(ln) => match checked::sqrt(ln) {
                Err(why) => panic!("{:?}", why),
                Ok(sqrt) => sqrt,
            },
        },
    }
}
*)
Definition op (x : f64.t) (y : f64.t) : M f64.t :=
  let* x : M.Val f64.t := M.alloc x in
  let* y : M.Val f64.t := M.alloc y in
  M.function_body
    (let* α0 : f64.t := M.read x in
    let* α1 : f64.t := M.read y in
    let* α2 : core.result.Result.t f64.t result.checked.MathError.t :=
      result.checked.div α0 α1 in
    let* α3 : M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
      M.alloc α2 in
    let* α4 := M.read α3 in
    let* α5 : M.Val f64.t :=
      match α4 with
      | core.result.Result.Err why =>
        let* why := M.alloc why in
        let* α0 : M.Val (array (ref str.t)) := M.alloc [ mk_str "" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref result.checked.MathError.t := borrow why in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : never.t := core.panicking.panic_fmt α13 in
        let* α15 : M.Val never.t := M.alloc α14 in
        never_to_any α15
      | core.result.Result.Ok ratio =>
        let* ratio := M.alloc ratio in
        let* α0 : f64.t := M.read ratio in
        let* α1 : core.result.Result.t f64.t result.checked.MathError.t :=
          result.checked.ln α0 in
        let* α2 :
            M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
          M.alloc α1 in
        let* α3 := M.read α2 in
        match α3 with
        | core.result.Result.Err why =>
          let* why := M.alloc why in
          let* α0 : M.Val (array (ref str.t)) := M.alloc [ mk_str "" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref result.checked.MathError.t := borrow why in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_debug"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
          let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
          let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
          let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α10 in
          let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
          let* α13 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α12 in
          let* α14 : never.t := core.panicking.panic_fmt α13 in
          let* α15 : M.Val never.t := M.alloc α14 in
          never_to_any α15
        | core.result.Result.Ok ln =>
          let* ln := M.alloc ln in
          let* α0 : f64.t := M.read ln in
          let* α1 : core.result.Result.t f64.t result.checked.MathError.t :=
            result.checked.sqrt α0 in
          let* α2 :
              M.Val (core.result.Result.t f64.t result.checked.MathError.t) :=
            M.alloc α1 in
          let* α3 := M.read α2 in
          match α3 with
          | core.result.Result.Err why =>
            let* why := M.alloc why in
            let* α0 : M.Val (array (ref str.t)) := M.alloc [ mk_str "" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
            let* α3 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α2 in
            let* α4 : ref (slice (ref str.t)) := M.read α3 in
            let* α5 : ref result.checked.MathError.t := borrow why in
            let* α6 : core.fmt.rt.Argument.t :=
              core.fmt.rt.Argument.t::["new_debug"] α5 in
            let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
            let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
            let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
            let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
              M.alloc α9 in
            let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
              pointer_coercion "Unsize" α10 in
            let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
            let* α13 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_v1"] α4 α12 in
            let* α14 : never.t := core.panicking.panic_fmt α13 in
            let* α15 : M.Val never.t := M.alloc α14 in
            never_to_any α15
          | core.result.Result.Ok sqrt =>
            let* sqrt := M.alloc sqrt in
            M.pure sqrt
          end
        end
      end in
    M.read α5).

(*
fn main() {
    // Will this fail?
    println!("{}", op(1.0, 10.0));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : M.Val f64.t := M.alloc 1 (* 1.0 *) in
        let* α6 : f64.t := M.read α5 in
        let* α7 : M.Val f64.t := M.alloc 10 (* 10.0 *) in
        let* α8 : f64.t := M.read α7 in
        let* α9 : f64.t := result.op α6 α8 in
        let* α10 : M.Val f64.t := M.alloc α9 in
        let* α11 : ref f64.t := borrow α10 in
        let* α12 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α11 in
        let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
        let* α14 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α13 ] in
        let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
        let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
        let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
        let* α19 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α18 in
        let* α20 : unit := std.io.stdio._print α19 in
        M.alloc α20 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
