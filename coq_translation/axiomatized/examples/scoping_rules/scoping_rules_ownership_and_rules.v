(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter destroy_box :
    (M.Val (alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A)) ->
      M (M.Val unit).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
