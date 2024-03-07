(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Inch *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      []
      [ ("fmt", InstanceField.Method fmt []) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Inch")
      []
      [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

(* Enum Mm *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      []
      [ ("fmt", InstanceField.Method fmt []) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Mm")
      []
      [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

(* Struct Length *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      []
      [ ("fmt", InstanceField.Method fmt [ Unit ]) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      []
      [ ("clone", InstanceField.Method clone [ Unit ]) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      []
      [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Output : Set :=
    Ty.apply
        (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
        [ Unit ].
  
  Parameter add : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::ops::arith::Add"
      (* Self *)
        (Ty.apply
          (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
          [ Unit ])
      []
      [ ("Output", TODO); ("add", InstanceField.Method add [ Unit ]) ].
End Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
