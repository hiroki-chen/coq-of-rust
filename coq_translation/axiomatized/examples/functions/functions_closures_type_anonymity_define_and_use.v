(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter apply :
    forall
      `{State.Trait}
      {F : Set}
      `{core.ops.function.Fn.Trait F (Args := unit)},
    F -> M unit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
