(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Number *)

Module Impl_core_convert_From_i32_for_from_Number.
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    let Self := Ty.path "from::Number" in
    M.IsTraitInstance
      "core::convert::From"
      Self
      [ (* T *) Ty.path "i32" ]
      [ ("from", InstanceField.Method from [ Self ]) ].
End Impl_core_convert_From_i32_for_from_Number.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
