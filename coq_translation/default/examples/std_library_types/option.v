(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition checked_division
    (dividend : M.Val i32.t)
    (divisor : M.Val i32.t)
    : M (M.Val (core.option.Option.t i32.t)) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
    let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq divisor α0 in
    let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
    let* α3 := M.read α2 in
    if (α3 : bool) then
      M.alloc core.option.Option.None
    else
      let* α0 : ltac:(refine (M.Val i32.t)) := BinOp.div dividend divisor in
      let* α1 := M.read α0 in
      M.alloc (core.option.Option.Some α1)).

Definition try_division
    (dividend : M.Val i32.t)
    (divisor : M.Val i32.t)
    : M (M.Val unit) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
      option.checked_division dividend divisor in
    let* α1 := M.read α0 in
    match α1 with
    | core.option.Option.None  =>
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str " / "; mk_str " failed!
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow dividend in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow divisor in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt
    | core.option.Option.Some quotient =>
      let* quotient := M.alloc quotient in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str " / "; mk_str " = "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow dividend in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow divisor in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (ref i32.t))) := borrow quotient in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α6; α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 4 in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 2 in
      option.try_division α0 α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
      let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      option.try_division α0 α1 in
    let* none : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
      M.alloc core.option.Option.None in
    let* _equivalent_none :
        ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
      M.alloc core.option.Option.None in
    let* optional_float : ltac:(refine (M.Val (core.option.Option.t f32.t))) :=
      let* α0 : ltac:(refine (M.Val f32.t)) := M.alloc 0 (* 0 *) in
      let* α1 := M.read α0 in
      M.alloc (core.option.Option.Some α1) in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref (core.option.Option.t f32.t)))) :=
          borrow optional_float in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val f32.t)) :=
          (core.option.Option.t f32.t)::["unwrap"] optional_float in
        let* α6 : ltac:(refine (M.Val (ref f32.t))) := borrow α5 in
        let* α7 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α6 in
        let* α8 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α7 ] in
        let* α9 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α8 in
        let* α10 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α9 in
        let* α11 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α10 in
        std.io.stdio._print α11 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref (core.option.Option.t i32.t)))) :=
          borrow none in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val i32.t)) :=
          (core.option.Option.t i32.t)::["unwrap"] none in
        let* α6 : ltac:(refine (M.Val (ref i32.t))) := borrow α5 in
        let* α7 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α6 in
        let* α8 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α7 ] in
        let* α9 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α8 in
        let* α10 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α9 in
        let* α11 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α10 in
        std.io.stdio._print α11 in
      M.alloc tt in
    M.alloc tt).
