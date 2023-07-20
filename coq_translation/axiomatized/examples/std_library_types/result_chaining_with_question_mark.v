(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError := MathError.t.
  
  Module
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self := result_chaining_with_question_mark.checked.MathError.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Definition MathResult : Set :=
    core.result.Result f64 result_chaining_with_question_mark.checked.MathError.
  
  Parameter div : forall `{H : State.Trait},
      f64 ->
      f64 ->
      M (H := H) result_chaining_with_question_mark.checked.MathResult.
  
  Parameter sqrt : forall `{H : State.Trait},
      f64 ->
      M (H := H) result_chaining_with_question_mark.checked.MathResult.
  
  Parameter ln : forall `{H : State.Trait},
      f64 ->
      M (H := H) result_chaining_with_question_mark.checked.MathResult.
  
  Parameter op_ : forall `{H : State.Trait},
      f64 ->
      f64 ->
      M (H := H) result_chaining_with_question_mark.checked.MathResult.
  
  Parameter op : forall `{H : State.Trait}, f64 -> f64 -> M (H := H) unit.
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError := MathError.t.

Module
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  Definition Self := result_chaining_with_question_mark.checked.MathError.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.

Definition MathResult : Set :=
  core.result.Result f64 result_chaining_with_question_mark.checked.MathError.

Parameter div : forall `{H : State.Trait},
    f64 ->
    f64 ->
    M (H := H) result_chaining_with_question_mark.checked.MathResult.

Parameter sqrt : forall `{H : State.Trait},
    f64 ->
    M (H := H) result_chaining_with_question_mark.checked.MathResult.

Parameter ln : forall `{H : State.Trait},
    f64 ->
    M (H := H) result_chaining_with_question_mark.checked.MathResult.

Parameter op_ : forall `{H : State.Trait},
    f64 ->
    f64 ->
    M (H := H) result_chaining_with_question_mark.checked.MathResult.

Parameter op : forall `{H : State.Trait}, f64 -> f64 -> M (H := H) unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
