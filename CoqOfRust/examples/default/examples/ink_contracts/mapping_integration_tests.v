(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
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
        (Value.StructRecord
          "mapping_integration_tests::Mapping"
          [ ("_key", α1); ("_value", α3) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (* Self *)
        (Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ])
      []
      [ ("default", InstanceField.Method default [ K; V ]) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.

Module Impl_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
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
End Impl_mapping_integration_tests_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_mapping_integration_tests_AccountId.
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
      M.pure (Value.StructTuple "mapping_integration_tests::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mapping_integration_tests::AccountId")
      []
      [ ("default", InstanceField.Method default []) ].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
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
              Ty.path "mapping_integration_tests::AccountId"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "mapping_integration_tests::AccountId")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "mapping_integration_tests::AccountId")
      []
      [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance :
  (Ty.path "mapping_integration_tests::Balance") = (Ty.path "u128").

(* Enum Env *)

Module Impl_mapping_integration_tests_Env.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "mapping_integration_tests::Env::Get_caller" in
      let* α1 := M.read self in
      M.read (α0 (deref α1))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
End Impl_mapping_integration_tests_Env.

(* Enum Mappings *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mappings.
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
          [
            (* Self *)
              Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
                ]
          ] in
      let* α1 := M.call α0 [] in
      M.pure
        (Value.StructRecord
          "mapping_integration_tests::Mappings"
          [ ("balances", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "mapping_integration_tests::Mappings")
      []
      [ ("default", InstanceField.Method default []) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module Impl_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
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
      fn env() -> Env {
          unimplemented!()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  (*
      pub fn new() -> Self {
          let balances = Mapping::default();
          Self { balances }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* balances :=
        let* α0 :=
          M.get_method
            "core::default::Default"
            "default"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "mapping_integration_tests::Mapping")
                  [
                    Ty.path "mapping_integration_tests::AccountId";
                    Ty.path "u128"
                  ]
            ] in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* α0 := M.read balances in
      let* α0 :=
        M.alloc
          (Value.StructRecord
            "mapping_integration_tests::Mappings"
            [ ("balances", α0) ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn get_balance(&self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.get(&caller)
      }
  *)
  Definition get_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
      let* α1 := M.read self in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "mapping_integration_tests::Mapping")
              [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
              ])::["get"]
          [ borrow (α0 (deref α1)); borrow caller ] in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_balance :
    M.IsAssociatedFunction Self "get_balance" get_balance [].
  
  (*
      pub fn insert_balance(&mut self, value: Balance) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.insert(caller, value)
      }
  *)
  Definition insert_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; value ] =>
      let* self := M.alloc self in
      let* value := M.alloc value in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
      let* α1 := M.read self in
      let* α2 := M.read caller in
      let* α3 := M.read value in
      let* α4 :=
        M.call
          (Ty.apply
              (Ty.path "mapping_integration_tests::Mapping")
              [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
              ])::["insert"]
          [ borrow_mut (α0 (deref α1)); α2; α3 ] in
      let* α0 := M.alloc α4 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_insert_balance :
    M.IsAssociatedFunction Self "insert_balance" insert_balance [].
  
  (*
      pub fn size_balance(&mut self) -> Option<u32> {
          let caller = Self::env().caller();
          self.balances.size(caller)
      }
  *)
  Definition size_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
      let* α1 := M.read self in
      let* α2 := M.read caller in
      let* α3 :=
        M.call
          (Ty.apply
              (Ty.path "mapping_integration_tests::Mapping")
              [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
              ])::["size"]
          [ borrow (α0 (deref α1)); α2 ] in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_size_balance :
    M.IsAssociatedFunction Self "size_balance" size_balance [].
  
  (*
      pub fn contains_balance(&self) -> bool {
          let caller = Self::env().caller();
          self.balances.contains(&caller)
      }
  *)
  Definition contains_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
      let* α1 := M.read self in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "mapping_integration_tests::Mapping")
              [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
              ])::["contains"]
          [ borrow (α0 (deref α1)); borrow caller ] in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_contains_balance :
    M.IsAssociatedFunction Self "contains_balance" contains_balance [].
  
  (*
      pub fn remove_balance(&mut self) {
          let caller = Self::env().caller();
          self.balances.remove(caller);
      }
  *)
  Definition remove_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
        let* α1 := M.read self in
        let* α2 := M.read caller in
        let* α3 :=
          M.call
            (Ty.apply
                (Ty.path "mapping_integration_tests::Mapping")
                [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
                ])::["remove"]
            [ borrow (α0 (deref α1)); α2 ] in
        M.alloc α3 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_remove_balance :
    M.IsAssociatedFunction Self "remove_balance" remove_balance [].
  
  (*
      pub fn take_balance(&mut self) -> Option<Balance> {
          let caller = Self::env().caller();
          self.balances.take(caller)
      }
  *)
  Definition take_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call (Ty.path "mapping_integration_tests::Mappings")::["env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "mapping_integration_tests::Env")::["caller"]
            [ borrow α1 ] in
        M.alloc α2 in
      let* α0 := M.var "mapping_integration_tests::Mappings::Get_balances" in
      let* α1 := M.read self in
      let* α2 := M.read caller in
      let* α3 :=
        M.call
          (Ty.apply
              (Ty.path "mapping_integration_tests::Mapping")
              [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128"
              ])::["take"]
          [ borrow (α0 (deref α1)); α2 ] in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_take_balance :
    M.IsAssociatedFunction Self "take_balance" take_balance [].
End Impl_mapping_integration_tests_Mappings.
