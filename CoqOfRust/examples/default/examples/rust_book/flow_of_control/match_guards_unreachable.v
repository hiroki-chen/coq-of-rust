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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* number := M.alloc (Value.Integer Integer.U8 4) in
    let* α0 :=
      match_operator
        number
        [
          fun γ =>
            (let* i := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "Zero
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* i := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "Greater than zero
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* α0 :=
              M.get_function
                "core::panicking::unreachable_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α1 := M.call α0 [ mk_str "Should never happen." ] in
            let* α2 := M.never_to_any α1 in
            M.alloc α2)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
