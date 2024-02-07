(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  
  Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
    Definition Self : Set :=
      result_chaining_with_question_mark.checked.MathError.t.
    
    (*
        Debug
    *)
    Parameter fmt :
        (ref Self) ->
          (mut_ref core.fmt.Formatter.t) ->
          M ltac:(core.fmt.Result).
    
    Global Instance AssociatedFunction_fmt :
      Notations.DoubleColon Self "fmt" := {
      Notations.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  
  Ltac MathResult :=
    exact
      (core.result.Result.t
        f64.t
        result_chaining_with_question_mark.checked.MathError.t).
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Parameter div :
      f64.t ->
        f64.t ->
        M ltac:(result_chaining_with_question_mark.checked.MathResult).
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Parameter sqrt :
      f64.t -> M ltac:(result_chaining_with_question_mark.checked.MathResult).
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Parameter ln :
      f64.t -> M ltac:(result_chaining_with_question_mark.checked.MathResult).
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Parameter op_ :
      f64.t ->
        f64.t ->
        M ltac:(result_chaining_with_question_mark.checked.MathResult).
  
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
  Parameter op : f64.t -> f64.t -> M unit.
End checked.

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
