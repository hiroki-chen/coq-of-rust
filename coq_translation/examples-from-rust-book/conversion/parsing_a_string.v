(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let parsed := "5".["parse"].["unwrap"] in
  let turbo_parsed := "10".["parse"].["unwrap"] in
  let sum := add parsed turbo_parsed in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Sum: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] sum ]) ;;
  tt ;;
  tt.
