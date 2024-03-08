(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Borrowed *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "scoping_rules_lifetimes_structs::Borrowed")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.

(* Struct NamedBorrowed *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "scoping_rules_lifetimes_structs::NamedBorrowed")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.

(* Enum Either *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "scoping_rules_lifetimes_structs::Either")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
