(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.

Parameter is_divisible_by : forall `{ℋ : State.Trait}, u32 -> u32 -> M bool.

Parameter fizzbuzz : forall `{ℋ : State.Trait}, u32 -> M unit.

Parameter fizzbuzz_to : forall `{ℋ : State.Trait}, u32 -> M unit.
