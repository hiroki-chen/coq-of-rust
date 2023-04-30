(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let strings :=
    Slice::["into_vec"] (_crate.boxed.Box::["new"] [ "tofu"; "93"; "18" ]) in
  let '(numbers, errors) :=
    (strings.["into_iter"].["map"] (fun s => s.["parse"])).["partition"]
      Result::["is_ok"] in
  let numbers :=
    (numbers.["into_iter"].["map"] Result::["unwrap"]).["collect"] in
  let errors :=
    (errors.["into_iter"].["map"] Result::["unwrap_err"]).["collect"] in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "Numbers: "; "
" ]
      [ format_argument::["new_debug"] numbers ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "Errors: "; "
" ]
      [ format_argument::["new_debug"] errors ]) ;;
  tt ;;
  tt.
