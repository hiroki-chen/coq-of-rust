(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // In general, the `{}` will be automatically replaced with any
    // arguments. These will be stringified.
    println!("{} days", 31);

    // Positional arguments can be used. Specifying an integer inside `{}`
    // determines which additional argument will be replaced. Arguments start
    // at 0 immediately after the format string
    println!("{0}, this is {1}. {1}, this is {0}", "Alice", "Bob");

    // As can named arguments.
    println!(
        "{subject} {verb} {object}",
        object = "the lazy dog",
        subject = "the quick brown fox",
        verb = "jumps over"
    );

    // Different formatting can be invoked by specifying the format character after a
    // `:`.
    println!("Base 10:               {}", 69420); //69420
    println!("Base 2 (binary):       {:b}", 69420); //10000111100101100
    println!("Base 8 (octal):        {:o}", 69420); //207454
    println!("Base 16 (hexadecimal): {:x}", 69420); //10f2c
    println!("Base 16 (hexadecimal): {:X}", 69420); //10F2C

    // You can right-justify text with a specified width. This will
    // output "    1". (Four white spaces and a "1", for a total width of 5.)
    println!("{number:>5}", number = 1);

    // You can pad numbers with extra zeroes,
    //and left-adjust by flipping the sign. This will output "10000".
    println!("{number:0<5}", number = 1);

    // You can use named arguments in the format specifier by appending a `$`
    println!("{number:0>width$}", number = 1, width = 5);

    // Rust even checks to make sure the correct number of arguments are
    // used.
    println!("My name is {0}, {1} {0}", "Bond", "James");
    // FIXME ^ Add the missing argument: "James"

    // Only types that implement fmt::Display can be formatted with `{}`. User-
    // defined types do not implement fmt::Display by default

    #[allow(dead_code)]
    struct Structure(i32);

    // This will not compile because `Structure` does not implement
    // fmt::Display
    //println!("This struct `{}` won't print...", Structure(3));
    // TODO ^ Try uncommenting this line

    // For Rust 1.58 and above, you can directly capture the argument from a
    // surrounding variable. Just like the above, this will output
    // "    1". 4 white spaces and a "1".
    let number: f64 = 1.0;
    let width: usize = 5;
    println!("{number:>width$}");
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
                        (M.alloc (| Value.Array [ M.read (| Value.String "31 days
" |) ] |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::rt::Argument",
                              "none",
                              []
                            |),
                            []
                          |)
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
                            [ M.read (| Value.String "Alice, this is Bob. Bob, this is Alice
" |) ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::rt::Argument",
                              "none",
                              []
                            |),
                            []
                          |)
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
                            [
                              M.read (|
                                Value.String "the quick brown fox jumps over the lazy dog
"
                              |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::rt::Argument",
                              "none",
                              []
                            |),
                            []
                          |)
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
                          Value.Array [ M.read (| Value.String "Base 10:               69420
" |) ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::rt::Argument",
                              "none",
                              []
                            |),
                            []
                          |)
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
                            [
                              M.read (| Value.String "Base 2 (binary):       " |);
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
                                  "new_binary",
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 69420 |) ]
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
                            [
                              M.read (| Value.String "Base 8 (octal):        " |);
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
                                  "new_octal",
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 69420 |) ]
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
                            [
                              M.read (| Value.String "Base 16 (hexadecimal): " |);
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
                                [ M.alloc (| Value.Integer 69420 |) ]
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
                            [
                              M.read (| Value.String "Base 16 (hexadecimal): " |);
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
                                  "new_upper_hex",
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 69420 |) ]
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
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 1 |) ]
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
                                  Value.Integer 0;
                                  Value.UnicodeChar 32;
                                  Value.StructTuple "core::fmt::rt::Alignment::Right" [];
                                  Value.Integer 0;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple "core::fmt::rt::Count::Is" [ Value.Integer 5 ]
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
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 1 |) ]
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
                                  Value.Integer 0;
                                  Value.UnicodeChar 48;
                                  Value.StructTuple "core::fmt::rt::Alignment::Left" [];
                                  Value.Integer 0;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple "core::fmt::rt::Count::Is" [ Value.Integer 5 ]
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
                                  [ Ty.path "i32" ]
                                |),
                                [ M.alloc (| Value.Integer 1 |) ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "from_usize",
                                  []
                                |),
                                [ M.alloc (| Value.Integer 5 |) ]
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
                                  Value.Integer 0;
                                  Value.UnicodeChar 48;
                                  Value.StructTuple "core::fmt::rt::Alignment::Right" [];
                                  Value.Integer 0;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple
                                    "core::fmt::rt::Count::Param"
                                    [ Value.Integer 1 ]
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
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "My name is Bond, James Bond
" |) ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::rt::Argument",
                              "none",
                              []
                            |),
                            []
                          |)
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let number := M.copy (| UnsupportedLiteral |) in
        let width := M.alloc (| Value.Integer 5 |) in
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
                                  [ Ty.path "f64" ]
                                |),
                                [ number ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "from_usize",
                                  []
                                |),
                                [ width ]
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
                                  Value.Integer 0;
                                  Value.UnicodeChar 32;
                                  Value.StructTuple "core::fmt::rt::Alignment::Right" [];
                                  Value.Integer 0;
                                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                                  Value.StructTuple
                                    "core::fmt::rt::Count::Param"
                                    [ Value.Integer 1 ]
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

Module main.
  (* StructTuple
    {
      name := "Structure";
      ty_params := [];
      fields := [ Ty.path "i32" ];
    } *)
End main.
