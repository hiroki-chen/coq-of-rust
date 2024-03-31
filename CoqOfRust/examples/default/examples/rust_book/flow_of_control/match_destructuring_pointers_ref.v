(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Assign a reference of type `i32`. The `&` signifies there
    // is a reference being assigned.
    let reference = &4;

    match reference {
        // If `reference` is pattern matched against `&val`, it results
        // in a comparison like:
        // `&i32`
        // `&val`
        // ^ We see that if the matching `&`s are dropped, then the `i32`
        // should be assigned to `val`.
        &val => println!("Got a value via destructuring: {:?}", val),
    }

    // To avoid the `&`, you dereference before matching.
    match *reference {
        val => println!("Got a value via dereferencing: {:?}", val),
    }

    // What if you don't start with a reference? `reference` was a `&`
    // because the right side was already a reference. This is not
    // a reference because the right side is not one.
    let _not_a_reference = 3;

    // Rust provides `ref` for exactly this purpose. It modifies the
    // assignment so that a reference is created for the element; this
    // reference is assigned.
    let ref _is_a_reference = 3;

    // Accordingly, by defining 2 values without references, references
    // can be retrieved via `ref` and `ref mut`.
    let value = 5;
    let mut mut_value = 6;

    // Use `ref` keyword to create a reference.
    match value {
        ref r => println!("Got a reference to a value: {:?}", r),
    }

    // Use `ref mut` similarly.
    match mut_value {
        ref mut m => {
            // Got a reference. Gotta dereference it before we can
            // add anything to it.
            *m += 10;
            println!("We added 10. `mut_value`: {:?}", m);
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* reference := let* α0 := M.alloc (Value.Integer Integer.I32 4) in M.alloc α0 in
    let* _ :=
      M.match_operator
        reference
        [
          fun γ =>
            let* γ := M.read γ in
            let* val := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Got a value via destructuring: ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug"
                      [ Ty.path "i32" ] in
                  let* α7 := M.call_closure α6 [ val ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    let* _ :=
      let* α0 := M.read reference in
      M.match_operator
        α0
        [
          fun γ =>
            let* val := M.copy γ in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Got a value via dereferencing: ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug"
                      [ Ty.path "i32" ] in
                  let* α7 := M.call_closure α6 [ val ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    let* _not_a_reference := M.alloc (Value.Integer Integer.I32 3) in
    let* α0 := M.alloc (Value.Integer Integer.I32 3) in
    let* α0 :=
      M.match_operator
        α0
        [
          fun γ =>
            let* _is_a_reference := M.alloc γ in
            let* value := M.alloc (Value.Integer Integer.I32 5) in
            let* mut_value := M.alloc (Value.Integer Integer.I32 6) in
            let* _ :=
              M.match_operator
                value
                [
                  fun γ =>
                    let* r := M.alloc γ in
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "Got a reference to a value: ") in
                          let* α3 := M.read (mk_str "
") in
                          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                          M.pure (M.pointer_coercion α4) in
                      let* α9 :=
                        (* Unsize *)
                          let* α6 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::rt::Argument")
                              "new_debug"
                              [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] in
                          let* α7 := M.call_closure α6 [ r ] in
                          let* α8 := M.alloc (Value.Array [ α7 ]) in
                          M.pure (M.pointer_coercion α8) in
                      let* α10 := M.call_closure α1 [ α5; α9 ] in
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    M.alloc (Value.Tuple [])
                ] in
            M.match_operator
              mut_value
              [
                fun γ =>
                  let* m := M.alloc γ in
                  let* _ :=
                    let* β := M.read m in
                    let* α0 := M.read β in
                    let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 10) in M.assign β α1 in
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "We added 10. `mut_value`: ") in
                          let* α3 := M.read (mk_str "
") in
                          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                          M.pure (M.pointer_coercion α4) in
                      let* α9 :=
                        (* Unsize *)
                          let* α6 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::rt::Argument")
                              "new_debug"
                              [ Ty.apply (Ty.path "&mut") [ Ty.path "i32" ] ] in
                          let* α7 := M.call_closure α6 [ m ] in
                          let* α8 := M.alloc (Value.Array [ α7 ]) in
                          M.pure (M.pointer_coercion α8) in
                      let* α10 := M.call_closure α1 [ α5; α9 ] in
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple [])
              ]
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
