(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine bool) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 := M.read α0 in
      match α1 with
      | _ => M.alloc false
      | _ => M.alloc true
      end in
    let* _ : ltac:(refine i32) :=
      let* α0 : ltac:(refine bool) := M.alloc true in
      let* α1 : ltac:(refine bool) := use α0 in
      if (α1 : bool) then
        M.alloc 0
      else
        M.alloc 1 in
    let* _ : ltac:(refine i32) :=
      let* α0 : ltac:(refine bool) := M.alloc false in
      let* α1 : ltac:(refine bool) := use α0 in
      if (α1 : bool) then
        M.alloc 2
      else
        let* α0 : ltac:(refine bool) := M.alloc false in
        let* α1 : ltac:(refine bool) := use α0 in
        if (α1 : bool) then
          M.alloc 3
        else
          let* α0 : ltac:(refine bool) := M.alloc false in
          let* α1 : ltac:(refine bool) := use α0 in
          if (α1 : bool) then
            M.alloc 4
          else
            M.alloc 5 in
    M.alloc tt).
