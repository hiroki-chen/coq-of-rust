(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let mut a: u64 = 4;
    let b: u64 = 4;
    unsafe {
        asm!("add {0}, {1}", inlateout(reg) a, in(reg) b);
    }
    assert_eq!(a, 8);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* a : M.Val u64.t :=
      let* α0 : M.Val u64.t := M.alloc 4 in
      M.copy α0 in
    let* b : M.Val u64.t :=
      let* α0 : M.Val u64.t := M.alloc 4 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let _ : M.Val unit := InlineAssembly in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* α0 : ref u64.t := borrow a in
      let* α1 : M.Val u64.t := M.alloc 8 in
      let* α2 : ref u64.t := borrow α1 in
      let* α3 : M.Val ((ref u64.t) * (ref u64.t)) := M.alloc (α0, α2) in
      let* α4 := M.read α3 in
      match α4 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ref u64.t := M.read left_val in
        let* α1 : M.Val u64.t := deref α0 in
        let* α2 : ref u64.t := M.read right_val in
        let* α3 : M.Val u64.t := deref α2 in
        let* α4 : M.Val bool.t := BinOp.eq α1 α3 in
        let* α5 : M.Val bool.t := UnOp.not α4 in
        let* α6 : M.Val bool.t := use α5 in
        let* α7 : bool.t := M.read α6 in
        if (α7 : bool) then
          let* kind : M.Val core.panicking.AssertKind.t :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : M.Val never.t :=
            let* α0 : core.panicking.AssertKind.t := M.read kind in
            let* α1 : ref u64.t := M.read left_val in
            let* α2 : ref u64.t := M.read right_val in
            let* α3 : never.t :=
              core.panicking.assert_failed α0 α1 α2 core.option.Option.None in
            M.alloc α3 in
          let* α0 : M.Val unit := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
