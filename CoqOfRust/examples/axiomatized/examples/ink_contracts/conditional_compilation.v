(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : (Ty.path "conditional_compilation::Balance") = (Ty.path "u128").

Axiom BlockNumber :
  (Ty.path "conditional_compilation::BlockNumber") = (Ty.path "u32").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "conditional_compilation::AccountId") ];
  } *)

(* Trait *)
(* Empty module 'Flip' *)

(* StructRecord
  {
    name := "Changes";
    ty_params := [];
    fields :=
      [
        ("new_value", Ty.path "bool");
        ("by_", Ty.path "conditional_compilation::AccountId")
      ];
  } *)

(* StructRecord
  {
    name := "ChangesDated";
    ty_params := [];
    fields :=
      [
        ("new_value", Ty.path "bool");
        ("by_", Ty.path "conditional_compilation::AccountId");
        ("when", Ty.path "u32")
      ];
  } *)

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Changes";
        item := StructTuple [ Ty.path "conditional_compilation::Changes" ];
        discriminant := None;
      };
      {
        name := "ChangesDated";
        item := StructTuple [ Ty.path "conditional_compilation::ChangesDated" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_conditional_compilation_Env.
  Definition Self : Ty.t := Ty.path "conditional_compilation::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event.
  
  Parameter block_number : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_block_number :
    M.IsAssociatedFunction Self "block_number" block_number.
End Impl_conditional_compilation_Env.

(* StructRecord
  {
    name := "ConditionalCompilation";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter new_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_foo :
    M.IsAssociatedFunction Self "new_foo" new_foo.
  
  Parameter new_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_bar :
    M.IsAssociatedFunction Self "new_bar" new_bar.
  
  Parameter new_foo_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_foo_bar :
    M.IsAssociatedFunction Self "new_foo_bar" new_foo_bar.
  
  Parameter inherent_flip_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inherent_flip_foo :
    M.IsAssociatedFunction Self "inherent_flip_foo" inherent_flip_foo.
  
  Parameter inherent_flip_bar : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inherent_flip_bar :
    M.IsAssociatedFunction Self "inherent_flip_bar" inherent_flip_bar.
End Impl_conditional_compilation_ConditionalCompilation.

Module Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter push_foo : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "conditional_compilation::Flip"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("flip", InstanceField.Method flip);
          ("get", InstanceField.Method get);
          ("push_foo", InstanceField.Method push_foo)
        ].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
