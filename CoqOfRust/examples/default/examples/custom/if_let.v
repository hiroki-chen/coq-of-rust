(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let x = Some(5);

    if let Some(y) = x {
        println!("if: {y}");
    }

    match x {
        Some(_) if let Some(y) = x => println!("match: {y}"),
        None => {}
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* x :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.Integer Integer.I32 5 ]) in
    let* _ :=
      match_operator
        x
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* y := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α2 := M.read (mk_str "if: ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "i32" ] in
                let* α6 := M.call_closure α5 [ y ] in
                let* α7 := M.alloc (Value.Array [ α6 ]) in
                let* α8 :=
                  M.call_closure
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α7
                    ] in
                let* α9 := M.call_closure α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* α0 :=
      match_operator
        x
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let Γ := x in
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                Γ
                "core::option::Option::Some"
                0 in
            let* y := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "match: ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α6 := M.call_closure α5 [ y ] in
              let* α7 := M.alloc (Value.Array [ α6 ]) in
              let* α8 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α7
                  ] in
              let* α9 := M.call_closure α0 [ α8 ] in
              M.alloc α9 in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
