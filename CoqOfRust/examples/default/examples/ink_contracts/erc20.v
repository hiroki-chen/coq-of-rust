(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Mapping";
    ty_params := [ "K"; "V" ];
    fields :=
      [
        ("_key", Ty.apply (Ty.path "core::marker::PhantomData") [ K ]);
        ("_value", Ty.apply (Ty.path "core::marker::PhantomData") [ V ])
      ];
  } *)

Module Impl_core_default_Default_for_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t := Ty.apply (Ty.path "erc20::Mapping") [ K; V ].
  
  (* Default *)
  Definition default (K V : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self K V in
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "erc20::Mapping"
          [
            ("_key",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply (Ty.path "core::marker::PhantomData") [ K ],
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("_value",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply (Ty.path "core::marker::PhantomData") [ V ],
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (Self K V)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method (default K V)) ].
End Impl_core_default_Default_for_erc20_Mapping_K_V.

Module Impl_erc20_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t := Ty.apply (Ty.path "erc20::Mapping") [ K; V ].
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter get : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" (get K V).
  
  (*
      fn insert(&mut self, _key: K, _value: V) {
          unimplemented!()
      }
  *)
  Parameter insert : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" (insert K V).
End Impl_erc20_Mapping_K_V.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "erc20::AccountId"
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "u128", [], "default", [] |),
              []
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_erc20_AccountId.

Module Impl_core_clone_Clone_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_erc20_AccountId.

Module Impl_core_marker_Copy_for_erc20_AccountId.
  Definition Self : Ty.t := Ty.path "erc20::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_erc20_AccountId.

Axiom Balance : (Ty.path "erc20::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "erc20::AccountId") ];
  } *)

(* StructRecord
  {
    name := "Erc20";
    ty_params := [];
    fields :=
      [
        ("total_supply", Ty.path "u128");
        ("balances",
          Ty.apply (Ty.path "erc20::Mapping") [ Ty.path "erc20::AccountId"; Ty.path "u128" ]);
        ("allowances",
          Ty.apply
            (Ty.path "erc20::Mapping")
            [ Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ]; Ty.path "u128" ])
      ];
  } *)

Module Impl_core_default_Default_for_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "erc20::Erc20"
          [
            ("total_supply",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("balances",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("allowances",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [
                      Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                      Ty.path "u128"
                    ],
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_erc20_Erc20.

(* StructRecord
  {
    name := "Transfer";
    ty_params := [];
    fields :=
      [
        ("from", Ty.apply (Ty.path "core::option::Option") [ Ty.path "erc20::AccountId" ]);
        ("to", Ty.apply (Ty.path "core::option::Option") [ Ty.path "erc20::AccountId" ]);
        ("value", Ty.path "u128")
      ];
  } *)

(* StructRecord
  {
    name := "Approval";
    ty_params := [];
    fields :=
      [
        ("owner", Ty.path "erc20::AccountId");
        ("spender", Ty.path "erc20::AccountId");
        ("value", Ty.path "u128")
      ];
  } *)

(*
Enum Event
{
  ty_params := [];
  variants :=
    [
      {
        name := "Transfer";
        item := StructTuple [ Ty.path "erc20::Transfer" ];
        discriminant := None;
      };
      {
        name := "Approval";
        item := StructTuple [ Ty.path "erc20::Approval" ];
        discriminant := None;
      }
    ];
}
*)

(*
Enum Error
{
  ty_params := [];
  variants :=
    [
      {
        name := "InsufficientBalance";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "InsufficientAllowance";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "erc20::Result") [ T ]) =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "erc20::Error" ]).

Module Impl_erc20_Env.
  Definition Self : Ty.t := Ty.path "erc20::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (| M.get_struct_record_field (M.read (| self |)) "erc20::Env" "caller" |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event : M.IsAssociatedFunction Self "emit_event" emit_event.
End Impl_erc20_Env.

Module Impl_erc20_Erc20.
  Definition Self : Ty.t := Ty.path "erc20::Erc20".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "erc20::Erc20", "init_env", [] |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
End Impl_erc20_Erc20.

Module Wrap_Impl_erc20_Erc20_2.
Module Impl_erc20_Erc20.
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
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ total_supply ] =>
      ltac:(M.monadic
        (let total_supply := M.alloc (| total_supply |) in
        M.read (|
          let balances :=
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                  [],
                  "default",
                  []
                |),
                []
              |)
            |) in
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "caller", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "init_env", [] |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                  "insert",
                  []
                |),
                [ balances; M.read (| caller |); M.read (| total_supply |) ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "emit_event", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "init_env", [] |),
                      []
                    |)
                  |);
                  Value.StructTuple
                    "erc20::Event::Transfer"
                    [
                      Value.StructRecord
                        "erc20::Transfer"
                        [
                          ("from", Value.StructTuple "core::option::Option::None" []);
                          ("to",
                            Value.StructTuple "core::option::Option::Some" [ M.read (| caller |) ]);
                          ("value", M.read (| total_supply |))
                        ]
                    ]
                ]
              |)
            |) in
          M.alloc (|
            Value.StructRecord
              "erc20::Erc20"
              [
                ("total_supply", M.read (| total_supply |));
                ("balances", M.read (| balances |));
                ("allowances",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.apply
                        (Ty.path "erc20::Mapping")
                        [
                          Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                          Ty.path "u128"
                        ],
                      [],
                      "default",
                      []
                    |),
                    []
                  |))
              ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      fn total_supply(&self) -> Balance {
          self.total_supply
      }
  *)
  Definition total_supply (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (| M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "total_supply" |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_total_supply : M.IsAssociatedFunction Self "total_supply" total_supply.
  
  (*
      fn balance_of_impl(&self, owner: &AccountId) -> Balance {
          self.balances.get(owner).unwrap_or_default()
      }
  *)
  Definition balance_of_impl (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; owner ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let owner := M.alloc (| owner |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.apply (Ty.path "core::option::Option") [ Ty.path "u128" ],
            "unwrap_or_default",
            []
          |),
          [
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "erc20::Mapping") [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                "get",
                []
              |),
              [
                M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "balances";
                M.read (| owner |)
              ]
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_balance_of_impl :
    M.IsAssociatedFunction Self "balance_of_impl" balance_of_impl.
  
  (*
      fn balance_of(&self, owner: AccountId) -> Balance {
          self.balance_of_impl(&owner)
      }
  *)
  Definition balance_of (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; owner ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let owner := M.alloc (| owner |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "erc20::Erc20", "balance_of_impl", [] |),
          [ M.read (| self |); owner ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_balance_of : M.IsAssociatedFunction Self "balance_of" balance_of.
  
  (*
      fn allowance_impl(&self, owner: &AccountId, spender: &AccountId) -> Balance {
          self.allowances.get(&( *owner, *spender)).unwrap_or_default()
      }
  *)
  Definition allowance_impl (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; owner; spender ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let owner := M.alloc (| owner |) in
        let spender := M.alloc (| spender |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.apply (Ty.path "core::option::Option") [ Ty.path "u128" ],
            "unwrap_or_default",
            []
          |),
          [
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "erc20::Mapping")
                  [
                    Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                    Ty.path "u128"
                  ],
                "get",
                []
              |),
              [
                M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "allowances";
                M.alloc (|
                  Value.Tuple [ M.read (| M.read (| owner |) |); M.read (| M.read (| spender |) |) ]
                |)
              ]
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_allowance_impl :
    M.IsAssociatedFunction Self "allowance_impl" allowance_impl.
  
  (*
      fn allowance(&self, owner: AccountId, spender: AccountId) -> Balance {
          self.allowance_impl(&owner, &spender)
      }
  *)
  Definition allowance (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; owner; spender ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let owner := M.alloc (| owner |) in
        let spender := M.alloc (| spender |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "erc20::Erc20", "allowance_impl", [] |),
          [ M.read (| self |); owner; spender ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_allowance : M.IsAssociatedFunction Self "allowance" allowance.
  
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
  Definition transfer_from_to (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; from; to; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let from := M.alloc (| from |) in
        let to := M.alloc (| to |) in
        let value := M.alloc (| value |) in
        M.read (|
          let from_balance :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Erc20", "balance_of_impl", [] |),
                [ M.read (| self |); M.read (| from |) ]
              |)
            |) in
          let _ :=
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          BinOp.Pure.lt (M.read (| from_balance |)) (M.read (| value |))
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.read (|
                          M.return_ (|
                            Value.StructTuple
                              "core::result::Result::Err"
                              [ Value.StructTuple "erc20::Error::InsufficientBalance" [] ]
                          |)
                        |)
                      |)
                    |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                  "insert",
                  []
                |),
                [
                  M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "balances";
                  M.read (| M.read (| from |) |);
                  BinOp.Panic.sub (| M.read (| from_balance |), M.read (| value |) |)
                ]
              |)
            |) in
          let to_balance :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Erc20", "balance_of_impl", [] |),
                [ M.read (| self |); M.read (| to |) ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [ Ty.path "erc20::AccountId"; Ty.path "u128" ],
                  "insert",
                  []
                |),
                [
                  M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "balances";
                  M.read (| M.read (| to |) |);
                  BinOp.Panic.add (| M.read (| to_balance |), M.read (| value |) |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "emit_event", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "env", [] |),
                      [ M.read (| self |) ]
                    |)
                  |);
                  Value.StructTuple
                    "erc20::Event::Transfer"
                    [
                      Value.StructRecord
                        "erc20::Transfer"
                        [
                          ("from",
                            Value.StructTuple
                              "core::option::Option::Some"
                              [ M.read (| M.read (| from |) |) ]);
                          ("to",
                            Value.StructTuple
                              "core::option::Option::Some"
                              [ M.read (| M.read (| to |) |) ]);
                          ("value", M.read (| value |))
                        ]
                    ]
                ]
              |)
            |) in
          M.alloc (| Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_from_to :
    M.IsAssociatedFunction Self "transfer_from_to" transfer_from_to.
  
  (*
      fn transfer(&mut self, to: AccountId, value: Balance) -> Result<()> {
          let from = self.env().caller();
          self.transfer_from_to(&from, &to, value)
      }
  *)
  Definition transfer (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; to; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let to := M.alloc (| to |) in
        let value := M.alloc (| value |) in
        M.read (|
          let from :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "caller", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "env", [] |),
                      [ M.read (| self |) ]
                    |)
                  |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "erc20::Erc20", "transfer_from_to", [] |),
              [ M.read (| self |); from; to; M.read (| value |) ]
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer : M.IsAssociatedFunction Self "transfer" transfer.
  
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
  Definition approve (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; spender; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let spender := M.alloc (| spender |) in
        let value := M.alloc (| value |) in
        M.read (|
          let owner :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "caller", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "env", [] |),
                      [ M.read (| self |) ]
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [
                      Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                      Ty.path "u128"
                    ],
                  "insert",
                  []
                |),
                [
                  M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "allowances";
                  Value.Tuple [ M.read (| owner |); M.read (| spender |) ];
                  M.read (| value |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "emit_event", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "env", [] |),
                      [ M.read (| self |) ]
                    |)
                  |);
                  Value.StructTuple
                    "erc20::Event::Approval"
                    [
                      Value.StructRecord
                        "erc20::Approval"
                        [
                          ("owner", M.read (| owner |));
                          ("spender", M.read (| spender |));
                          ("value", M.read (| value |))
                        ]
                    ]
                ]
              |)
            |) in
          M.alloc (| Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_approve : M.IsAssociatedFunction Self "approve" approve.
  
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
  Definition transfer_from (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; from; to; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let from := M.alloc (| from |) in
        let to := M.alloc (| to |) in
        let value := M.alloc (| value |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Env", "caller", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "erc20::Erc20", "env", [] |),
                      [ M.read (| self |) ]
                    |)
                  |)
                ]
              |)
            |) in
          let allowance :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "erc20::Erc20", "allowance_impl", [] |),
                [ M.read (| self |); from; caller ]
              |)
            |) in
          let _ :=
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          BinOp.Pure.lt (M.read (| allowance |)) (M.read (| value |))
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.read (|
                          M.return_ (|
                            Value.StructTuple
                              "core::result::Result::Err"
                              [ Value.StructTuple "erc20::Error::InsufficientAllowance" [] ]
                          |)
                        |)
                      |)
                    |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |) in
          let _ :=
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::try_trait::Try",
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.tuple []; Ty.path "erc20::Error" ],
                    [],
                    "branch",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "erc20::Erc20",
                        "transfer_from_to",
                        []
                      |),
                      [ M.read (| self |); from; to; M.read (| value |) ]
                    |)
                  ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "core::ops::control_flow::ControlFlow::Break",
                        0
                      |) in
                    let residual := M.copy (| γ0_0 |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.read (|
                          M.return_ (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::try_trait::FromResidual",
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [ Ty.tuple []; Ty.path "erc20::Error" ],
                                [
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [ Ty.path "core::convert::Infallible"; Ty.path "erc20::Error" ]
                                ],
                                "from_residual",
                                []
                              |),
                              [ M.read (| residual |) ]
                            |)
                          |)
                        |)
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "core::ops::control_flow::ControlFlow::Continue",
                        0
                      |) in
                    let val := M.copy (| γ0_0 |) in
                    val))
              ]
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "erc20::Mapping")
                    [
                      Ty.tuple [ Ty.path "erc20::AccountId"; Ty.path "erc20::AccountId" ];
                      Ty.path "u128"
                    ],
                  "insert",
                  []
                |),
                [
                  M.get_struct_record_field (M.read (| self |)) "erc20::Erc20" "allowances";
                  Value.Tuple [ M.read (| from |); M.read (| caller |) ];
                  BinOp.Panic.sub (| M.read (| allowance |), M.read (| value |) |)
                ]
              |)
            |) in
          M.alloc (| Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_from :
    M.IsAssociatedFunction Self "transfer_from" transfer_from.
End Impl_erc20_Erc20.
End Wrap_Impl_erc20_Erc20_2.
Import Wrap_Impl_erc20_Erc20_2.
