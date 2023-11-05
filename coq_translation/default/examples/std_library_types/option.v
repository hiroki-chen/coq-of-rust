(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition checked_division
    `{ℋ : State.Trait}
    (dividend : i32)
    (divisor : i32)
    : M (core.option.Option i32) :=
  M.function_body
    (let* α0 : ltac:(refine i32) := M.alloc 0 in
    let* α1 : ltac:(refine bool) := BinOp.eq divisor α0 in
    let* α2 : ltac:(refine bool) := use α1 in
    if (α2 : bool) then
      M.alloc core.option.Option.None
    else
      let* α0 : ltac:(refine i32) := BinOp.div dividend divisor in
      M.alloc (core.option.Option.Some α0)).

Definition try_division
    `{ℋ : State.Trait}
    (dividend : i32)
    (divisor : i32)
    : M unit :=
  M.function_body
    (let* α0 : ltac:(refine (core.option.Option i32)) :=
      option.checked_division dividend divisor in
    let* α1 := M.read α0 in
    match α1 with
    | core.option.Option  =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " / "; mk_str " failed!
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow dividend in
        let* α6 : ltac:(refine i32) := deref α5 in
        let* α7 : ltac:(refine (ref i32)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (ref i32)) := borrow divisor in
        let* α10 : ltac:(refine i32) := deref α9 in
        let* α11 : ltac:(refine (ref i32)) := borrow α10 in
        let* α12 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α11 in
        let* α13 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8; α12 ] in
        let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α13 in
        let* α15 : ltac:(refine (array core.fmt.rt.Argument)) := deref α14 in
        let* α16 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α15 in
        let* α17 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α17 in
        std.io.stdio._print α18 in
      M.alloc tt
    | core.option.Option quotient =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " / "; mk_str " = "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow dividend in
        let* α6 : ltac:(refine i32) := deref α5 in
        let* α7 : ltac:(refine (ref i32)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (ref i32)) := borrow divisor in
        let* α10 : ltac:(refine i32) := deref α9 in
        let* α11 : ltac:(refine (ref i32)) := borrow α10 in
        let* α12 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α11 in
        let* α13 : ltac:(refine (ref i32)) := borrow quotient in
        let* α14 : ltac:(refine i32) := deref α13 in
        let* α15 : ltac:(refine (ref i32)) := borrow α14 in
        let* α16 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α15 in
        let* α17 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8; α12; α16 ] in
        let* α18 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α17 in
        let* α19 : ltac:(refine (array core.fmt.rt.Argument)) := deref α18 in
        let* α20 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α19 in
        let* α21 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α20 in
        let* α22 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α21 in
        std.io.stdio._print α22 in
      M.alloc tt
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine i32) := M.alloc 4 in
      let* α1 : ltac:(refine i32) := M.alloc 2 in
      option.try_division α0 α1 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 0 in
      option.try_division α0 α1 in
    let* none : ltac:(refine (core.option.Option i32)) :=
      M.alloc core.option.Option.None in
    let* _equivalent_none : ltac:(refine (core.option.Option i32)) :=
      M.alloc core.option.Option.None in
    let* optional_float : ltac:(refine (core.option.Option f32)) :=
      let* α0 : ltac:(refine f32) := M.alloc 0 (* 0 *) in
      M.alloc (core.option.Option.Some α0) in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (core.option.Option f32))) :=
          borrow optional_float in
        let* α6 : ltac:(refine (core.option.Option f32)) := deref α5 in
        let* α7 : ltac:(refine (ref (core.option.Option f32))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine f32) :=
          (core.option.Option f32)::["unwrap"] optional_float in
        let* α10 : ltac:(refine (ref f32)) := borrow α9 in
        let* α11 : ltac:(refine f32) := deref α10 in
        let* α12 : ltac:(refine (ref f32)) := borrow α11 in
        let* α13 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α12 in
        let* α14 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8; α13 ] in
        let* α15 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α14 in
        let* α16 : ltac:(refine (array core.fmt.rt.Argument)) := deref α15 in
        let* α17 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α16 in
        let* α18 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α17 in
        let* α19 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α18 in
        std.io.stdio._print α19 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str " unwraps to "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (core.option.Option i32))) := borrow none in
        let* α6 : ltac:(refine (core.option.Option i32)) := deref α5 in
        let* α7 : ltac:(refine (ref (core.option.Option i32))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine i32) :=
          (core.option.Option i32)::["unwrap"] none in
        let* α10 : ltac:(refine (ref i32)) := borrow α9 in
        let* α11 : ltac:(refine i32) := deref α10 in
        let* α12 : ltac:(refine (ref i32)) := borrow α11 in
        let* α13 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α12 in
        let* α14 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8; α13 ] in
        let* α15 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α14 in
        let* α16 : ltac:(refine (array core.fmt.rt.Argument)) := deref α15 in
        let* α17 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α16 in
        let* α18 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α17 in
        let* α19 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α18 in
        std.io.stdio._print α19 in
      M.alloc tt in
    M.alloc tt).
