(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter double_first :
    forall `{ℋ : State.Trait},
    (alloc.vec.Vec (ref str) alloc.vec.Vec.Default.A) -> M i32.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
