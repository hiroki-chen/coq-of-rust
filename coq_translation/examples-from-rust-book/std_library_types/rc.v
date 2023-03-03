(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Rc := std.rc.Rc.

Definition main (_ : unit) : unit :=
  let rc_examples := method "to_string" "Rc examples" in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1 [ "--- rc_a is created ---\n" ] [  ]) ;;
  tt ;;
  let rc_a := ImplRc.new rc_examples in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Reference Count of rc_a: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (ImplRc.strong_count rc_a) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "--- rc_a is cloned to rc_b ---\n" ]
      [  ]) ;;
  tt ;;
  let rc_b := ImplRc.clone rc_a in
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Reference Count of rc_b: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (ImplRc.strong_count rc_b) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Reference Count of rc_a: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (ImplRc.strong_count rc_a) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "rc_a and rc_b are equal: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (method "eq" rc_a rc_b) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Length of the value inside rc_a: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (method "len" rc_a) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Value of rc_b: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display rc_b ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "--- rc_b is dropped out of scope ---\n" ]
      [  ]) ;;
  tt ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Reference Count of rc_a: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display (ImplRc.strong_count rc_a) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "--- rc_a is dropped out of scope ---\n" ]
      [  ]) ;;
  tt ;;
  tt.
