(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Mapping *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (K V : Ty.t),
    let Self :=
      Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ] in
    M.IsTraitInstance
      "core::default::Default"
      Self
      []
      [ ("default", InstanceField.Method default [ Self; K; V ]) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.

Module Impl_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter insert : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter remove : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter size : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter take : (list Ty.t) -> (list Value.t) -> M.
End Impl_mapping_integration_tests_Mapping_K_V.

(* Struct AccountId *)

Module Impl_core_default_Default_for_mapping_integration_tests_AccountId.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    let Self := Ty.path "mapping_integration_tests::AccountId" in
    M.IsTraitInstance
      "core::default::Default"
      Self
      []
      [ ("default", InstanceField.Method default [ Self ]) ].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    let Self := Ty.path "mapping_integration_tests::AccountId" in
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      []
      [ ("clone", InstanceField.Method clone [ Self ]) ].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Axiom Implements :
    let Self := Ty.path "mapping_integration_tests::AccountId" in
    M.IsTraitInstance "core::marker::Copy" Self [] [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance :
  (Ty.path "mapping_integration_tests::Balance") = (Ty.path "u128").

(* Enum Env *)

Module Impl_mapping_integration_tests_Env.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
End Impl_mapping_integration_tests_Env.

(* Enum Mappings *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mappings.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    let Self := Ty.path "mapping_integration_tests::Mappings" in
    M.IsTraitInstance
      "core::default::Default"
      Self
      []
      [ ("default", InstanceField.Method default [ Self ]) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module Impl_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter insert_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter size_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter contains_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter remove_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter take_balance : (list Ty.t) -> (list Value.t) -> M.
End Impl_mapping_integration_tests_Mappings.
