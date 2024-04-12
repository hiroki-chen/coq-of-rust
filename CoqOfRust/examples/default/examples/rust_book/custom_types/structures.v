(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields := [ ("name", Ty.path "alloc::string::String"); ("age", Ty.path "u8") ];
  } *)

Module Impl_core_fmt_Debug_for_structures_Person.
  Definition Self : Ty.t := Ty.path "structures::Person".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_struct_field2_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Person" |);
            M.read (| Value.String "name" |);
            (* Unsize *)
            M.pointer_coercion
              (M.get_struct_record_field (M.read (| self |)) "structures::Person" "name");
            M.read (| Value.String "age" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.get_struct_record_field (M.read (| self |)) "structures::Person" "age"
              |))
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_structures_Person.

(* StructTuple
  {
    name := "Unit";
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "Pair";
    ty_params := [];
    fields := [ Ty.path "i32"; Ty.path "f32" ];
  } *)

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "f32"); ("y", Ty.path "f32") ];
  } *)

(* StructRecord
  {
    name := "Rectangle";
    ty_params := [];
    fields :=
      [ ("top_left", Ty.path "structures::Point"); ("bottom_right", Ty.path "structures::Point") ];
  } *)

(*
fn main() {
    // Create struct with field init shorthand
    let name = String::from("Peter");
    let age = 27;
    let peter = Person { name, age };

    // Print debug struct
    println!("{:?}", peter);

    // Instantiate a `Point`
    let point: Point = Point { x: 10.3, y: 0.4 };

    // Access the fields of the point
    println!("point coordinates: ({}, {})", point.x, point.y);

    // Make a new point by using struct update syntax to use the fields of our
    // other one
    let bottom_right = Point { x: 5.2, ..point };

    // `bottom_right.y` will be the same as `point.y` because we used that field
    // from `point`
    println!("second point: ({}, {})", bottom_right.x, bottom_right.y);

    // Destructure the point using a `let` binding
    let Point {
        x: left_edge,
        y: top_edge,
    } = point;

    let _rectangle = Rectangle {
        // struct instantiation is an expression too
        top_left: Point {
            x: left_edge,
            y: top_edge,
        },
        bottom_right: bottom_right,
    };

    // Instantiate a unit struct
    let _unit = Unit;

    // Instantiate a tuple struct
    let pair = Pair(1, 0.1);

    // Access the fields of a tuple struct
    println!("pair contains {:?} and {:?}", pair.0, pair.1);

    // Destructure a tuple struct
    let Pair(integer, decimal) = pair;

    println!("pair contains {:?} and {:?}", integer, decimal);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let name :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::From",
                Ty.path "alloc::string::String",
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "from",
                []
              |),
              [ M.read (| Value.String "Peter" |) ]
            |)
          |) in
        let age := M.alloc (| Value.Integer Integer.U8 27 |) in
        let peter :=
          M.alloc (|
            Value.StructRecord
              "structures::Person"
              [ ("name", M.read (| name |)); ("age", M.read (| age |)) ]
          |) in
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
                                  [ Ty.path "structures::Person" ]
                                |),
                                [ peter ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let point :=
          M.alloc (|
            Value.StructRecord
              "structures::Point"
              [ ("x", M.read (| UnsupportedLiteral |)); ("y", M.read (| UnsupportedLiteral |)) ]
          |) in
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
                              M.read (| Value.String "point coordinates: (" |);
                              M.read (| Value.String ", " |);
                              M.read (| Value.String ")
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
                                  [ Ty.path "f32" ]
                                |),
                                [ M.get_struct_record_field point "structures::Point" "x" ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "f32" ]
                                |),
                                [ M.get_struct_record_field point "structures::Point" "y" ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let bottom_right :=
          M.alloc (|
            M.struct_record_update (M.read (| point |)) [ ("x", M.read (| UnsupportedLiteral |)) ]
          |) in
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
                              M.read (| Value.String "second point: (" |);
                              M.read (| Value.String ", " |);
                              M.read (| Value.String ")
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
                                  [ Ty.path "f32" ]
                                |),
                                [ M.get_struct_record_field bottom_right "structures::Point" "x" ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "f32" ]
                                |),
                                [ M.get_struct_record_field bottom_right "structures::Point" "y" ]
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
          point,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.get_struct_record_field_or_break_match (| γ, "structures::Point", "x" |) in
                let γ0_1 :=
                  M.get_struct_record_field_or_break_match (| γ, "structures::Point", "y" |) in
                let left_edge := M.copy (| γ0_0 |) in
                let top_edge := M.copy (| γ0_1 |) in
                let _rectangle :=
                  M.alloc (|
                    Value.StructRecord
                      "structures::Rectangle"
                      [
                        ("top_left",
                          Value.StructRecord
                            "structures::Point"
                            [ ("x", M.read (| left_edge |)); ("y", M.read (| top_edge |)) ]);
                        ("bottom_right", M.read (| bottom_right |))
                      ]
                  |) in
                let _unit := M.alloc (| Value.StructTuple "structures::Unit" [] |) in
                let pair_ :=
                  M.alloc (|
                    Value.StructTuple
                      "structures::Pair"
                      [ Value.Integer Integer.I32 1; M.read (| UnsupportedLiteral |) ]
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
                                      M.read (| Value.String "pair contains " |);
                                      M.read (| Value.String " and " |);
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
                                        [ M.get_struct_tuple_field pair_ "structures::Pair" 0 ]
                                      |);
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_debug",
                                          [ Ty.path "f32" ]
                                        |),
                                        [ M.get_struct_tuple_field pair_ "structures::Pair" 1 ]
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
                  pair_,
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.get_struct_tuple_field_or_break_match (| γ, "structures::Pair", 0 |) in
                        let γ0_1 :=
                          M.get_struct_tuple_field_or_break_match (| γ, "structures::Pair", 1 |) in
                        let integer := M.copy (| γ0_0 |) in
                        let decimal := M.copy (| γ0_1 |) in
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
                                              M.read (| Value.String "pair contains " |);
                                              M.read (| Value.String " and " |);
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
                                                [ integer ]
                                              |);
                                              M.call_closure (|
                                                M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_debug",
                                                  [ Ty.path "f32" ]
                                                |),
                                                [ decimal ]
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
