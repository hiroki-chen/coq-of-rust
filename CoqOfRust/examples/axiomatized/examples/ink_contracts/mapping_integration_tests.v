(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Mapping";
    ty_params := [ ("K", None); ("V", None) ];
    fields :=
      [
        ("_key", Ty.apply (Ty.path "core::marker::PhantomData") [ K ]);
        ("_value", Ty.apply (Ty.path "core::marker::PhantomData") [ V ])
      ];
  } *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
  Parameter default : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (Self K V)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method (default K V)) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mapping_K_V.

Module Impl_mapping_integration_tests_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "mapping_integration_tests::Mapping") [ K; V ].
  
  Parameter contains : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_contains :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "contains" (contains K V).
  
  Parameter get : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" (get K V).
  
  Parameter insert : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" (insert K V).
  
  Parameter new : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "new" (new K V).
  
  Parameter remove : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_remove :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "remove" (remove K V).
  
  Parameter size : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_size :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "size" (size K V).
  
  Parameter take : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_take :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "take" (take K V).
End Impl_mapping_integration_tests_Mapping_K_V.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mapping_integration_tests_AccountId.

Module Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mapping_integration_tests_AccountId.

Module Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_mapping_integration_tests_AccountId.

Axiom Balance :
  (Ty.path "mapping_integration_tests::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "mapping_integration_tests::AccountId") ];
  } *)

Module Impl_mapping_integration_tests_Env.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
End Impl_mapping_integration_tests_Env.

(* StructRecord
  {
    name := "Mappings";
    ty_params := [];
    fields :=
      [
        ("balances",
          Ty.apply
            (Ty.path "mapping_integration_tests::Mapping")
            [ Ty.path "mapping_integration_tests::AccountId"; Ty.path "u128" ])
      ];
  } *)

Module Impl_core_default_Default_for_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mapping_integration_tests_Mappings.

Module Impl_mapping_integration_tests_Mappings.
  Definition Self : Ty.t := Ty.path "mapping_integration_tests::Mappings".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter get_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get_balance :
    M.IsAssociatedFunction Self "get_balance" get_balance.
  
  Parameter insert_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert_balance :
    M.IsAssociatedFunction Self "insert_balance" insert_balance.
  
  Parameter size_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_size_balance :
    M.IsAssociatedFunction Self "size_balance" size_balance.
  
  Parameter contains_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_contains_balance :
    M.IsAssociatedFunction Self "contains_balance" contains_balance.
  
  Parameter remove_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_remove_balance :
    M.IsAssociatedFunction Self "remove_balance" remove_balance.
  
  Parameter take_balance : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_take_balance :
    M.IsAssociatedFunction Self "take_balance" take_balance.
End Impl_mapping_integration_tests_Mappings.
