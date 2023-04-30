(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition LANGUAGE : ref str := "Rust".

Definition THRESHOLD : i32 := 10.

Definition is_big (n : i32) : bool := n.["gt"] THRESHOLD.

Definition main (_ : unit) : unit :=
  let n := 16 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "This is "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] LANGUAGE ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "The threshold is "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] THRESHOLD ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " is "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] n;
        _crate.fmt.ArgumentV1::["new_display"]
          (if (is_big n : bool) then
            "big"
          else
            "small")
      ]) ;;
  tt ;;
  tt.
