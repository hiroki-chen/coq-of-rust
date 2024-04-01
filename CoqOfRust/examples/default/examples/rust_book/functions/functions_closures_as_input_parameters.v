(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    // The closure takes no input and returns nothing.
    F: FnOnce(),
{
    // ^ TODO: Try changing this to `Fn` or `FnMut`.

    f();
}
*)
Definition apply (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ F ], [ f ] =>
    ltac:(M.monadic
      (let f := M.alloc (| f |) in
      M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnOnce",
                F,
                [ Ty.tuple [] ],
                "call_once",
                []
              |),
              [ M.read (| f |); Value.Tuple [] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn apply_to_3<F>(f: F) -> i32
where
    // The closure takes an `i32` and returns an `i32`.
    F: Fn(i32) -> i32,
{
    f(3)
}
*)
Definition apply_to_3 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ F ], [ f ] =>
    ltac:(M.monadic
      (let f := M.alloc (| f |) in
      M.call_closure (|
        M.get_trait_method (|
          "core::ops::function::Fn",
          F,
          [ Ty.tuple [ Ty.path "i32" ] ],
          "call",
          []
        |),
        [ f; Value.Tuple [ Value.Integer Integer.I32 3 ] ]
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    use std::mem;

    let greeting = "hello";
    // A non-copy type.
    // `to_owned` creates owned data from borrowed one
    let mut farewell = "goodbye".to_owned();

    // Capture 2 variables: `greeting` by reference and
    // `farewell` by value.
    let diary = || {
        // `greeting` is by reference: requires `Fn`.
        println!("I said {}.", greeting);

        // Mutation forces `farewell` to be captured by
        // mutable reference. Now requires `FnMut`.
        farewell.push_str("!!!");
        println!("Then I screamed {}.", farewell);
        println!("Now I can sleep. zzzzz");

        // Manually calling drop forces `farewell` to
        // be captured by value. Now requires `FnOnce`.
        mem::drop(farewell);
    };

    // Call the function which applies the closure.
    apply(diary);

    // `double` satisfies `apply_to_3`'s trait bound
    let double = |x| 2 * x;

    println!("3 doubled: {}", apply_to_3(double));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let greeting := M.copy (| mk_str "hello" |) in
        let farewell :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (| "alloc::borrow::ToOwned", Ty.path "str", [], "to_owned", [] |),
              [ M.read (| mk_str "goodbye" |) ]
            |)
          |) in
        let diary :=
          M.alloc (|
            M.closure
              (fun γ =>
                ltac:(M.monadic
                  match γ with
                  | [ α0 ] =>
                    M.match_operator (|
                      M.alloc (| α0 |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (M.read (|
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
                                                    M.read (| mk_str "I said " |);
                                                    M.read (| mk_str ".
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
                                                      [ greeting ]
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
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_associated_function (|
                                      Ty.path "alloc::string::String",
                                      "push_str",
                                      []
                                    |),
                                    [ farewell; M.read (| mk_str "!!!" |) ]
                                  |)
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
                                                Value.Array
                                                  [
                                                    M.read (| mk_str "Then I screamed " |);
                                                    M.read (| mk_str ".
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
                                                        [ Ty.path "alloc::string::String" ]
                                                      |),
                                                      [ farewell ]
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
                                                  [ M.read (| mk_str "Now I can sleep. zzzzz
" |) ]
                                              |))
                                          ]
                                        |)
                                      ]
                                    |)
                                  |) in
                                M.alloc (| Value.Tuple [] |) in
                              let _ :=
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::mem::drop",
                                      [ Ty.path "alloc::string::String" ]
                                    |),
                                    [ M.read (| farewell |) ]
                                  |)
                                |) in
                              M.alloc (| Value.Tuple [] |)
                            |)))
                      ]
                    |)
                  | _ => M.impossible (||)
                  end))
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "functions_closures_as_input_parameters::apply",
                [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ]
              |),
              [ M.read (| diary |) ]
            |)
          |) in
        let double :=
          M.alloc (|
            M.closure
              (fun γ =>
                ltac:(M.monadic
                  match γ with
                  | [ α0 ] =>
                    M.match_operator (|
                      M.alloc (| α0 |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let x := M.copy (| γ |) in
                            BinOp.Panic.mul (| Value.Integer Integer.I32 2, M.read (| x |) |)))
                      ]
                    |)
                  | _ => M.impossible (||)
                  end))
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
                          Value.Array [ M.read (| mk_str "3 doubled: " |); M.read (| mk_str "
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
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "functions_closures_as_input_parameters::apply_to_3",
                                        [ Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32")
                                        ]
                                      |),
                                      [ M.read (| double |) ]
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
