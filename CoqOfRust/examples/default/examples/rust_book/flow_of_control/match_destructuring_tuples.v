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
        (1, ..) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, .., 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
        // `..` can be used to ignore the rest of the tuple
        _ => println!("It doesn't matter what they are"),
        // `_` means don't bind the value to a variable
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let triple :=
          M.alloc (| Value.Tuple [ Value.Integer 0; Value.Integer (-2); Value.Integer 3 ] |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "Tell me about " |);
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
                                  [ Ty.tuple [ Ty.path "i32"; Ty.path "i32"; Ty.path "i32" ] ]
                                |),
                                [ triple ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.match_operator (|
          triple,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_tuple_field (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 0 |) in
                let y := M.copy (| γ0_1 |) in
                let z := M.copy (| γ0_2 |) in
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
                                    M.read (| Value.String "First is `0`, `y` is " |);
                                    M.read (| Value.String ", and `z` is " |);
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
                                      [ y ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_debug",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ z ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_tuple_field (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 1 |) in
                let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (|
                                      Value.String "First is `1` and the rest doesn't matter
"
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_tuple_field (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_2 |), Value.Integer 2 |) in
                let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (|
                                      Value.String "last is `2` and the rest doesn't matter
"
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_tuple_field (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 3 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_2 |), Value.Integer 4 |) in
                let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (|
                                      Value.String
                                        "First is `3`, last is `4`, and the rest doesn't matter
"
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [ M.read (| Value.String "It doesn't matter what they are
" |) ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "match_destructuring_tuples::main" main.
