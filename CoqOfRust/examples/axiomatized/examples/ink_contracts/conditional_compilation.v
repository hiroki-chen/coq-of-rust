(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_conditional_compilation_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      []
      [ ("default", InstanceField.Method default []) ].
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      []
      [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : (Ty.path "conditional_compilation::Balance") = (Ty.path "u128").

Axiom BlockNumber :
  (Ty.path "conditional_compilation::BlockNumber") = (Ty.path "u32").

(* Enum Env *)

(* Trait *)
Module Flip.
  
End Flip.

(* Enum Changes *)

(* Enum ChangesDated *)

(* Enum Event *)

Module Impl_conditional_compilation_Env.
  Definition Self : Ty.t := Ty.path "conditional_compilation::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
  
  Parameter block_number : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_block_number :
    M.IsAssociatedFunction Self "block_number" block_number [].
End Impl_conditional_compilation_Env.

(* Enum ConditionalCompilation *)

Module Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter new_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_foo :
    M.IsAssociatedFunction Self "new_foo" new_foo [].
  
  Parameter new_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_bar :
    M.IsAssociatedFunction Self "new_bar" new_bar [].
  
  Parameter new_foo_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_foo_bar :
    M.IsAssociatedFunction Self "new_foo_bar" new_foo_bar [].
  
  Parameter inherent_flip_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inherent_flip_foo :
    M.IsAssociatedFunction Self "inherent_flip_foo" inherent_flip_foo [].
  
  Parameter inherent_flip_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inherent_flip_bar :
    M.IsAssociatedFunction Self "inherent_flip_bar" inherent_flip_bar [].
End Impl_conditional_compilation_ConditionalCompilation.

Module Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter push_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "conditional_compilation::Flip"
      (* Self *) (Ty.path "conditional_compilation::ConditionalCompilation")
      []
      [
        ("flip", InstanceField.Method flip []);
        ("get", InstanceField.Method get []);
        ("push_foo", InstanceField.Method push_foo [])
      ].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
