(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let i := 3 in
  let borrow1 := i in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "borrow1: "; "
" ]
      [ format_argument::["new_display"] borrow1 ]) ;;
  tt ;;
  tt ;;
  let borrow2 := i in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "borrow2: "; "
" ]
      [ format_argument::["new_display"] borrow2 ]) ;;
  tt ;;
  tt.
