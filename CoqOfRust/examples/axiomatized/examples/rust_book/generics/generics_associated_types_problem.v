(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Container *)

(* Trait *)
Module Contains.
  
End Contains.

Module Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  Parameter contains : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter first : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter last : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_problem::Contains"
      (* Self *) (Ty.path "generics_associated_types_problem::Container")
      (* Trait polymorphic types *)
        [ (* A *) Ty.path "i32"; (* B *) Ty.path "i32" ]
      (* Instance *)
        [
          ("contains", InstanceField.Method contains);
          ("first", InstanceField.Method first);
          ("last", InstanceField.Method last)
        ]
      (* Instance polymorphic types *) [].
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.

Parameter difference : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
