(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit := M.alloc tt.

Definition load_fpu_control_word `{ℋ : State.Trait} (control : u16) : M unit :=
  let _ := InlineAssembly in
  M.alloc tt.
