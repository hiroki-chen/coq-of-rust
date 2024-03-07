(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct DoubleError *)

Module Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      []
      [ ("fmt", InstanceField.Method fmt []) ].
End Impl_core_fmt_Debug_for_defining_an_error_type_DoubleError.

Module Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_defining_an_error_type_DoubleError.

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "defining_an_error_type::Result") =
    (Ty.apply
      (Ty.path "core::result::Result")
      [ T; Ty.path "defining_an_error_type::DoubleError" ]).

Module Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "defining_an_error_type::DoubleError")
      []
      [ ("fmt", InstanceField.Method fmt []) ].
End Impl_core_fmt_Display_for_defining_an_error_type_DoubleError.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
