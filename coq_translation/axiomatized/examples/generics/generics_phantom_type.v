(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module PhantomTuple.Section PhantomTuple.
Context {A B : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    _ : A;
    _ : core.marker.PhantomData B;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.


End PhantomTuple.
End PhantomTuple.
Definition PhantomTuple := PhantomTuple.t.

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
Section
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Context {A B : Set}.
  
  Definition Self := generics_phantom_type.PhantomTuple A B.
  
  Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
    core.marker.StructuralPartialEq.Build_Trait _.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Context {A B : Set}.
  
  Definition Self := generics_phantom_type.PhantomTuple A B.
  
  Parameter eq : forall `{H : State.Trait},
      ref Self ->
      ref (generics_phantom_type.PhantomTuple A B) ->
      M (H := H) bool.
  
  Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : core.cmp.PartialEq.Trait Self := {
    core.cmp.PartialEq.eq `{H : State.Trait} := eq;
  }.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module PhantomStruct.Section PhantomStruct.
Context {A B : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    first : A;
    phantom : core.marker.PhantomData B;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_first : Notation.Dot "first" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_phantom : Notation.Dot "phantom" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.


End PhantomStruct.
End PhantomStruct.
Definition PhantomStruct : Set := PhantomStruct.t.

Module
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
Section
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Context {A B : Set}.
  
  Definition Self := generics_phantom_type.PhantomStruct A B.
  
  Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
    core.marker.StructuralPartialEq.Build_Trait _.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
End
  Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.

Module Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
Section Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Context {A B : Set}.
  
  Definition Self := generics_phantom_type.PhantomStruct A B.
  
  Parameter eq : forall `{H : State.Trait},
      ref Self ->
      ref (generics_phantom_type.PhantomStruct A B) ->
      M (H := H) bool.
  
  Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : core.cmp.PartialEq.Trait Self := {
    core.cmp.PartialEq.eq `{H : State.Trait} := eq;
  }.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.
End Impl_core_cmp_PartialEq_for_generics_phantom_type_PhantomStruct_A_B.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
