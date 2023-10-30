(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.

Module Person.
  Section Person.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      name : alloc.string.String;
      age : alloc.boxed.Box u8 alloc.boxed.Box.Default.A;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_name : Notation.Dot "name" := {
      Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_age : Notation.Dot "age" := {
      Notation.dot x := let* x := M.read x in Pure x.(age) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_age : Notation.DoubleColon t "age" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(age) : M _;
    }.
    Admitted.
  End Person.
End Person.
Definition Person `{ℋ : State.Trait} : Set := M.val Person.t.

Module
  Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
  Section
    Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set :=
      scoping_rules_ownership_and_rules_partial_moves.main.Person.
    
    Parameter fmt :
        (ref Self) -> (mut_ref core.fmt.Formatter) -> M ltac:(core.fmt.Result).
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Admitted.
  End
    Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
  Global Hint Resolve ℐ : core.
End
  Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
