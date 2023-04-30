(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition destroy_box (c : Box i32) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Destroying a box that contains "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] c ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let x := 5 in
  let y := x in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "x is "; ", and y is "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] x;
        _crate.fmt.ArgumentV1::["new_display"] y
      ]) ;;
  tt ;;
  let a := Box::["new"] 5 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "a contains: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] a ]) ;;
  tt ;;
  let b := a in
  destroy_box b ;;
  tt.
