(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn drink(beverage: &str) {
    // You shouldn't drink too much sugary beverages.
    if beverage == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("Some refreshing {} is all I need.", beverage);
}
*)
Definition drink (beverage : ref str.t) : M unit :=
  let* beverage := M.alloc beverage in
  let* _ : M.Val unit :=
    let* α0 : _ :=
      ltac:(M.get_method (fun ℐ =>
        core.cmp.PartialEq.eq
          (Self := ref str.t)
          (Rhs := ref str.t)
          (Trait := ℐ))) in
    let* α1 : bool.t :=
      M.call (α0 (borrow beverage) (borrow (mk_str "lemonade"))) in
    let* α2 : M.Val bool.t := M.alloc α1 in
    let* α3 : bool.t := M.read (use α2) in
    if α3 then
      let* α0 : ref str.t := M.read (mk_str "AAAaaaaa!!!!") in
      let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
      let* α2 : unit := never_to_any α1 in
      M.alloc α2
    else
      M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Some refreshing ") in
      let* α1 : ref str.t := M.read (mk_str " is all I need.
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow beverage)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn main() {
    drink("water");
    drink("lemonade");
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* α0 : ref str.t := M.read (mk_str "water") in
    let* α1 : unit := M.call (panic.drink α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 : ref str.t := M.read (mk_str "lemonade") in
    let* α1 : unit := M.call (panic.drink α0) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
