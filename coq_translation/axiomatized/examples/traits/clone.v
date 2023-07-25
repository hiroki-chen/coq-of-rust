(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Unit.
  Inductive t : Set := Build.
End Unit.
Definition Unit := Unit.t.

Module Impl_core_fmt_Debug_for_clone_Unit.
  Definition Self := clone.Unit.
  
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
End Impl_core_fmt_Debug_for_clone_Unit.

Module Impl_core_clone_Clone_for_clone_Unit.
  Definition Self := clone.Unit.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) clone.Unit.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_clone_Unit.

Module Impl_core_marker_Copy_for_clone_Unit.
  Definition Self := clone.Unit.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_clone_Unit.

Module Pair.
  Unset Primitive Projections.
  Record t : Set := {
    _ : alloc.boxed.Box i32;
    _ : alloc.boxed.Box i32;
  }.
  Global Set Primitive Projections.

  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Pair.
Definition Pair := Pair.t.

Module Impl_core_clone_Clone_for_clone_Pair.
  Definition Self := clone.Pair.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) clone.Pair.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_clone_Pair.

Module Impl_core_fmt_Debug_for_clone_Pair.
  Definition Self := clone.Pair.
  
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
End Impl_core_fmt_Debug_for_clone_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
