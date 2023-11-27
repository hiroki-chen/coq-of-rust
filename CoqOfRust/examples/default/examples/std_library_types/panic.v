(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn division(dividend: i32, divisor: i32) -> i32 {
    if divisor == 0 {
        // Division by zero triggers a panic
        panic!("division by zero");
    } else {
        dividend / divisor
    }
}
*)
Definition division (dividend : i32.t) (divisor : i32.t) : M i32.t :=
  let* dividend : M.Val i32.t := M.alloc dividend in
  let* divisor : M.Val i32.t := M.alloc divisor in
  let* α0 : M.Val i32.t := M.alloc 0 in
  let* α1 : M.Val bool.t := BinOp.eq divisor α0 in
  let* α2 : M.Val bool.t := use α1 in
  let* α3 : bool.t := M.read α2 in
  let* α4 : M.Val i32.t :=
    if (α3 : bool) then
      let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "division by zero") in
        let* α1 : never.t := std.panicking.begin_panic α0 in
        let* α2 : M.Val never.t := M.alloc α1 in
        never_to_any α2 in
      let* α0 : M.Val unit := M.alloc tt in
      never_to_any α0
    else
      BinOp.div dividend divisor in
  M.read α4.

(*
fn main() {
    // Heap allocated integer
    let _x = Box::new(0i32);

    // This operation will trigger a task failure
    division(3, 0);

    println!("This point won't be reached!");

    // `_x` should get destroyed at this point
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _x : M.Val (alloc.boxed.Box.t i32.t alloc.alloc.Global.t) :=
    let* α0 : M.Val i32.t := M.alloc 0 in
    let* α1 : i32.t := M.read α0 in
    let* α2 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      (alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"] α1 in
    M.alloc α2 in
  let* _ : M.Val i32.t :=
    let* α0 : M.Val i32.t := M.alloc 3 in
    let* α1 : i32.t := M.read α0 in
    let* α2 : M.Val i32.t := M.alloc 0 in
    let* α3 : i32.t := M.read α2 in
    let* α4 : i32.t := panic.division α1 α3 in
    M.alloc α4 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "This point won't be reached!
" ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_const"] α4 in
      let* α6 : unit := std.io.stdio._print α5 in
      M.alloc α6 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
