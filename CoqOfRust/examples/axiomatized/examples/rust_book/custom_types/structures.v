(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Person *)

Module Impl_core_fmt_Debug_for_structures_Person.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "structures::Person")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_structures_Person.

(* Struct Unit *)

(* Struct Pair *)

(* Struct Point *)

(* Struct Rectangle *)

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
