(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    calculate! { // Look ma! Variadic `calculate!`!
        eval 1 + 2,
        eval 3 + 4,
        eval (2 * 3) + 1
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* val :=
        let* α0 :=
          BinOp.Panic.add
            (Value.Integer Integer.Usize 1)
            (Value.Integer Integer.Usize 2) in
        M.alloc α0 in
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
              [ val ] in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
              ] in
          let* α7 := M.call α0 [ α6 ] in
          M.alloc α7 in
        M.alloc tt in
      M.alloc tt in
    let* _ :=
      let* val :=
        let* α0 :=
          BinOp.Panic.add
            (Value.Integer Integer.Usize 3)
            (Value.Integer Integer.Usize 4) in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "3 + 4 = ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ val ] in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
              ] in
          let* α7 := M.call α0 [ α6 ] in
          M.alloc α7 in
        M.alloc tt in
      M.alloc tt in
    let* val :=
      let* α0 :=
        BinOp.Panic.mul
          (Value.Integer Integer.Usize 2)
          (Value.Integer Integer.Usize 3) in
      let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.Usize 1) in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "(2 * 3) + 1 = ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ val ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
