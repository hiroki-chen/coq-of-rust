(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Container *)

(* Trait *)
Module Contains.
  
End Contains.

Module Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
  Definition A : Ty.t := Ty.path "i32".
  
  Definition B : Ty.t := Ty.path "i32".
  
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter first : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter last : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter a : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_solution::Contains"
      (* Self *) (Ty.path "generics_associated_types_solution::Container")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("A", InstanceField.Ty A);
          ("B", InstanceField.Ty B);
          ("contains", InstanceField.Method contains);
          ("first", InstanceField.Method first);
          ("last", InstanceField.Method last);
          ("a", InstanceField.Method a)
        ]
      (* Instance polymorphic types *) [].
End Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.

Parameter difference : (list Ty.t) -> (list Value.t) -> M.

Parameter get_a : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
