(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* immutable_box := Box::["new"] 5 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of immutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "immutable_box contains "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let mutable_box := immutable_box in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of mutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "mutable_box contains "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let* _ := assign mutable_box.["deref"] 4 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of mutable_box) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "mutable_box now contains "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  Pure tt.
