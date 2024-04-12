(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Number
{
  ty_params := [];
  variants :=
    [
      {
        name := "Zero";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "One";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Two";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

(*
Enum Color
{
  ty_params := [];
  variants :=
    [
      {
        name := "Red";
        item := StructTuple [];
        discriminant := Some 16711680;
      };
      {
        name := "Green";
        item := StructTuple [];
        discriminant := Some 65280;
      };
      {
        name := "Blue";
        item := StructTuple [];
        discriminant := Some 255;
      }
    ];
}
*)

(*
fn main() {
    // `enums` can be cast as integers.
    println!("zero is {}", Number::Zero as i32);
    println!("one is {}", Number::One as i32);

    println!("roses are #{:06x}", Color::Red as i32);
    println!("violets are #{:06x}", Color::Blue as i32);
}
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
                            [ M.read (| Value.String "zero is " |); M.read (| Value.String "
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
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| M.rust_cast (Value.Integer Integer.Isize 0) |) ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
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
                            [ M.read (| Value.String "one is " |); M.read (| Value.String "
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
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| M.rust_cast (Value.Integer Integer.Isize 1) |) ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::Arguments",
                      "new_v1_formatted",
                      []
                    |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| Value.String "roses are #" |); M.read (| Value.String "
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
                                  "new_lower_hex",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.rust_cast
                                      (BinOp.Panic.add (|
                                        M.get_constant (|
                                          "enums_c_like::Color::Red_discriminant"
                                        |),
                                        Value.Integer Integer.Isize 0
                                      |))
                                  |)
                                ]
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
                                  Ty.path "core::fmt::rt::Placeholder",
                                  "new",
                                  []
                                |),
                                [
                                  Value.Integer Integer.Usize 0;
                                  Value.UnicodeChar 32;
                                  Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
                                  Value.Integer Integer.U32 8;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple
                                    "core::fmt::rt::Count::Is"
                                    [ Value.Integer Integer.Usize 6 ]
                                ]
                              |)
                            ]
                        |));
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::rt::UnsafeArg",
                          "new",
                          []
                        |),
                        []
                      |)
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::Arguments",
                      "new_v1_formatted",
                      []
                    |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "violets are #" |);
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
                                  "new_lower_hex",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.rust_cast
                                      (BinOp.Panic.add (|
                                        M.get_constant (|
                                          "enums_c_like::Color::Blue_discriminant"
                                        |),
                                        Value.Integer Integer.Isize 0
                                      |))
                                  |)
                                ]
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
                                  Ty.path "core::fmt::rt::Placeholder",
                                  "new",
                                  []
                                |),
                                [
                                  Value.Integer Integer.Usize 0;
                                  Value.UnicodeChar 32;
                                  Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
                                  Value.Integer Integer.U32 8;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple
                                    "core::fmt::rt::Count::Is"
                                    [ Value.Integer Integer.Usize 6 ]
                                ]
                              |)
                            ]
                        |));
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::rt::UnsafeArg",
                          "new",
                          []
                        |),
                        []
                      |)
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
