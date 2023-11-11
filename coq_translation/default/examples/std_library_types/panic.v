(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition division
    (dividend : M.Val i32.t)
    (divisor : M.Val i32.t)
    : M (M.Val i32.t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
    let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq divisor α0 in
    let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
    let* α3 := M.read α2 in
    if (α3 : bool) then
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val never.t)) :=
          std.panicking.begin_panic (mk_str "division by zero") in
        never_to_any α0 in
      let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
      never_to_any α0
    else
      BinOp.div dividend divisor).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _x :
        ltac:(refine (M.Val (alloc.boxed.Box.t i32.t alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      (alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"] α0 in
    let* _ : ltac:(refine (M.Val i32.t)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      panic.division α0 α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "This point won't be reached!
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    M.alloc tt).
