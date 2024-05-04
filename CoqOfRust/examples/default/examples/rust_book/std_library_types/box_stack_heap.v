(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "f64"); ("y", Ty.path "f64") ];
  } *)

Module Impl_core_fmt_Debug_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
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
            M.read (| Value.String "Point" |);
            M.read (| Value.String "x" |);
            (* Unsize *)
            M.pointer_coercion
              (M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "box_stack_heap::Point",
                "x"
              |));
            M.read (| Value.String "y" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "box_stack_heap::Point",
                  "y"
                |)
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
End Impl_core_fmt_Debug_for_box_stack_heap_Point.

Module Impl_core_clone_Clone_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_box_stack_heap_Point.

Module Impl_core_marker_Copy_for_box_stack_heap_Point.
  Definition Self : Ty.t := Ty.path "box_stack_heap::Point".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_box_stack_heap_Point.

(* StructRecord
  {
    name := "Rectangle";
    ty_params := [];
    fields :=
      [
        ("top_left", Ty.path "box_stack_heap::Point");
        ("bottom_right", Ty.path "box_stack_heap::Point")
      ];
  } *)

(*
fn origin() -> Point {
    Point { x: 0.0, y: 0.0 }
}
*)
Definition origin (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (Value.StructRecord
        "box_stack_heap::Point"
        [ ("x", M.read (| UnsupportedLiteral |)); ("y", M.read (| UnsupportedLiteral |)) ]))
  | _, _ => M.impossible
  end.

(*
fn boxed_origin() -> Box<Point> {
    // Allocate this point on the heap, and return a pointer to it
    Box::new(Point { x: 0.0, y: 0.0 })
}
*)
Definition boxed_origin (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.call_closure (|
        M.get_associated_function (|
          Ty.apply
            (Ty.path "alloc::boxed::Box")
            [ Ty.path "box_stack_heap::Point"; Ty.path "alloc::alloc::Global" ],
          "new",
          []
        |),
        [
          Value.StructRecord
            "box_stack_heap::Point"
            [ ("x", M.read (| UnsupportedLiteral |)); ("y", M.read (| UnsupportedLiteral |)) ]
        ]
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    // (all the type annotations are superfluous)
    // Stack allocated variables
    let point: Point = origin();
    let rectangle: Rectangle = Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    };

    // Heap allocated rectangle
    let boxed_rectangle: Box<Rectangle> = Box::new(Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    });

    // The output of functions can be boxed
    let boxed_point: Box<Point> = Box::new(origin());

    // Double indirection
    let box_in_a_box: Box<Box<Point>> = Box::new(boxed_origin());

    println!(
        "Point occupies {} bytes on the stack",
        mem::size_of_val(&point)
    );
    println!(
        "Rectangle occupies {} bytes on the stack",
        mem::size_of_val(&rectangle)
    );

    // box size == pointer size
    println!(
        "Boxed point occupies {} bytes on the stack",
        mem::size_of_val(&boxed_point)
    );
    println!(
        "Boxed rectangle occupies {} bytes on the stack",
        mem::size_of_val(&boxed_rectangle)
    );
    println!(
        "Boxed box occupies {} bytes on the stack",
        mem::size_of_val(&box_in_a_box)
    );

    // Copy the data contained in `boxed_point` into `unboxed_point`
    let unboxed_point: Point = *boxed_point;
    println!(
        "Unboxed point occupies {} bytes on the stack",
        mem::size_of_val(&unboxed_point)
    );
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let point :=
          M.alloc (|
            M.call_closure (| M.get_function (| "box_stack_heap::origin", [] |), [] |)
          |) in
        let rectangle :=
          M.alloc (|
            Value.StructRecord
              "box_stack_heap::Rectangle"
              [
                ("top_left",
                  M.call_closure (| M.get_function (| "box_stack_heap::origin", [] |), [] |));
                ("bottom_right",
                  Value.StructRecord
                    "box_stack_heap::Point"
                    [ ("x", M.read (| UnsupportedLiteral |)); ("y", M.read (| UnsupportedLiteral |))
                    ])
              ]
          |) in
        let boxed_rectangle :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [ Ty.path "box_stack_heap::Rectangle"; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              [
                Value.StructRecord
                  "box_stack_heap::Rectangle"
                  [
                    ("top_left",
                      M.call_closure (| M.get_function (| "box_stack_heap::origin", [] |), [] |));
                    ("bottom_right",
                      Value.StructRecord
                        "box_stack_heap::Point"
                        [
                          ("x", M.read (| UnsupportedLiteral |));
                          ("y", M.read (| UnsupportedLiteral |))
                        ])
                  ]
              ]
            |)
          |) in
        let boxed_point :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [ Ty.path "box_stack_heap::Point"; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              [ M.call_closure (| M.get_function (| "box_stack_heap::origin", [] |), [] |) ]
            |)
          |) in
        let box_in_a_box :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [
                    Ty.apply
                      (Ty.path "alloc::boxed::Box")
                      [ Ty.path "box_stack_heap::Point"; Ty.path "alloc::alloc::Global" ];
                    Ty.path "alloc::alloc::Global"
                  ],
                "new",
                []
              |),
              [ M.call_closure (| M.get_function (| "box_stack_heap::boxed_origin", [] |), [] |) ]
            |)
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
                              M.read (| Value.String "Point occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [ Ty.path "box_stack_heap::Point" ]
                                      |),
                                      [ point ]
                                    |)
                                  |)
                                ]
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
                              M.read (| Value.String "Rectangle occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [ Ty.path "box_stack_heap::Rectangle" ]
                                      |),
                                      [ rectangle ]
                                    |)
                                  |)
                                ]
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
                              M.read (| Value.String "Boxed point occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [
                                          Ty.apply
                                            (Ty.path "alloc::boxed::Box")
                                            [
                                              Ty.path "box_stack_heap::Point";
                                              Ty.path "alloc::alloc::Global"
                                            ]
                                        ]
                                      |),
                                      [ boxed_point ]
                                    |)
                                  |)
                                ]
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
                              M.read (| Value.String "Boxed rectangle occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [
                                          Ty.apply
                                            (Ty.path "alloc::boxed::Box")
                                            [
                                              Ty.path "box_stack_heap::Rectangle";
                                              Ty.path "alloc::alloc::Global"
                                            ]
                                        ]
                                      |),
                                      [ boxed_rectangle ]
                                    |)
                                  |)
                                ]
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
                              M.read (| Value.String "Boxed box occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [
                                          Ty.apply
                                            (Ty.path "alloc::boxed::Box")
                                            [
                                              Ty.apply
                                                (Ty.path "alloc::boxed::Box")
                                                [
                                                  Ty.path "box_stack_heap::Point";
                                                  Ty.path "alloc::alloc::Global"
                                                ];
                                              Ty.path "alloc::alloc::Global"
                                            ]
                                        ]
                                      |),
                                      [ box_in_a_box ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let unboxed_point := M.copy (| M.read (| boxed_point |) |) in
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
                              M.read (| Value.String "Unboxed point occupies " |);
                              M.read (| Value.String " bytes on the stack
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [ Ty.path "box_stack_heap::Point" ]
                                      |),
                                      [ unboxed_point ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
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
