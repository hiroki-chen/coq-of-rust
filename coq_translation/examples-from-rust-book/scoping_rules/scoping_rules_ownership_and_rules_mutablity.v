(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let immutable_box := Box::["new"] 5 in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "immutable_box contains "; "
" ]
      [ format_argument::["new_display"] immutable_box ]) ;;
  tt ;;
  let mutable_box := immutable_box in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "mutable_box contains "; "
" ]
      [ format_argument::["new_display"] mutable_box ]) ;;
  tt ;;
  assign (deref mutable_box) 4 ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "mutable_box now contains "; "
" ]
      [ format_argument::["new_display"] mutable_box ]) ;;
  tt ;;
  tt.
