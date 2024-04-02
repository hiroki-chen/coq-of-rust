(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Hash :
  (Ty.path "call_builder_delegate::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(*
Enum LangError
{
  ty_params := [];
  variants :=
    [
      {
        name := "CouldNotReadInput";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

(* StructRecord
  {
    name := "CallBuilderDelegateTest";
    ty_params := [];
    fields := [ ("value", Ty.path "i32") ];
  } *)

Module Impl_core_default_Default_for_call_builder_delegate_CallBuilderDelegateTest.
  Definition Self : Ty.t := Ty.path "call_builder_delegate::CallBuilderDelegateTest".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_builder_delegate_CallBuilderDelegateTest.

Module Impl_call_builder_delegate_CallBuilderDelegateTest.
  Definition Self : Ty.t := Ty.path "call_builder_delegate::CallBuilderDelegateTest".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter delegate : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_delegate : M.IsAssociatedFunction Self "delegate" delegate.
  
  Parameter invoke : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_invoke : M.IsAssociatedFunction Self "invoke" invoke.
End Impl_call_builder_delegate_CallBuilderDelegateTest.
