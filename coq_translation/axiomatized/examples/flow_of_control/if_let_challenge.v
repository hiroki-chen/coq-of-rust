(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set :=
  | Bar.
End Foo.
Definition Foo : Set := M.Val Foo.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
