(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec = vec![1, 9, 3, 3, 13, 2];

    // `iter()` for vecs yields `&i32` and `position()` does not take a reference, so
    // we have to destructure `&i32` to `i32`
    let index_of_first_even_number = vec.iter().position(|&x| x % 2 == 0);
    assert_eq!(index_of_first_even_number, Some(5));

    // `into_iter()` for vecs yields `i32` and `position()` does not take a reference, so
    // we do not have to destructure
    let index_of_first_negative_number = vec.into_iter().position(|x| x < 0);
    assert_eq!(index_of_first_negative_number, None);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let vec :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              Value.Integer Integer.I32 1;
                              Value.Integer Integer.I32 9;
                              Value.Integer Integer.I32 3;
                              Value.Integer Integer.I32 3;
                              Value.Integer Integer.I32 13;
                              Value.Integer Integer.I32 2
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let index_of_first_even_number :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ],
                [],
                "position",
                [
                  Ty.function
                    [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
                    (Ty.path "bool")
                ]
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                      "iter",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::ops::deref::Deref",
                          Ty.apply
                            (Ty.path "alloc::vec::Vec")
                            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                          [],
                          "deref",
                          []
                        |),
                        [ vec ]
                      |)
                    ]
                  |)
                |);
                M.closure
                  (fun γ =>
                    ltac:(M.monadic
                      match γ with
                      | [ α0 ] =>
                        M.match_operator (|
                          M.alloc (| α0 |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ := M.read (| γ |) in
                                let x := M.copy (| γ |) in
                                BinOp.Pure.eq
                                  (BinOp.Panic.rem (|
                                    M.read (| x |),
                                    Value.Integer Integer.I32 2
                                  |))
                                  (Value.Integer Integer.I32 0)))
                          ]
                        |)
                      | _ => M.impossible (||)
                      end))
              ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  index_of_first_even_number;
                  M.alloc (|
                    Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.Usize 5 ]
                  |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.get_tuple_field (| γ, 1 |) in
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
                                      Ty.apply (Ty.path "core::option::Option") [ Ty.path "usize" ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ]
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
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ];
                                        Ty.apply
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ]
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
        let index_of_first_negative_number :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                [],
                "position",
                [ Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "bool") ]
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::collect::IntoIterator",
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                      [],
                      "into_iter",
                      []
                    |),
                    [ M.read (| vec |) ]
                  |)
                |);
                M.closure
                  (fun γ =>
                    ltac:(M.monadic
                      match γ with
                      | [ α0 ] =>
                        M.match_operator (|
                          M.alloc (| α0 |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let x := M.copy (| γ |) in
                                BinOp.Pure.lt (M.read (| x |)) (Value.Integer Integer.I32 0)))
                          ]
                        |)
                      | _ => M.impossible (||)
                      end))
              ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  index_of_first_negative_number;
                  M.alloc (| Value.StructTuple "core::option::Option::None" [] |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.get_tuple_field (| γ, 1 |) in
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
                                      Ty.apply (Ty.path "core::option::Option") [ Ty.path "usize" ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ]
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
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ];
                                        Ty.apply
                                          (Ty.path "core::option::Option")
                                          [ Ty.path "usize" ]
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
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
