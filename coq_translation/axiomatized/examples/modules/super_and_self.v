(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Module cool.
  Parameter function : forall `{H : State.Trait}, M (H := H) unit.
End cool.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Module my.
  Parameter indirect_call : forall `{H : State.Trait}, M (H := H) unit.
End my.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Module cool.
  Parameter function : forall `{H : State.Trait}, M (H := H) unit.
End cool.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Parameter indirect_call : forall `{H : State.Trait}, M (H := H) unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
