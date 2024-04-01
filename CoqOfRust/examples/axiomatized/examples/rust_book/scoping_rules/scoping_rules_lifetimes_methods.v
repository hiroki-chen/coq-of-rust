(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Owner";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_scoping_rules_lifetimes_methods_Owner.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_methods::Owner".
  
  Parameter add_one : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_add_one : M.IsAssociatedFunction Self "add_one" add_one.
  
  Parameter print : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_print : M.IsAssociatedFunction Self "print" print.
End Impl_scoping_rules_lifetimes_methods_Owner.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
