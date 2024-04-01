(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Declare a variable binding
    let a_binding;

    {
        let x = 2;

        // Initialize the binding
        a_binding = x * x;
    }

    println!("a binding: {}", a_binding);

    let another_binding;

    // Error! Use of uninitialized binding
    // println!("another binding: {}", another_binding);
    // FIXME ^ Comment out this line

    another_binding = 1;

    println!("another binding: {}", another_binding);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let a_binding := M.copy (| Value.DeclaredButUndefined |) in
          let _ :=
            let x := M.alloc (| Value.Integer Integer.I32 2 |) in
            let _ :=
              M.assign (| a_binding, BinOp.Panic.mul (| M.read (| x |), M.read (| x |) |) |) in
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
                                        [ M.read (| mk_str "a binding: " |); M.read (| mk_str "
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
                                              [ a_binding ]
                                            |)
                                        ]
                                    |))
                            ]
                          |)
                      ]
                    |)
                |) in
            M.alloc (| Value.Tuple [] |) in
          let another_binding := M.copy (| Value.DeclaredButUndefined |) in
          let _ := M.assign (| another_binding, Value.Integer Integer.I32 1 |) in
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
                                          M.read (| mk_str "another binding: " |);
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
                                              [ another_binding ]
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
