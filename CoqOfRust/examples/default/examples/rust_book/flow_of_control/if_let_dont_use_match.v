(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let optional = Some(7);

    match optional {
        Some(i) => {
            println!("This is a really long string and `{:?}`", i);
            // ^ Needed 2 indentations just so we could destructure
            // `i` from the option.
        }
        _ => {}
        // ^ Required because `match` is exhaustive. Doesn't it seem
        // like wasted space?
    };
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let optional :=
          M.alloc (|
            Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 7 ]
          |) in
        let _ :=
          M.match_operator (|
            optional,
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                  let i := M.copy (| γ0_0 |) in
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
                                        M.read (|
                                          Value.String "This is a really long string and `"
                                        |);
                                        M.read (| Value.String "`
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
                  M.alloc (| Value.Tuple [] |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
