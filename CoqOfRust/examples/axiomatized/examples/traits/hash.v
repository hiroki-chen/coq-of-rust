(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Person.
Section Person.
  Record t : Set := {
    id : u32.t;
    name : alloc.string.String.t;
    phone : u64.t;
  }.
  
  Global Instance Get_id : Notations.Dot "id" := {
    Notations.dot := Ref.map (fun x => x.(id)) (fun v x => x <| id := v |>);
  }.
  Global Instance Get_AF_id : Notations.DoubleColon t "id" := {
    Notations.double_colon (x : M.Val t) := x.["id"];
  }.
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot := Ref.map (fun x => x.(name)) (fun v x => x <| name := v |>);
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (x : M.Val t) := x.["name"];
  }.
  Global Instance Get_phone : Notations.Dot "phone" := {
    Notations.dot :=
      Ref.map (fun x => x.(phone)) (fun v x => x <| phone := v |>);
  }.
  Global Instance Get_AF_phone : Notations.DoubleColon t "phone" := {
    Notations.double_colon (x : M.Val t) := x.["phone"];
  }.
End Person.
End Person.

Module  Impl_core_hash_Hash_for_hash_Person_t.
Section Impl_core_hash_Hash_for_hash_Person_t.
  Ltac Self := exact hash.Person.t.
  
  (*
  Hash
  *)
  Parameter hash :
      forall {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H},
      (ref ltac:(Self)) -> (mut_ref __H) -> M unit.
  
  Global Instance AssociatedFunction_hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H} :
    Notations.DoubleColon ltac:(Self) "hash" := {
    Notations.double_colon := hash (__H := __H);
  }.
  
  Global Instance ℐ : core.hash.Hash.Required.Trait ltac:(Self) := {
    core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
      hash (__H := __H);
    core.hash.Hash.hash_slice := Datatypes.None;
  }.
End Impl_core_hash_Hash_for_hash_Person_t.
End Impl_core_hash_Hash_for_hash_Person_t.

(*
fn calculate_hash<T: Hash>(t: &T) -> u64 {
    let mut s = DefaultHasher::new();
    t.hash(&mut s);
    s.finish()
}
*)
Parameter calculate_hash :
    forall {T : Set} {ℋ_0 : core.hash.Hash.Trait T},
    (ref T) -> M u64.t.

(*
fn main() {
    let person1 = Person {
        id: 5,
        name: "Janet".to_string(),
        phone: 555_666_7777,
    };
    let person2 = Person {
        id: 5,
        name: "Bob".to_string(),
        phone: 555_666_7777,
    };

    assert!(calculate_hash(&person1) != calculate_hash(&person2));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
