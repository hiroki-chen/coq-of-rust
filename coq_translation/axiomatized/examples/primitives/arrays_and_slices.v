(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter analyze_slice :
    forall `{ℋ : State.Trait},
    (ref (slice i32)) -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
