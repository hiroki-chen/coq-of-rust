(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Number *)

Module Impl_core_convert_From_i32_for_from_Number.
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      (* Self *) (Ty.path "from::Number")
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *) [ ("from", InstanceField.Method from) ]
      (* Instance polymorphic types *) [].
End Impl_core_convert_From_i32_for_from_Number.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
