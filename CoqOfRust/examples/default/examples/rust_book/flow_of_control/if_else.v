(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let n = 5;

    if n < 0 {
        print!("{} is negative", n);
    } else if n > 0 {
        print!("{} is positive", n);
    } else {
        print!("{} is zero", n);
    }

    let big_n = if n < 10 && n > -10 {
        println!(", and is a small number, increase ten-fold");

        // This expression returns an `i32`.
        10 * n
    } else {
        println!(", and is a big number, halve the number");

        // This expression must return an `i32` as well.
        n / 2
        // TODO ^ Try suppressing this expression with a semicolon.
    };
    //   ^ Don't forget to put a semicolon here! All `let` bindings need it.

    println!("{} -> {}", n, big_n);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let n := M.alloc (| Value.Integer Integer.I32 5 |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.lt (M.read (| n |)) (Value.Integer Integer.I32 0)
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
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
                                      [ M.read (| mk_str "" |); M.read (| mk_str " is negative" |) ]
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
                                BinOp.Pure.gt (M.read (| n |)) (Value.Integer Integer.I32 0)
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
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
                                                M.read (| mk_str "" |);
                                                M.read (| mk_str " is positive" |)
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
                          M.alloc (| Value.Tuple [] |)));
                      fun γ =>
                        ltac:(M.monadic
                          (let _ :=
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
                                                M.read (| mk_str " is zero" |)
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
          |) in
        let big_n :=
          M.copy (|
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          LogicalOp.and (|
                            BinOp.Pure.lt (M.read (| n |)) (Value.Integer Integer.I32 10),
                            ltac:(M.monadic
                              (BinOp.Pure.gt (M.read (| n |)) (Value.Integer Integer.I32 (-10))))
                          |)
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
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
                                          M.read (|
                                            mk_str ", and is a small number, increase ten-fold
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
                    M.alloc (|
                      BinOp.Panic.mul (| Value.Integer Integer.I32 10, M.read (| n |) |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
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
                                          M.read (|
                                            mk_str ", and is a big number, halve the number
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
                    M.alloc (|
                      BinOp.Panic.div (| M.read (| n |), Value.Integer Integer.I32 2 |)
                    |)))
              ]
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
                              M.read (| mk_str "" |);
                              M.read (| mk_str " -> " |);
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
                                [ n ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "i32" ]
                                |),
                                [ big_n ]
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
