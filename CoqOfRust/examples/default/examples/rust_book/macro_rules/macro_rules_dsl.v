(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    calculate! {
        eval 1 + 2 // hehehe `eval` is _not_ a Rust keyword!
    }

    calculate! {
        eval (1 + 2) * (3 / 4)
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* val :=
        let* α0 := M.var "BinOp::Panic::add" in
        let* α1 :=
          α0
            ((Integer.of_Z 1) : Ty.path "usize")
            ((Integer.of_Z 2) : Ty.path "usize") in
        M.alloc α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "1 + 2 = ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow val ] in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α5)
              ] in
          let* α7 := M.call α0 [ α6 ] in
          M.alloc α7 in
        M.alloc tt in
      M.alloc tt in
    let* val :=
      let* α0 := M.var "BinOp::Panic::mul" in
      let* α1 := M.var "BinOp::Panic::add" in
      let* α2 :=
        α1
          ((Integer.of_Z 1) : Ty.path "usize")
          ((Integer.of_Z 2) : Ty.path "usize") in
      let* α3 := M.var "BinOp::Panic::div" in
      let* α4 :=
        α3
          ((Integer.of_Z 3) : Ty.path "usize")
          ((Integer.of_Z 4) : Ty.path "usize") in
      let* α5 := α0 α2 α4 in
      M.alloc α5 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "(1 + 2) * (3 / 4) = ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow val ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
