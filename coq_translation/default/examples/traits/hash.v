(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Section Person.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      id : u32;
      name : alloc.string.String;
      phone : u64;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_id : Notation.Dot "id" := {
      Notation.dot x := let* x := M.read x in Pure x.(id) : M _;
    }.
    Global Instance Get_AF_id : Notation.DoubleColon t "id" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(id) : M _;
    }.
    Global Instance Get_name : Notation.Dot "name" := {
      Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Global Instance Get_phone : Notation.Dot "phone" := {
      Notation.dot x := let* x := M.read x in Pure x.(phone) : M _;
    }.
    Global Instance Get_AF_phone : Notation.DoubleColon t "phone" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(phone) : M _;
    }.
  End Person.
End Person.
Definition Person `{ℋ : State.Trait} : Set := M.val Person.t.

Module Impl_core_hash_Hash_for_hash_Person.
  Section Impl_core_hash_Hash_for_hash_Person.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := hash.Person.
    
    Definition hash
        {__H : Set}
        {ℋ_0 : core.hash.Hasher.Trait __H}
        (self : ref Self)
        (state : mut_ref __H)
        : M unit :=
      let* _ :=
        let* α0 := deref self hash.Person in
        let* α1 := α0.["id"] in
        let* α2 := borrow α1 u32 in
        let* α3 := deref α2 u32 in
        let* α4 := borrow α3 u32 in
        let* α5 := deref state __H in
        let* α6 := borrow_mut α5 __H in
        (core.hash.Hash.hash (Self := u32) (Trait := ltac:(refine _))) α4 α6 in
      let* _ :=
        let* α0 := deref self hash.Person in
        let* α1 := α0.["name"] in
        let* α2 := borrow α1 alloc.string.String in
        let* α3 := deref α2 alloc.string.String in
        let* α4 := borrow α3 alloc.string.String in
        let* α5 := deref state __H in
        let* α6 := borrow_mut α5 __H in
        (core.hash.Hash.hash
            (Self := alloc.string.String)
            (Trait := ltac:(refine _)))
          α4
          α6 in
      let* α0 := deref self hash.Person in
      let* α1 := α0.["phone"] in
      let* α2 := borrow α1 u64 in
      let* α3 := deref α2 u64 in
      let* α4 := borrow α3 u64 in
      let* α5 := deref state __H in
      let* α6 := borrow_mut α5 __H in
      (core.hash.Hash.hash (Self := u64) (Trait := ltac:(refine _))) α4 α6.
    
    Global Instance AssociatedFunction_hash
        {__H : Set}
        {ℋ_0 : core.hash.Hasher.Trait __H} :
      Notation.DoubleColon Self "hash" := {
      Notation.double_colon := hash (__H := __H);
    }.
    
    Global Instance ℐ : core.hash.Hash.Required.Trait Self := {
      core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
        hash (__H := __H);
    }.
  End Impl_core_hash_Hash_for_hash_Person.
End Impl_core_hash_Hash_for_hash_Person.

Definition calculate_hash
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : core.hash.Hash.Trait T}
    (t : ref T)
    : M u64 :=
  let* s := std.collections.hash.map.DefaultHasher::["new"] in
  let* _ :=
    let* α0 := deref t T in
    let* α1 := borrow α0 T in
    let* α2 := borrow_mut s std.collections.hash.map.DefaultHasher in
    let* α3 := deref α2 std.collections.hash.map.DefaultHasher in
    let* α4 := borrow_mut α3 std.collections.hash.map.DefaultHasher in
    (core.hash.Hash.hash (Self := T) (Trait := ltac:(refine _))) α1 α4 in
  let* α0 := borrow s std.collections.hash.map.DefaultHasher in
  (core.hash.Hasher.finish
      (Self := std.collections.hash.map.DefaultHasher)
      (Trait := ltac:(refine _)))
    α0.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* person1 :=
    let* α0 := M.alloc 5 in
    let* α1 := deref (mk_str "Janet") str in
    let* α2 := borrow α1 str in
    let* α3 :=
      (alloc.string.ToString.to_string (Self := str) (Trait := ltac:(refine _)))
        α2 in
    let* α4 := M.alloc 5556667777 in
    M.alloc
      {| hash.Person.id := α0; hash.Person.name := α3; hash.Person.phone := α4;
      |} in
  let* person2 :=
    let* α0 := M.alloc 5 in
    let* α1 := deref (mk_str "Bob") str in
    let* α2 := borrow α1 str in
    let* α3 :=
      (alloc.string.ToString.to_string (Self := str) (Trait := ltac:(refine _)))
        α2 in
    let* α4 := M.alloc 5556667777 in
    M.alloc
      {| hash.Person.id := α0; hash.Person.name := α3; hash.Person.phone := α4;
      |} in
  let* _ :=
    let* α0 := borrow person1 hash.Person in
    let* α1 := deref α0 hash.Person in
    let* α2 := borrow α1 hash.Person in
    let* α3 := hash.calculate_hash α2 in
    let* α4 := borrow person2 hash.Person in
    let* α5 := deref α4 hash.Person in
    let* α6 := borrow α5 hash.Person in
    let* α7 := hash.calculate_hash α6 in
    let* α8 := BinOp.ne α3 α7 in
    let* α9 := UnOp.not α8 in
    let* α10 := use α9 in
    if (α10 : bool) then
      let* α0 :=
        core.panicking.panic
          (mk_str
            "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)") in
      never_to_any α0
    else
      M.alloc tt in
  M.alloc tt.
