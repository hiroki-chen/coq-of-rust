(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    unsafe {
        asm!("nop");
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let _ := InlineAssembly in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
