(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Try changing the values in the array, or make it a slice!
    let array = [1, -2, 6];

    match array {
        // Binds the second and the third elements to the respective variables
        [0, second, third] => println!("array[0] = 0, array[1] = {}, array[2] = {}", second, third),

        // Single values can be ignored with _
        [1, _, third] => println!(
            "array[0] = 1, array[2] = {} and array[1] was ignored",
            third
        ),

        // You can also bind some and ignore the rest
        [-1, second, ..] => println!(
            "array[0] = -1, array[1] = {} and all the other ones were ignored",
            second
        ),
        // The code below would not compile
        // [-1, second] => ...

        // Or store them in another array/slice (the type depends on
        // that of the value that is being matched against)
        [3, second, tail @ ..] => println!(
            "array[0] = 3, array[1] = {} and the other elements were {:?}",
            second, tail
        ),

        // Combining these patterns, we can, for example, bind the first and
        // last values, and store the rest of them in a single array
        [first, middle @ .., last] => println!(
            "array[0] = {}, middle = {:?}, array[2] = {}",
            first, middle, last
        ),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ array :=
          M.alloc (| Value.Array [ Value.Integer 1; Value.Integer (-2); Value.Integer 6 ] |) in
        M.match_operator (|
          array,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_slice_index (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_slice_index (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_slice_index (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 0 |) in
                let second := M.copy (| γ0_1 |) in
                let third := M.copy (| γ0_2 |) in
                let~ _ :=
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
                                    M.read (| Value.String "array[0] = 0, array[1] = " |);
                                    M.read (| Value.String ", array[2] = " |);
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
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ second ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ third ]
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
                (let γ0_0 := M.SubPointer.get_slice_index (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_slice_index (| γ, 1 |) in
                let γ0_2 := M.SubPointer.get_slice_index (| γ, 2 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 1 |) in
                let third := M.copy (| γ0_2 |) in
                let~ _ :=
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
                                    M.read (| Value.String "array[0] = 1, array[2] = " |);
                                    M.read (| Value.String " and array[1] was ignored
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
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ third ]
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
                (let γ0_0 := M.SubPointer.get_slice_index (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_slice_index (| γ, 1 |) in
                let γ0_rest := M.SubPointer.get_slice_rest (| γ, 2, 0 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer (-1) |) in
                let second := M.copy (| γ0_1 |) in
                let~ _ :=
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
                                    M.read (| Value.String "array[0] = -1, array[1] = " |);
                                    M.read (|
                                      Value.String " and all the other ones were ignored
"
                                    |)
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
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ second ]
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
                (let γ0_0 := M.SubPointer.get_slice_index (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_slice_index (| γ, 1 |) in
                let γ0_rest := M.SubPointer.get_slice_rest (| γ, 2, 0 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 3 |) in
                let second := M.copy (| γ0_1 |) in
                let tail := M.copy (| γ0_rest |) in
                let~ _ :=
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
                                    M.read (| Value.String "array[0] = 3, array[1] = " |);
                                    M.read (| Value.String " and the other elements were " |);
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
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ second ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_debug",
                                        [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ]
                                      |),
                                      [ tail ]
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
                (let γ0_0 := M.SubPointer.get_slice_index (| γ, 0 |) in
                let γ0_rest := M.SubPointer.get_slice_rest (| γ, 1, 1 |) in
                let γ0_rev0 := M.SubPointer.get_slice_rev_index (| γ, 0 |) in
                let first := M.copy (| γ0_0 |) in
                let middle := M.copy (| γ0_rest |) in
                let last := M.copy (| γ0_rev0 |) in
                let~ _ :=
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
                                    M.read (| Value.String "array[0] = " |);
                                    M.read (| Value.String ", middle = " |);
                                    M.read (| Value.String ", array[2] = " |);
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
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ first ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_debug",
                                        [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ]
                                      |),
                                      [ middle ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ last ]
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
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "match_destructuring_arrays_slices::main" main.
