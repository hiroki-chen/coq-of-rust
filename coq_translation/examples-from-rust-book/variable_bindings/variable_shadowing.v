(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition main (_ : unit) :=
  let shadowed_binding := 1 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["before being shadowed: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display shadowed_binding]) ;;
  tt ;;
  let shadowed_binding := "abc" in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["shadowed in inner block: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display shadowed_binding]) ;;
  tt ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["outside inner block: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display shadowed_binding]) ;;
  tt ;;
  let shadowed_binding := 2 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["shadowed in outer block: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display shadowed_binding]) ;;
  tt ;;
  tt.