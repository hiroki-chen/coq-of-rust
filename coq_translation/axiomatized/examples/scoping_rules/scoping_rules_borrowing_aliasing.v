(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Point.
  Section Point.
    Context `{State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x : i32;
      y : i32;
      z : i32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_x : Notation.Dot "x" := {
      Notation.dot x' := let* x' := M.read x' in Pure x'.(x) : M _;
    }.
    Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
      Notation.double_colon x' := let* x' := M.read x' in Pure x'.(x) : M _;
    }.
    Global Instance Get_y : Notation.Dot "y" := {
      Notation.dot x := let* x := M.read x in Pure x.(y) : M _;
    }.
    Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(y) : M _;
    }.
    Global Instance Get_z : Notation.Dot "z" := {
      Notation.dot x := let* x := M.read x in Pure x.(z) : M _;
    }.
    Global Instance Get_AF_z : Notation.DoubleColon t "z" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(z) : M _;
    }.
  End Point.
End Point.
Definition Point `{State.Trait} : Set := M.val Point.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
