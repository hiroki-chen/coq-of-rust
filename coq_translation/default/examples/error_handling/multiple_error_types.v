(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition double_first
    `{H : State.Trait}
    (vec : alloc.vec.Vec (ref str))
    : M (H := H) i32 :=
  let* first :=
    let* α0 := vec.["first"] in
    α0.["unwrap"] in
  let* α0 := first.["parse"] in
  let* α1 := α0.["unwrap"] in
  2.["mul"] α1.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* numbers :=
    let* α0 := alloc.boxed.Box::["new"] [ "42"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* empty := alloc.vec.Vec::["new"] in
  let* strings :=
    let* α0 := alloc.boxed.Box::["new"] [ "tofu"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* _ :=
    let* _ :=
      let* α0 := multiple_error_types.double_first numbers in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := multiple_error_types.double_first empty in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := multiple_error_types.double_first strings in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
