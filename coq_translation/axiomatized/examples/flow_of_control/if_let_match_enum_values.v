(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set :=
  | Bar
  | Baz
  | Qux (_ : u32).
End Foo.
Definition Foo : Set := Foo.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
