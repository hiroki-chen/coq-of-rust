(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter give_adult : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_give_adult : M.IsFunction "option_and_unwrap::give_adult" give_adult.

Parameter drink : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_drink : M.IsFunction "option_and_unwrap::drink" drink.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main : M.IsFunction "option_and_unwrap::main" main.
