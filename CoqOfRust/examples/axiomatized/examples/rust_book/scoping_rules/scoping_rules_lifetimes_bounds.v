(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Ref *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ T ])
      []
      [ ("fmt", InstanceField.Method fmt [ T ]) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

Parameter print_ref : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
