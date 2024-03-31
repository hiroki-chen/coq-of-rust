(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 := M.get_trait_method "core::default::Default" (Ty.path "u128") [] "default" [] in
      let* α1 := M.call_closure α0 [] in M.pure (Value.StructTuple "contract_ref::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_contract_ref_AccountId.

Module Impl_core_clone_Clone_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
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
End Impl_core_clone_Clone_for_contract_ref_AccountId.

Module Impl_core_marker_Copy_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_contract_ref_AccountId.

Axiom Balance : (Ty.path "contract_ref::Balance") = (Ty.path "u128").

Axiom Hash : (Ty.path "contract_ref::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "contract_ref::AccountId") ];
  } *)

(* StructRecord
  {
    name := "FlipperRef";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

(* StructTuple
  {
    name := "FlipperError";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_contract_ref_FlipperError.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperError".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.get_associated_function (Ty.path "core::fmt::Formatter") "write_str" [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "FlipperError") in M.call_closure α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_contract_ref_FlipperError.

Module Impl_contract_ref_FlipperRef.
  Definition Self : Ty.t := Ty.path "contract_ref::FlipperRef".
  
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
      let* α0 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "init_env" [] in
      M.call_closure α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      let* init_value := M.alloc init_value in
      let* α0 := M.read init_value in
      M.pure (Value.StructRecord "contract_ref::FlipperRef" [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "new" [] in
      let* α1 := M.get_trait_method "core::default::Default" (Ty.path "bool") [] "default" [] in
      let* α2 := M.call_closure α1 [] in M.call_closure α0 [ α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default : M.IsAssociatedFunction Self "new_default" new_default.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Definition try_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ succeed ] =>
      let* succeed := M.alloc succeed in
      let* α0 := M.alloc (Value.Tuple []) in
      let* α1 :=
        M.match_operator
          α0
          [
            fun γ =>
              let γ := M.use succeed in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* α0 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "new" [] in
              let* α1 := M.call_closure α0 [ Value.Bool true ] in
              M.alloc (Value.StructTuple "core::result::Result::Ok" [ α1 ]);
            fun γ =>
              M.alloc
                (Value.StructTuple
                  "core::result::Result::Err"
                  [ Value.StructTuple "contract_ref::FlipperError" [] ])
          ] in
      M.read α1
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_new : M.IsAssociatedFunction Self "try_new" try_new.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 := M.read (M.get_struct_record_field α1 "contract_ref::FlipperRef" "value") in
        M.assign
          (M.get_struct_record_field α0 "contract_ref::FlipperRef" "value")
          (UnOp.Pure.not α2) in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record_field α0 "contract_ref::FlipperRef" "value")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_contract_ref_FlipperRef.

(* StructRecord
  {
    name := "ContractRef";
    ty_params := [];
    fields := [ ("flipper", Ty.path "contract_ref::FlipperRef") ];
  } *)

Module Impl_contract_ref_ContractRef.
  Definition Self : Ty.t := Ty.path "contract_ref::ContractRef".
  
  (*
      pub fn new(version: u32, flipper_code_hash: Hash) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::new_default();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate();
  
          Self { flipper }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ version; flipper_code_hash ] =>
      let* version := M.alloc version in
      let* flipper_code_hash := M.alloc flipper_code_hash in
      let* salt :=
        let* α0 := M.get_associated_function (Ty.path "u32") "to_le_bytes" [] in
        let* α1 := M.read version in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
      let* flipper :=
        let* α0 :=
          M.get_associated_function (Ty.path "contract_ref::FlipperRef") "new_default" [] in
        let* α1 := M.call_closure α0 [] in M.alloc α1 in
      let* α0 := M.read flipper in
      let* α0 := M.alloc (Value.StructRecord "contract_ref::ContractRef" [ ("flipper", α0) ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn try_new(version: u32, flipper_code_hash: Hash, succeed: bool) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::try_new(succeed).unwrap();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate()
          // .unwrap_or_else(|error| {
          //     panic!(
          //         "Received an error from the Flipper constructor while instantiating \
          //              Flipper {error:?}"
          //     )
          // });
  
          Self { flipper }
      }
  *)
  Definition try_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ version; flipper_code_hash; succeed ] =>
      let* version := M.alloc version in
      let* flipper_code_hash := M.alloc flipper_code_hash in
      let* succeed := M.alloc succeed in
      let* salt :=
        let* α0 := M.get_associated_function (Ty.path "u32") "to_le_bytes" [] in
        let* α1 := M.read version in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
      let* flipper :=
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "contract_ref::FlipperRef"; Ty.path "contract_ref::FlipperError" ])
            "unwrap"
            [] in
        let* α1 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "try_new" [] in
        let* α2 := M.read succeed in
        let* α3 := M.call_closure α1 [ α2 ] in let* α4 := M.call_closure α0 [ α3 ] in M.alloc α4 in
      let* α0 := M.read flipper in
      let* α0 := M.alloc (Value.StructRecord "contract_ref::ContractRef" [ ("flipper", α0) ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_new : M.IsAssociatedFunction Self "try_new" try_new.
  
  (*
      pub fn flip(&mut self) {
          self.flipper.flip();
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "flip" [] in
        let* α1 := M.read self in
        let* α2 :=
          M.call_closure
            α0
            [ M.get_struct_record_field α1 "contract_ref::ContractRef" "flipper" ] in
        M.alloc α2 in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&mut self) -> bool {
          self.flipper.get()
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.get_associated_function (Ty.path "contract_ref::FlipperRef") "get" [] in
      let* α1 := M.read self in
      M.call_closure α0 [ M.get_struct_record_field α1 "contract_ref::ContractRef" "flipper" ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_contract_ref_ContractRef.
