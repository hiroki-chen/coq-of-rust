(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This binding lives in the main function
    let long_lived_binding = 1;

    // This is a block, and has a smaller scope than the main function
    {
        // This binding only exists in this block
        let short_lived_binding = 2;

        println!("inner short: {}", short_lived_binding);
    }
    // End of the block

    // Error! `short_lived_binding` doesn't exist in this scope
    // println!("outer short: {}", short_lived_binding);
    // FIXME ^ Comment out this line

    println!("outer long: {}", long_lived_binding);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let long_lived_binding := M.alloc (| Value.Integer Integer.I32 1 |) in
          let _ :=
            let short_lived_binding := M.alloc (| Value.Integer Integer.I32 2 |) in
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
                                            M.read (| mk_str "inner short: " |);
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
                                                [ short_lived_binding ]
                                              |)
                                          ]
                                      |))
                              ]
                            |)
                        ]
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |) in
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
                                          M.read (| mk_str "outer long: " |);
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
                                              [ long_lived_binding ]
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
