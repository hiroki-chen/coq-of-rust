(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"] (addr_of [ "1
" ]) (addr_of [ ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 1.["add"] 2 in
      let* α1 := core.cmp.min α0 2 in
      let* α2 := format_argument::["new_display"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 2.["mul"] 3 in
      let* α1 := core.cmp.min α0 4 in
      let* α2 := core.cmp.min 5 α1 in
      let* α3 := format_argument::["new_display"] (addr_of α2) in
      let* α4 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α3 ]) in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
