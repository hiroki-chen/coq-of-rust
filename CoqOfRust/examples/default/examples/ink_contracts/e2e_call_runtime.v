(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_e2e_call_runtime_AccountId.
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
      M.pure (Value.StructTuple "e2e_call_runtime::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "e2e_call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_e2e_call_runtime_AccountId.

Module Impl_core_clone_Clone_for_e2e_call_runtime_AccountId.
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
      (* Self *) (Ty.path "e2e_call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_e2e_call_runtime_AccountId.

Module Impl_core_marker_Copy_for_e2e_call_runtime_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "e2e_call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_e2e_call_runtime_AccountId.

Axiom Balance : (Ty.path "e2e_call_runtime::Balance") = (Ty.path "u128").

(* Struct Env *)

Module Impl_e2e_call_runtime_Env.
  Definition Self : Ty.t := Ty.path "e2e_call_runtime::Env".
  
  (*
      fn balance(&self) -> Balance {
          unimplemented!()
      }
  *)
  Definition balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.get_function "core::panicking::panic" [] in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_balance :
    M.IsAssociatedFunction Self "balance" balance [].
End Impl_e2e_call_runtime_Env.

(* Struct Contract *)

Module Impl_core_default_Default_for_e2e_call_runtime_Contract.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] => M.pure (Value.StructTuple "e2e_call_runtime::Contract" [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "e2e_call_runtime::Contract")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_e2e_call_runtime_Contract.

Module Impl_e2e_call_runtime_Contract.
  Definition Self : Ty.t := Ty.path "e2e_call_runtime::Contract".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 := M.get_function "core::panicking::panic" [] in
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
      let* α0 :=
        M.get_associated_function
          (Ty.path "e2e_call_runtime::Contract")
          "init_env" in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] => M.pure (Value.StructTuple "e2e_call_runtime::Contract" [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn get_contract_balance(&self) -> Balance {
          self.env().balance()
      }
  *)
  Definition get_contract_balance (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_associated_function (Ty.path "e2e_call_runtime::Env") "balance" in
      let* α1 :=
        M.get_associated_function
          (Ty.path "e2e_call_runtime::Contract")
          "env" in
      let* α2 := M.read self in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.alloc α3 in
      M.call α0 [ α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_contract_balance :
    M.IsAssociatedFunction Self "get_contract_balance" get_contract_balance [].
End Impl_e2e_call_runtime_Contract.
