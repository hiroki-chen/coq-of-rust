(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [ "T" ];
    fields := [ ("data", T) ];
  } *)

Module Impl_polymorphic_associated_function_Foo_A.
  Definition Self (A : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "polymorphic_associated_function::Foo") [ A ].
  
  Parameter convert : forall (A : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_convert :
    forall (A : Ty.t),
    M.IsAssociatedFunction (Self A) "convert" (convert A).
End Impl_polymorphic_associated_function_Foo_A.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
