(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This binding lives in the main function
    let long_lived_binding = 1;

    // This is a block, and has a smaller scope than the main function
    {
        // This binding only exists in this block
        let short_lived_binding = 2;

        println!("inner short: {}", short_lived_binding);
    }
    // End of the block

    // Error! `short_lived_binding` doesn't exist in this scope
    // println!("outer short: {}", short_lived_binding);
    // FIXME ^ Comment out this line

    println!("outer long: {}", long_lived_binding);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* long_lived_binding := M.alloc (Value.Integer Integer.I32 1) in
    let* _ :=
      let* short_lived_binding := M.alloc (Value.Integer Integer.I32 2) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1"
              [] in
          let* α5 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "inner short: ") in
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
                  [ Ty.path "i32" ] in
              let* α7 := M.call_closure α6 [ short_lived_binding ] in
              let* α8 := M.alloc (Value.Array [ α7 ]) in
              M.pure (M.pointer_coercion α8) in
          let* α10 := M.call_closure α1 [ α5; α9 ] in
          let* α11 := M.call_closure α0 [ α10 ] in
          M.alloc α11 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "outer long: ") in
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
                [ Ty.path "i32" ] in
            let* α7 := M.call_closure α6 [ long_lived_binding ] in
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
