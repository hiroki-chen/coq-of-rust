(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "i32"); ("y", Ty.path "i32") ];
  } *)

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t := Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  (*
  Clone
  *)
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
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.
  Definition Self : Ty.t := Ty.path "scoping_rules_borrowing_the_ref_pattern::Point".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point.

(*
fn main() {
    let c = 'Q';

    // A `ref` borrow on the left side of an assignment is equivalent to
    // an `&` borrow on the right side.
    let ref ref_c1 = c;
    let ref_c2 = &c;

    println!("ref_c1 equals ref_c2: {}", *ref_c1 == *ref_c2);

    let point = Point { x: 0, y: 0 };

    // `ref` is also valid when destructuring a struct.
    let _copy_of_x = {
        // `ref_to_x` is a reference to the `x` field of `point`.
        let Point {
            x: ref ref_to_x,
            y: _,
        } = point;

        // Return a copy of the `x` field of `point`.
        *ref_to_x
    };

    // A mutable copy of `point`
    let mut mutable_point = point;

    {
        // `ref` can be paired with `mut` to take mutable references.
        let Point {
            x: _,
            y: ref mut mut_ref_to_y,
        } = mutable_point;

        // Mutate the `y` field of `mutable_point` via a mutable reference.
        *mut_ref_to_y = 1;
    }

    println!("point is ({}, {})", point.x, point.y);
    println!(
        "mutable_point is ({}, {})",
        mutable_point.x, mutable_point.y
    );

    // A mutable tuple that includes a pointer
    let mut mutable_tuple = (Box::new(5u32), 3u32);

    {
        // Destructure `mutable_tuple` to change the value of `last`.
        let (_, ref mut last) = mutable_tuple;
        *last = 2u32;
    }

    println!("tuple is {:?}", mutable_tuple);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let c := M.alloc (| Value.UnicodeChar 81 |) in
          M.match_operator (|
              c,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let ref_c1 := M.alloc (| γ |) in
                    let ref_c2 := M.alloc (| c |) in
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
                                                    M.read (| mk_str "ref_c1 equals ref_c2: " |);
                                                    M.read (| mk_str "
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
                                                            [ Ty.path "bool" ]
                                                          |),
                                                        [
                                                          M.alloc (|
                                                              BinOp.Pure.eq
                                                                (M.read (| M.read (| ref_c1 |) |))
                                                                (M.read (| M.read (| ref_c2 |) |))
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
                    let point :=
                      M.alloc (|
                          Value.StructRecord
                            "scoping_rules_borrowing_the_ref_pattern::Point"
                            [ ("x", Value.Integer Integer.I32 0); ("y", Value.Integer Integer.I32 0)
                            ]
                        |) in
                    let _copy_of_x :=
                      M.copy (|
                          M.match_operator (|
                              point,
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ0_0 :=
                                      M.get_struct_record_field_or_break_match (|
                                          γ,
                                          "scoping_rules_borrowing_the_ref_pattern::Point",
                                          "x"
                                        |) in
                                    let γ0_1 :=
                                      M.get_struct_record_field_or_break_match (|
                                          γ,
                                          "scoping_rules_borrowing_the_ref_pattern::Point",
                                          "y"
                                        |) in
                                    let ref_to_x := M.alloc (| γ0_0 |) in
                                    M.read (| ref_to_x |)))
                              ]
                            |)
                        |) in
                    let mutable_point := M.copy (| point |) in
                    let _ :=
                      M.match_operator (|
                          mutable_point,
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.get_struct_record_field_or_break_match (|
                                      γ,
                                      "scoping_rules_borrowing_the_ref_pattern::Point",
                                      "x"
                                    |) in
                                let γ0_1 :=
                                  M.get_struct_record_field_or_break_match (|
                                      γ,
                                      "scoping_rules_borrowing_the_ref_pattern::Point",
                                      "y"
                                    |) in
                                let mut_ref_to_y := M.alloc (| γ0_1 |) in
                                let _ :=
                                  M.assign (| M.read (| mut_ref_to_y |), Value.Integer Integer.I32 1
                                    |) in
                                M.alloc (| Value.Tuple [] |)))
                          ]
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
                                                    M.read (| mk_str "point is (" |);
                                                    M.read (| mk_str ", " |);
                                                    M.read (| mk_str ")
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
                                                        [
                                                          M.get_struct_record_field
                                                            point
                                                            "scoping_rules_borrowing_the_ref_pattern::Point"
                                                            "x"
                                                        ]
                                                      |);
                                                    M.call_closure (|
                                                        M.get_associated_function (|
                                                            Ty.path "core::fmt::rt::Argument",
                                                            "new_display",
                                                            [ Ty.path "i32" ]
                                                          |),
                                                        [
                                                          M.get_struct_record_field
                                                            point
                                                            "scoping_rules_borrowing_the_ref_pattern::Point"
                                                            "y"
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
                                                    M.read (| mk_str "mutable_point is (" |);
                                                    M.read (| mk_str ", " |);
                                                    M.read (| mk_str ")
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
                                                        [
                                                          M.get_struct_record_field
                                                            mutable_point
                                                            "scoping_rules_borrowing_the_ref_pattern::Point"
                                                            "x"
                                                        ]
                                                      |);
                                                    M.call_closure (|
                                                        M.get_associated_function (|
                                                            Ty.path "core::fmt::rt::Argument",
                                                            "new_display",
                                                            [ Ty.path "i32" ]
                                                          |),
                                                        [
                                                          M.get_struct_record_field
                                                            mutable_point
                                                            "scoping_rules_borrowing_the_ref_pattern::Point"
                                                            "y"
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
                    let mutable_tuple :=
                      M.alloc (|
                          Value.Tuple
                            [
                              M.call_closure (|
                                  M.get_associated_function (|
                                      Ty.apply
                                        (Ty.path "alloc::boxed::Box")
                                        [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ],
                                      "new",
                                      []
                                    |),
                                  [ Value.Integer Integer.U32 5 ]
                                |);
                              Value.Integer Integer.U32 3
                            ]
                        |) in
                    let _ :=
                      M.match_operator (|
                          mutable_tuple,
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 := M.get_tuple_field γ 0 in
                                let γ0_1 := M.get_tuple_field γ 1 in
                                let last := M.alloc (| γ0_1 |) in
                                let _ :=
                                  M.assign (| M.read (| last |), Value.Integer Integer.U32 2 |) in
                                M.alloc (| Value.Tuple [] |)))
                          ]
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
                                                    M.read (| mk_str "tuple is " |);
                                                    M.read (| mk_str "
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
                                                              Ty.tuple
                                                                [
                                                                  Ty.apply
                                                                    (Ty.path "alloc::boxed::Box")
                                                                    [
                                                                      Ty.path "u32";
                                                                      Ty.path "alloc::alloc::Global"
                                                                    ];
                                                                  Ty.path "u32"
                                                                ]
                                                            ]
                                                          |),
                                                        [ mutable_tuple ]
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
            |)
        |)))
  | _, _ => M.impossible
  end.
