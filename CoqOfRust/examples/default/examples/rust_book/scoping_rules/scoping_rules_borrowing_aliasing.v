(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "i32"); ("y", Ty.path "i32"); ("z", Ty.path "i32") ];
  } *)

(*
fn main() {
    let mut point = Point { x: 0, y: 0, z: 0 };

    let borrowed_point = &point;
    let another_borrow = &point;

    // Data can be accessed via the references and the original owner
    println!(
        "Point has coordinates: ({}, {}, {})",
        borrowed_point.x, another_borrow.y, point.z
    );

    // Error! Can't borrow `point` as mutable because it's currently
    // borrowed as immutable.
    // let mutable_borrow = &mut point;
    // TODO ^ Try uncommenting this line

    // The borrowed values are used again here
    println!(
        "Point has coordinates: ({}, {}, {})",
        borrowed_point.x, another_borrow.y, point.z
    );

    // The immutable references are no longer used for the rest of the code so
    // it is possible to reborrow with a mutable reference.
    let mutable_borrow = &mut point;

    // Change data via mutable reference
    mutable_borrow.x = 5;
    mutable_borrow.y = 2;
    mutable_borrow.z = 1;

    // Error! Can't borrow `point` as immutable because it's currently
    // borrowed as mutable.
    // let y = &point.y;
    // TODO ^ Try uncommenting this line

    // Error! Can't print because `println!` takes an immutable reference.
    // println!("Point Z coordinate is {}", point.z);
    // TODO ^ Try uncommenting this line

    // Ok! Mutable references can be passed as immutable to `println!`
    println!(
        "Point has coordinates: ({}, {}, {})",
        mutable_borrow.x, mutable_borrow.y, mutable_borrow.z
    );

    // The mutable reference is no longer used for the rest of the code so it
    // is possible to reborrow
    let new_borrowed_point = &point;
    println!(
        "Point now has coordinates: ({}, {}, {})",
        new_borrowed_point.x, new_borrowed_point.y, new_borrowed_point.z
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
                Value.StructRecord
                  "scoping_rules_borrowing_aliasing::Point"
                  [
                    ("x", Value.Integer Integer.I32 0);
                    ("y", Value.Integer Integer.I32 0);
                    ("z", Value.Integer Integer.I32 0)
                  ]
              |) in
          let borrowed_point := M.alloc (| point |) in
          let another_borrow := M.alloc (| point |) in
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
                                          M.read (| mk_str "Point has coordinates: (" |);
                                          M.read (| mk_str ", " |);
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
                                                  (M.read (| borrowed_point |))
                                                  "scoping_rules_borrowing_aliasing::Point"
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
                                                  (M.read (| another_borrow |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "y"
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
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "z"
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
                                          M.read (| mk_str "Point has coordinates: (" |);
                                          M.read (| mk_str ", " |);
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
                                                  (M.read (| borrowed_point |))
                                                  "scoping_rules_borrowing_aliasing::Point"
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
                                                  (M.read (| another_borrow |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "y"
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
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "z"
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
          let mutable_borrow := M.alloc (| point |) in
          let _ :=
            M.assign (|
                M.get_struct_record_field
                  (M.read (| mutable_borrow |))
                  "scoping_rules_borrowing_aliasing::Point"
                  "x",
                Value.Integer Integer.I32 5
              |) in
          let _ :=
            M.assign (|
                M.get_struct_record_field
                  (M.read (| mutable_borrow |))
                  "scoping_rules_borrowing_aliasing::Point"
                  "y",
                Value.Integer Integer.I32 2
              |) in
          let _ :=
            M.assign (|
                M.get_struct_record_field
                  (M.read (| mutable_borrow |))
                  "scoping_rules_borrowing_aliasing::Point"
                  "z",
                Value.Integer Integer.I32 1
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
                                          M.read (| mk_str "Point has coordinates: (" |);
                                          M.read (| mk_str ", " |);
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
                                                  (M.read (| mutable_borrow |))
                                                  "scoping_rules_borrowing_aliasing::Point"
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
                                                  (M.read (| mutable_borrow |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "y"
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
                                                  (M.read (| mutable_borrow |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "z"
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
          let new_borrowed_point := M.alloc (| point |) in
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
                                          M.read (| mk_str "Point now has coordinates: (" |);
                                          M.read (| mk_str ", " |);
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
                                                  (M.read (| new_borrowed_point |))
                                                  "scoping_rules_borrowing_aliasing::Point"
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
                                                  (M.read (| new_borrowed_point |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "y"
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
                                                  (M.read (| new_borrowed_point |))
                                                  "scoping_rules_borrowing_aliasing::Point"
                                                  "z"
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
