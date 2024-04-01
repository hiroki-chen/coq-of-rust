(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "i32"); ("y", Ty.path "i32") ];
  } *)

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t := Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t := Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
