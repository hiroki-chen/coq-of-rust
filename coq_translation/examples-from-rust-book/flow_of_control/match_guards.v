(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Temperature.
  Inductive t : Set :=
  | Celsius (_ : i32)
  | Fahrenheit (_ : i32).
End Temperature.
Definition Temperature := Temperature.t.

Definition main (_ : unit) : unit :=
  let temperature := Temperature.Celsius 35 in
  match temperature with
  | Temperature.Celsius t =>
    _crate.io._print
      (format_arguments::["new_v1"]
        [ ""; "C is above 30 Celsius
" ]
        [ format_argument::["new_display"] t ]) ;;
    tt
  | Temperature.Celsius t =>
    _crate.io._print
      (format_arguments::["new_v1"]
        [ ""; "C is below 30 Celsius
" ]
        [ format_argument::["new_display"] t ]) ;;
    tt
  | Temperature.Fahrenheit t =>
    _crate.io._print
      (format_arguments::["new_v1"]
        [ ""; "F is above 86 Fahrenheit
" ]
        [ format_argument::["new_display"] t ]) ;;
    tt
  | Temperature.Fahrenheit t =>
    _crate.io._print
      (format_arguments::["new_v1"]
        [ ""; "F is below 86 Fahrenheit
" ]
        [ format_argument::["new_display"] t ]) ;;
    tt
  end.
