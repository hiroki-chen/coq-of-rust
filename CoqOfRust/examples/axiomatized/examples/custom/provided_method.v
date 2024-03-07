(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module ProvidedAndRequired.
  Parameter provided : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_provided :
    M.IsProvidedMethod "provided_method::ProvidedAndRequired" provided.
End ProvidedAndRequired.

Module Impl_provided_method_ProvidedAndRequired_for_i32.
  Parameter required : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "provided_method::ProvidedAndRequired"
      (* Self *) (Ty.path "i32")
      []
      [ ("required", InstanceField.Method required []) ].
End Impl_provided_method_ProvidedAndRequired_for_i32.

Module Impl_provided_method_ProvidedAndRequired_for_u32.
  Parameter required : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter provided : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "provided_method::ProvidedAndRequired"
      (* Self *) (Ty.path "u32")
      []
      [
        ("required", InstanceField.Method required []);
        ("provided", InstanceField.Method provided [])
      ].
End Impl_provided_method_ProvidedAndRequired_for_u32.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
