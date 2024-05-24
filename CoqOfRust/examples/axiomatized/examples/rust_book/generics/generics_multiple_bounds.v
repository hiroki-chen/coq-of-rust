(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter compare_prints : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_compare_prints :
  M.IsFunction "generics_multiple_bounds::compare_prints" compare_prints.

Parameter compare_types : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_compare_types : M.IsFunction "generics_multiple_bounds::compare_types" compare_types.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main : M.IsFunction "generics_multiple_bounds::main" main.
