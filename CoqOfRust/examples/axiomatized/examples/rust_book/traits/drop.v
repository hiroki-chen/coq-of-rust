(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Droppable *)

Module Impl_core_ops_drop_Drop_for_drop_Droppable.
  Parameter drop : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::drop::Drop"
      (* Self *) (Ty.path "drop::Droppable")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("drop", InstanceField.Method drop) ]
      (* Instance polymorphic types *) [].
End Impl_core_ops_drop_Drop_for_drop_Droppable.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
