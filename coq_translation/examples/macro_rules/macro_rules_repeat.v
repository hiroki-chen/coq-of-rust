(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_v1"] (addr_of [ "1
" ]) (addr_of [ ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 1.["add"] 2 in
      let* α1 := std.cmp.min α0 2 in
      let* α2 := format_argument::["new_display"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α2 ]) in
      _crate.io._print α3 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := 2.["mul"] 3 in
      let* α1 := std.cmp.min α0 4 in
      let* α2 := std.cmp.min 5 α1 in
      let* α3 := format_argument::["new_display"] (addr_of α2) in
      let* α4 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α3 ]) in
      _crate.io._print α4 in
    Pure tt in
  Pure tt.
