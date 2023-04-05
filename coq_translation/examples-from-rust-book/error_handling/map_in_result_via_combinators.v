(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.
Definition ParseIntError := ParseIntError.t.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : Result :=
  first_number_str.["parse"].["and_then"]
    (fun first_number =>
      second_number_str.["parse"].["map"]
        (fun second_number => mul first_number second_number)).

Definition print (result : Result) : unit :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "n is "; "\n" ]
        [ _crate.fmt.ArgumentV1::["new_display"] n ]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Error: "; "\n" ]
        [ _crate.fmt.ArgumentV1::["new_display"] e ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  let twenty := multiply "10" "2" in
  print twenty ;;
  let tt := multiply "t" "2" in
  print tt ;;
  tt.
