(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Unit.
  Inductive t : Set := Build.
End Unit.
Definition Unit := Unit.t.

Module Impl_core_fmt_Debug_for_clone_Unit.
  Definition Self := clone.Unit.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["write_str"] f "Unit".
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Unit.

Module Impl_core_clone_Clone_for_clone_Unit.
  Definition Self := clone.Unit.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) clone.Unit :=
    self.["deref"].
  
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
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) clone.Pair :=
    let* α0 := core.clone.Clone.clone (addr_of (self.[0])) in
    let* α1 := core.clone.Clone.clone (addr_of (self.[1])) in
    Pure (clone.Pair.Build_t α0 α1).
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_clone_Pair.

Module Impl_core_fmt_Debug_for_clone_Pair.
  Definition Self := clone.Pair.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field2_finish"]
      f
      "Pair"
      (addr_of (self.[0]))
      (addr_of (addr_of (self.[1]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let unit := clone.Unit.Build in
  let copied_unit := unit in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of unit) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "original: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of copied_unit) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "copy: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* pair :=
    let* α0 := alloc.boxed.Box::["new"] 1 in
    let* α1 := alloc.boxed.Box::["new"] 2 in
    Pure (clone.Pair.Build_t α0 α1) in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of pair) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "original: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let moved_pair := pair in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of moved_pair) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "moved: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* cloned_pair := moved_pair.["clone"] in
  let* _ := core.mem.drop moved_pair in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of cloned_pair) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "clone: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
