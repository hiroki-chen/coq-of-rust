(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn analyze_slice(slice: &[i32]) {
    println!("first element of the slice: {}", slice[0]);
    println!("the slice has {} elements", slice.len());
}
*)
Definition analyze_slice (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ slice ] =>
    ltac:(M.monadic
      (let slice := M.alloc (| slice |) in
      M.read (|
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
                              M.read (| mk_str "first element of the slice: " |);
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
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.get_array_field (|
                                    M.read (| slice |),
                                    M.alloc (| Value.Integer Integer.Usize 0 |)
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
                            [ M.read (| mk_str "the slice has " |); M.read (| mk_str " elements
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
                                      M.get_associated_function (|
                                        Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                                        "len",
                                        []
                                      |),
                                      [ M.read (| slice |) ]
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

(*
fn main() {
    // Fixed-size array (type signature is superfluous)
    let xs: [i32; 5] = [1, 2, 3, 4, 5];

    // All elements can be initialized to the same value
    let ys: [i32; 500] = [0; 500];

    // Indexing starts at 0
    println!("first element of the array: {}", xs[0]);
    println!("second element of the array: {}", xs[1]);

    // `len` returns the count of elements in the array
    println!("number of elements in array: {}", xs.len());

    // Arrays are stack allocated
    println!("array occupies {} bytes", mem::size_of_val(&xs));

    // Arrays can be automatically borrowed as slices
    println!("borrow the whole array as a slice");
    analyze_slice(&xs);

    // Slices can point to a section of an array
    // They are of the form [starting_index..ending_index]
    // starting_index is the first position in the slice
    // ending_index is one more than the last position in the slice
    println!("borrow a section of the array as a slice");
    analyze_slice(&ys[1 .. 4]);

    // Example of empty slice `&[]`
    let empty_array: [u32; 0] = [];
    assert_eq!(&empty_array, &[]);
    assert_eq!(&empty_array, &[][..]); // same but more verbose

    // Arrays can be safely accessed using `.get`, which returns an
    // `Option`. This can be matched as shown below, or used with
    // `.expect()` if you would like the program to exit with a nice
    // message instead of happily continue.
    for i in 0..xs.len() + 1 { // OOPS, one element too far
        match xs.get(i) {
            Some(xval) => println!("{}: {}", i, xval),
            None => println!("Slow down! {} is too far!", i),
        }
    }

    // Out of bound indexing causes runtime error
    //println!("{}", xs[5]);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let xs :=
          M.alloc (|
            Value.Array
              [
                Value.Integer Integer.I32 1;
                Value.Integer Integer.I32 2;
                Value.Integer Integer.I32 3;
                Value.Integer Integer.I32 4;
                Value.Integer Integer.I32 5
              ]
          |) in
        let ys := M.alloc (| repeat (Value.Integer Integer.I32 0) 500 |) in
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
                              M.read (| mk_str "first element of the array: " |);
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
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.get_array_field (|
                                    xs,
                                    M.alloc (| Value.Integer Integer.Usize 0 |)
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
                              M.read (| mk_str "second element of the array: " |);
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
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.get_array_field (|
                                    xs,
                                    M.alloc (| Value.Integer Integer.Usize 1 |)
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
                              M.read (| mk_str "number of elements in array: " |);
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                                        "len",
                                        []
                                      |),
                                      [ (* Unsize *) M.pointer_coercion xs ]
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
                            [ M.read (| mk_str "array occupies " |); M.read (| mk_str " bytes
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
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::mem::size_of_val",
                                        [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ]
                                      |),
                                      [ xs ]
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
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| mk_str "borrow the whole array as a slice
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "arrays_and_slices::analyze_slice", [] |),
              [ (* Unsize *) M.pointer_coercion xs ]
            |)
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
                          Value.Array
                            [ M.read (| mk_str "borrow a section of the array as a slice
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "arrays_and_slices::analyze_slice", [] |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::index::Index",
                    Ty.apply (Ty.path "array") [ Ty.path "i32" ],
                    [ Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ] ],
                    "index",
                    []
                  |),
                  [
                    ys;
                    Value.StructRecord
                      "core::ops::range::Range"
                      [
                        ("start", Value.Integer Integer.Usize 1);
                        ("end_", Value.Integer Integer.Usize 4)
                      ]
                  ]
                |)
              ]
            |)
          |) in
        let empty_array := M.alloc (| Value.Array [] |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple [ M.alloc (| empty_array |); M.alloc (| M.alloc (| Value.Array [] |) |) ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field γ 0 in
                  let γ0_1 := M.get_tuple_field γ 1 in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "&")
                                        [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ],
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ];
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (| empty_array |);
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::index::Index",
                        Ty.apply (Ty.path "array") [ Ty.path "u32" ],
                        [ Ty.path "core::ops::range::RangeFull" ],
                        "index",
                        []
                      |),
                      [
                        M.alloc (| Value.Array [] |);
                        Value.StructTuple "core::ops::range::RangeFull" []
                      ]
                    |)
                  |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field γ 0 in
                  let γ0_1 := M.get_tuple_field γ 1 in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "&")
                                        [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ],
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ];
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.use
          (M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::collect::IntoIterator",
                  Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ],
                  [],
                  "into_iter",
                  []
                |),
                [
                  Value.StructRecord
                    "core::ops::range::Range"
                    [
                      ("start", Value.Integer Integer.Usize 0);
                      ("end_",
                        BinOp.Panic.add (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                              "len",
                              []
                            |),
                            [ (* Unsize *) M.pointer_coercion xs ]
                          |),
                          Value.Integer Integer.Usize 1
                        |))
                    ]
                ]
              |)
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let iter := M.copy (| γ |) in
                  M.loop (|
                    ltac:(M.monadic
                      (let _ :=
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::iter::traits::iterator::Iterator",
                                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ],
                                [],
                                "next",
                                []
                              |),
                              [ iter ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.get_struct_tuple_field_or_break_match (|
                                    γ,
                                    "core::option::Option::Some",
                                    0
                                  |) in
                                let i := M.copy (| γ0_0 |) in
                                M.match_operator (|
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                                        "get",
                                        [ Ty.path "usize" ]
                                      |),
                                      [ (* Unsize *) M.pointer_coercion xs; M.read (| i |) ]
                                    |)
                                  |),
                                  [
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let γ0_0 :=
                                          M.get_struct_tuple_field_or_break_match (|
                                            γ,
                                            "core::option::Option::Some",
                                            0
                                          |) in
                                        let xval := M.copy (| γ0_0 |) in
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
                                                            M.read (| mk_str "" |);
                                                            M.read (| mk_str ": " |);
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
                                                                [ Ty.path "usize" ]
                                                              |),
                                                              [ i ]
                                                            |);
                                                            M.call_closure (|
                                                              M.get_associated_function (|
                                                                Ty.path "core::fmt::rt::Argument",
                                                                "new_display",
                                                                [
                                                                  Ty.apply
                                                                    (Ty.path "&")
                                                                    [ Ty.path "i32" ]
                                                                ]
                                                              |),
                                                              [ xval ]
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
                                        (let _ :=
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
                                                            M.read (| mk_str "Slow down! " |);
                                                            M.read (| mk_str " is too far!
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
                                                              [ i ]
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
                                |)))
                          ]
                        |) in
                      M.alloc (| Value.Tuple [] |)))
                  |)))
            ]
          |))
      |)))
  | _, _ => M.impossible
  end.
