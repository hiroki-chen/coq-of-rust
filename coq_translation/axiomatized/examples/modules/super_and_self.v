(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module cool.
  Parameter function : forall `{H : State.Trait}, M (H := H) unit.
End cool.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Module my.
  Module cool.
    Parameter function : forall `{H : State.Trait}, M (H := H) unit.
  End cool.
  
  Parameter indirect_call : forall `{H : State.Trait}, M (H := H) unit.
End my.

Module cool.
  Parameter function : forall `{H : State.Trait}, M (H := H) unit.
End cool.

Parameter function : forall `{H : State.Trait}, M (H := H) unit.

Parameter indirect_call : forall `{H : State.Trait}, M (H := H) unit.
