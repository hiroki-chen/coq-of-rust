(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter csqrtf : (list Ty.t) -> (list Value.t) -> M.

Parameter ccosf : (list Ty.t) -> (list Value.t) -> M.

Parameter cos : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

(* StructRecord
  {
    name := "Complex";
    ty_params := [];
    fields := [ ("re", Ty.path "f32"); ("im", Ty.path "f32") ];
  } *)

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self : Ty.t := Ty.path "foreign_function_interface::Complex".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
