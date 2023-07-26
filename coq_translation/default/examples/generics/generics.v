(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module A.
  Inductive t : Set :=
  Build.
End A.
Definition A := A.t.

Module Single.
  Unset Primitive Projections.
  Record t : Set := {
    _ : generics.A;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Single.
Definition Single := Single.t.

Module SingleGen.Section SingleGen.
Context {T : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    _ : T;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.


End SingleGen.
End SingleGen.
Definition SingleGen := SingleGen.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let _s := generics.Single.Build_t generics.A.Build in
  let _char := generics.SingleGen.Build_t "a"%char in
  let _t := generics.SingleGen.Build_t generics.A.Build in
  let _i32 := generics.SingleGen.Build_t 6 in
  let _char := generics.SingleGen.Build_t "a"%char in
  Pure tt.
