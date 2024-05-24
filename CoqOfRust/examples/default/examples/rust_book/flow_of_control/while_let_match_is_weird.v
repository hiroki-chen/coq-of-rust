(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // Repeatedly try this test.
    loop {
        match optional {
            // If `optional` destructures, evaluate the block.
            Some(i) => {
                if i > 9 {
                    println!("Greater than 9, quit!");
                    optional = None;
                } else {
                    println!("`i` is `{:?}`. Try again.", i);
                    optional = Some(i + 1);
                }
                // ^ Requires 3 indentations!
            }
            // Quit the loop when the destructure fails:
            _ => {
                break;
            } // ^ Why should this be required? There must be a better way!
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let optional :=
          M.alloc (| Value.StructTuple "core::option::Option::Some" [ Value.Integer 0 ] |) in
        M.loop (|
          ltac:(M.monadic
            (M.match_operator (|
              optional,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_tuple_field (|
                        γ,
                        "core::option::Option::Some",
                        0
                      |) in
                    let i := M.copy (| γ0_0 |) in
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.alloc (| BinOp.Pure.gt (M.read (| i |)) (Value.Integer 9) |)) in
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
                                          "new_const",
                                          []
                                        |),
                                        [
                                          (* Unsize *)
                                          M.pointer_coercion
                                            (M.alloc (|
                                              Value.Array
                                                [ M.read (| Value.String "Greater than 9, quit!
" |)
                                                ]
                                            |))
                                        ]
                                      |)
                                    ]
                                  |)
                                |) in
                              M.alloc (| Value.Tuple [] |) in
                            let _ :=
                              M.write (|
                                optional,
                                Value.StructTuple "core::option::Option::None" []
                              |) in
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
                                                  M.read (| Value.String "`i` is `" |);
                                                  M.read (| Value.String "`. Try again.
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
                                                    [ i ]
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
                              M.write (|
                                optional,
                                Value.StructTuple
                                  "core::option::Option::Some"
                                  [
                                    BinOp.Panic.add (|
                                      Integer.I32,
                                      M.read (| i |),
                                      Value.Integer 1
                                    |)
                                  ]
                              |) in
                            M.alloc (| Value.Tuple [] |)))
                      ]
                    |)));
                fun γ =>
                  ltac:(M.monadic (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)))
              ]
            |)))
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "while_let_match_is_weird::main" main.
