(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ :
        ltac:(refine
          (M.Val
            (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
      let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "12") in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      str::["parse"] α1 in
    let* _ :
        ltac:(refine
          (M.Val
            (core.result.Result.t bool.t core.str.error.ParseBoolError.t))) :=
      let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "true") in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      str::["parse"] α1 in
    let* _ :
        ltac:(refine
          (M.Val
            (core.result.Result.t u32.t core.num.error.ParseIntError.t))) :=
      let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "unparsable") in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      str::["parse"] α1 in
    M.alloc tt).
