(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) :=
  let _mutable_integer := 7 in
  let _mutable_integer := _mutable_integer in
  tt ;;
  assign _mutable_integer := 3 ;;
  tt.