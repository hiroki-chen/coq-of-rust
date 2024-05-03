(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Color
{
  ty_params := [];
  variants :=
    [
      {
        name := "Red";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Blue";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Green";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "RGB";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSV";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "HSL";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMY";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "CMYK";
        item := StructTuple [ Ty.path "u32"; Ty.path "u32"; Ty.path "u32"; Ty.path "u32" ];
        discriminant := None;
      }
    ];
}
*)

(*
fn main() {
    let color = Color::RGB(122, 17, 40);
    // TODO ^ Try different variants for `color`

    println!("What color is it?");
    // An `enum` can be destructured using a `match`.
    match color {
        Color::Red => println!("The color is Red!"),
        Color::Blue => println!("The color is Blue!"),
        Color::Green => println!("The color is Green!"),
        Color::RGB(r, g, b) => println!("Red: {}, green: {}, and blue: {}!", r, g, b),
        Color::HSV(h, s, v) => println!("Hue: {}, saturation: {}, value: {}!", h, s, v),
        Color::HSL(h, s, l) => println!("Hue: {}, saturation: {}, lightness: {}!", h, s, l),
        Color::CMY(c, m, y) => println!("Cyan: {}, magenta: {}, yellow: {}!", c, m, y),
        Color::CMYK(c, m, y, k) => println!(
            "Cyan: {}, magenta: {}, yellow: {}, key (black): {}!",
            c, m, y, k
        ),
        // Don't need another arm because all variants have been examined
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let color :=
          M.alloc (|
            Value.StructTuple
              "match_destructuring_enums::Color::RGB"
              [
                Value.Integer Integer.U32 122;
                Value.Integer Integer.U32 17;
                Value.Integer Integer.U32 40
              ]
          |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "What color is it?
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.match_operator (|
          color,
          [
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
                                Value.Array [ M.read (| Value.String "The color is Red!
" |) ]
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
                                Value.Array [ M.read (| Value.String "The color is Blue!
" |) ]
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
                                Value.Array [ M.read (| Value.String "The color is Green!
" |) ]
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
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::RGB",
                    0
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::RGB",
                    1
                  |) in
                let γ0_2 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::RGB",
                    2
                  |) in
                let r := M.copy (| γ0_0 |) in
                let g := M.copy (| γ0_1 |) in
                let b := M.copy (| γ0_2 |) in
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
                                    M.read (| Value.String "Red: " |);
                                    M.read (| Value.String ", green: " |);
                                    M.read (| Value.String ", and blue: " |);
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
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ r ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ g ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ b ]
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
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSV",
                    0
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSV",
                    1
                  |) in
                let γ0_2 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSV",
                    2
                  |) in
                let h := M.copy (| γ0_0 |) in
                let s := M.copy (| γ0_1 |) in
                let v := M.copy (| γ0_2 |) in
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
                                    M.read (| Value.String "Hue: " |);
                                    M.read (| Value.String ", saturation: " |);
                                    M.read (| Value.String ", value: " |);
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
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ h ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ s ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ v ]
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
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSL",
                    0
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSL",
                    1
                  |) in
                let γ0_2 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::HSL",
                    2
                  |) in
                let h := M.copy (| γ0_0 |) in
                let s := M.copy (| γ0_1 |) in
                let l := M.copy (| γ0_2 |) in
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
                                    M.read (| Value.String "Hue: " |);
                                    M.read (| Value.String ", saturation: " |);
                                    M.read (| Value.String ", lightness: " |);
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
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ h ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ s ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ l ]
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
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMY",
                    0
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMY",
                    1
                  |) in
                let γ0_2 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMY",
                    2
                  |) in
                let c := M.copy (| γ0_0 |) in
                let m := M.copy (| γ0_1 |) in
                let y := M.copy (| γ0_2 |) in
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
                                    M.read (| Value.String "Cyan: " |);
                                    M.read (| Value.String ", magenta: " |);
                                    M.read (| Value.String ", yellow: " |);
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
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ c ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ m ]
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
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMYK",
                    0
                  |) in
                let γ0_1 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMYK",
                    1
                  |) in
                let γ0_2 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMYK",
                    2
                  |) in
                let γ0_3 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "match_destructuring_enums::Color::CMYK",
                    3
                  |) in
                let c := M.copy (| γ0_0 |) in
                let m := M.copy (| γ0_1 |) in
                let y := M.copy (| γ0_2 |) in
                let k := M.copy (| γ0_3 |) in
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
                                    M.read (| Value.String "Cyan: " |);
                                    M.read (| Value.String ", magenta: " |);
                                    M.read (| Value.String ", yellow: " |);
                                    M.read (| Value.String ", key (black): " |);
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
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ c ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ m ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ y ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "u32" ]
                                      |),
                                      [ k ]
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
