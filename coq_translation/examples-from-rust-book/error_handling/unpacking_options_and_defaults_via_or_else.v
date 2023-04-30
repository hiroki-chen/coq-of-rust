(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Fruit.
  Inductive t : Set :=
  | Apple
  | Orange
  | Banana
  | Kiwi
  | Lemon.
End Fruit.
Definition Fruit := Fruit.t.

Module Impl__crate_fmt_Debug_for_Fruit.
  Definition Self := Fruit.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["write_str"]
      f
      match self with
      | Fruit.Apple => "Apple"
      | Fruit.Orange => "Orange"
      | Fruit.Banana => "Banana"
      | Fruit.Kiwi => "Kiwi"
      | Fruit.Lemon => "Lemon"
      end.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Fruit.

Definition main (_ : unit) : unit :=
  let apple := Some Fruit.Apple in
  let no_fruit := None in
  let get_kiwi_as_fallback :=
    fun  =>
      _crate.io._print
        (format_arguments::["new_const"] [ "Providing kiwi as fallback
" ]) ;;
      tt ;;
      Some Fruit.Kiwi in
  let get_lemon_as_fallback :=
    fun  =>
      _crate.io._print
        (format_arguments::["new_const"] [ "Providing lemon as fallback
" ]) ;;
      tt ;;
      Some Fruit.Lemon in
  let first_available_fruit :=
    (no_fruit.["or_else"] get_kiwi_as_fallback).["or_else"]
      get_lemon_as_fallback in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "first_available_fruit: "; "
" ]
      [ format_argument::["new_debug"] first_available_fruit ]) ;;
  tt ;;
  tt.
