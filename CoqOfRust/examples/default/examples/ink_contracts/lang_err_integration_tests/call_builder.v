(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_call_builder_AccountId.
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
      M.pure (Value.StructTuple "call_builder::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "call_builder::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_call_builder_AccountId.

Module Impl_core_clone_Clone_for_call_builder_AccountId.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "call_builder::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_call_builder_AccountId.

Module Impl_core_marker_Copy_for_call_builder_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "call_builder::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_call_builder_AccountId.

Axiom Balance : (Ty.path "call_builder::Balance") = (Ty.path "u128").

Axiom Hash :
  (Ty.path "call_builder::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum LangError *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CouldNotReadInput";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "AnotherError";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

(* Struct Selector *)

Module Impl_call_builder_Selector.
  Definition Self : Ty.t := Ty.path "call_builder::Selector".
  
  (*
      fn new(bytes: [u8; 4]) -> Self {
          unimplemented!()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ bytes ] =>
      let* bytes := M.alloc bytes in
      let* α0 := M.get_function "core::panicking::panic" [] in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
End Impl_call_builder_Selector.

(* Struct CallBuilderTest *)

Module Impl_core_default_Default_for_call_builder_CallBuilderTest.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      M.pure (Value.StructTuple "call_builder::CallBuilderTest" [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "call_builder::CallBuilderTest")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_call_builder_CallBuilderTest.

Module Impl_call_builder_CallBuilderTest.
  Definition Self : Ty.t := Ty.path "call_builder::CallBuilderTest".
  
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
          [ (* Self *) Ty.path "call_builder::CallBuilderTest" ] in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn call(&mut self, address: AccountId, selector: [u8; 4]) -> Option<LangError> {
          // let result = build_call::<DefaultEnvironment>()
          //     .call(address)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<()>()
          //     .try_invoke()
          //     .expect("Error from the Contracts pallet.");
          let result: Result<(), LangError> = todo!();
  
          match result {
              Ok(_) => None,
              Err(e @ LangError::CouldNotReadInput) => Some(e),
              Err(_) => {
                  unimplemented!("No other `LangError` variants exist at the moment.")
              }
          }
      }
  *)
  Definition call (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; address; selector ] =>
      let* self := M.alloc self in
      let* address := M.alloc address in
      let* selector := M.alloc selector in
      let* result :=
        let* α0 := M.get_function "core::panicking::panic" [] in
        let* α1 := M.read (mk_str "not yet implemented") in
        let* α2 := M.call α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3 in
      let* α0 :=
        match_operator
          result
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Ok"
                  0 in
              M.alloc (Value.StructTuple "core::option::Option::None" []);
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Err"
                  0 in
              let* e := M.copy γ0_0 in
              let* α0 := M.read e in
              M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]);
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::result::Result::Err"
                  0 in
              let* α0 := M.get_function "core::panicking::panic_fmt" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 :=
                M.read
                  (mk_str
                    "not implemented: No other `LangError` variants exist at the moment.") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "none" in
              let* α5 := M.call α4 [] in
              let* α6 := M.alloc α5 in
              let* α7 :=
                M.call
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α3;
                    M.pointer_coercion (* Unsize *) α6
                  ] in
              let* α8 := M.call α0 [ α7 ] in
              let* α9 := M.never_to_any α8 in
              M.alloc α9
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call : M.IsAssociatedFunction Self "call" call [].
  
  (*
      pub fn invoke(&mut self, address: AccountId, selector: [u8; 4]) {
          // use ink::env::call::build_call;
  
          // build_call::<DefaultEnvironment>()
          //     .call(address)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<()>()
          //     .invoke()
      }
  *)
  Definition invoke (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; address; selector ] =>
      let* self := M.alloc self in
      let* address := M.alloc address in
      let* selector := M.alloc selector in
      M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_invoke :
    M.IsAssociatedFunction Self "invoke" invoke [].
  
  (*
      pub fn call_instantiate(
          &mut self,
          code_hash: Hash,
          selector: [u8; 4],
          init_value: bool,
      ) -> Option<LangError> {
          // let mut params = ConstructorsReturnValueRef::new(init_value)
          //     .code_hash(code_hash)
          //     .gas_limit(0)
          //     .endowment(0)
          //     .salt_bytes(&[0xDE, 0xAD, 0xBE, 0xEF])
          //     .params();
  
          // params.update_selector(Selector::new(selector));
  
          // let result = params
          //     .try_instantiate()
          //     .expect("Error from the Contracts pallet.");
  
          // match result {
          //     Ok(_) => None,
          //     Err(e @ LangError::CouldNotReadInput) => Some(e),
          //     Err(_) => {
          //         unimplemented!("No other `LangError` variants exist at the moment.")
          //     }
          // }
          None
      }
  *)
  Definition call_instantiate (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; code_hash; selector; init_value ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* selector := M.alloc selector in
      let* init_value := M.alloc init_value in
      M.pure (Value.StructTuple "core::option::Option::None" [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call_instantiate :
    M.IsAssociatedFunction Self "call_instantiate" call_instantiate [].
  
  (*
      pub fn call_instantiate_fallible(
          &mut self,
          code_hash: Hash,
          selector: [u8; 4],
          init_value: bool,
          // ) -> Option<Result<Result<AccountId, constructors_return_value::ConstructorError>, LangError>>
      ) -> Option<()> {
          // let mut params = ConstructorsReturnValueRef::try_new(init_value)
          //     .code_hash(code_hash)
          //     .gas_limit(0)
          //     .endowment(0)
          //     .salt_bytes(&[0xDE, 0xAD, 0xBE, 0xEF])
          //     .params();
  
          // params.update_selector(Selector::new(selector));
  
          // let lang_result = params
          //     .try_instantiate()
          //     .expect("Error from the Contracts pallet.");
  
          // Some(lang_result.map(|contract_result| {
          //     contract_result.map(|inner| ink::ToAccountId::to_account_id(&inner))
          // }))
          None
      }
  *)
  Definition call_instantiate_fallible (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; code_hash; selector; init_value ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* selector := M.alloc selector in
      let* init_value := M.alloc init_value in
      M.pure (Value.StructTuple "core::option::Option::None" [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call_instantiate_fallible :
    M.IsAssociatedFunction
      Self
      "call_instantiate_fallible"
      call_instantiate_fallible
      [].
End Impl_call_builder_CallBuilderTest.
