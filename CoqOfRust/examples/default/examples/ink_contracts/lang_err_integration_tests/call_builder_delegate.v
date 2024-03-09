(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Hash :
  (Ty.path "call_builder_delegate::Hash") =
    (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* Enum LangError *)

(* Struct CallBuilderDelegateTest *)

Module Impl_core_default_Default_for_call_builder_delegate_CallBuilderDelegateTest.
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
          [ (* Self *) Ty.path "i32" ] in
      let* α1 := M.call α0 [] in
      M.pure
        (Value.StructRecord
          "call_builder_delegate::CallBuilderDelegateTest"
          [ ("value", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "call_builder_delegate::CallBuilderDelegateTest")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_call_builder_delegate_CallBuilderDelegateTest.

Module Impl_call_builder_delegate_CallBuilderDelegateTest.
  Definition Self : Ty.t :=
    Ty.path "call_builder_delegate::CallBuilderDelegateTest".
  
  (*
      pub fn new(value: i32) -> Self {
          Self { value }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure
        (Value.StructRecord
          "call_builder_delegate::CallBuilderDelegateTest"
          [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn delegate(&mut self, code_hash: Hash, selector: [u8; 4]) -> Option<LangError> {
          // let result = build_call::<DefaultEnvironment>()
          //     .delegate(code_hash)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<bool>()
          //     .try_invoke()
          //     .expect("Error from the Contracts pallet.");
  
          // match result {
          //     Ok(_) => None,
          //     Err(e @ ink::LangError::CouldNotReadInput) => Some(e),
          //     Err(_) => {
          //         unimplemented!("No other `LangError` variants exist at the moment.")
          //     }
          // }
          None
      }
  *)
  Definition delegate (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; code_hash; selector ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* selector := M.alloc selector in
      M.pure (Value.StructTuple "core::option::Option::None" [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_delegate :
    M.IsAssociatedFunction Self "delegate" delegate [].
  
  (*
      pub fn invoke(&mut self, code_hash: Hash, selector: [u8; 4]) -> i32 {
          // use ink::env::call::build_call;
  
          // build_call::<DefaultEnvironment>()
          //     .delegate(code_hash)
          //     .exec_input(ExecutionInput::new(Selector::new(selector)))
          //     .returns::<i32>()
          //     .invoke()
          0
      }
  *)
  Definition invoke (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; code_hash; selector ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* selector := M.alloc selector in
      M.pure (Value.Integer Integer.I32 0)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_invoke :
    M.IsAssociatedFunction Self "invoke" invoke [].
End Impl_call_builder_delegate_CallBuilderDelegateTest.
