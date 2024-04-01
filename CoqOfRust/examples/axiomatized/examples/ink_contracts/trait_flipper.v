(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
(* Empty module 'Flip' *)

(* StructRecord
  {
    name := "Flipper";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_trait_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "trait_flipper::Flipper".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
End Impl_trait_flipper_Flipper.

Module Impl_trait_flipper_Flip_for_trait_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "trait_flipper::Flipper".
  
  Parameter flip : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "trait_flipper::Flip"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("flip", InstanceField.Method flip); ("get", InstanceField.Method get) ].
End Impl_trait_flipper_Flip_for_trait_flipper_Flipper.
