(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter LANGUAGE : forall `{ℋ : State.Trait}, ref str.

Parameter THRESHOLD : forall `{ℋ : State.Trait}, i32.

Parameter is_big : forall `{ℋ : State.Trait}, i32 -> M bool.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
