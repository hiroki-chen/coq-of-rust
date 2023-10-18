(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition give_adult
    `{State.Trait}
    (drink : core.option.Option (ref str))
    : M unit :=
  match drink with
  | core.option.Option _ =>
    let* _ :=
      let* α0 := borrow [ mk_str "Yuck! Too sugary.
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  | core.option.Option inner =>
    let* _ :=
      let* α0 := borrow [ mk_str ""; mk_str "? How nice.
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow inner (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  | core.option.Option  =>
    let* _ :=
      let* α0 := borrow [ mk_str "No drink? Oh well.
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt
  end.

Definition drink
    `{State.Trait}
    (drink : core.option.Option (ref str))
    : M unit :=
  let* inside := (core.option.Option _)::["unwrap"] drink in
  let* _ :=
    let* α0 := borrow inside (ref str) in
    let* α1 := borrow (mk_str "lemonade") (ref str) in
    let* α2 := core.cmp.PartialEq.eq α0 α1 in
    let* α3 := use α2 in
    if (α3 : bool) then
      let* _ :=
        let* α0 := std.panicking.begin_panic (mk_str "AAAaaaaa!!!!") in
        never_to_any α0 in
      never_to_any tt
    else
      Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "I love "; mk_str "s!!!!!
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow inside (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let water := core.option.Option.Some (mk_str "water") in
  let lemonade := core.option.Option.Some (mk_str "lemonade") in
  let void := core.option.Option.None tt in
  let* _ := option_and_unwrap.give_adult water in
  let* _ := option_and_unwrap.give_adult lemonade in
  let* _ := option_and_unwrap.give_adult void in
  let coffee := core.option.Option.Some (mk_str "coffee") in
  let nothing := core.option.Option.None tt in
  let* _ := option_and_unwrap.drink coffee in
  let* _ := option_and_unwrap.drink nothing in
  Pure tt.
