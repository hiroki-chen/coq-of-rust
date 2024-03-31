(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let triple = (0, -2, 3);
    // TODO ^ Try different values for `triple`

    println!("Tell me about {:?}", triple);
    // Match can be used to destructure a tuple
    match triple {
        // Destructure the second and third elements
        (0, y, z) => println!("First is `0`, `y` is {:?}, and `z` is {:?}", y, z),
        (1, _, _) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, _, 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
        // `..` can be used to ignore the rest of the tuple
        _ => println!("It doesn't matter what they are"),
        // `_` means don't bind the value to a variable
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* triple :=
      M.alloc
        (Value.Tuple
          [ Value.Integer Integer.I32 0; Value.Integer Integer.I32 (-2); Value.Integer Integer.I32 3
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Tell me about ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.tuple [ Ty.path "i32"; Ty.path "i32"; Ty.path "i32" ] ] in
            let* α7 := M.call_closure α6 [ triple ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      M.match_operator
        triple
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 0) in
            let* y := M.copy γ0_1 in
            let* z := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α6 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "First is `0`, `y` is ") in
                  let* α3 := M.read (mk_str ", and `z` is ") in
                  let* α4 := M.read (mk_str "
") in
                  let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                  M.pure (M.pointer_coercion α5) in
              let* α12 :=
                (* Unsize *)
                  let* α7 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug"
                      [ Ty.path "i32" ] in
                  let* α8 := M.call_closure α7 [ y ] in
                  let* α9 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug"
                      [ Ty.path "i32" ] in
                  let* α10 := M.call_closure α9 [ z ] in
                  let* α11 := M.alloc (Value.Array [ α8; α10 ]) in
                  M.pure (M.pointer_coercion α11) in
              let* α13 := M.call_closure α1 [ α6; α12 ] in
              let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 1) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "First is `1` and the rest doesn't matter
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let* _ :=
              let* α0 := M.read γ0_2 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 2) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "last is `2` and the rest doesn't matter
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 3) in
            let* _ :=
              let* α0 := M.read γ0_2 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 4) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 :=
                    M.read (mk_str "First is `3`, last is `4`, and the rest doesn't matter
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "It doesn't matter what they are
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
