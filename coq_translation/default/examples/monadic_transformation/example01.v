(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition id (x : M.Val u64.t) : M (M.Val u64.t) := M.function_body (M.pure x).

Definition tri
    (a : M.Val u64.t)
    (b : M.Val u64.t)
    (c : M.Val u64.t)
    : M (M.Val unit) :=
  M.function_body (M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val u64.t)) :=
      let* α0 : ltac:(refine (M.Val u64.t)) := M.alloc 0 in
      example01.id α0 in
    let* _ : ltac:(refine (M.Val u64.t)) :=
      let* α0 : ltac:(refine (M.Val u64.t)) := M.alloc 0 in
      let* α1 : ltac:(refine (M.Val u64.t)) := example01.id α0 in
      example01.id α1 in
    let* _ : ltac:(refine (M.Val u64.t)) :=
      let* α0 : ltac:(refine (M.Val u64.t)) := M.alloc 0 in
      let* α1 : ltac:(refine (M.Val u64.t)) := example01.id α0 in
      let* α2 : ltac:(refine (M.Val u64.t)) := example01.id α1 in
      example01.id α2 in
    let* _ : ltac:(refine (M.Val u64.t)) :=
      let* α0 : ltac:(refine (M.Val u64.t)) := M.alloc 0 in
      let* α1 : ltac:(refine (M.Val u64.t)) := example01.id α0 in
      let* α2 : ltac:(refine (M.Val u64.t)) := example01.id α1 in
      let* α3 : ltac:(refine (M.Val u64.t)) := example01.id α2 in
      example01.id α3 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val u64.t)) := M.alloc 1 in
      let* α1 : ltac:(refine (M.Val u64.t)) := example01.id α0 in
      let* α2 : ltac:(refine (M.Val u64.t)) := M.alloc 2 in
      let* α3 : ltac:(refine (M.Val u64.t)) := example01.id α2 in
      let* α4 : ltac:(refine (M.Val u64.t)) := M.alloc 3 in
      example01.tri α1 α3 α4 in
    M.alloc tt).
