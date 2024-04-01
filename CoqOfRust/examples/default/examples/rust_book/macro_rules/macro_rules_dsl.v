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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* val :=
        let* α0 :=
          BinOp.Panic.add (Value.Integer Integer.Usize 1) (Value.Integer Integer.Usize 2) in
        M.alloc α0 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "1 + 2 = ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              M.pure (M.pointer_coercion α4) in
          let* α9 :=
            (* Unsize *)
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "usize" ] in
              let* α7 := M.call_closure α6 [ val ] in
              let* α8 := M.alloc (Value.Array [ α7 ]) in
              M.pure (M.pointer_coercion α8) in
          let* α10 := M.call_closure α1 [ α5; α9 ] in
          let* α11 := M.call_closure α0 [ α10 ] in
          M.alloc α11 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* val :=
      let* α0 := BinOp.Panic.add (Value.Integer Integer.Usize 1) (Value.Integer Integer.Usize 2) in
      let* α1 := BinOp.Panic.div (Value.Integer Integer.Usize 3) (Value.Integer Integer.Usize 4) in
      let* α2 := BinOp.Panic.mul α0 α1 in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "(1 + 2) * (3 / 4) = ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "usize" ] in
            let* α7 := M.call_closure α6 [ val ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
