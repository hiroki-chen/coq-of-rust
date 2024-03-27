(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_builder_AccountId.

Module Impl_core_clone_Clone_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_call_builder_AccountId.

Module Impl_core_marker_Copy_for_call_builder_AccountId.
  Definition Self : Ty.t := Ty.path "call_builder::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
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
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "AnotherError";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

(* StructTuple
  {
    name := "Selector";
    ty_params := [];
  } *)

Module Impl_call_builder_Selector.
  Definition Self : Ty.t := Ty.path "call_builder::Selector".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
End Impl_call_builder_Selector.

(* StructTuple
  {
    name := "CallBuilderTest";
    ty_params := [];
  } *)

Module Impl_core_default_Default_for_call_builder_CallBuilderTest.
  Definition Self : Ty.t := Ty.path "call_builder::CallBuilderTest".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_builder_CallBuilderTest.

Module Impl_call_builder_CallBuilderTest.
  Definition Self : Ty.t := Ty.path "call_builder::CallBuilderTest".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter call : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call : M.IsAssociatedFunction Self "call" call.
  
  Parameter invoke : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_invoke : M.IsAssociatedFunction Self "invoke" invoke.
  
  Parameter call_instantiate : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call_instantiate :
    M.IsAssociatedFunction Self "call_instantiate" call_instantiate.
  
  Parameter call_instantiate_fallible : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call_instantiate_fallible :
    M.IsAssociatedFunction
      Self
      "call_instantiate_fallible"
      call_instantiate_fallible.
End Impl_call_builder_CallBuilderTest.
