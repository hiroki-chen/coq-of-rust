(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _mutable_integer := M.alloc 7 in
  let* _ :=
    let _mutable_integer := _mutable_integer in
    M.alloc tt in
  let* _ :=
    let* α0 := M.alloc 3 in
    assign _mutable_integer α0 in
  M.alloc tt.
