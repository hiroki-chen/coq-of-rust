(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition message : Value.t := M.run ltac:(M.monadic (Value.String "Hello, World!")).

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
    ltac:(M.monadic
      (M.read (|
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
                            [ M.read (| Value.String "" |); M.read (| Value.String "
" |) ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ M.get_constant (| "hello_world::message" |) ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let number :=
          M.alloc (|
            Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 7 ]
          |) in
        let letter := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let emoticon := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := number in
                  let γ0_0 := M.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                  let i := M.copy (| γ0_0 |) in
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
                                        M.read (| Value.String "Matched " |);
                                        M.read (| Value.String "!
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
                                          [ i ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := letter in
                  let γ0_0 := M.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                  let j := M.copy (| γ0_0 |) in
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
                                        M.read (| Value.String "Matched " |);
                                        M.read (| Value.String "!
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
                                          [ j ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)));
              fun γ =>
                ltac:(M.monadic
                  (let _ :=
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
                                            "Didn't match a number. Let's go with a letter!
"
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
          |) in
        let i_like_letters := M.alloc (| Value.Bool false |) in
        M.match_operator (|
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ := emoticon in
                let γ0_0 := M.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let i := M.copy (| γ0_0 |) in
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
                                      M.read (| Value.String "Matched " |);
                                      M.read (| Value.String "!
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
                                        [ i ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ := M.use i_like_letters in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let _ :=
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
                                                  "Didn't match a number. Let's go with a letter!
"
                                              |)
                                            ]
                                        |))
                                    ]
                                  |)
                                ]
                              |)
                            |) in
                          M.alloc (| Value.Tuple [] |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let _ :=
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
                                                  "I don't like letters. Let's go with an emoticon :)!
"
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
