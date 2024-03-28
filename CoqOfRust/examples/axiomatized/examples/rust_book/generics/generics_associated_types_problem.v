(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Container";
    ty_params := [];
    fields := [ Ty.path "i32"; Ty.path "i32" ];
  } *)

(* Trait *)
(* Empty module 'Contains' *)

Module Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  Definition Self : Ty.t :=
    Ty.path "generics_associated_types_problem::Container".
  
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter first : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter last : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_problem::Contains"
      Self
      (* Trait polymorphic types *)
        [ (* A *) Ty.path "i32"; (* B *) Ty.path "i32" ]
      (* Instance *)
        [
          ("contains", InstanceField.Method contains);
          ("first", InstanceField.Method first);
          ("last", InstanceField.Method last)
        ].
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.

Parameter difference : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
