(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "called `function()`
" ] [  ]) ;;
  tt ;;
  tt.

Module cool.
  Definition function (_ : unit) : unit :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "called `cool::function()`
" ]
        [  ]) ;;
    tt ;;
    tt.
End cool.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "called `cool::function()`
" ] [  ]) ;;
  tt ;;
  tt.

Module my.
  Definition function (_ : unit) : unit :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"] [ "called `my::function()`
" ] [  ]) ;;
    tt ;;
    tt.
  
  Module cool.
    Definition function (_ : unit) : unit :=
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ "called `my::cool::function()`
" ]
          [  ]) ;;
      tt ;;
      tt.
  End cool.
  
  Definition indirect_call (_ : unit) : unit :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "called `my::indirect_call()`, that
> " ]
        [  ]) ;;
    tt ;;
    self.function tt ;;
    function tt ;;
    self.cool.function tt ;;
    super.function tt ;;
    root_function tt ;;
    tt.
End my.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "called `my::function()`
" ] [  ]) ;;
  tt ;;
  tt.

Module cool.
  Definition function (_ : unit) : unit :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "called `my::cool::function()`
" ]
        [  ]) ;;
    tt ;;
    tt.
End cool.

Definition function (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "called `my::cool::function()`
" ]
      [  ]) ;;
  tt ;;
  tt.

Definition indirect_call (_ : unit) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "called `my::indirect_call()`, that
> " ]
      [  ]) ;;
  tt ;;
  self.function tt ;;
  function tt ;;
  self.cool.function tt ;;
  super.function tt ;;
  root_function tt ;;
  tt.

Module root_function := crate.cool.function.

Definition main (_ : unit) : unit :=
  my.indirect_call tt ;;
  tt.
