(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut count = 0u32;

    println!("Let's count until infinity!");

    // Infinite loop
    loop {
        count += 1;

        if count == 3 {
            println!("three");

            // Skip the rest of this iteration
            continue;
        }

        println!("{}", count);

        if count == 5 {
            println!("OK, that's enough");

            // Exit this loop
            break;
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let count := M.alloc (| Value.Integer Integer.U32 0 |) in
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
                          Value.Array [ M.read (| mk_str "Let's count until infinity!
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.loop (|
          ltac:(M.monadic
            (let _ :=
              let β := count in
              M.assign (| β, BinOp.Panic.add (| M.read (| β |), Value.Integer Integer.U32 1 |) |) in
            let _ :=
              M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ :=
                        M.use
                          (M.alloc (|
                            BinOp.Pure.eq (M.read (| count |)) (Value.Integer Integer.U32 3)
                          |)) in
                      let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                      M.alloc (|
                        M.never_to_any (|
                          M.read (|
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
                                              Value.Array [ M.read (| mk_str "three
" |) ]
                                            |))
                                        ]
                                      |)
                                    ]
                                  |)
                                |) in
                              M.alloc (| Value.Tuple [] |) in
                            M.continue (||)
                          |)
                        |)
                      |)));
                  fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
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
                              Value.Array [ M.read (| mk_str "" |); M.read (| mk_str "
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
                                      [ Ty.path "u32" ]
                                    |),
                                    [ count ]
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
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          BinOp.Pure.eq (M.read (| count |)) (Value.Integer Integer.U32 5)
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.read (|
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
                                            Value.Array [ M.read (| mk_str "OK, that's enough
" |) ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |) in
                          M.break (||)
                        |)
                      |)
                    |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
              ]
            |)))
        |)
      |)))
  | _, _ => M.impossible
  end.
