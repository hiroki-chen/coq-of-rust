(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition multiply
    (first_number_str : M.Val (ref str.t))
    (second_number_str : M.Val (ref str.t))
    : M (M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t)) :=
  M.function_body
    (let* first_number : ltac:(refine (M.Val i32.t)) :=
      let* α0 : ltac:(refine (M.Val str)) := deref first_number_str in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      let* α2 :
          ltac:(refine
            (M.Val
              (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
        str::["parse"] α1 in
      let* α3 := M.read α2 in
      match α3 with
      | core.result.Result.Ok first_number =>
        let* first_number := M.alloc first_number in
        M.pure first_number
      | core.result.Result.Err e =>
        let* e := M.alloc e in
        let* α0 := M.read e in
        let* α1 :
            ltac:(refine
              (M.Val
                (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
          M.alloc (core.result.Result.Err α0) in
        let* α2 : ltac:(refine (M.Val never.t)) := M.return_ α1 in
        never_to_any α2
      end in
    let* second_number : ltac:(refine (M.Val i32.t)) :=
      let* α0 : ltac:(refine (M.Val str)) := deref second_number_str in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      let* α2 :
          ltac:(refine
            (M.Val
              (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
        str::["parse"] α1 in
      let* α3 := M.read α2 in
      match α3 with
      | core.result.Result.Ok second_number =>
        let* second_number := M.alloc second_number in
        M.pure second_number
      | core.result.Result.Err e =>
        let* e := M.alloc e in
        let* α0 := M.read e in
        let* α1 :
            ltac:(refine
              (M.Val
                (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
          M.alloc (core.result.Result.Err α0) in
        let* α2 : ltac:(refine (M.Val never.t)) := M.return_ α1 in
        never_to_any α2
      end in
    let* α0 : ltac:(refine (M.Val i32.t)) :=
      BinOp.mul first_number second_number in
    let* α1 := M.read α0 in
    M.alloc (core.result.Result.Ok α1)).

Definition print
    (result : M.Val (core.result.Result.t i32.t core.num.error.ParseIntError.t))
    : M (M.Val unit) :=
  M.function_body
    (let* α0 := M.read result in
    match α0 with
    | core.result.Result.Ok n =>
      let* n := M.alloc n in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "n is "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow n in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt
    | core.result.Result.Err e =>
      let* e := M.alloc e in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Error: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref core.num.error.ParseIntError.t))) :=
          borrow e in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "10") in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val str)) := deref (mk_str "2") in
      let* α3 : ltac:(refine (M.Val (ref str))) := borrow α2 in
      let* α4 :
          ltac:(refine
            (M.Val
              (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
        early_returns.multiply α1 α3 in
      early_returns.print α4 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "t") in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val str)) := deref (mk_str "2") in
      let* α3 : ltac:(refine (M.Val (ref str))) := borrow α2 in
      let* α4 :
          ltac:(refine
            (M.Val
              (core.result.Result.t i32.t core.num.error.ParseIntError.t))) :=
        early_returns.multiply α1 α3 in
      early_returns.print α4 in
    M.alloc tt).
