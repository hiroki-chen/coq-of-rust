(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition Years : Set :=
  i64.

Definition main (_ : unit) :=
  let years := Years 42 in
  let years_as_primitive_1 := years.0 in
  let Years (years_as_primitive_2) := years in
  tt.