(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LANGUAGE `{H : State.Trait} : ref str := run (Pure "Rust").

Definition THRESHOLD `{H : State.Trait} : i32 := run (Pure 10).

Parameter is_big : forall `{H : State.Trait}, i32 -> M (H := H) bool.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
