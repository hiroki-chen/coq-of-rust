(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_NUM : Value.t :=
  M.run ltac:(M.monadic (M.alloc (| M.alloc (| Value.Integer 18 |) |))).

(*
fn coerce_static<'a>(_: &'a i32) -> &'a i32 {
    &NUM
}
*)
Definition coerce_static (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ β0 ] =>
    ltac:(M.monadic
      (let β0 := M.alloc (| β0 |) in
      M.match_operator (|
        β0,
        [
          fun γ =>
            ltac:(M.monadic
              (M.read (|
                M.get_constant (| "scoping_rules_lifetimes_reference_lifetime_static::NUM" |)
              |)))
        ]
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_coerce_static :
  M.IsFunction "scoping_rules_lifetimes_reference_lifetime_static::coerce_static" coerce_static.

(*
fn main() {
    {
        // Make a `string` literal and print it:
        let static_string = "I'm in read-only memory";
        println!("static_string: {}", static_string);

        // When `static_string` goes out of scope, the reference
        // can no longer be used, but the data remains in the binary.
    }

    {
        // Make an integer to use for `coerce_static`:
        let lifetime_num = 9;

        // Coerce `NUM` to lifetime of `lifetime_num`:
        let coerced_static = coerce_static(&lifetime_num);

        println!("coerced_static: {}", coerced_static);
    }

    println!("NUM: {} stays accessible!", NUM);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ _ :=
          let~ static_string := M.copy (| Value.String "I'm in read-only memory" |) in
          let~ _ :=
            let~ _ :=
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
                                M.read (| Value.String "static_string: " |);
                                M.read (| Value.String "
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
                                  [ static_string ]
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
        let~ _ :=
          let~ lifetime_num := M.alloc (| Value.Integer 9 |) in
          let~ coerced_static :=
            M.alloc (|
              M.call_closure (|
                M.get_function (|
                  "scoping_rules_lifetimes_reference_lifetime_static::coerce_static",
                  []
                |),
                [ lifetime_num ]
              |)
            |) in
          let~ _ :=
            let~ _ :=
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
                                M.read (| Value.String "coerced_static: " |);
                                M.read (| Value.String "
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
                                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                                  |),
                                  [ coerced_static ]
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
        let~ _ :=
          let~ _ :=
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
                              M.read (| Value.String "NUM: " |);
                              M.read (| Value.String " stays accessible!
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
                                [
                                  M.read (|
                                    M.get_constant (|
                                      "scoping_rules_lifetimes_reference_lifetime_static::NUM"
                                    |)
                                  |)
                                ]
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

Axiom Function_main : M.IsFunction "scoping_rules_lifetimes_reference_lifetime_static::main" main.
