(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter function : M (M.Val unit).

Module deeply.
  Module nested.
    Parameter function : M (M.Val unit).
  End nested.
End deeply.

Module nested.
  Parameter function : M (M.Val unit).
End nested.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
