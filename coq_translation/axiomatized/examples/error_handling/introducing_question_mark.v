(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter multiply :
    (M.Val (ref str.t)) ->
      (M.Val (ref str.t)) ->
      M (M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t)).

Parameter print :
    (M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t)) ->
      M (M.Val unit).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
