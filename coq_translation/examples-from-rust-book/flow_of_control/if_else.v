(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let n := 5 in
  if lt n 0 then
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ ""; " is negative" ]
        [ _crate.fmt.ImplArgumentV1.new_display n ]) ;;
    tt ;;
    tt
  else
    if gt n 0 then
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ ""; " is positive" ]
          [ _crate.fmt.ImplArgumentV1.new_display n ]) ;;
      tt ;;
      tt
    else
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ ""; " is zero" ]
          [ _crate.fmt.ImplArgumentV1.new_display n ]) ;;
      tt ;;
      tt ;;
  let big_n :=
    if andb (lt n 10) (gt n (neg 10)) then
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ ", and is a small number, increase ten-fold\n" ]
          [  ]) ;;
      tt ;;
      mul 10 n
    else
      _crate.io._print
        (_crate.fmt.ImplArguments.new_v1
          [ ", and is a big number, halve the number\n" ]
          [  ]) ;;
      tt ;;
      div n 2 in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ ""; " -> "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display n;
        _crate.fmt.ImplArgumentV1.new_display big_n
      ]) ;;
  tt ;;
  tt.
