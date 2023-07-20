(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Record t : Set := {
    id : u32;
    name : alloc.string.String;
    phone : u64;
  }.
  
  Global Instance Get_id : Notation.Dot "id" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_phone : Notation.Dot "phone" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End Person.
Definition Person : Set := Person.t.

Module Impl_core_hash_Hash_for_hash_Person.
  Definition Self := hash.Person.
  
  Parameter hash : forall `{H : State.Trait},
      ref Self ->
      mut_ref __H ->
      M (H := H) unit.
  
  Global Instance Method_hash `{H : State.Trait} : Notation.Dot "hash" := {
    Notation.dot := hash;
  }.
  
  Global Instance I : core.hash.Hash.Trait Self := {
    core.hash.Hash.hash `{H : State.Trait} := hash;
  }.
End Impl_core_hash_Hash_for_hash_Person.

Parameter calculate_hash : forall `{H : State.Trait},
    forall
    {T : Set},
    `{core.hash.Hash.Trait T}
    ref T ->
    M (H := H) u64.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
