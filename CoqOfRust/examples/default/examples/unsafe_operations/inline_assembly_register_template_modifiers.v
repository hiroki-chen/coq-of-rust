(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let mut x: u16 = 0xab;

    unsafe {
        asm!("mov {0:h}, {0:l}", inout(reg_abcd) x);
    }

    assert_eq!(x, 0xabab);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* x : M.Val u16.t := M.alloc (Integer.of_Z 171) in
  let* _ : M.Val unit :=
    let _ : M.Val unit := InlineAssembly in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : M.Val u16.t := M.alloc (Integer.of_Z 43947) in
    match_operator
      (borrow x, borrow α0)
      [
        fun α =>
          match α with
          | (left_val, right_val) =>
            let* left_val := M.alloc left_val in
            let* right_val := M.alloc right_val in
            let* α0 : ref u16.t := M.read left_val in
            let* α1 : u16.t := M.read (deref α0) in
            let* α2 : ref u16.t := M.read right_val in
            let* α3 : u16.t := M.read (deref α2) in
            let* α4 : M.Val bool.t :=
              M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* _ : M.Val never.t :=
                let* α0 : core.panicking.AssertKind.t := M.read kind in
                let* α1 : ref u16.t := M.read left_val in
                let* α2 : ref u16.t := M.read right_val in
                let* α3 : never.t :=
                  M.call
                    (core.panicking.assert_failed
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                M.alloc α3 in
              let* α0 : M.Val unit := M.alloc tt in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
