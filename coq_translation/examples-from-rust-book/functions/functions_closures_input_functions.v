(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition call_me {F : Set} `{Fn.Trait unit F} (f : F) : unit :=
  f tt ;;
  tt.

Definition function (_ : unit) : unit :=
  _crate.io._print (format_arguments::["new_const"] [ "I'm a function!
" ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let closure :=
    fun  =>
      _crate.io._print
        (format_arguments::["new_const"] [ "I'm a closure!
" ]) ;;
      tt in
  call_me closure ;;
  call_me function ;;
  tt.
