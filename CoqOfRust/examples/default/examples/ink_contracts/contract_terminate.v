(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          (Ty.path "u128")
          []
          "default"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.pure (Value.StructTuple "contract_terminate::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_contract_terminate_AccountId.

Module Impl_core_clone_Clone_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  (*
  Clone
  *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_contract_terminate_AccountId.

Module Impl_core_marker_Copy_for_contract_terminate_AccountId.
  Definition Self : Ty.t := Ty.path "contract_terminate::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_contract_terminate_AccountId.

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "contract_terminate::AccountId") ];
  } *)

Module Impl_contract_terminate_Env.
  Definition Self : Ty.t := Ty.path "contract_terminate::Env".
  
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
      M.read (M.get_struct_record_field α0 "contract_terminate::Env" "caller")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  (*
      fn terminate_contract(&self, _account: AccountId) {
          unimplemented!()
      }
  *)
  Parameter terminate_contract : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_terminate_contract :
    M.IsAssociatedFunction Self "terminate_contract" terminate_contract.
End Impl_contract_terminate_Env.

(* StructTuple
  {
    name := "JustTerminate";
    ty_params := [];
  } *)

Module Impl_contract_terminate_JustTerminate.
  Definition Self : Ty.t := Ty.path "contract_terminate::JustTerminate".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_associated_function
          (Ty.path "contract_terminate::JustTerminate")
          "init_env"
          [] in
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
    | [], [] =>
      M.pure (Value.StructTuple "contract_terminate::JustTerminate" [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn terminate_me(&mut self) {
          self.env().terminate_contract(self.env().caller());
      }
  *)
  Definition terminate_me (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.path "contract_terminate::Env")
            "terminate_contract"
            [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "contract_terminate::JustTerminate")
            "env"
            [] in
        let* α2 := M.read self in
        let* α3 := M.call_closure α1 [ α2 ] in
        let* α4 := M.alloc α3 in
        let* α5 :=
          M.get_associated_function
            (Ty.path "contract_terminate::Env")
            "caller"
            [] in
        let* α6 :=
          M.get_associated_function
            (Ty.path "contract_terminate::JustTerminate")
            "env"
            [] in
        let* α7 := M.read self in
        let* α8 := M.call_closure α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call_closure α5 [ α9 ] in
        let* α11 := M.call_closure α0 [ α4; α10 ] in
        M.alloc α11 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_terminate_me :
    M.IsAssociatedFunction Self "terminate_me" terminate_me.
End Impl_contract_terminate_JustTerminate.
