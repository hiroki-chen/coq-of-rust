(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main : M.IsFunction "inline_assembly_clobbered_registers::main" main.
