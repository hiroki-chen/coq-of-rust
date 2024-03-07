(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let mut a = 0;
    unsafe {
        asm!(
            "mov {0}, 10",
            "2:",
            "sub {0}, 1",
            "cmp {0}, 3",
            "jle 2f",
            "jmp 2b",
            "2:",
            "add {0}, 2",
            out(reg) a
        );
    }
    assert_eq!(a, 5);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc ((Integer.of_Z 0) : Ty.path "i32") in
    let* _ :=
      let _ := InlineAssembly in
      M.alloc tt in
    let* _ :=
      let* α0 := M.alloc ((Integer.of_Z 5) : Ty.path "i32") in
      let* α1 := M.alloc (borrow a, borrow α0) in
      match_operator
        α1
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 := M.var "BinOp::Pure::eq" in
              let* α2 := M.read left_val in
              let* α3 := M.read (deref α2) in
              let* α4 := M.read right_val in
              let* α5 := M.read (deref α4) in
              let* α6 := M.alloc (α0 (α1 α3 α5)) in
              let* α7 := M.read (use α6) in
              if α7 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
