(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Inch.
  Inductive t : Set :=
  .
End Inch.
Definition Inch := Inch.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.intrinsics.unreachable.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) generics_phantom_type_test_case_unit_clarification.Inch :=
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Inch.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Mm.
  Inductive t : Set :=
  .
End Mm.
Definition Mm := Mm.t.

Module
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.intrinsics.unreachable.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) generics_phantom_type_test_case_unit_clarification.Mm :=
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self := generics_phantom_type_test_case_unit_clarification.Mm.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Length.
  Section Length.
    Context {Unit : Set}.
    Unset Primitive Projections.
    Record t : Set := {
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
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field2_finish"]
      f
      "Length"
      (addr_of (self.[0]))
      (addr_of (addr_of (self.[1]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      :
        M (H := H)
          (generics_phantom_type_test_case_unit_clarification.Length Unit) :=
    let* α0 := core.clone.Clone.clone (addr_of (self.[0])) in
    let* α1 := core.clone.Clone.clone (addr_of (self.[1])) in
    Pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t α0 α1).
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
Section
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Context {Unit : Set}.
  
  Definition
    Self
    :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Definition Output : Set :=
    generics_phantom_type_test_case_unit_clarification.Length Unit.
  
  Definition add
      `{H : State.Trait}
      (self : Self)
      (rhs : generics_phantom_type_test_case_unit_clarification.Length Unit)
      :
        M (H := H)
          (generics_phantom_type_test_case_unit_clarification.Length Unit) :=
    let* α0 := (self.[0]).["add"] (rhs.[0]) in
    Pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α0
        core.marker.PhantomData.Build).
  
  Global Instance Method_add `{H : State.Trait} : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I : core.ops.arith.Add.Trait Self := {
    core.ops.arith.Add.add `{H : State.Trait} := add;
  }.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
End
  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let one_foot :=
    generics_phantom_type_test_case_unit_clarification.Length.Build_t
      12 (* 12.0 *)
      core.marker.PhantomData.Build in
  let one_meter :=
    generics_phantom_type_test_case_unit_clarification.Length.Build_t
      1000 (* 1000.0 *)
      core.marker.PhantomData.Build in
  let* two_feet := one_foot.["add"] one_foot in
  let* two_meters := one_meter.["add"] one_meter in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of (two_feet.[0])) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "one foot + one_foot = "; " in
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of (two_meters.[0])) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "one meter + one_meter = "; " mm
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
