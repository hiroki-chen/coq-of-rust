(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Foo *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Parameter main : (list Ty.t) -> (list Value.t) -> M.
