(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Mapping *)

Module Impl_core_default_Default_for_erc20_Mapping_K_V.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; K; V ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ K ] ] in
      let* α1 := M.call α0 [] in
      let* α2 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.apply (Ty.path "core::marker::PhantomData") [ V ] ] in
      let* α3 := M.call α2 [] in
      M.pure
        (Value.StructRecord "erc20::Mapping" [ ("_key", α1); ("_value", α3) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.apply (Ty.path "erc20::Mapping") [ K; V ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [ K; V ].
End Impl_core_default_Default_for_erc20_Mapping_K_V.

Module Impl_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "erc20::Mapping") [ K; V ].
  
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
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" get [ K; V ].
  
  (*
      fn insert(&mut self, _key: K, _value: V) {
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
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" insert [ K; V ].
End Impl_erc20_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_erc20_AccountId.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call α0 [] in
      M.pure (Value.StructTuple "erc20::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "erc20::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_erc20_AccountId.

Module Impl_core_clone_Clone_for_erc20_AccountId.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => (M.read self) ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "erc20::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_erc20_AccountId.

Module Impl_core_marker_Copy_for_erc20_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "erc20::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_erc20_AccountId.

Axiom Balance : (Ty.path "erc20::Balance") = (Ty.path "u128").

(* Struct Env *)

(* Struct Erc20 *)

Module Impl_core_default_Default_for_erc20_Erc20.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call α0 [] in
      let* α2 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [
            (* Self *)
              Ty.apply
                (Ty.path "erc20::Mapping")
                [ Ty.path "erc20::AccountId"; Ty.path "u128" ]
          ] in
      let* α3 := M.call α2 [] in
      let* α4 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [
            (* Self *)
              Ty.apply
                (Ty.path "erc20::Mapping")
                [
                  Ty.tuple
                    [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                  Ty.path "u128"
                ]
          ] in
      let* α5 := M.call α4 [] in
      M.pure
        (Value.StructRecord
          "erc20::Erc20"
          [ ("total_supply", α1); ("balances", α3); ("allowances", α5) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "erc20::Erc20")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_erc20_Erc20.

(* Struct Transfer *)

(* Struct Approval *)

(* Enum Event *)

(* Enum Error *)

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "erc20::Result") =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "erc20::Error" ]).

Module Impl_erc20_Env.
  Definition Self : Ty.t := Ty.path "erc20::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "caller")
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
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
End Impl_erc20_Env.

Module Impl_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
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
      M.never_to_any α2
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
      M.call (Ty.path "erc20::Erc20")::["init_env"] []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
End Impl_erc20_Erc20.

Module Impl_erc20_Erc20_2.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  (*
      fn new(total_supply: Balance) -> Self {
          let mut balances = Mapping::default();
          let caller = Self::init_env().caller();
          balances.insert(caller, total_supply);
          Self::init_env().emit_event(Event::Transfer(Transfer {
              from: None,
              to: Some(caller),
              value: total_supply,
          }));
          Self {
              total_supply,
              balances,
              allowances: Default::default(),
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ total_supply ] =>
      let* total_supply := M.alloc total_supply in
      let* balances :=
        let* α0 :=
          M.get_trait_method
            "core::default::Default"
            "default"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "erc20::Mapping")
                  [ Ty.path "erc20::AccountId"; Ty.path "u128" ]
            ] in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* caller :=
        let* α0 := M.call (Ty.path "erc20::Erc20")::["init_env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 := M.call (Ty.path "erc20::Env")::["caller"] [ α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.read caller in
        let* α1 := M.read total_supply in
        let* α2 :=
          M.call
            (Ty.apply
                (Ty.path "erc20::Mapping")
                [ Ty.path "erc20::AccountId"; Ty.path "u128" ])::["insert"]
            [ balances; α0; α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.call (Ty.path "erc20::Erc20")::["init_env"] [] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read caller in
        let* α3 := M.read total_supply in
        let* α4 :=
          M.call
            (Ty.path "erc20::Env")::["emit_event"]
            [
              α1;
              Value.StructTuple
                "erc20::Event::Transfer"
                [
                  Value.StructRecord
                    "erc20::Transfer"
                    [
                      ("from", core.option.Option.None);
                      ("to",
                        Value.StructTuple "core::option::Option::Some" [ α2 ]);
                      ("value", α3)
                    ]
                ]
            ] in
        M.alloc α4 in
      let* α0 := M.read total_supply in
      let* α1 := M.read balances in
      let* α2 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [
            (* Self *)
              Ty.apply
                (Ty.path "erc20::Mapping")
                [
                  Ty.tuple
                    [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                  Ty.path "u128"
                ]
          ] in
      let* α3 := M.call α2 [] in
      let* α0 :=
        M.alloc
          (Value.StructRecord
            "erc20::Erc20"
            [ ("total_supply", α0); ("balances", α1); ("allowances", α3) ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      fn total_supply(&self) -> Balance {
          self.total_supply
      }
  *)
  Definition total_supply (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "total_supply")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_total_supply :
    M.IsAssociatedFunction Self "total_supply" total_supply [].
  
  (*
      fn balance_of_impl(&self, owner: &AccountId) -> Balance {
          self.balances.get(owner).unwrap_or_default()
      }
  *)
  Definition balance_of_impl (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; owner ] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* α0 := M.read self in
      let* α1 := M.read owner in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "erc20::Mapping")
              [ Ty.path "erc20::AccountId"; Ty.path "u128" ])::["get"]
          [ M.get_struct_record α0 "balances"; α1 ] in
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "u128" ])::["unwrap_or_default"]
        [ α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_balance_of_impl :
    M.IsAssociatedFunction Self "balance_of_impl" balance_of_impl [].
  
  (*
      fn balance_of(&self, owner: AccountId) -> Balance {
          self.balance_of_impl(&owner)
      }
  *)
  Definition balance_of (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; owner ] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* α0 := M.read self in
      M.call (Ty.path "erc20::Erc20")::["balance_of_impl"] [ α0; owner ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_balance_of :
    M.IsAssociatedFunction Self "balance_of" balance_of [].
  
  (*
      fn allowance_impl(&self, owner: &AccountId, spender: &AccountId) -> Balance {
          self.allowances.get(&( *owner, *spender)).unwrap_or_default()
      }
  *)
  Definition allowance_impl (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; owner; spender ] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* spender := M.alloc spender in
      let* α0 := M.read self in
      let* α1 := M.read owner in
      let* α2 := M.read α1 in
      let* α3 := M.read spender in
      let* α4 := M.read α3 in
      let* α5 := M.alloc (α2, α4) in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "erc20::Mapping")
              [
                Ty.tuple
                  [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                Ty.path "u128"
              ])::["get"]
          [ M.get_struct_record α0 "allowances"; α5 ] in
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "u128" ])::["unwrap_or_default"]
        [ α6 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_allowance_impl :
    M.IsAssociatedFunction Self "allowance_impl" allowance_impl [].
  
  (*
      fn allowance(&self, owner: AccountId, spender: AccountId) -> Balance {
          self.allowance_impl(&owner, &spender)
      }
  *)
  Definition allowance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; owner; spender ] =>
      let* self := M.alloc self in
      let* owner := M.alloc owner in
      let* spender := M.alloc spender in
      let* α0 := M.read self in
      M.call (Ty.path "erc20::Erc20")::["allowance_impl"] [ α0; owner; spender ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_allowance :
    M.IsAssociatedFunction Self "allowance" allowance [].
  
  (*
      fn transfer_from_to(&mut self, from: &AccountId, to: &AccountId, value: Balance) -> Result<()> {
          let from_balance = self.balance_of_impl(from);
          if from_balance < value {
              return Err(Error::InsufficientBalance);
          }
  
          self.balances.insert( *from, from_balance - value);
          let to_balance = self.balance_of_impl(to);
          self.balances.insert( *to, to_balance + value);
          self.env().emit_event(Event::Transfer(Transfer {
              from: Some( *from),
              to: Some( *to),
              value,
          }));
          Ok(())
      }
  *)
  Definition transfer_from_to (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; from; to; value ] =>
      let* self := M.alloc self in
      let* from := M.alloc from in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "erc20::Error" ]) in
      M.catch_return
        (let* from_balance :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 :=
            M.call (Ty.path "erc20::Erc20")::["balance_of_impl"] [ α0; α1 ] in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.read from_balance in
          let* α1 := M.read value in
          let* α2 := M.alloc (BinOp.Pure.lt α0 α1) in
          let* α3 := M.read (M.use α2) in
          if α3 then
            let* α0 :=
              return_
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ erc20.Error.InsufficientBalance ]) in
            let* α1 := M.read α0 in
            let* α2 := M.never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 := M.read α1 in
          let* α3 := M.read from_balance in
          let* α4 := M.read value in
          let* α5 := BinOp.Panic.sub α3 α4 in
          let* α6 :=
            M.call
              (Ty.apply
                  (Ty.path "erc20::Mapping")
                  [ Ty.path "erc20::AccountId"; Ty.path "u128" ])::["insert"]
              [ M.get_struct_record α0 "balances"; α2; α5 ] in
          M.alloc α6 in
        let* to_balance :=
          let* α0 := M.read self in
          let* α1 := M.read to in
          let* α2 :=
            M.call (Ty.path "erc20::Erc20")::["balance_of_impl"] [ α0; α1 ] in
          M.alloc α2 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read to in
          let* α2 := M.read α1 in
          let* α3 := M.read to_balance in
          let* α4 := M.read value in
          let* α5 := BinOp.Panic.add α3 α4 in
          let* α6 :=
            M.call
              (Ty.apply
                  (Ty.path "erc20::Mapping")
                  [ Ty.path "erc20::AccountId"; Ty.path "u128" ])::["insert"]
              [ M.get_struct_record α0 "balances"; α2; α5 ] in
          M.alloc α6 in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.call (Ty.path "erc20::Erc20")::["env"] [ α0 ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.read from in
          let* α4 := M.read α3 in
          let* α5 := M.read to in
          let* α6 := M.read α5 in
          let* α7 := M.read value in
          let* α8 :=
            M.call
              (Ty.path "erc20::Env")::["emit_event"]
              [
                α2;
                Value.StructTuple
                  "erc20::Event::Transfer"
                  [
                    Value.StructRecord
                      "erc20::Transfer"
                      [
                        ("from",
                          Value.StructTuple
                            "core::option::Option::Some"
                            [ α4 ]);
                        ("to",
                          Value.StructTuple
                            "core::option::Option::Some"
                            [ α6 ]);
                        ("value", α7)
                      ]
                  ]
              ] in
          M.alloc α8 in
        let* α0 :=
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_from_to :
    M.IsAssociatedFunction Self "transfer_from_to" transfer_from_to [].
  
  (*
      fn transfer(&mut self, to: AccountId, value: Balance) -> Result<()> {
          let from = self.env().caller();
          self.transfer_from_to(&from, &to, value)
      }
  *)
  Definition transfer (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; to; value ] =>
      let* self := M.alloc self in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let* from :=
        let* α0 := M.read self in
        let* α1 := M.call (Ty.path "erc20::Erc20")::["env"] [ α0 ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.call (Ty.path "erc20::Env")::["caller"] [ α2 ] in
        M.alloc α3 in
      let* α0 := M.read self in
      let* α1 := M.read value in
      let* α2 :=
        M.call
          (Ty.path "erc20::Erc20")::["transfer_from_to"]
          [ α0; from; to; α1 ] in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer :
    M.IsAssociatedFunction Self "transfer" transfer [].
  
  (*
      fn approve(&mut self, spender: AccountId, value: Balance) -> Result<()> {
          let owner = self.env().caller();
          self.allowances.insert((owner, spender), value);
          self.env().emit_event(Event::Approval(Approval {
              owner,
              spender,
              value,
          }));
          Ok(())
      }
  *)
  Definition approve (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; spender; value ] =>
      let* self := M.alloc self in
      let* spender := M.alloc spender in
      let* value := M.alloc value in
      let* owner :=
        let* α0 := M.read self in
        let* α1 := M.call (Ty.path "erc20::Erc20")::["env"] [ α0 ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.call (Ty.path "erc20::Env")::["caller"] [ α2 ] in
        M.alloc α3 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read owner in
        let* α2 := M.read spender in
        let* α3 := M.read value in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "erc20::Mapping")
                [
                  Ty.tuple
                    [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                  Ty.path "u128"
                ])::["insert"]
            [ M.get_struct_record α0 "allowances"; (α1, α2); α3 ] in
        M.alloc α4 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.call (Ty.path "erc20::Erc20")::["env"] [ α0 ] in
        let* α2 := M.alloc α1 in
        let* α3 := M.read owner in
        let* α4 := M.read spender in
        let* α5 := M.read value in
        let* α6 :=
          M.call
            (Ty.path "erc20::Env")::["emit_event"]
            [
              α2;
              Value.StructTuple
                "erc20::Event::Approval"
                [
                  Value.StructRecord
                    "erc20::Approval"
                    [ ("owner", α3); ("spender", α4); ("value", α5) ]
                ]
            ] in
        M.alloc α6 in
      let* α0 :=
        M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_approve :
    M.IsAssociatedFunction Self "approve" approve [].
  
  (*
      fn transfer_from(&mut self, from: AccountId, to: AccountId, value: Balance) -> Result<()> {
          let caller = self.env().caller();
          let allowance = self.allowance_impl(&from, &caller);
          if allowance < value {
              return Err(Error::InsufficientAllowance);
          }
          self.transfer_from_to(&from, &to, value)?;
          self.allowances.insert((from, caller), allowance - value);
          Ok(())
      }
  *)
  Definition transfer_from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; from; to; value ] =>
      let* self := M.alloc self in
      let* from := M.alloc from in
      let* to := M.alloc to in
      let* value := M.alloc value in
      let return_ :=
        M.return_
          (R :=
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "erc20::Error" ]) in
      M.catch_return
        (let* caller :=
          let* α0 := M.read self in
          let* α1 := M.call (Ty.path "erc20::Erc20")::["env"] [ α0 ] in
          let* α2 := M.alloc α1 in
          let* α3 := M.call (Ty.path "erc20::Env")::["caller"] [ α2 ] in
          M.alloc α3 in
        let* allowance :=
          let* α0 := M.read self in
          let* α1 :=
            M.call
              (Ty.path "erc20::Erc20")::["allowance_impl"]
              [ α0; from; caller ] in
          M.alloc α1 in
        let* _ :=
          let* α0 := M.read allowance in
          let* α1 := M.read value in
          let* α2 := M.alloc (BinOp.Pure.lt α0 α1) in
          let* α3 := M.read (M.use α2) in
          if α3 then
            let* α0 :=
              return_
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ erc20.Error.InsufficientAllowance ]) in
            let* α1 := M.read α0 in
            let* α2 := M.never_to_any α1 in
            M.alloc α2
          else
            M.alloc tt in
        let* _ :=
          let* α0 :=
            M.get_trait_method
              "core::ops::try_trait::Try"
              "branch"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.tuple []; Ty.path "erc20::Error" ]
              ] in
          let* α1 := M.read self in
          let* α2 := M.read value in
          let* α3 :=
            M.call
              (Ty.path "erc20::Erc20")::["transfer_from_to"]
              [ α1; from; to; α2 ] in
          let* α4 := M.call α0 [ α3 ] in
          let* α5 := M.alloc α4 in
          match_operator
            α5
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_trait_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [ Ty.tuple []; Ty.path "erc20::Error" ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "core::convert::Infallible";
                              Ty.path "erc20::Error"
                            ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := M.never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end)
            ] in
        let* _ :=
          let* α0 := M.read self in
          let* α1 := M.read from in
          let* α2 := M.read caller in
          let* α3 := M.read allowance in
          let* α4 := M.read value in
          let* α5 := BinOp.Panic.sub α3 α4 in
          let* α6 :=
            M.call
              (Ty.apply
                  (Ty.path "erc20::Mapping")
                  [
                    Ty.tuple
                      [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId"
                      ];
                    Ty.path "u128"
                  ])::["insert"]
              [ M.get_struct_record α0 "allowances"; (α1, α2); α5 ] in
          M.alloc α6 in
        let* α0 :=
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ tt ]) in
        M.read α0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_from :
    M.IsAssociatedFunction Self "transfer_from" transfer_from [].
End Impl_erc20_Erc20_2.
