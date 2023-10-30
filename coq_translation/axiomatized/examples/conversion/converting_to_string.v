(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Circle.
  Section Circle.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      radius : i32;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_radius : Notation.Dot "radius" := {
      Notation.dot x := let* x := M.read x in Pure x.(radius) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_radius :
      Notation.DoubleColon t "radius" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(radius) : M _;
    }.
    Admitted.
  End Circle.
End Circle.
Definition Circle `{ℋ : State.Trait} : Set := M.val Circle.t.

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  Section Impl_core_fmt_Display_for_converting_to_string_Circle.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := converting_to_string.Circle.
    
    Parameter fmt :
        (ref Self) -> (mut_ref core.fmt.Formatter) -> M ltac:(core.fmt.Result).
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Display.Trait Self := {
      core.fmt.Display.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Display_for_converting_to_string_Circle.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Display_for_converting_to_string_Circle.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
