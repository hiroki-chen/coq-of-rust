(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : Result :=
  match method "parse" first_number_str with
  | Ok (first_number) =>
    match method "parse" second_number_str with
    | Ok (second_number) => Ok (mul first_number second_number)
    | Err (e) => Err e
    end
  | Err (e) => Err e
  end.

Definition print (result : Result) : unit :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "n is "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display n ]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "Error: "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display e ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  let twenty := multiply "10" "2" in
  print twenty ;;
  let tt := multiply "t" "2" in
  print tt ;;
  tt.
