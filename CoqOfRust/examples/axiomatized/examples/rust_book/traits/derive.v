(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Centimeters *)

Module Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialEq_for_derive_Centimeters.
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialOrd_for_derive_Centimeters.
  Parameter partial_cmp : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialOrd"
      (* Self *) (Ty.path "derive::Centimeters")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("partial_cmp", InstanceField.Method partial_cmp) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

(* Struct Inches *)

Module Impl_core_fmt_Debug_for_derive_Inches.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "derive::Inches")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_derive_Inches.

Module Impl_derive_Inches.
  Definition Self : Ty.t := Ty.path "derive::Inches".
  
  Parameter to_centimeters : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_to_centimeters :
    M.IsAssociatedFunction Self "to_centimeters" to_centimeters [].
End Impl_derive_Inches.

(* Struct Seconds *)

Parameter main : (list Ty.t) -> (list Value.t) -> M.
