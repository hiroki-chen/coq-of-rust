(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module other_function := deeply.nested.function.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "called `function()`
" ] [ ]) ;;
  tt ;;
  tt.

Module deeply.
  Module nested.
    Definition function (_ : unit) : unit :=
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ "called `deeply::nested::function()`
" ]
          [ ]) ;;
      tt ;;
      tt.
  End nested.
End deeply.

Module nested.
  Definition function (_ : unit) : unit :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "called `deeply::nested::function()`
" ]
        [ ]) ;;
    tt ;;
    tt.
End nested.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "called `deeply::nested::function()`
" ]
      [ ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  other_function tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "Entering block
" ] [ ]) ;;
  tt ;;
  function tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "Leaving block
" ] [ ]) ;;
  tt ;;
  tt ;;
  function tt ;;
  tt.

Module function := crate.deeply.nested.function.
