(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) :=
  Stmt_item.

Module Foo.
  Record t : Set := {
    x : u32 * u32;
    y : u32;
  }.
End Foo.
Definition Foo : Set := Foo.t.