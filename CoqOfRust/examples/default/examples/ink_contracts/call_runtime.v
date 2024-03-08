(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_call_runtime_AccountId.
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
      M.pure (Value.StructTuple "call_runtime::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_call_runtime_AccountId.

Module Impl_core_clone_Clone_for_call_runtime_AccountId.
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
      (* Self *) (Ty.path "call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_call_runtime_AccountId.

Module Impl_core_marker_Copy_for_call_runtime_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "call_runtime::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_call_runtime_AccountId.

Axiom Balance : (Ty.path "call_runtime::Balance") = (Ty.path "u128").

(* Struct Env *)

(* Enum MultiAddress *)

Module Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.
  (*
      fn from(_value: AccountId) -> Self {
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
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *)
        (Ty.apply
          (Ty.path "call_runtime::MultiAddress")
          [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ])
      (* Trait polymorphic types *)
        [ (* T *) Ty.path "call_runtime::AccountId" ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.

(* Enum BalancesCall *)

(* Enum RuntimeCall *)

(* Struct RuntimeCaller *)

Module Impl_core_default_Default_for_call_runtime_RuntimeCaller.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] => M.pure call_runtime.RuntimeCaller.Build
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "call_runtime::RuntimeCaller")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_call_runtime_RuntimeCaller.

(* Enum RuntimeError *)

Module Impl_core_fmt_Debug_for_call_runtime_RuntimeError.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "CallRuntimeFailed") in
      M.call (Ty.path "core::fmt::Formatter")::["write_str"] [ α0; α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      M.pure true
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_Eq_for_call_runtime_RuntimeError.
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
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError.

(* Enum EnvError *)

Module Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.
  (*
      fn from(e: EnvError) -> Self {
          match e {
              EnvError::CallRuntimeFailed => RuntimeError::CallRuntimeFailed,
              _ => panic!("Unexpected error from `pallet-contracts`."),
          }
      }
  *)
  Definition from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ e ] =>
      let* e := M.alloc e in
      let* α0 :=
        match_operator
          e
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | call_runtime.EnvError.CallRuntimeFailed =>
                M.alloc call_runtime.RuntimeError.CallRuntimeFailed
              | _ => M.break_match 
              end);
            fun γ =>
              (let* α0 := M.var "std::panicking::begin_panic" in
              let* α1 :=
                M.read (mk_str "Unexpected error from `pallet-contracts`.") in
              let* α2 := M.call α0 [ α1 ] in
              let* α3 := M.never_to_any α2 in
              M.alloc α3)
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "call_runtime::RuntimeError")
      (* Trait polymorphic types *) [ (* T *) Ty.path "call_runtime::EnvError" ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.

Module Impl_call_runtime_Env.
  Definition Self : Ty.t := Ty.path "call_runtime::Env".
  
  (*
      fn call_runtime<Call>(&self, _call: &Call) -> Result<(), EnvError> {
          unimplemented!()
      }
  *)
  Definition call_runtime (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; Call ], [ self; _call ] =>
      let* self := M.alloc self in
      let* _call := M.alloc _call in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call_runtime :
    M.IsAssociatedFunction Self "call_runtime" call_runtime [].
End Impl_call_runtime_Env.

Module Impl_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
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
      M.call (Ty.path "call_runtime::RuntimeCaller")::["init_env"] []
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
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "call_runtime::RuntimeCaller" ] in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn transfer_through_runtime(
          &mut self,
          receiver: AccountId,
          value: Balance,
      ) -> Result<(), RuntimeError> {
          self.env()
              .call_runtime(&RuntimeCall::Balances(BalancesCall::Transfer {
                  dest: receiver.into(),
                  value,
              }))
              .map_err(Into::into)
      }
  *)
  Definition transfer_through_runtime (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; receiver; value ] =>
      let* self := M.alloc self in
      let* receiver := M.alloc receiver in
      let* value := M.alloc value in
      let* α0 := M.read self in
      let* α1 :=
        M.call (Ty.path "call_runtime::RuntimeCaller")::["env"] [ α0 ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.get_trait_method
          "core::convert::Into"
          "into"
          [
            (* Self *) Ty.path "call_runtime::AccountId";
            (* T *)
              Ty.apply
                (Ty.path "call_runtime::MultiAddress")
                [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ]
          ] in
      let* α4 := M.read receiver in
      let* α5 := M.call α3 [ α4 ] in
      let* α6 := M.read value in
      let* α7 :=
        M.alloc
          (Value.StructTuple
            "call_runtime::RuntimeCall::Balances"
            [
              Value.StructRecord
                "call_runtime::BalancesCall::Transfer"
                [ ("dest", α5); ("value", α6) ]
            ]) in
      let* α8 :=
        M.call (Ty.path "call_runtime::Env")::["call_runtime"] [ α2; α7 ] in
      let* α9 :=
        M.get_trait_method
          "core::convert::Into"
          "into"
          [
            (* Self *) Ty.path "call_runtime::EnvError";
            (* T *) Ty.path "call_runtime::RuntimeError"
          ] in
      M.call
        (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.tuple []; Ty.path "call_runtime::EnvError" ])::["map_err"]
        [ α8; α9 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_through_runtime :
    M.IsAssociatedFunction
      Self
      "transfer_through_runtime"
      transfer_through_runtime
      [].
  
  (*
      pub fn call_nonexistent_extrinsic(&mut self) -> Result<(), RuntimeError> {
          self.env().call_runtime(&()).map_err(Into::into)
      }
  *)
  Definition call_nonexistent_extrinsic
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.call (Ty.path "call_runtime::RuntimeCaller")::["env"] [ α0 ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc tt in
      let* α4 :=
        M.call (Ty.path "call_runtime::Env")::["call_runtime"] [ α2; α3 ] in
      let* α5 :=
        M.get_trait_method
          "core::convert::Into"
          "into"
          [
            (* Self *) Ty.path "call_runtime::EnvError";
            (* T *) Ty.path "call_runtime::RuntimeError"
          ] in
      M.call
        (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.tuple []; Ty.path "call_runtime::EnvError" ])::["map_err"]
        [ α4; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call_nonexistent_extrinsic :
    M.IsAssociatedFunction
      Self
      "call_nonexistent_extrinsic"
      call_nonexistent_extrinsic
      [].
End Impl_call_runtime_RuntimeCaller.
