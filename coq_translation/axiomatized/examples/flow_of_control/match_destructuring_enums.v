(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Color.
  Inductive t : Set :=
  | Red
  | Blue
  | Green
  | RGB (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | HSV (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | HSL (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | CMY (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | CMYK (_ : u32.t) (_ : u32.t) (_ : u32.t) (_ : u32.t).
End Color.
Definition Color : Set := M.Val Color.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
