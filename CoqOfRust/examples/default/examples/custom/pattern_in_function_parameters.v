(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn sum((x, y): (i32, i32)) -> i32 {
    x + y
}
*)
Definition sum (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ β0 ] =>
    let* β0 := M.alloc β0 in
    match_operator
      β0
      [
        fun γ =>
          let γ0_0 := M.get_tuple_field γ 0 in
          let γ0_1 := M.get_tuple_field γ 1 in
          let* x := M.copy γ0_0 in
          let* y := M.copy γ0_1 in
          let* α0 := M.read x in
          let* α1 := M.read y in
          BinOp.Panic.add α0 α1
      ]
  | _, _ => M.impossible
  end.
