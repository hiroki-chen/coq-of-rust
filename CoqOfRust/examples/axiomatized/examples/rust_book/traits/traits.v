(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Sheep *)

(* Trait *)
Module Animal.
  Parameter talk : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_talk : M.IsProvidedMethod "traits::Animal" talk.
End Animal.

Module Impl_traits_Sheep.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  Parameter is_naked : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_is_naked :
    M.IsAssociatedFunction Self "is_naked" is_naked [].
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter name : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter noise : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter talk : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "traits::Animal"
      (* Self *) (Ty.path "traits::Sheep")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("new", InstanceField.Method new);
          ("name", InstanceField.Method name);
          ("noise", InstanceField.Method noise);
          ("talk", InstanceField.Method talk)
        ]
      (* Instance polymorphic types *) [].
End Impl_traits_Animal_for_traits_Sheep.

Module Impl_traits_Sheep_2.
  Definition Self : Ty.t := Ty.path "traits::Sheep".
  
  Parameter shear : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_shear : M.IsAssociatedFunction Self "shear" shear [].
End Impl_traits_Sheep_2.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
