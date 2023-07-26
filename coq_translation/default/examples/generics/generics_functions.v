(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module A.
  Inductive t : Set :=
  Build.
End A.
Definition A := A.t.

Module S.
  Unset Primitive Projections.
  Record t : Set := {
    _ : generics_functions.A;
  }.
  Global Set Primitive Projections.
  
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
End S.
Definition S := S.t.

Module SGen.Section SGen.
Context {T : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    _ : T;
  }.
  Global Set Primitive Projections.
  
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.


End SGen.
End SGen.
Definition SGen := SGen.t.

Definition reg_fn
    `{H : State.Trait}
    (_s : generics_functions.S)
    : M (H := H) unit :=
  Pure tt.

Definition gen_spec_t
    `{H : State.Trait}
    (_s : generics_functions.SGen generics_functions.A)
    : M (H := H) unit :=
  Pure tt.

Definition gen_spec_i32
    `{H : State.Trait}
    (_s : generics_functions.SGen i32)
    : M (H := H) unit :=
  Pure tt.

Definition generic
    `{H : State.Trait}
    {T : Set}
    (_s : generics_functions.SGen T)
    : M (H := H) unit :=
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    generics_functions.reg_fn
      (generics_functions.S.Build_t generics_functions.A.Build) in
  let* _ :=
    generics_functions.gen_spec_t
      (generics_functions.SGen.Build_t generics_functions.A.Build) in
  let* _ :=
    generics_functions.gen_spec_i32 (generics_functions.SGen.Build_t 6) in
  let* _ :=
    generics_functions.generic (generics_functions.SGen.Build_t "a"%char) in
  let* _ :=
    generics_functions.generic (generics_functions.SGen.Build_t "c"%char) in
  Pure tt.
