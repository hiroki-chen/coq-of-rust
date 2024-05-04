(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `n` will take the values: 1, 2, ..., 100 in each iteration
    for n in 1..101 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        M.use
          (M.match_operator (|
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::collect::IntoIterator",
                  Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ],
                  [],
                  "into_iter",
                  []
                |),
                [
                  Value.StructRecord
                    "core::ops::range::Range"
                    [ ("start", Value.Integer 1); ("end_", Value.Integer 101) ]
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
                                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ],
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
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::option::Option::Some",
                                    0
                                  |) in
                                let n := M.copy (| γ0_0 |) in
                                M.match_operator (|
                                  M.alloc (| Value.Tuple [] |),
                                  [
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let γ :=
                                          M.use
                                            (M.alloc (|
                                              BinOp.Pure.eq
                                                (BinOp.Panic.rem (|
                                                  Integer.I32,
                                                  M.read (| n |),
                                                  Value.Integer 15
                                                |))
                                                (Value.Integer 0)
                                            |)) in
                                        let _ :=
                                          M.is_constant_or_break_match (|
                                            M.read (| γ |),
                                            Value.Bool true
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
                                                      "new_const",
                                                      []
                                                    |),
                                                    [
                                                      (* Unsize *)
                                                      M.pointer_coercion
                                                        (M.alloc (|
                                                          Value.Array
                                                            [ M.read (| Value.String "fizzbuzz
" |)
                                                            ]
                                                        |))
                                                    ]
                                                  |)
                                                ]
                                              |)
                                            |) in
                                          M.alloc (| Value.Tuple [] |) in
                                        M.alloc (| Value.Tuple [] |)));
                                    fun γ =>
                                      ltac:(M.monadic
                                        (M.match_operator (|
                                          M.alloc (| Value.Tuple [] |),
                                          [
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let γ :=
                                                  M.use
                                                    (M.alloc (|
                                                      BinOp.Pure.eq
                                                        (BinOp.Panic.rem (|
                                                          Integer.I32,
                                                          M.read (| n |),
                                                          Value.Integer 3
                                                        |))
                                                        (Value.Integer 0)
                                                    |)) in
                                                let _ :=
                                                  M.is_constant_or_break_match (|
                                                    M.read (| γ |),
                                                    Value.Bool true
                                                  |) in
                                                let _ :=
                                                  let _ :=
                                                    M.alloc (|
                                                      M.call_closure (|
                                                        M.get_function (|
                                                          "std::io::stdio::_print",
                                                          []
                                                        |),
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
                                                                  Value.Array
                                                                    [
                                                                      M.read (|
                                                                        Value.String "fizz
"
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
                                            fun γ =>
                                              ltac:(M.monadic
                                                (M.match_operator (|
                                                  M.alloc (| Value.Tuple [] |),
                                                  [
                                                    fun γ =>
                                                      ltac:(M.monadic
                                                        (let γ :=
                                                          M.use
                                                            (M.alloc (|
                                                              BinOp.Pure.eq
                                                                (BinOp.Panic.rem (|
                                                                  Integer.I32,
                                                                  M.read (| n |),
                                                                  Value.Integer 5
                                                                |))
                                                                (Value.Integer 0)
                                                            |)) in
                                                        let _ :=
                                                          M.is_constant_or_break_match (|
                                                            M.read (| γ |),
                                                            Value.Bool true
                                                          |) in
                                                        let _ :=
                                                          let _ :=
                                                            M.alloc (|
                                                              M.call_closure (|
                                                                M.get_function (|
                                                                  "std::io::stdio::_print",
                                                                  []
                                                                |),
                                                                [
                                                                  M.call_closure (|
                                                                    M.get_associated_function (|
                                                                      Ty.path
                                                                        "core::fmt::Arguments",
                                                                      "new_const",
                                                                      []
                                                                    |),
                                                                    [
                                                                      (* Unsize *)
                                                                      M.pointer_coercion
                                                                        (M.alloc (|
                                                                          Value.Array
                                                                            [
                                                                              M.read (|
                                                                                Value.String "buzz
"
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
                                                    fun γ =>
                                                      ltac:(M.monadic
                                                        (let _ :=
                                                          let _ :=
                                                            M.alloc (|
                                                              M.call_closure (|
                                                                M.get_function (|
                                                                  "std::io::stdio::_print",
                                                                  []
                                                                |),
                                                                [
                                                                  M.call_closure (|
                                                                    M.get_associated_function (|
                                                                      Ty.path
                                                                        "core::fmt::Arguments",
                                                                      "new_v1",
                                                                      []
                                                                    |),
                                                                    [
                                                                      (* Unsize *)
                                                                      M.pointer_coercion
                                                                        (M.alloc (|
                                                                          Value.Array
                                                                            [
                                                                              M.read (|
                                                                                Value.String ""
                                                                              |);
                                                                              M.read (|
                                                                                Value.String "
"
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
                                                                                  Ty.path
                                                                                    "core::fmt::rt::Argument",
                                                                                  "new_display",
                                                                                  [ Ty.path "i32" ]
                                                                                |),
                                                                                [ n ]
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
                                        |)))
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
