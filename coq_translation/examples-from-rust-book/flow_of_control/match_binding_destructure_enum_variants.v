(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition some_number (_ : unit) :=
  Some 42.

Definition main (_ : unit) :=
  match some_number tt with
  | Some (n) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["The Answer: ";"!\n"]
        [_crate::fmt::ImplArgumentV1.new_display n]) ;;
    tt
  | Some (n) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Not interesting... ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display n]) ;;
    tt
  | _ => ()
  end.