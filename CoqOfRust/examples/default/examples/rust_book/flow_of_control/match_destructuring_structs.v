(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [];
    fields := [ ("x", Ty.tuple [ Ty.path "u32"; Ty.path "u32" ]); ("y", Ty.path "u32") ];
  } *)

(*
fn main() {
    // Try changing the values in the struct to see what happens
    let foo = Foo { x: (1, 2), y: 3 };

    match foo {
        Foo { x: (1, b), y } => println!("First of x is 1, b = {},  y = {} ", b, y),

        // you can destructure structs and rename the variables,
        // the order is not important
        Foo { y: 2, x: i } => println!("y is 2, i = {:?}", i),

        // and you can also ignore some variables:
        Foo { y, .. } => println!("y = {}, we don't care about x", y),
        // this will give an error: pattern does not mention field `x`
        //Foo { y } => println!("y = {}", y),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ foo :=
          M.alloc (|
            Value.StructRecord
              "match_destructuring_structs::Foo"
              [ ("x", Value.Tuple [ Value.Integer 1; Value.Integer 2 ]); ("y", Value.Integer 3) ]
          |) in
        M.match_operator (|
          foo,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_record_field (|
                    γ,
                    "match_destructuring_structs::Foo",
                    "x"
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_record_field (|
                    γ,
                    "match_destructuring_structs::Foo",
                    "y"
                  |) in
                let γ1_0 := M.SubPointer.get_tuple_field (| γ0_0, 0 |) in
                let γ1_1 := M.SubPointer.get_tuple_field (| γ0_0, 1 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ1_0 |), Value.Integer 1 |) in
                let b := M.copy (| γ1_1 |) in
                let y := M.copy (| γ0_1 |) in
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
                                    M.read (| Value.String "First of x is 1, b = " |);
                                    M.read (| Value.String ",  y = " |);
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
                                        [ Ty.path "u32" ]
                                      |),
                                      [ b ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ y ]
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
                (let γ0_0 :=
                  M.SubPointer.get_struct_record_field (|
                    γ,
                    "match_destructuring_structs::Foo",
                    "y"
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_record_field (|
                    γ,
                    "match_destructuring_structs::Foo",
                    "x"
                  |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 2 |) in
                let i := M.copy (| γ0_1 |) in
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
                                    M.read (| Value.String "y is 2, i = " |);
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
                                        [ Ty.tuple [ Ty.path "u32"; Ty.path "u32" ] ]
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
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_record_field (|
                    γ,
                    "match_destructuring_structs::Foo",
                    "y"
                  |) in
                let y := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "y = " |);
                                    M.read (| Value.String ", we don't care about x
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
                                        [ Ty.path "u32" ]
                                      |),
                                      [ y ]
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

Axiom Function_main : M.IsFunction "match_destructuring_structs::main" main.
