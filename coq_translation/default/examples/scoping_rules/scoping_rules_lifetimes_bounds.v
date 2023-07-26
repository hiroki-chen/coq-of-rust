(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Ref.Section Ref.
Context {T : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    _ : ref T;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.


End Ref.
End Ref.
Definition Ref := Ref.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Context {T : Set}.
  
  Definition Self := scoping_rules_lifetimes_bounds.Ref T.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "Ref"
      (addr_of (addr_of (self.[0]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.

Definition print
    `{H : State.Trait}
    {T : Set}
    `{core.fmt.Debug.Trait T}
    (t : T)
    : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of t) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "`print`: t is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.

Definition print_ref
    `{H : State.Trait}
    {T : Set}
    `{core.fmt.Debug.Trait T}
    (t : ref T)
    : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of t) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "`print_ref`: t is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let x := 7 in
  let ref_x := scoping_rules_lifetimes_bounds.Ref.Build_t (addr_of x) in
  let* _ := scoping_rules_lifetimes_bounds.print_ref (addr_of ref_x) in
  let* _ := scoping_rules_lifetimes_bounds.print ref_x in
  Pure tt.
