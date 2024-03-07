(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn used_function() {}
*)
Definition used_function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
fn unused_function() {}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition unused_function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
fn noisy_unused_function() {}
*)
Definition noisy_unused_function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with | [], [] => M.pure tt | _, _ => M.impossible end.

(*
fn main() {
    used_function();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "dead_code::used_function" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
