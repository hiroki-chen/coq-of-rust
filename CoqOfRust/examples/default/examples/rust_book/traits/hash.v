(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Person *)

Module Impl_core_hash_Hash_for_hash_Person.
  (*
  Hash
  *)
  Definition hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; __H ], [ self; state ] =>
      let* self := M.alloc self in
      let* state := M.alloc state in
      let* _ :=
        let* α0 :=
          M.get_method
            "core::hash::Hash"
            "hash"
            [ (* Self *) Ty.path "u32"; (* H *) __H ] in
        let* α1 := M.var "hash::Person::Get_id" in
        let* α2 := M.read self in
        let* α3 := M.read state in
        let* α4 := M.call α0 [ borrow (α1 (deref α2)); α3 ] in
        M.alloc α4 in
      let* _ :=
        let* α0 :=
          M.get_method
            "core::hash::Hash"
            "hash"
            [ (* Self *) Ty.path "alloc::string::String"; (* H *) __H ] in
        let* α1 := M.var "hash::Person::Get_name" in
        let* α2 := M.read self in
        let* α3 := M.read state in
        let* α4 := M.call α0 [ borrow (α1 (deref α2)); α3 ] in
        M.alloc α4 in
      let* α0 :=
        M.get_method
          "core::hash::Hash"
          "hash"
          [ (* Self *) Ty.path "u64"; (* H *) __H ] in
      let* α1 := M.var "hash::Person::Get_phone" in
      let* α2 := M.read self in
      let* α3 := M.read state in
      let* α4 := M.call α0 [ borrow (α1 (deref α2)); α3 ] in
      let* α0 := M.alloc α4 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    let Self := Ty.path "hash::Person" in
    M.IsTraitInstance
      "core::hash::Hash"
      Self
      []
      [ ("hash", InstanceField.Method hash [ Self ]) ].
End Impl_core_hash_Hash_for_hash_Person.

(*
fn calculate_hash<T: Hash>(t: &T) -> u64 {
    let mut s = DefaultHasher::new();
    t.hash(&mut s);
    s.finish()
}
*)
Definition calculate_hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* s :=
      let* α0 :=
        M.call (Ty.path "std::hash::random::DefaultHasher")::["new"] [] in
      M.alloc α0 in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::hash::Hash"
          "hash"
          [ (* Self *) T; (* H *) Ty.path "std::hash::random::DefaultHasher"
          ] in
      let* α1 := M.read t in
      let* α2 := M.call α0 [ α1; borrow_mut s ] in
      M.alloc α2 in
    let* α0 :=
      M.get_method
        "core::hash::Hasher"
        "finish"
        [ (* Self *) Ty.path "std::hash::random::DefaultHasher" ] in
    let* α1 := M.call α0 [ borrow s ] in
    let* α0 := M.alloc α1 in
    M.read α0
  | _, _ => M.impossible
  end.

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* person1 :=
      let* α0 :=
        M.get_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Janet") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc
        (Value.StructRecord
          "hash::Person"
          [
            ("id", (Integer.of_Z 5) : Ty.path "u32");
            ("name", α2);
            ("phone", (Integer.of_Z 5556667777) : Ty.path "u64")
          ]) in
    let* person2 :=
      let* α0 :=
        M.get_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "Bob") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc
        (Value.StructRecord
          "hash::Person"
          [
            ("id", (Integer.of_Z 5) : Ty.path "u32");
            ("name", α2);
            ("phone", (Integer.of_Z 5556667777) : Ty.path "u64")
          ]) in
    let* _ :=
      let* α0 := M.var "UnOp::not" in
      let* α1 := M.var "BinOp::Pure::ne" in
      let* α2 := M.var "hash::calculate_hash" in
      let* α3 := M.call α2 [ borrow person1 ] in
      let* α4 := M.var "hash::calculate_hash" in
      let* α5 := M.call α4 [ borrow person2 ] in
      let* α6 := M.alloc (α0 (α1 α3 α5)) in
      let* α7 := M.read (use α6) in
      if α7 then
        let* α0 := M.var "core::panicking::panic" in
        let* α1 :=
          M.read
            (mk_str
              "assertion failed: calculate_hash(&person1) != calculate_hash(&person2)") in
        let* α2 := M.call α0 [ α1 ] in
        let* α3 := never_to_any α2 in
        M.alloc α3
      else
        M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
