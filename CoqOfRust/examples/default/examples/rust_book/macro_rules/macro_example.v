(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This call will expand into `println!("Hello");`
    say_hello!()
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "std::io::stdio::_print" in
      let* α1 := M.read (mk_str "Hello!
") in
      let* α2 := M.alloc [ α1 ] in
      let* α3 :=
        M.call
          (Ty.path "core::fmt::Arguments")::["new_const"]
          [ M.pointer_coercion "Unsize" α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
