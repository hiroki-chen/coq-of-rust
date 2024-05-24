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
    ltac:(M.monadic
      (M.read (|
        let reference := M.alloc (| M.alloc (| Value.Integer 4 |) |) in
        let _ :=
          M.match_operator (|
            reference,
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.read (| γ |) in
                  let val := M.copy (| γ |) in
                  let _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_v1",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.read (| Value.String "Got a value via destructuring: " |);
                                      M.read (| Value.String "
" |)
                                    ]
                                |));
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_debug",
                                          [ Ty.path "i32" ]
                                        |),
                                        [ val ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.read (| reference |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let val := M.copy (| γ |) in
                  let _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_v1",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.read (| Value.String "Got a value via dereferencing: " |);
                                      M.read (| Value.String "
" |)
                                    ]
                                |));
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_debug",
                                          [ Ty.path "i32" ]
                                        |),
                                        [ val ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _not_a_reference := M.alloc (| Value.Integer 3 |) in
        M.match_operator (|
          M.alloc (| Value.Integer 3 |),
          [
            fun γ =>
              ltac:(M.monadic
                (let _is_a_reference := M.alloc (| γ |) in
                let value := M.alloc (| Value.Integer 5 |) in
                let mut_value := M.alloc (| Value.Integer 6 |) in
                let _ :=
                  M.match_operator (|
                    value,
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let r := M.alloc (| γ |) in
                          let _ :=
                            M.alloc (|
                              M.call_closure (|
                                M.get_function (| "std::io::stdio::_print", [] |),
                                [
                                  M.call_closure (|
                                    M.get_associated_function (|
                                      Ty.path "core::fmt::Arguments",
                                      "new_v1",
                                      []
                                    |),
                                    [
                                      (* Unsize *)
                                      M.pointer_coercion
                                        (M.alloc (|
                                          Value.Array
                                            [
                                              M.read (|
                                                Value.String "Got a reference to a value: "
                                              |);
                                              M.read (| Value.String "
" |)
                                            ]
                                        |));
                                      (* Unsize *)
                                      M.pointer_coercion
                                        (M.alloc (|
                                          Value.Array
                                            [
                                              M.call_closure (|
                                                M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_debug",
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                                                |),
                                                [ r ]
                                              |)
                                            ]
                                        |))
                                    ]
                                  |)
                                ]
                              |)
                            |) in
                          M.alloc (| Value.Tuple [] |)))
                    ]
                  |) in
                M.match_operator (|
                  mut_value,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let m := M.alloc (| γ |) in
                        let _ :=
                          let β := M.read (| m |) in
                          M.write (|
                            β,
                            BinOp.Panic.add (| Integer.I32, M.read (| β |), Value.Integer 10 |)
                          |) in
                        let _ :=
                          let _ :=
                            M.alloc (|
                              M.call_closure (|
                                M.get_function (| "std::io::stdio::_print", [] |),
                                [
                                  M.call_closure (|
                                    M.get_associated_function (|
                                      Ty.path "core::fmt::Arguments",
                                      "new_v1",
                                      []
                                    |),
                                    [
                                      (* Unsize *)
                                      M.pointer_coercion
                                        (M.alloc (|
                                          Value.Array
                                            [
                                              M.read (|
                                                Value.String "We added 10. `mut_value`: "
                                              |);
                                              M.read (| Value.String "
" |)
                                            ]
                                        |));
                                      (* Unsize *)
                                      M.pointer_coercion
                                        (M.alloc (|
                                          Value.Array
                                            [
                                              M.call_closure (|
                                                M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_debug",
                                                  [ Ty.apply (Ty.path "&mut") [ Ty.path "i32" ] ]
                                                |),
                                                [ m ]
                                              |)
                                            ]
                                        |))
                                    ]
                                  |)
                                ]
                              |)
                            |) in
                          M.alloc (| Value.Tuple [] |) in
                        M.alloc (| Value.Tuple [] |)))
                  ]
                |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "match_destructuring_pointers_ref::main" main.
