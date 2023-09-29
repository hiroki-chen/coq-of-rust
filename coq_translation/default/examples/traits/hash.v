(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Unset Primitive Projections.
  Record t : Set := {
    id : u32;
    name : alloc.string.String;
    phone : u64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_id : Notation.Dot "id" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_AF_id : Notation.DoubleColon t "id" := {
    Notation.double_colon '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
    Notation.double_colon '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_phone : Notation.Dot "phone" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
  Global Instance Get_AF_phone : Notation.DoubleColon t "phone" := {
    Notation.double_colon '(Build_t _ _ x2) := x2;
  }.
End Person.
Definition Person : Set := Person.t.

Module Impl_core_hash_Hash_for_hash_Person.
  Definition Self := hash.Person.
  
  Definition hash
      `{H' : State.Trait}
      {__H : Set}
      `{core.hash.Hasher.Trait __H}
      (self : ref Self)
      (state : mut_ref __H)
      : M (H := H') unit :=
    let* _ := core.hash.Hash.hash (addr_of self.["id"]) state in
    let* _ := core.hash.Hash.hash (addr_of self.["name"]) state in
    core.hash.Hash.hash (addr_of self.["phone"]) state.
  
  Global Instance Method_hash
      `{H' : State.Trait}
      {__H : Set}
      `{core.hash.Hasher.Trait __H} :
    Notation.Dot "hash" := {
    Notation.dot := hash (__H := __H);
  }.
  
  Global Instance I : core.hash.Hash.Trait Self := {
    core.hash.Hash.hash `{H' : State.Trait} := hash;
  }.
  Global Hint Resolve I : core.
End Impl_core_hash_Hash_for_hash_Person.

Definition calculate_hash
    `{H' : State.Trait}
    {T : Set}
    `{core.hash.Hash.Trait T}
    (t : ref T)
    : M (H := H') u64 :=
  let* s := std.collections.hash.map.DefaultHasher::["new"] in
  let* _ := t.["hash"] (addr_of s) in
  s.["finish"].

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* person1 :=
    let* α0 := "Janet".["to_string"] in
    Pure
      {|
        hash.Person.id := 5;
        hash.Person.name := α0;
        hash.Person.phone := 5556667777;
      |} in
  let* person2 :=
    let* α0 := "Bob".["to_string"] in
    Pure
      {|
        hash.Person.id := 5;
        hash.Person.name := α0;
        hash.Person.phone := 5556667777;
      |} in
  let* _ :=
    let* α0 := hash.calculate_hash (addr_of person1) in
    let* α1 := hash.calculate_hash (addr_of person2) in
    let* α2 := α0.["ne"] α1 in
    let* α3 := α2.["not"] in
    if (α3 : bool) then
      core.panicking.panic
        "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)"
    else
      Pure tt in
  Pure tt.
