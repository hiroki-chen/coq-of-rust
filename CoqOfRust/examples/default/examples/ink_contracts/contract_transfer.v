(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_contract_transfer_AccountId.
  Definition Self : Ty.t := Ty.path "contract_transfer::AccountId".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "contract_transfer::AccountId"
          [
            M.call_closure
              (|
                (M.get_trait_method
                  (| "core::default::Default", (Ty.path "u128"), [], "default", []
                  |)),
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
End Impl_core_default_Default_for_contract_transfer_AccountId.

Module Impl_core_clone_Clone_for_contract_transfer_AccountId.
  Definition Self : Ty.t := Ty.path "contract_transfer::AccountId".
  
  (*
  Clone
  *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read
          (|
            (M.match_operator
              (| Value.DeclaredButUndefined, [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
              |))
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_contract_transfer_AccountId.

Module Impl_core_marker_Copy_for_contract_transfer_AccountId.
  Definition Self : Ty.t := Ty.path "contract_transfer::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_contract_transfer_AccountId.

Axiom Balance : (Ty.path "contract_transfer::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "contract_transfer::AccountId") ];
  } *)

Module Impl_contract_transfer_Env.
  Definition Self : Ty.t := Ty.path "contract_transfer::Env".
  
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
        M.read
          (| (M.get_struct_record_field (M.read (| self |)) "contract_transfer::Env" "caller")
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  (*
      fn balance(&self) -> Balance {
          unimplemented!()
      }
  *)
  Parameter balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_balance : M.IsAssociatedFunction Self "balance" balance.
  
  (*
      fn transfer(&mut self, _to: AccountId, _value: Balance) -> Result<(), ()> {
          unimplemented!()
      }
  *)
  Parameter transfer : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_transfer : M.IsAssociatedFunction Self "transfer" transfer.
  
  (*
      fn transferred_value(&self) -> Balance {
          unimplemented!()
      }
  *)
  Parameter transferred_value : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_transferred_value :
    M.IsAssociatedFunction Self "transferred_value" transferred_value.
End Impl_contract_transfer_Env.

(* StructTuple
  {
    name := "GiveMe";
    ty_params := [];
  } *)

Module Impl_contract_transfer_GiveMe.
  Definition Self : Ty.t := Ty.path "contract_transfer::GiveMe".
  
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
        M.call_closure
          (|
            (M.get_associated_function (| (Ty.path "contract_transfer::GiveMe"), "init_env", [] |)),
            []
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => ltac:(M.monadic (Value.StructTuple "contract_transfer::GiveMe" []))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn give_me(&mut self, value: Balance) {
          println!("requested value: {}", value);
          println!("contract balance: {}", self.env().balance());
  
          assert!(value <= self.env().balance(), "insufficient funds!");
  
          if self.env().transfer(self.env().caller(), value).is_err() {
              panic!(
                  "requested transfer failed. this can be the case if the contract does not\
                   have sufficient free funds or if the transfer would have brought the\
                   contract's balance below minimum balance."
              )
          }
      }
  *)
  Definition give_me (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let value := M.alloc (| value |) in
        M.read
          (|
            (let _ :=
              let _ :=
                M.alloc
                  (|
                    (M.call_closure
                      (|
                        (M.get_function (| "std::io::stdio::_print", [] |)),
                        [
                          M.call_closure
                            (|
                              (M.get_associated_function
                                (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                                |)),
                              [
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.read (| (mk_str "requested value: ") |);
                                            M.read (| (mk_str "
") |)
                                          ])
                                      |));
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.call_closure
                                              (|
                                                (M.get_associated_function
                                                  (|
                                                    (Ty.path "core::fmt::rt::Argument"),
                                                    "new_display",
                                                    [ Ty.path "u128" ]
                                                  |)),
                                                [ value ]
                                              |)
                                          ])
                                      |))
                              ]
                            |)
                        ]
                      |))
                  |) in
              M.alloc (| (Value.Tuple []) |) in
            let _ :=
              let _ :=
                M.alloc
                  (|
                    (M.call_closure
                      (|
                        (M.get_function (| "std::io::stdio::_print", [] |)),
                        [
                          M.call_closure
                            (|
                              (M.get_associated_function
                                (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                                |)),
                              [
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.read (| (mk_str "contract balance: ") |);
                                            M.read (| (mk_str "
") |)
                                          ])
                                      |));
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.call_closure
                                              (|
                                                (M.get_associated_function
                                                  (|
                                                    (Ty.path "core::fmt::rt::Argument"),
                                                    "new_display",
                                                    [ Ty.path "u128" ]
                                                  |)),
                                                [
                                                  M.alloc
                                                    (|
                                                      (M.call_closure
                                                        (|
                                                          (M.get_associated_function
                                                            (|
                                                              (Ty.path "contract_transfer::Env"),
                                                              "balance",
                                                              []
                                                            |)),
                                                          [
                                                            M.alloc
                                                              (|
                                                                (M.call_closure
                                                                  (|
                                                                    (M.get_associated_function
                                                                      (|
                                                                        (Ty.path
                                                                          "contract_transfer::GiveMe"),
                                                                        "env",
                                                                        []
                                                                      |)),
                                                                    [ M.read (| self |) ]
                                                                  |))
                                                              |)
                                                          ]
                                                        |))
                                                    |)
                                                ]
                                              |)
                                          ])
                                      |))
                              ]
                            |)
                        ]
                      |))
                  |) in
              M.alloc (| (Value.Tuple []) |) in
            let _ :=
              M.match_operator
                (|
                  (M.alloc (| (Value.Tuple []) |)),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc
                              (|
                                (UnOp.Pure.not
                                  (BinOp.Pure.le
                                    (M.read (| value |))
                                    (M.call_closure
                                      (|
                                        (M.get_associated_function
                                          (| (Ty.path "contract_transfer::Env"), "balance", []
                                          |)),
                                        [
                                          M.alloc
                                            (|
                                              (M.call_closure
                                                (|
                                                  (M.get_associated_function
                                                    (|
                                                      (Ty.path "contract_transfer::GiveMe"),
                                                      "env",
                                                      []
                                                    |)),
                                                  [ M.read (| self |) ]
                                                |))
                                            |)
                                        ]
                                      |))))
                              |)) in
                        let _ :=
                          M.is_constant_or_break_match (| (M.read (| γ |)), (Value.Bool true) |) in
                        M.alloc
                          (|
                            (M.never_to_any
                              (|
                                (M.call_closure
                                  (|
                                    (M.get_function
                                      (|
                                        "std::panicking::begin_panic",
                                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                      |)),
                                    [ M.read (| (mk_str "insufficient funds!") |) ]
                                  |))
                              |))
                          |)));
                    fun γ => ltac:(M.monadic (M.alloc (| (Value.Tuple []) |)))
                  ]
                |) in
            M.match_operator
              (|
                (M.alloc (| (Value.Tuple []) |)),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ :=
                        M.use
                          (M.alloc
                            (|
                              (M.call_closure
                                (|
                                  (M.get_associated_function
                                    (|
                                      (Ty.apply
                                        (Ty.path "core::result::Result")
                                        [ Ty.tuple []; Ty.tuple [] ]),
                                      "is_err",
                                      []
                                    |)),
                                  [
                                    M.alloc
                                      (|
                                        (M.call_closure
                                          (|
                                            (M.get_associated_function
                                              (| (Ty.path "contract_transfer::Env"), "transfer", []
                                              |)),
                                            [
                                              M.alloc
                                                (|
                                                  (M.call_closure
                                                    (|
                                                      (M.get_associated_function
                                                        (|
                                                          (Ty.path "contract_transfer::GiveMe"),
                                                          "env",
                                                          []
                                                        |)),
                                                      [ M.read (| self |) ]
                                                    |))
                                                |);
                                              M.call_closure
                                                (|
                                                  (M.get_associated_function
                                                    (|
                                                      (Ty.path "contract_transfer::Env"),
                                                      "caller",
                                                      []
                                                    |)),
                                                  [
                                                    M.alloc
                                                      (|
                                                        (M.call_closure
                                                          (|
                                                            (M.get_associated_function
                                                              (|
                                                                (Ty.path
                                                                  "contract_transfer::GiveMe"),
                                                                "env",
                                                                []
                                                              |)),
                                                            [ M.read (| self |) ]
                                                          |))
                                                      |)
                                                  ]
                                                |);
                                              M.read (| value |)
                                            ]
                                          |))
                                      |)
                                  ]
                                |))
                            |)) in
                      let _ :=
                        M.is_constant_or_break_match (| (M.read (| γ |)), (Value.Bool true) |) in
                      M.alloc
                        (|
                          (M.never_to_any
                            (|
                              (M.call_closure
                                (|
                                  (M.get_function
                                    (|
                                      "std::panicking::begin_panic",
                                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                    |)),
                                  [
                                    M.read
                                      (|
                                        (mk_str
                                          "requested transfer failed. this can be the case if the contract does nothave sufficient free funds or if the transfer would have brought thecontract's balance below minimum balance.")
                                      |)
                                  ]
                                |))
                            |))
                        |)));
                  fun γ => ltac:(M.monadic (M.alloc (| (Value.Tuple []) |)))
                ]
              |))
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_give_me : M.IsAssociatedFunction Self "give_me" give_me.
  
  (*
      pub fn was_it_ten(&self) {
          println!("received payment: {}", self.env().transferred_value());
          assert!(self.env().transferred_value() == 10, "payment was not ten");
      }
  *)
  Definition was_it_ten (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read
          (|
            (let _ :=
              let _ :=
                M.alloc
                  (|
                    (M.call_closure
                      (|
                        (M.get_function (| "std::io::stdio::_print", [] |)),
                        [
                          M.call_closure
                            (|
                              (M.get_associated_function
                                (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                                |)),
                              [
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.read (| (mk_str "received payment: ") |);
                                            M.read (| (mk_str "
") |)
                                          ])
                                      |));
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            M.call_closure
                                              (|
                                                (M.get_associated_function
                                                  (|
                                                    (Ty.path "core::fmt::rt::Argument"),
                                                    "new_display",
                                                    [ Ty.path "u128" ]
                                                  |)),
                                                [
                                                  M.alloc
                                                    (|
                                                      (M.call_closure
                                                        (|
                                                          (M.get_associated_function
                                                            (|
                                                              (Ty.path "contract_transfer::Env"),
                                                              "transferred_value",
                                                              []
                                                            |)),
                                                          [
                                                            M.alloc
                                                              (|
                                                                (M.call_closure
                                                                  (|
                                                                    (M.get_associated_function
                                                                      (|
                                                                        (Ty.path
                                                                          "contract_transfer::GiveMe"),
                                                                        "env",
                                                                        []
                                                                      |)),
                                                                    [ M.read (| self |) ]
                                                                  |))
                                                              |)
                                                          ]
                                                        |))
                                                    |)
                                                ]
                                              |)
                                          ])
                                      |))
                              ]
                            |)
                        ]
                      |))
                  |) in
              M.alloc (| (Value.Tuple []) |) in
            let _ :=
              M.match_operator
                (|
                  (M.alloc (| (Value.Tuple []) |)),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc
                              (|
                                (UnOp.Pure.not
                                  (BinOp.Pure.eq
                                    (M.call_closure
                                      (|
                                        (M.get_associated_function
                                          (|
                                            (Ty.path "contract_transfer::Env"),
                                            "transferred_value",
                                            []
                                          |)),
                                        [
                                          M.alloc
                                            (|
                                              (M.call_closure
                                                (|
                                                  (M.get_associated_function
                                                    (|
                                                      (Ty.path "contract_transfer::GiveMe"),
                                                      "env",
                                                      []
                                                    |)),
                                                  [ M.read (| self |) ]
                                                |))
                                            |)
                                        ]
                                      |))
                                    (Value.Integer Integer.U128 10)))
                              |)) in
                        let _ :=
                          M.is_constant_or_break_match (| (M.read (| γ |)), (Value.Bool true) |) in
                        M.alloc
                          (|
                            (M.never_to_any
                              (|
                                (M.call_closure
                                  (|
                                    (M.get_function
                                      (|
                                        "std::panicking::begin_panic",
                                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                      |)),
                                    [ M.read (| (mk_str "payment was not ten") |) ]
                                  |))
                              |))
                          |)));
                    fun γ => ltac:(M.monadic (M.alloc (| (Value.Tuple []) |)))
                  ]
                |) in
            M.alloc (| (Value.Tuple []) |))
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_was_it_ten : M.IsAssociatedFunction Self "was_it_ten" was_it_ten.
End Impl_contract_transfer_GiveMe.
