(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_double_first :
  M.IsFunction
    "pulling_results_out_of_options_with_stop_error_processing::double_first"
    double_first.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main :
  M.IsFunction "pulling_results_out_of_options_with_stop_error_processing::main" main.
