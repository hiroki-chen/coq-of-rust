(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* name_buf := repeat 0 in
  let _ :=
    let _ := InlineAsm in
    tt in
  let* name :=
    let* α0 := core.str.converts.from_utf8 (addr_of name_buf) in
    α0.["unwrap"] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of name) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "CPU Manufacturer ID: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
