(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition message : Value.t := M.run (M.pure (mk_str "Hello, World!")).

(*
fn main() {
    println!("{message}");

    // All have type `Option<i32>`
    let number = Some(7);
    let letter: Option<i32> = None;
    let emoticon: Option<i32> = None;

    // The `if let` construct reads: "if `let` destructures `number` into
    // `Some(i)`, evaluate the block (`{}`).
    if let Some(i) = number {
        println!("Matched {:?}!", i);
    }

    // If you need to specify a failure, use an else:
    if let Some(j) = letter {
        println!("Matched {:?}!", j);
    } else {
        // Destructure failed. Change to the failure case.
        println!("Didn't match a number. Let's go with a letter!");
    }

    // Provide an altered failing condition.
    let i_like_letters = false;

    if let Some(i) = emoticon {
        println!("Matched {:?}!", i);
    // Destructure failed. Evaluate an `else if` condition to see if the
    // alternate failure branch should be taken:
    } else if i_like_letters {
        println!("Didn't match a number. Let's go with a letter!");
    } else {
        // The condition evaluated false. This branch is the default:
        println!("I don't like letters. Let's go with an emoticon :)!");
    }
}
"
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α10 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α7 := M.get_constant "hello_world::message" in
            let* α8 := M.call_closure α6 [ α7 ] in
            let* α9 := M.alloc (Value.Array [ α8 ]) in
            M.pure (M.pointer_coercion α9) in
        let* α11 := M.call_closure α1 [ α5; α10 ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* number :=
      M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 7 ]) in
    let* letter := M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* emoticon := M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* _ :=
      let* α0 := M.alloc (Value.Tuple []) in
      M.match_operator
        α0
        [
          fun γ =>
            let γ := number in
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
            let* i := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Matched ") in
                    let* α3 := M.read (mk_str "!
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    M.pure (M.pointer_coercion α4) in
                let* α9 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "i32" ] in
                    let* α7 := M.call_closure α6 [ i ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    M.pure (M.pointer_coercion α8) in
                let* α10 := M.call_closure α1 [ α5; α9 ] in
                let* α11 := M.call_closure α0 [ α10 ] in
                M.alloc α11 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      let* α0 := M.alloc (Value.Tuple []) in
      M.match_operator
        α0
        [
          fun γ =>
            let γ := letter in
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
            let* j := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Matched ") in
                    let* α3 := M.read (mk_str "!
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    M.pure (M.pointer_coercion α4) in
                let* α9 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "i32" ] in
                    let* α7 := M.call_closure α6 [ j ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    M.pure (M.pointer_coercion α8) in
                let* α10 := M.call_closure α1 [ α5; α9 ] in
                let* α11 := M.call_closure α0 [ α10 ] in
                M.alloc α11 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                let* α4 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Didn't match a number. Let's go with a letter!
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    M.pure (M.pointer_coercion α3) in
                let* α5 := M.call_closure α1 [ α4 ] in
                let* α6 := M.call_closure α0 [ α5 ] in
                M.alloc α6 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple [])
        ] in
    let* i_like_letters := M.alloc (Value.Bool false) in
    let* α0 := M.alloc (Value.Tuple []) in
    let* α0 :=
      M.match_operator
        α0
        [
          fun γ =>
            let γ := emoticon in
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
            let* i := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Matched ") in
                    let* α3 := M.read (mk_str "!
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    M.pure (M.pointer_coercion α4) in
                let* α9 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "i32" ] in
                    let* α7 := M.call_closure α6 [ i ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    M.pure (M.pointer_coercion α8) in
                let* α10 := M.call_closure α1 [ α5; α9 ] in
                let* α11 := M.call_closure α0 [ α10 ] in
                M.alloc α11 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let γ := M.use i_like_letters in
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                      let* α4 :=
                        (* Unsize *)
                          let* α2 :=
                            M.read (mk_str "Didn't match a number. Let's go with a letter!
") in
                          let* α3 := M.alloc (Value.Array [ α2 ]) in
                          M.pure (M.pointer_coercion α3) in
                      let* α5 := M.call_closure α1 [ α4 ] in
                      let* α6 := M.call_closure α0 [ α5 ] in
                      M.alloc α6 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                      let* α4 :=
                        (* Unsize *)
                          let* α2 :=
                            M.read
                              (mk_str "I don't like letters. Let's go with an emoticon :)!
") in
                          let* α3 := M.alloc (Value.Array [ α2 ]) in
                          M.pure (M.pointer_coercion α3) in
                      let* α5 := M.call_closure α1 [ α4 ] in
                      let* α6 := M.call_closure α0 [ α5 ] in
                      M.alloc α6 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple [])
              ]
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
