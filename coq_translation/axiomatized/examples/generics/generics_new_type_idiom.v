(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Years.
  Section Years.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : i64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End Years.
End Years.
Definition Years `{State.Trait} : Set := M.val Years.t.

Module Days.
  Section Days.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : i64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
  End Days.
End Days.
Definition Days `{State.Trait} : Set := M.val Days.t.

Module Impl_generics_new_type_idiom_Years.
  Section Impl_generics_new_type_idiom_Years.
    Context `{State.Trait}.
    
    Definition Self : Set := generics_new_type_idiom.Years.
    
    Parameter to_days : (ref Self) -> M generics_new_type_idiom.Days.
    
    Global Instance AssociatedFunction_to_days :
      Notation.DoubleColon Self "to_days" := {
      Notation.double_colon := to_days;
    }.
  End Impl_generics_new_type_idiom_Years.
End Impl_generics_new_type_idiom_Years.

Module Impl_generics_new_type_idiom_Days.
  Section Impl_generics_new_type_idiom_Days.
    Context `{State.Trait}.
    
    Definition Self : Set := generics_new_type_idiom.Days.
    
    Parameter to_years : (ref Self) -> M generics_new_type_idiom.Years.
    
    Global Instance AssociatedFunction_to_years :
      Notation.DoubleColon Self "to_years" := {
      Notation.double_colon := to_years;
    }.
  End Impl_generics_new_type_idiom_Days.
End Impl_generics_new_type_idiom_Days.

Parameter old_enough :
    forall `{State.Trait},
    (ref generics_new_type_idiom.Years) -> M bool.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
