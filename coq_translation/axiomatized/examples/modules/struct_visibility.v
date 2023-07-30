(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module OpenBox.
    Section OpenBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End OpenBox.
  End OpenBox.
  Definition OpenBox : Set := @OpenBox.t.
  
  Module ClosedBox.
    Section ClosedBox.
      Context {T : Set}.
      Unset Primitive Projections.
      Record t : Set := {
        contents : T;
      }.
      Global Set Primitive Projections.
      
      Global Instance Get_contents : Notation.Dot "contents" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End ClosedBox.
  End ClosedBox.
  Definition ClosedBox : Set := @ClosedBox.t.
End my.

Module OpenBox.
  Section OpenBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End OpenBox.
End OpenBox.
Definition OpenBox : Set := @OpenBox.t.

Module ClosedBox.
  Section ClosedBox.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t : Set := {
      contents : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ClosedBox.
End ClosedBox.
Definition ClosedBox : Set := @ClosedBox.t.
