(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition used_function (_ : unit) :=
  tt.

Definition unused_function (_ : unit) :=
  tt.

Definition noisy_unused_function (_ : unit) :=
  tt.

Definition main (_ : unit) :=
  used_function tt ;;
  tt.