(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let shadowed_binding = 1;

    {
        println!("before being shadowed: {}", shadowed_binding);

        // This binding *shadows* the outer one
        let shadowed_binding = "abc";

        println!("shadowed in inner block: {}", shadowed_binding);
    }
    println!("outside inner block: {}", shadowed_binding);

    // This binding *shadows* the previous binding
    let shadowed_binding = 2;
    println!("shadowed in outer block: {}", shadowed_binding);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let shadowed_binding := M.alloc (| Value.Integer Integer.I32 1 |) in
        let _ :=
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
                                M.read (| mk_str "before being shadowed: " |);
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
                                  [ shadowed_binding ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          let shadowed_binding := M.copy (| mk_str "abc" |) in
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
                                M.read (| mk_str "shadowed in inner block: " |);
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
                                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                  |),
                                  [ shadowed_binding ]
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
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| mk_str "outside inner block: " |); M.read (| mk_str "
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
                                  [ Ty.path "i32" ]
                                |),
                                [ shadowed_binding ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let shadowed_binding := M.alloc (| Value.Integer Integer.I32 2 |) in
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
                              M.read (| mk_str "shadowed in outer block: " |);
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
                                [ shadowed_binding ]
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
