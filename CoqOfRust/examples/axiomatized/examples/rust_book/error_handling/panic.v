(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter drink : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_drink : M.IsFunction "panic::drink" drink.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main : M.IsFunction "panic::main" main.
