(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // A counter variable
    let mut n = 1;

    // Loop while `n` is less than 101
    while n < 101 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }

        // Increment counter
        n += 1;
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let n := M.alloc (| Value.Integer Integer.I32 1 |) in
          M.loop (|
              ltac:(M.monadic
                (M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                  BinOp.Pure.lt (M.read (| n |)) (Value.Integer Integer.I32 101)
                                |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          let _ :=
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
                                                    M.read (| n |),
                                                    Value.Integer Integer.I32 15
                                                  |))
                                                (Value.Integer Integer.I32 0)
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
                                                                    [
                                                                      M.read (| mk_str "fizzbuzz
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
                                                              M.read (| n |),
                                                              Value.Integer Integer.I32 3
                                                            |))
                                                          (Value.Integer Integer.I32 0)
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
                                                                                    mk_str "fizz
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
                                                                        M.read (| n |),
                                                                        Value.Integer Integer.I32 5
                                                                      |))
                                                                    (Value.Integer Integer.I32 0)
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
                                                                                              mk_str
                                                                                                "buzz
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
                                                                                              mk_str
                                                                                                ""
                                                                                            |);
                                                                                          M.read (|
                                                                                              mk_str
                                                                                                "
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
                                                                                                  [
                                                                                                    Ty.path
                                                                                                      "i32"
                                                                                                  ]
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
                              |) in
                          let _ :=
                            let β := n in
                            M.assign (|
                                β,
                                BinOp.Panic.add (| M.read (| β |), Value.Integer Integer.I32 1 |)
                              |) in
                          M.alloc (| Value.Tuple [] |)));
                      fun γ =>
                        ltac:(M.monadic
                          (M.alloc (|
                              M.never_to_any (|
                                  M.read (|
                                      let _ :=
                                        M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |)
                                          |) in
                                      M.alloc (| Value.Tuple [] |)
                                    |)
                                |)
                            |)))
                    ]
                  |)))
            |)
        |)))
  | _, _ => M.impossible
  end.
