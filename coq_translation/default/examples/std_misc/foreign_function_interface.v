(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

Definition cos
    `{H : State.Trait}
    (z : foreign_function_interface.Complex)
    : M (H := H) foreign_function_interface.Complex :=
  foreign_function_interface.ccosf z.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* z :=
    let* α0 := 1 (* 1. *).["neg"] in
    Pure
      {|
        foreign_function_interface.Complex.re := α0;
        foreign_function_interface.Complex.im := 0 (* 0. *);
      |} in
  let* z_sqrt := foreign_function_interface.csqrtf z in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of z) in
      let* α1 := format_argument::["new_debug"] (addr_of z_sqrt) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "the square root of "; " is "; "
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of z) in
      let* α1 := foreign_function_interface.cos z in
      let* α2 := format_argument::["new_debug"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "cos("; ") = "; "
" ])
          (addr_of [ α0; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  Pure tt.

Module Complex.
  Unset Primitive Projections.
  Record t : Set := {
    re : f32;
    im : f32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_re : Notation.Dot "re" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_im : Notation.Dot "im" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Complex.
Definition Complex : Set := @Complex.t.

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) foreign_function_interface.Complex :=
    let _ : core.clone.AssertParamIsClone f32 := tt in
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self := foreign_function_interface.Complex.
  
  Parameter struct_parameter_for_fmt : core.fmt.Formatter ->
    string -> string -> f32 -> string -> f32 -> M (H := H) core.fmt.Result.
  
  Global Instance Deb_struct_parameter_for_fmt : Notation.DoubleColon
    core.fmt.Formatter "struct_parameter_for_fmt" := {
    Notation.double_colon := struct_parameter_for_fmt; }.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    let* α0 := self.["im"].["lt"] 0 (* 0. *) in
    if (α0 : bool) then
      let* α0 := format_argument::["new_display"] (addr_of self.["re"]) in
      let* α1 := self.["im"].["neg"] in
      let* α2 := format_argument::["new_display"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; "-"; "i" ])
          (addr_of [ α0; α2 ]) in
      f.["write_fmt"] α3
    else
      let* α0 := format_argument::["new_display"] (addr_of self.["re"]) in
      let* α1 := format_argument::["new_display"] (addr_of self.["im"]) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; "+"; "i" ])
          (addr_of [ α0; α1 ]) in
      f.["write_fmt"] α2.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
