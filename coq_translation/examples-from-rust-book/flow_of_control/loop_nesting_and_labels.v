(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  loop
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"] [ "Entered the outer loop
" ] [  ]) ;;
    tt ;;
    loop
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"] [ "Entered the inner loop
" ] [  ]) ;;
      tt ;;
      Break ;;
      tt
      from
      loop ;;
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "This point will never be reached
" ]
        [  ]) ;;
    tt ;;
    tt
    from
    loop ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"] [ "Exited the outer loop
" ] [  ]) ;;
  tt ;;
  tt.
