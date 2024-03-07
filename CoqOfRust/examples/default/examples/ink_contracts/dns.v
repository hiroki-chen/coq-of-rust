(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_dns_Mapping_K_V.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [] =>
      let* α0 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ K ] ] in
      let* α1 := M.call α0 [] in
      let* α2 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ V ] ] in
      let* α3 := M.call α2 [] in
      M.pure
        (Value.StructRecord "dns::Mapping" [ ("_key", α1); ("_value", α3) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.apply (Ty.path "dns::Mapping") [ K; V ])
      []
      [ ("default", InstanceField.Method default [ K; V ]) ].
End Impl_core_default_Default_for_dns_Mapping_K_V.

Module Impl_dns_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "dns::Mapping") [ K; V ].
  
  (*
      fn contains(&self, _key: &K) -> bool {
          unimplemented!()
      }
  *)
  Definition contains (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_contains :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "contains" contains [ K; V ].
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" get [ K; V ].
  
  (*
      fn insert(&mut self, _key: K, _value: V) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition insert (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key; _value ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* _value := M.alloc _value in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" insert [ K; V ].
  
  (*
      fn new() -> Mapping<K, V> {
          unimplemented!()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [] =>
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "new" new [ K; V ].
  
  (*
      fn remove(&self, _key: K) {
          unimplemented!()
      }
  *)
  Definition remove (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_remove :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "remove" remove [ K; V ].
  
  (*
      fn size(&self, _key: K) -> Option<u32> {
          unimplemented!()
      }
  *)
  Definition size (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_size :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "size" size [ K; V ].
  
  (*
      fn take(&self, _key: K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition take (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [ self; _key ] =>
      let* self := M.alloc self in
      let* _key := M.alloc _key in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_take :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "take" take [ K; V ].
End Impl_dns_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_dns_AccountId.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call α0 [] in
      M.pure (Value.StructTuple "dns::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "dns::AccountId")
      []
      [ ("default", InstanceField.Method default []) ].
End Impl_core_default_Default_for_dns_AccountId.

Module Impl_core_clone_Clone_for_dns_AccountId.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.path "dns::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "dns::AccountId")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_dns_AccountId.

Module Impl_core_marker_Copy_for_dns_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "dns::AccountId")
      []
      [].
End Impl_core_marker_Copy_for_dns_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_dns_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "dns::AccountId")
      []
      [].
End Impl_core_marker_StructuralPartialEq_for_dns_AccountId.

Module Impl_core_cmp_PartialEq_for_dns_AccountId.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 := M.var "BinOp::Pure::eq" in
      let* α1 := M.var "dns::AccountId::Get_0" in
      let* α2 := M.read self in
      let* α3 := M.read (α1 (deref α2)) in
      let* α4 := M.var "dns::AccountId::Get_0" in
      let* α5 := M.read other in
      let* α6 := M.read (α4 (deref α5)) in
      M.pure (α0 α3 α6)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "dns::AccountId")
      []
      [ ("eq", InstanceField.Method eq []) ].
End Impl_core_cmp_PartialEq_for_dns_AccountId.

Module Impl_core_convert_From_array_u8_for_dns_AccountId.
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ _value ] =>
      let* _value := M.alloc _value in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "dns::AccountId")
      [ (* T *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
      [ ("from", InstanceField.Method from []) ].
End Impl_core_convert_From_array_u8_for_dns_AccountId.

Axiom Balance : (Ty.path "dns::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "dns::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum Env *)

(* Enum Register *)

(* Enum SetAddress *)

(* Enum Transfer *)

(* Enum Event *)

Module Impl_dns_Env.
  Definition Self : Ty.t := Ty.path "dns::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "dns::Env::Get_caller" in
      let* α1 := M.read self in
      M.read (α0 (deref α1))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; _event ] =>
      let* self := M.alloc self in
      let* _event := M.alloc _event in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
End Impl_dns_Env.

(* Enum DomainNameService *)

(*
fn zero_address() -> AccountId {
    [0u8; 32].into()
}
*)
Definition zero_address (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.get_method
        "core::convert::Into"
        "into"
        [
          (* Self *) Ty.apply (Ty.path "array") [ Ty.path "u8" ];
          (* T *) Ty.path "dns::AccountId"
        ] in
    M.call α0 [ repeat ((Integer.of_Z 0) : Ty.path "u8") 32 ]
  | _, _ => M.impossible
  end.

Module Impl_core_default_Default_for_dns_DomainNameService.
  (*
      fn default() -> Self {
          let mut name_to_address = Mapping::new();
          name_to_address.insert(Hash::default(), zero_address());
          let mut name_to_owner = Mapping::new();
          name_to_owner.insert(Hash::default(), zero_address());
  
          Self {
              name_to_address,
              name_to_owner,
              default_address: zero_address(),
          }
      }
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* name_to_address :=
        let* α0 :=
          M.call
            (Ty.apply
                (Ty.path "dns::Mapping")
                [
                  Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                  Ty.path "dns::AccountId"
                ])::["new"]
            [] in
        M.alloc α0 in
      let* _ :=
        let* α0 :=
          M.get_method
            "core::default::Default"
            "default"
            [ (* Self *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ] in
        let* α1 := M.call α0 [] in
        let* α2 := M.var "dns::zero_address" in
        let* α3 := M.call α2 [] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "dns::Mapping")
                [
                  Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                  Ty.path "dns::AccountId"
                ])::["insert"]
            [ borrow_mut name_to_address; α1; α3 ] in
        M.alloc α4 in
      let* name_to_owner :=
        let* α0 :=
          M.call
            (Ty.apply
                (Ty.path "dns::Mapping")
                [
                  Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                  Ty.path "dns::AccountId"
                ])::["new"]
            [] in
        M.alloc α0 in
      let* _ :=
        let* α0 :=
          M.get_method
            "core::default::Default"
            "default"
            [ (* Self *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ] in
        let* α1 := M.call α0 [] in
        let* α2 := M.var "dns::zero_address" in
        let* α3 := M.call α2 [] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "dns::Mapping")
                [
                  Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                  Ty.path "dns::AccountId"
                ])::["insert"]
            [ borrow_mut name_to_owner; α1; α3 ] in
        M.alloc α4 in
      let* α0 := M.read name_to_address in
      let* α1 := M.read name_to_owner in
      let* α2 := M.var "dns::zero_address" in
      let* α3 := M.call α2 [] in
      let* α0 :=
        M.alloc
          (Value.StructRecord
            "dns::DomainNameService"
            [
              ("name_to_address", α0);
              ("name_to_owner", α1);
              ("default_address", α3)
            ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "dns::DomainNameService")
      []
      [ ("default", InstanceField.Method default []) ].
End Impl_core_default_Default_for_dns_DomainNameService.

(* Enum Error *)

Module Impl_core_marker_StructuralPartialEq_for_dns_Error.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "dns::Error")
      []
      [].
End Impl_core_marker_StructuralPartialEq_for_dns_Error.

Module Impl_core_cmp_PartialEq_for_dns_Error.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* __self_tag :=
        let* α0 := M.var "core::intrinsics::discriminant_value" in
        let* α1 := M.read self in
        let* α2 := M.call α0 [ α1 ] in
        M.alloc α2 in
      let* __arg1_tag :=
        let* α0 := M.var "core::intrinsics::discriminant_value" in
        let* α1 := M.read other in
        let* α2 := M.call α0 [ α1 ] in
        M.alloc α2 in
      let* α0 := M.var "BinOp::Pure::eq" in
      let* α1 := M.read __self_tag in
      let* α2 := M.read __arg1_tag in
      let* α0 := M.alloc (α0 α1 α2) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "dns::Error")
      []
      [ ("eq", InstanceField.Method eq []) ].
End Impl_core_cmp_PartialEq_for_dns_Error.

Module Impl_core_marker_StructuralEq_for_dns_Error.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "dns::Error")
      []
      [].
End Impl_core_marker_StructuralEq_for_dns_Error.

Module Impl_core_cmp_Eq_for_dns_Error.
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      M.pure tt
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "dns::Error")
      []
      [
        ("assert_receiver_is_total_eq",
          InstanceField.Method assert_receiver_is_total_eq [])
      ].
End Impl_core_cmp_Eq_for_dns_Error.

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "dns::Result") =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "dns::Error" ]).

Module Impl_dns_DomainNameService.
  Definition Self : Ty.t := Ty.path "dns::DomainNameService".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      M.call (Ty.path "dns::DomainNameService")::["init_env"] []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "dns::DomainNameService" ] in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn register(&mut self, name: Hash) -> Result<()> {
          let caller = self.env().caller();
          if self.name_to_owner.contains(&name) {
              return Err(Error::NameAlreadyExists);
          }
  
          self.name_to_owner.insert(name, caller);
          self.env()
              .emit_event(Event::Register(Register { name, from: caller }));
  
          Ok(())
      }
  *)
  Definition register (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "dns::Error" ]) in
      M.catch_return
        (let* caller :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.call (Ty.path "dns::Env")::["caller"] [ borrow α2 ] in
          M.alloc α3 in
        let* _ :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_owner" in
          let* α1 := M.read self in
          let* α2 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["contains"]
              [ borrow (α0 (deref α1)); borrow name ] in
          let* α3 := M.alloc α2 in
          let* α4 := M.read (use α3) in
          if α4 then
            let* α0 :=
              return_
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ dns.Error.NameAlreadyExists ]) in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* _ :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_owner" in
          let* α1 := M.read self in
          let* α2 := M.read name in
          let* α3 := M.read caller in
          let* α4 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["insert"]
              [ borrow_mut (α0 (deref α1)); α2; α3 ] in
          M.alloc α4 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read name in
          let* α4 := M.read caller in
          let* α5 :=
            M.call
              (Ty.path "dns::Env")::["emit_event"]
              [
                borrow α2;
                Value.StructTuple
                  "dns::Event::Register"
                  [
                    Value.StructRecord
                      "dns::Register"
                      [ ("name", α3); ("from", α4) ]
                  ]
              ] in
          M.alloc α5 in
        let* α0 :=
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_register :
    M.IsAssociatedFunction Self "register" register [].
  
  (*
      fn get_owner_or_default(&self, name: Hash) -> AccountId {
          self.name_to_owner
              .get(&name)
              .unwrap_or(self.default_address)
      }
  *)
  Definition get_owner_or_default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* α0 := M.var "dns::DomainNameService::Get_name_to_owner" in
      let* α1 := M.read self in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "dns::Mapping")
              [
                Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                Ty.path "dns::AccountId"
              ])::["get"]
          [ borrow (α0 (deref α1)); borrow name ] in
      let* α3 := M.var "dns::DomainNameService::Get_default_address" in
      let* α4 := M.read self in
      let* α5 := M.read (α3 (deref α4)) in
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "dns::AccountId" ])::["unwrap_or"]
        [ α2; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_owner_or_default :
    M.IsAssociatedFunction Self "get_owner_or_default" get_owner_or_default [].
  
  (*
      pub fn set_address(&mut self, name: Hash, new_address: AccountId) -> Result<()> {
          let caller = self.env().caller();
          let owner = self.get_owner_or_default(name);
          if caller != owner {
              return Err(Error::CallerIsNotOwner);
          }
  
          let old_address = self.name_to_address.get(&name);
          self.name_to_address.insert(name, new_address);
  
          self.env().emit_event(Event::SetAddress(SetAddress {
              name,
              from: caller,
              old_address,
              new_address,
          }));
          Ok(())
      }
  *)
  Definition set_address (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name; new_address ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* new_address := M.alloc new_address in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "dns::Error" ]) in
      M.catch_return
        (let* caller :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.call (Ty.path "dns::Env")::["caller"] [ borrow α2 ] in
          M.alloc α3 in
        let* owner :=
          let* α0 := M.read self in
          let* α1 := M.read name in
          let* α2 :=
            M.call
              (Ty.path "dns::DomainNameService")::["get_owner_or_default"]
              [ borrow (deref α0); α1 ] in
          M.alloc α2 in
        let* _ :=
          let* α0 :=
            M.get_method
              "core::cmp::PartialEq"
              "ne"
              [
                (* Self *) Ty.path "dns::AccountId";
                (* Rhs *) Ty.path "dns::AccountId"
              ] in
          let* α1 := M.call α0 [ borrow caller; borrow owner ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read (use α2) in
          if α3 then
            let* α0 :=
              return_
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ dns.Error.CallerIsNotOwner ]) in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* old_address :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_address" in
          let* α1 := M.read self in
          let* α2 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["get"]
              [ borrow (α0 (deref α1)); borrow name ] in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_address" in
          let* α1 := M.read self in
          let* α2 := M.read name in
          let* α3 := M.read new_address in
          let* α4 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["insert"]
              [ borrow_mut (α0 (deref α1)); α2; α3 ] in
          M.alloc α4 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read name in
          let* α4 := M.read caller in
          let* α5 := M.read old_address in
          let* α6 := M.read new_address in
          let* α7 :=
            M.call
              (Ty.path "dns::Env")::["emit_event"]
              [
                borrow α2;
                Value.StructTuple
                  "dns::Event::SetAddress"
                  [
                    Value.StructRecord
                      "dns::SetAddress"
                      [
                        ("name", α3);
                        ("from", α4);
                        ("old_address", α5);
                        ("new_address", α6)
                      ]
                  ]
              ] in
          M.alloc α7 in
        let* α0 :=
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_set_address :
    M.IsAssociatedFunction Self "set_address" set_address [].
  
  (*
      pub fn transfer(&mut self, name: Hash, to: AccountId) -> Result<()> {
          let caller = self.env().caller();
          let owner = self.get_owner_or_default(name);
          if caller != owner {
              return Err(Error::CallerIsNotOwner);
          }
  
          let old_owner = self.name_to_owner.get(&name);
          self.name_to_owner.insert(name, to);
  
          self.env().emit_event(Event::Transfer(Transfer {
              name,
              from: caller,
              old_owner,
              new_owner: to,
          }));
  
          Ok(())
      }
  *)
  Definition transfer (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name; to ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* to := M.alloc to in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "dns::Error" ]) in
      M.catch_return
        (let* caller :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.call (Ty.path "dns::Env")::["caller"] [ borrow α2 ] in
          M.alloc α3 in
        let* owner :=
          let* α0 := M.read self in
          let* α1 := M.read name in
          let* α2 :=
            M.call
              (Ty.path "dns::DomainNameService")::["get_owner_or_default"]
              [ borrow (deref α0); α1 ] in
          M.alloc α2 in
        let* _ :=
          let* α0 :=
            M.get_method
              "core::cmp::PartialEq"
              "ne"
              [
                (* Self *) Ty.path "dns::AccountId";
                (* Rhs *) Ty.path "dns::AccountId"
              ] in
          let* α1 := M.call α0 [ borrow caller; borrow owner ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read (use α2) in
          if α3 then
            let* α0 :=
              return_
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ dns.Error.CallerIsNotOwner ]) in
            let* α1 := M.read α0 in
            let* α2 := never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* old_owner :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_owner" in
          let* α1 := M.read self in
          let* α2 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["get"]
              [ borrow (α0 (deref α1)); borrow name ] in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.var "dns::DomainNameService::Get_name_to_owner" in
          let* α1 := M.read self in
          let* α2 := M.read name in
          let* α3 := M.read to in
          let* α4 :=
            M.call
              (Ty.apply
                  (Ty.path "dns::Mapping")
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "dns::AccountId"
                  ])::["insert"]
              [ borrow_mut (α0 (deref α1)); α2; α3 ] in
          M.alloc α4 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "dns::DomainNameService")::["env"]
              [ borrow (deref α0) ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read name in
          let* α4 := M.read caller in
          let* α5 := M.read old_owner in
          let* α6 := M.read to in
          let* α7 :=
            M.call
              (Ty.path "dns::Env")::["emit_event"]
              [
                borrow α2;
                Value.StructTuple
                  "dns::Event::Transfer"
                  [
                    Value.StructRecord
                      "dns::Transfer"
                      [
                        ("name", α3);
                        ("from", α4);
                        ("old_owner", α5);
                        ("new_owner", α6)
                      ]
                  ]
              ] in
          M.alloc α7 in
        let* α0 :=
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer :
    M.IsAssociatedFunction Self "transfer" transfer [].
  
  (*
      fn get_address_or_default(&self, name: Hash) -> AccountId {
          self.name_to_address
              .get(&name)
              .unwrap_or(self.default_address)
      }
  *)
  Definition get_address_or_default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* α0 := M.var "dns::DomainNameService::Get_name_to_address" in
      let* α1 := M.read self in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "dns::Mapping")
              [
                Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                Ty.path "dns::AccountId"
              ])::["get"]
          [ borrow (α0 (deref α1)); borrow name ] in
      let* α3 := M.var "dns::DomainNameService::Get_default_address" in
      let* α4 := M.read self in
      let* α5 := M.read (α3 (deref α4)) in
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "dns::AccountId" ])::["unwrap_or"]
        [ α2; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_address_or_default :
    M.IsAssociatedFunction
      Self
      "get_address_or_default"
      get_address_or_default
      [].
  
  (*
      pub fn get_address(&self, name: Hash) -> AccountId {
          self.get_address_or_default(name)
      }
  *)
  Definition get_address (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* α0 := M.read self in
      let* α1 := M.read name in
      M.call
        (Ty.path "dns::DomainNameService")::["get_address_or_default"]
        [ α0; α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_address :
    M.IsAssociatedFunction Self "get_address" get_address [].
  
  (*
      pub fn get_owner(&self, name: Hash) -> AccountId {
          self.get_owner_or_default(name)
      }
  *)
  Definition get_owner (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; name ] =>
      let* self := M.alloc self in
      let* name := M.alloc name in
      let* α0 := M.read self in
      let* α1 := M.read name in
      M.call
        (Ty.path "dns::DomainNameService")::["get_owner_or_default"]
        [ α0; α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_owner :
    M.IsAssociatedFunction Self "get_owner" get_owner [].
End Impl_dns_DomainNameService.
