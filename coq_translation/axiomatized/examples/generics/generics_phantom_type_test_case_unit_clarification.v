(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Inch.
  Inductive t : Set :=
  .
End Inch.
Definition Inch : Set := Inch.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Parameter fmt :
      forall `{State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Parameter clone :
      forall `{State.Trait},
      (ref Self) -> M generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Mm.
  Inductive t : Set :=
  .
End Mm.
Definition Mm : Set := Mm.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Parameter fmt :
      forall `{State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Parameter clone :
      forall `{State.Trait},
      (ref Self) -> M generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self `{State.Trait} :=
    generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Length.
  Section Length.
    Context {Unit : Set}.
    Unset Primitive Projections.
    Record t `{State.Trait} : Set := {
      _ : f64;
      _ : core.marker.PhantomData Unit;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_1 : Notation.Dot 1 := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End Length.
End Length.
Definition Length := @Length.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.fmt.Debug.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Parameter fmt :
        forall `{State.Trait},
        (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
    
    Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End
    Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.clone.Clone.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Parameter clone :
        forall `{State.Trait},
        (ref Self) ->
          M (generics_phantom_type_test_case_unit_clarification.Length Unit).
    
    Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
      Notation.dot := clone;
    }.
    
    Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone := clone;
    }.
  End
    Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Context `{core.marker.Copy.Trait Unit}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
    }.
  End
    Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Section
    Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
    Context {Unit : Set}.
    Definition Self `{State.Trait} :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Definition Output : Set :=
      generics_phantom_type_test_case_unit_clarification.Length Unit.
    
    Parameter add :
        forall `{State.Trait},
        Self ->
          (generics_phantom_type_test_case_unit_clarification.Length Unit) ->
          M (generics_phantom_type_test_case_unit_clarification.Length Unit).
    
    Global Instance Method_add `{State.Trait} : Notation.Dot "add" := {
      Notation.dot := add;
    }.
    
    Global Instance I `{State.Trait}
      : core.ops.arith.Add.Trait Self
          (Rhs := core.ops.arith.Add.Default.Rhs Self)
        := {
      core.ops.arith.Add.Output := Output;
      core.ops.arith.Add.add := add;
    }.
  End
    Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Global Hint Resolve I : core.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
