(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let number = 13;
    // TODO ^ Try different values for `number`

    println!("Tell me about {}", number);
    match number {
        // Match a single value
        1 => println!("One!"),
        // Match several values
        2 | 3 | 5 | 7 | 11 => println!("This is a prime"),
        // TODO ^ Try adding 13 to the list of prime values
        // Match an inclusive range
        13..=19 => println!("A teen"),
        // Handle the rest of cases
        _ => println!("Ain't special"),
        // TODO ^ Try commenting out this catch-all arm
    }

    let boolean = true;
    // Match is an expression too
    let binary = match boolean {
        // The arms of a match must cover all the possible values
        false => 0,
        true => 1,
        // TODO ^ Try commenting out one of these arms
    };

    println!("{} -> {}", boolean, binary);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* number := M.alloc (Value.Integer Integer.I32 13) in
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
            let* α2 := M.read (mk_str "Tell me about ") in
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
            let* α7 := M.call_closure α6 [ number ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      M.match_operator
        number
        [
          fun γ =>
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 1) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "One!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            M.find_or_pattern
              γ
              [
                fun γ =>
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match
                      α0
                      (Value.Integer Integer.I32 2) in
                  M.pure (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match
                      α0
                      (Value.Integer Integer.I32 3) in
                  M.pure (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match
                      α0
                      (Value.Integer Integer.I32 5) in
                  M.pure (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match
                      α0
                      (Value.Integer Integer.I32 7) in
                  M.pure (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match
                      α0
                      (Value.Integer Integer.I32 11) in
                  M.pure (Value.Tuple [])
              ]
              (M.closure
                (fun γ =>
                  match γ with
                  | [] =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_const"
                          [] in
                      let* α4 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "This is a prime
") in
                          let* α3 := M.alloc (Value.Array [ α2 ]) in
                          M.pure (M.pointer_coercion α3) in
                      let* α5 := M.call_closure α1 [ α4 ] in
                      let* α6 := M.call_closure α0 [ α5 ] in
                      M.alloc α6 in
                    M.alloc (Value.Tuple [])
                  | _ => M.impossible
                  end));
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "A teen
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const"
                  [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Ain't special
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                  M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in
              M.alloc α6 in
            M.alloc (Value.Tuple [])
        ] in
    let* boolean := M.alloc (Value.Bool true) in
    let* binary :=
      let* α0 :=
        M.match_operator
          boolean
          [
            fun γ =>
              let* _ :=
                let* α0 := M.read γ in
                M.is_constant_or_break_match α0 (Value.Bool false) in
              M.alloc (Value.Integer Integer.I32 0);
            fun γ =>
              let* _ :=
                let* α0 := M.read γ in
                M.is_constant_or_break_match α0 (Value.Bool true) in
              M.alloc (Value.Integer Integer.I32 1)
          ] in
      M.copy α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α6 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str " -> ") in
            let* α4 := M.read (mk_str "
") in
            let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
            M.pure (M.pointer_coercion α5) in
        let* α12 :=
          (* Unsize *)
            let* α7 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "bool" ] in
            let* α8 := M.call_closure α7 [ boolean ] in
            let* α9 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α10 := M.call_closure α9 [ binary ] in
            let* α11 := M.alloc (Value.Array [ α8; α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α6; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
