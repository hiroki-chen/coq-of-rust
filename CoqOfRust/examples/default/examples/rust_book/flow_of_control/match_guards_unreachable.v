(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let number: u8 = 4;

    match number {
        i if i == 0 => println!("Zero"),
        i if i > 0 => println!("Greater than zero"),
        _ => unreachable!("Should never happen."),
        // TODO ^ uncomment to fix compilation
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* number := M.alloc (Value.Integer Integer.U8 4) in
    let* α0 :=
      M.match_operator
        number
        [
          fun γ =>
            let* i := M.copy γ in
            let* γ :=
              let* α0 := M.read i in
              M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.U8 0)) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Zero
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* i := M.copy γ in
            let* γ :=
              let* α0 := M.read i in
              M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.U8 0)) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Greater than zero
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* α0 :=
              M.get_function
                "core::panicking::unreachable_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α1 := M.call_closure α0 [ mk_str "Should never happen." ] in
            let* α2 := M.never_to_any α1 in
            M.alloc α2
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
