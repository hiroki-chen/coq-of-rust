(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let x := 5 in
  let _ := x in
  let* _ := x.["add"] 1 in
  let _ := 15 in
  Pure tt.
