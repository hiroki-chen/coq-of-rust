(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let raw_p: ref u32 := addr_of 10 in
  let* _ :=
    let* α0 := raw_p.["deref"] in
    let* α1 := α0.["eq"] 10 in
    let* α2 := α1.["not"] in
    if (α2 : bool) then
      core.panicking.panic "assertion failed: *raw_p == 10"
    else
      Pure tt in
  Pure tt.
