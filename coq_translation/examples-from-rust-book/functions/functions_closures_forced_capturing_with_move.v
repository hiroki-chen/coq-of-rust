(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let haystack := Slice::["into_vec"] [ 1; 2; 3 ] in
  let contains := fun needle => haystack.["contains"] needle in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] (contains 1) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] (contains 4) ]) ;;
  tt ;;
  tt.
