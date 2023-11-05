(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition give_adult
    `{ℋ : State.Trait}
    (drink : core.option.Option (ref str))
    : M unit :=
  M.function_body
    (let* α0 := M.read drink in
    match α0 with
    | core.option.Option _ =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Yuck! Too sugary.
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt
    | core.option.Option inner =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str ""; mk_str "? How nice.
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref str))) := borrow inner in
        let* α6 : ltac:(refine (ref str)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt
    | core.option.Option  =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "No drink? Oh well.
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt
    end).

Definition drink
    `{ℋ : State.Trait}
    (drink : core.option.Option (ref str))
    : M unit :=
  M.function_body
    (let* inside : ltac:(refine (ref str)) :=
      (core.option.Option (ref str))::["unwrap"] drink in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (ref str))) := borrow inside in
      let* α1 : ltac:(refine (ref (ref str))) := borrow (mk_str "lemonade") in
      let* α2 : ltac:(refine bool) :=
        (core.cmp.PartialEq.eq (Self := ref str) (Trait := ltac:(refine _)))
          α0
          α1 in
      let* α3 : ltac:(refine bool) := use α2 in
      if (α3 : bool) then
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine never) :=
            std.panicking.begin_panic (mk_str "AAAaaaaa!!!!") in
          never_to_any α0 in
        let* α0 : ltac:(refine unit) := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "I love "; mk_str "s!!!!!
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref str))) := borrow inside in
        let* α6 : ltac:(refine (ref str)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref str))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* water : ltac:(refine (core.option.Option (ref str))) :=
      M.alloc (core.option.Option.Some (mk_str "water")) in
    let* lemonade : ltac:(refine (core.option.Option (ref str))) :=
      M.alloc (core.option.Option.Some (mk_str "lemonade")) in
    let* void : ltac:(refine (core.option.Option (ref str))) :=
      M.alloc core.option.Option.None in
    let* _ : ltac:(refine unit) := option_and_unwrap.give_adult water in
    let* _ : ltac:(refine unit) := option_and_unwrap.give_adult lemonade in
    let* _ : ltac:(refine unit) := option_and_unwrap.give_adult void in
    let* coffee : ltac:(refine (core.option.Option (ref str))) :=
      M.alloc (core.option.Option.Some (mk_str "coffee")) in
    let* nothing : ltac:(refine (core.option.Option (ref str))) :=
      M.alloc core.option.Option.None in
    let* _ : ltac:(refine unit) := option_and_unwrap.drink coffee in
    let* _ : ltac:(refine unit) := option_and_unwrap.drink nothing in
    M.alloc tt).
