(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition add (a : i32) (b : i32) : M i32 := a.["add"] b.

Definition div (a : i32) (b : i32) : M i32 :=
  let* _ :=
    let* α0 := b.["eq"] 0 in
    if (α0 : bool) then
      let* _ := _crate.rt.begin_panic "Divide-by-zero error" in
      Pure tt
    else
      Pure tt in
  a.["div"] b.
