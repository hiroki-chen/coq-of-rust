(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Empty";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Null";
    ty_params := [];
  } *)

(* Trait *)
Module DoubleDrop.
  
End DoubleDrop.

Module Impl_generics_traits_DoubleDrop_T_for_U.
  Definition Self (T U : Ty.t) : Ty.t := U.
  
  Parameter double_drop :
      forall (T U : Ty.t),
      (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T U : Ty.t),
    M.IsTraitInstance
      "generics_traits::DoubleDrop"
      (Self T U)
      (* Trait polymorphic types *) [ (* T *) T ]
      (* Instance *)
        [ ("double_drop", InstanceField.Method (double_drop T U)) ].
End Impl_generics_traits_DoubleDrop_T_for_U.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
