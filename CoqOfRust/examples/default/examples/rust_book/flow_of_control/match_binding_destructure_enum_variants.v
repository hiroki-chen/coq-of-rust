(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn some_number() -> Option<u32> {
    Some(42)
}
*)
Definition some_number (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    M.pure
      (Value.StructTuple
        "core::option::Option::Some"
        [ Value.Integer Integer.U32 42 ])
  | _, _ => M.impossible
  end.

(*
fn main() {
    match some_number() {
        // Got `Some` variant, match if its value, bound to `n`,
        // is equal to 42.
        Some(n @ 42) => println!("The Answer: {}!", n),
        // Match any other number.
        Some(n) => println!("Not interesting... {}", n),
        // Match anything else (`None` variant).
        _ => (),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* α0 :=
      M.get_function
        "match_binding_destructure_enum_variants::some_number"
        [] in
    let* α1 := M.call_closure α0 [] in
    let* α2 := M.alloc α1 in
    let* α3 :=
      M.match_operator
        α2
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.U32 42) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "The Answer: ") in
                  let* α3 := M.read (mk_str "!
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "u32" ] in
                  let* α7 := M.call_closure α6 [ n ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Not interesting... ") in
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
                      [ Ty.path "u32" ] in
                  let* α7 := M.call_closure α6 [ n ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    M.read α3
  | _, _ => M.impossible
  end.
