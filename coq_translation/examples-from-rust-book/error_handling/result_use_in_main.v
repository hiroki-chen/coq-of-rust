(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.
Definition ParseIntError := ParseIntError.t.

Definition main (_ : unit) : Result unit ParseIntError :=
  let number_str := "10" in
  let number :=
    match number_str.["parse"] with
    | Ok.Build_t number => number
    | Err.Build_t e => Return (Err e)
    end in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] number ]) ;;
  tt ;;
  Ok ().
