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
      ltac:(M.monadic
        (Value.StructTuple
          "contract_ref::AccountId"
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
End Impl_core_default_Default_for_contract_ref_AccountId.

Module Impl_core_clone_Clone_for_contract_ref_AccountId.
  Definition Self : Ty.t := Ty.path "contract_ref::AccountId".
  
  (*
  Clone
  *)
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [ M.read (| f |); M.read (| mk_str "FlipperError" |) ]
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "contract_ref::FlipperRef", "init_env", [] |),
          []
        |)))
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
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord "contract_ref::FlipperRef" [ ("value", M.read (| init_value |)) ]))
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
      ltac:(M.monadic
        (M.call_closure (|
          M.get_associated_function (| Ty.path "contract_ref::FlipperRef", "new", [] |),
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "bool", [], "default", [] |),
              []
            |)
          ]
        |)))
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
      ltac:(M.monadic
        (let succeed := M.alloc (| succeed |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.use succeed in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "contract_ref::FlipperRef",
                            "new",
                            []
                          |),
                          [ Value.Bool true ]
                        |)
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [ Value.StructTuple "contract_ref::FlipperError" [] ]
                  |)))
            ]
          |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.assign (|
              M.get_struct_record_field (M.read (| self |)) "contract_ref::FlipperRef" "value",
              UnOp.Pure.not
                (M.read (|
                  M.get_struct_record_field (M.read (| self |)) "contract_ref::FlipperRef" "value"
                |))
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field (M.read (| self |)) "contract_ref::FlipperRef" "value"
        |)))
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
      ltac:(M.monadic
        (let version := M.alloc (| version |) in
        let flipper_code_hash := M.alloc (| flipper_code_hash |) in
        M.read (|
          let salt :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "u32", "to_le_bytes", [] |),
                [ M.read (| version |) ]
              |)
            |) in
          let flipper :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "contract_ref::FlipperRef",
                  "new_default",
                  []
                |),
                []
              |)
            |) in
          M.alloc (|
            Value.StructRecord "contract_ref::ContractRef" [ ("flipper", M.read (| flipper |)) ]
          |)
        |)))
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
      ltac:(M.monadic
        (let version := M.alloc (| version |) in
        let flipper_code_hash := M.alloc (| flipper_code_hash |) in
        let succeed := M.alloc (| succeed |) in
        M.read (|
          let salt :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "u32", "to_le_bytes", [] |),
                [ M.read (| version |) ]
              |)
            |) in
          let flipper :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "contract_ref::FlipperRef"; Ty.path "contract_ref::FlipperError" ],
                  "unwrap",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "contract_ref::FlipperRef",
                      "try_new",
                      []
                    |),
                    [ M.read (| succeed |) ]
                  |)
                ]
              |)
            |) in
          M.alloc (|
            Value.StructRecord "contract_ref::ContractRef" [ ("flipper", M.read (| flipper |)) ]
          |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "contract_ref::FlipperRef", "flip", [] |),
                [
                  M.get_struct_record_field
                    (M.read (| self |))
                    "contract_ref::ContractRef"
                    "flipper"
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "contract_ref::FlipperRef", "get", [] |),
          [ M.get_struct_record_field (M.read (| self |)) "contract_ref::ContractRef" "flipper" ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_contract_ref_ContractRef.
