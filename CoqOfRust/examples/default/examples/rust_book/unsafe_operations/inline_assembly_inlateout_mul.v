(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    fn mul(a: u64, b: u64) -> u128 {
        let lo: u64;
        let hi: u64;

        unsafe {
            asm!(
                // The x86 mul instruction takes rax as an implicit input and writes
                // the 128-bit result of the multiplication to rax:rdx.
                "mul {}",
                in(reg) a,
                inlateout("rax") b => lo,
                lateout("rdx") hi
            );
        }

        ((hi as u128) << 64) + lo as u128
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] => M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

Module main.
  (*
      fn mul(a: u64, b: u64) -> u128 {
          let lo: u64;
          let hi: u64;
  
          unsafe {
              asm!(
                  // The x86 mul instruction takes rax as an implicit input and writes
                  // the 128-bit result of the multiplication to rax:rdx.
                  "mul {}",
                  in(reg) a,
                  inlateout("rax") b => lo,
                  lateout("rdx") hi
              );
          }
  
          ((hi as u128) << 64) + lo as u128
      }
  *)
  Definition mul (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ a; b ] =>
      let* a := M.alloc a in
      let* b := M.alloc b in
      let* lo := M.copy Value.DeclaredButUndefined in
      let* hi := M.copy Value.DeclaredButUndefined in
      let* _ :=
        let _ := InlineAssembly in
        M.alloc (Value.Tuple []) in
      let* α0 := M.read hi in
      let* α1 :=
        BinOp.Panic.shl (M.rust_cast α0) (Value.Integer Integer.I32 64) in
      let* α2 := M.read lo in
      let* α3 := BinOp.Panic.add α1 (M.rust_cast α2) in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
End main.
