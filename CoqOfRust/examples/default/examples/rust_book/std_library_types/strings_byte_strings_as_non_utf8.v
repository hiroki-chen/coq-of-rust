(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Note that this is not actually a `&str`
    let bytestring: &[u8; 21] = b"this is a byte string";

    // Byte arrays don't have the `Display` trait, so printing them is a bit limited
    println!("A byte string: {:?}", bytestring);

    // Byte strings can have byte escapes...
    let escaped = b"\x52\x75\x73\x74 as bytes";
    // ...but no unicode escapes
    // let escaped = b"\u{211D} is not allowed";
    println!("Some escaped bytes: {:?}", escaped);

    // Raw byte strings work just like raw strings
    let raw_bytestring = br"\u{211D} is not escaped here";
    println!("{:?}", raw_bytestring);

    // Converting a byte array to `str` can fail
    if let Ok(my_str) = str::from_utf8(raw_bytestring) {
        println!("And the same as text: '{}'", my_str);
    }

    let _quotes = br#"You can also use "fancier" formatting, \
                    like with normal raw strings"#;

    // Byte strings don't have to be UTF-8
    let shift_jis = b"\x82\xe6\x82\xa8\x82\xb1\x82\xbb"; // "ようこそ" in SHIFT-JIS

    // But then they can't always be converted to `str`
    match str::from_utf8(shift_jis) {
        Ok(my_str) => println!("Conversion successful: '{}'", my_str),
        Err(e) => println!("Conversion failed: {:?}", e),
    };
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let bytestring := M.alloc (| M.read (| UnsupportedLiteral |) |) in
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
                              M.read (| Value.String "A byte string: " |);
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
                                  [
                                    Ty.apply
                                      (Ty.path "&")
                                      [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
                                  ]
                                |),
                                [ bytestring ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let escaped := M.copy (| UnsupportedLiteral |) in
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
                              M.read (| Value.String "Some escaped bytes: " |);
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
                                  [
                                    Ty.apply
                                      (Ty.path "&")
                                      [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
                                  ]
                                |),
                                [ escaped ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let raw_bytestring := M.copy (| UnsupportedLiteral |) in
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
                                  "new_debug",
                                  [
                                    Ty.apply
                                      (Ty.path "&")
                                      [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
                                  ]
                                |),
                                [ raw_bytestring ]
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
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "core::str::converts::from_utf8", [] |),
                        [ (* Unsize *) M.pointer_coercion (M.read (| raw_bytestring |)) ]
                      |)
                    |) in
                  let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                  let my_str := M.copy (| γ0_0 |) in
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
                                        M.read (| Value.String "And the same as text: '" |);
                                        M.read (| Value.String "'
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
                                            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                          |),
                                          [ my_str ]
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
        let _quotes := M.copy (| UnsupportedLiteral |) in
        let shift_jis := M.copy (| UnsupportedLiteral |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::str::converts::from_utf8", [] |),
                [ (* Unsize *) M.pointer_coercion (M.read (| shift_jis |)) ]
              |)
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                  let my_str := M.copy (| γ0_0 |) in
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
                                      M.read (| Value.String "Conversion successful: '" |);
                                      M.read (| Value.String "'
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
                                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                        |),
                                        [ my_str ]
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
                    M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                  let e := M.copy (| γ0_0 |) in
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
                                      M.read (| Value.String "Conversion failed: " |);
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
                                          [ Ty.path "core::str::error::Utf8Error" ]
                                        |),
                                        [ e ]
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
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
