(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let val := 1.["add"] 2 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " = "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] "1 + 2";
        _crate.fmt.ArgumentV1::["new_display"] val
      ]) ;;
  tt ;;
  tt ;;
  let val := 3.["add"] 4 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " = "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] "3 + 4";
        _crate.fmt.ArgumentV1::["new_display"] val
      ]) ;;
  tt ;;
  tt ;;
  let val := (2.["mul"] 3).["add"] 1 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; " = "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] "(2 * 3) + 1";
        _crate.fmt.ArgumentV1::["new_display"] val
      ]) ;;
  tt ;;
  tt.
