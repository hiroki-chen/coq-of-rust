(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* _ :=
    match 1 with
    | _ => Pure false
    | _ => Pure true
    end in
  let* _ :=
    let* α0 := use true in
    if (α0 : bool) then
      Pure 0
    else
      Pure 1 in
  let* _ :=
    let* α0 := use false in
    if (α0 : bool) then
      Pure 2
    else
      let* α0 := use false in
      if (α0 : bool) then
        Pure 3
      else
        let* α0 := use false in
        if (α0 : bool) then
          Pure 4
        else
          Pure 5 in
  Pure tt.
