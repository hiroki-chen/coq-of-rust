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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* a := M.alloc (Value.Integer Integer.U64 4) in
    let* b := M.alloc (Value.Integer Integer.U64 4) in
    let* _ :=
      let _ := InlineAssembly in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 := M.alloc (Value.Integer Integer.U64 8) in
      let* α1 := M.alloc (Value.Tuple [ a; α0 ]) in
      M.match_operator
        α1
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 := M.read left_val in
                    let* α1 := M.read α0 in
                    let* α2 := M.read right_val in
                    let* α3 := M.read α2 in
                    let* α4 := M.alloc (UnOp.Pure.not (BinOp.Pure.eq α1 α3)) in
                    M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [ Ty.path "u64"; Ty.path "u64" ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in
                  let* α2 := M.never_to_any α1 in
                  M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
