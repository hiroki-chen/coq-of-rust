(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    let cmd = 0xd1;
    unsafe {
        asm!("out 0x64, eax", in("eax") cmd);
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* cmd := M.alloc (Value.Integer Integer.I32 209) in
    let _ := InlineAssembly in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
