(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Error *)
(* {
  ty_params := [];
  variants := [];
} *)

Parameter set_code_hash : (list Ty.t) -> (list Value.t) -> M.

(* Struct Incrementer *)

Module Impl_core_default_Default_for_set_code_hash_Incrementer.
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "set_code_hash::Incrementer")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_set_code_hash_Incrementer.

Module Impl_set_code_hash_Incrementer.
  Definition Self : Ty.t := Ty.path "set_code_hash::Incrementer".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter inc : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc [].
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get [].
  
  Parameter set_code : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_set_code :
    M.IsAssociatedFunction Self "set_code" set_code [].
End Impl_set_code_hash_Incrementer.
