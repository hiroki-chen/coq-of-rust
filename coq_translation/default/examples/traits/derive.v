(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Centimeters.
  Unset Primitive Projections.
  Record t : Set := {
    _ : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Centimeters.
Definition Centimeters := @Centimeters.t.

Module Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Definition Self := derive.Centimeters.
  
  Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
    core.marker.StructuralPartialEq.Build_Trait _.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialEq_for_derive_Centimeters.
  Definition Self := derive.Centimeters.
  
  Definition eq
      `{H : State.Trait}
      (self : ref Self)
      (other : ref derive.Centimeters)
      : M (H := H) bool :=
    (self.[0]).["eq"] (other.[0]).
  
  Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : core.cmp.PartialEq.Trait Self := {
    core.cmp.PartialEq.eq `{H : State.Trait} := eq;
  }.
End Impl_core_cmp_PartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialOrd_for_derive_Centimeters.
  Definition Self := derive.Centimeters.
  
  Definition partial_cmp
      `{H : State.Trait}
      (self : ref Self)
      (other : ref derive.Centimeters)
      : M (H := H) (core.option.Option core.cmp.Ordering) :=
    core.cmp.PartialOrd.partial_cmp (addr_of (self.[0])) (addr_of (other.[0])).
  
  Global Instance Method_partial_cmp `{H : State.Trait} :
    Notation.Dot "partial_cmp" := {
    Notation.dot := partial_cmp;
  }.
  
  Global Instance I : core.cmp.PartialOrd.Trait Self := {
    core.cmp.PartialOrd.partial_cmp `{H : State.Trait} := partial_cmp;
  }.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

Module Inches.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Inches.
Definition Inches := @Inches.t.

Module Impl_core_fmt_Debug_for_derive_Inches.
  Definition Self := derive.Inches.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "Inches"
      (addr_of (addr_of (self.[0]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_derive_Inches.

Module Impl_derive_Inches.
  Definition Self := derive.Inches.
  
  Definition to_centimeters
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) derive.Centimeters :=
    let 'derive.Inches.Build_t inches := self in
    let* α0 := (cast inches f64).["mul"] 3 (* 2.54 *) in
    Pure (derive.Centimeters.Build_t α0).
  
  Global Instance Method_to_centimeters `{H : State.Trait} :
    Notation.Dot "to_centimeters" := {
    Notation.dot := to_centimeters;
  }.
End Impl_derive_Inches.

Module Seconds.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Seconds.
Definition Seconds := @Seconds.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let _one_second := derive.Seconds.Build_t 1 in
  let foot := derive.Inches.Build_t 12 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of foot) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "One foot equals "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let meter := derive.Centimeters.Build_t 100 (* 100.0 *) in
  let* cmp :=
    let* α0 := foot.["to_centimeters"] in
    let* α1 := α0.["lt"] meter in
    if (α1 : bool) then
      Pure "smaller"
    else
      Pure "bigger" in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of cmp) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "One foot is "; " than one meter.
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
