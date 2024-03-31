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
      let* α0 := M.get_trait_method "core::default::Default" (Ty.path "u128") [] "default" [] in
      let* α1 := M.call_closure α0 [] in
      M.pure (Value.StructTuple "contract_transfer::AccountId" [ α1 ])
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
      let* self := M.alloc self in
      let* α0 := M.match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in M.read α0
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
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record_field α0 "contract_transfer::Env" "caller")
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
      let* self := M.alloc self in
      let* α0 := M.get_associated_function (Ty.path "contract_transfer::GiveMe") "init_env" [] in
      M.call_closure α0 []
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
    | [], [] => M.pure (Value.StructTuple "contract_transfer::GiveMe" [])
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
      let* self := M.alloc self in
      let* value := M.alloc value in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "requested value: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
          let* α9 :=
            (* Unsize *)
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "u128" ] in
              let* α7 := M.call_closure α6 [ value ] in
              let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
          let* α10 := M.call_closure α1 [ α5; α9 ] in
          let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "contract balance: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
          let* α16 :=
            (* Unsize *)
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "u128" ] in
              let* α7 :=
                M.get_associated_function (Ty.path "contract_transfer::Env") "balance" [] in
              let* α8 := M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
              let* α9 := M.read self in
              let* α10 := M.call_closure α8 [ α9 ] in
              let* α11 := M.alloc α10 in
              let* α12 := M.call_closure α7 [ α11 ] in
              let* α13 := M.alloc α12 in
              let* α14 := M.call_closure α6 [ α13 ] in
              let* α15 := M.alloc (Value.Array [ α14 ]) in M.pure (M.pointer_coercion α15) in
          let* α17 := M.call_closure α1 [ α5; α16 ] in
          let* α18 := M.call_closure α0 [ α17 ] in M.alloc α18 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* α0 := M.alloc (Value.Tuple []) in
        M.match_operator
          α0
          [
            fun γ =>
              let* γ :=
                let* α0 := M.read value in
                let* α1 :=
                  M.get_associated_function (Ty.path "contract_transfer::Env") "balance" [] in
                let* α2 :=
                  M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
                let* α3 := M.read self in
                let* α4 := M.call_closure α2 [ α3 ] in
                let* α5 := M.alloc α4 in
                let* α6 := M.call_closure α1 [ α5 ] in
                let* α7 := M.alloc (UnOp.Pure.not (BinOp.Pure.le α0 α6)) in M.pure (M.use α7) in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* α0 :=
                M.get_function
                  "std::panicking::begin_panic"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α1 := M.read (mk_str "insufficient funds!") in
              let* α2 := M.call_closure α0 [ α1 ] in let* α3 := M.never_to_any α2 in M.alloc α3;
            fun γ => M.alloc (Value.Tuple [])
          ] in
      let* α0 := M.alloc (Value.Tuple []) in
      let* α0 :=
        M.match_operator
          α0
          [
            fun γ =>
              let* γ :=
                let* α0 :=
                  M.get_associated_function
                    (Ty.apply (Ty.path "core::result::Result") [ Ty.tuple []; Ty.tuple [] ])
                    "is_err"
                    [] in
                let* α1 :=
                  M.get_associated_function (Ty.path "contract_transfer::Env") "transfer" [] in
                let* α2 :=
                  M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
                let* α3 := M.read self in
                let* α4 := M.call_closure α2 [ α3 ] in
                let* α5 := M.alloc α4 in
                let* α6 :=
                  M.get_associated_function (Ty.path "contract_transfer::Env") "caller" [] in
                let* α7 :=
                  M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
                let* α8 := M.read self in
                let* α9 := M.call_closure α7 [ α8 ] in
                let* α10 := M.alloc α9 in
                let* α11 := M.call_closure α6 [ α10 ] in
                let* α12 := M.read value in
                let* α13 := M.call_closure α1 [ α5; α11; α12 ] in
                let* α14 := M.alloc α13 in
                let* α15 := M.call_closure α0 [ α14 ] in
                let* α16 := M.alloc α15 in M.pure (M.use α16) in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* α0 :=
                M.get_function
                  "std::panicking::begin_panic"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α1 :=
                M.read
                  (mk_str
                    "requested transfer failed. this can be the case if the contract does nothave sufficient free funds or if the transfer would have brought thecontract's balance below minimum balance.") in
              let* α2 := M.call_closure α0 [ α1 ] in let* α3 := M.never_to_any α2 in M.alloc α3;
            fun γ => M.alloc (Value.Tuple [])
          ] in
      M.read α0
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
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "received payment: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
          let* α16 :=
            (* Unsize *)
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "u128" ] in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "contract_transfer::Env")
                  "transferred_value"
                  [] in
              let* α8 := M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
              let* α9 := M.read self in
              let* α10 := M.call_closure α8 [ α9 ] in
              let* α11 := M.alloc α10 in
              let* α12 := M.call_closure α7 [ α11 ] in
              let* α13 := M.alloc α12 in
              let* α14 := M.call_closure α6 [ α13 ] in
              let* α15 := M.alloc (Value.Array [ α14 ]) in M.pure (M.pointer_coercion α15) in
          let* α17 := M.call_closure α1 [ α5; α16 ] in
          let* α18 := M.call_closure α0 [ α17 ] in M.alloc α18 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* α0 := M.alloc (Value.Tuple []) in
        M.match_operator
          α0
          [
            fun γ =>
              let* γ :=
                let* α0 :=
                  M.get_associated_function
                    (Ty.path "contract_transfer::Env")
                    "transferred_value"
                    [] in
                let* α1 :=
                  M.get_associated_function (Ty.path "contract_transfer::GiveMe") "env" [] in
                let* α2 := M.read self in
                let* α3 := M.call_closure α1 [ α2 ] in
                let* α4 := M.alloc α3 in
                let* α5 := M.call_closure α0 [ α4 ] in
                let* α6 :=
                  M.alloc (UnOp.Pure.not (BinOp.Pure.eq α5 (Value.Integer Integer.U128 10))) in
                M.pure (M.use α6) in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* α0 :=
                M.get_function
                  "std::panicking::begin_panic"
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
              let* α1 := M.read (mk_str "payment was not ten") in
              let* α2 := M.call_closure α0 [ α1 ] in let* α3 := M.never_to_any α2 in M.alloc α3;
            fun γ => M.alloc (Value.Tuple [])
          ] in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_was_it_ten : M.IsAssociatedFunction Self "was_it_ten" was_it_ten.
End Impl_contract_transfer_GiveMe.
