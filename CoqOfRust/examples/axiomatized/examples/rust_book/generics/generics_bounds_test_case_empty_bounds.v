(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Cardinal";
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "BlueJay";
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "Turkey";
    ty_params := [];
    fields := [];
  } *)

(* Trait *)
(* Empty module 'Red' *)

(* Trait *)
(* Empty module 'Blue' *)

Module Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.
  Definition Self : Ty.t := Ty.path "generics_bounds_test_case_empty_bounds::Cardinal".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Red"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.

Module Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.
  Definition Self : Ty.t := Ty.path "generics_bounds_test_case_empty_bounds::BlueJay".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Blue"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.

Parameter red : (list Ty.t) -> (list Value.t) -> M.

Parameter blue : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
