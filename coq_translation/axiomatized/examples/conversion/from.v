(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Number.
Section Number.
  Record t : Set := {
    value : i32.t;
  }.
  
  Global Instance Get_value : Notation.Dot "value" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
  Global Instance Get_AF_value : Notation.DoubleColon t "value" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
End Number.
End Number.

Module  Impl_core_convert_From_i32_t_for_from_Number_t.
Section Impl_core_convert_From_i32_t_for_from_Number_t.
  Ltac Self := exact from.Number.t.
  
  Parameter from : (M.Val i32.t) -> M (M.Val ltac:(Self)).
  
  Global Instance AssociatedFunction_from :
    Notation.DoubleColon ltac:(Self) "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait ltac:(Self) (T := i32.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_i32_t_for_from_Number_t.
End Impl_core_convert_From_i32_t_for_from_Number_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
