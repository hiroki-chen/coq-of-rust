(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::mem;

    let color = String::from("green");

    // A closure to print `color` which immediately borrows (`&`) `color` and
    // stores the borrow and closure in the `print` variable. It will remain
    // borrowed until `print` is used the last time.
    //
    // `println!` only requires arguments by immutable reference so it doesn't
    // impose anything more restrictive.
    let print = || println!("`color`: {}", color);

    // Call the closure using the borrow.
    print();

    // `color` can be borrowed immutably again, because the closure only holds
    // an immutable reference to `color`.
    let _reborrow = &color;
    print();

    // A move or reborrow is allowed after the final use of `print`
    let _color_moved = color;

    let mut count = 0;
    // A closure to increment `count` could take either `&mut count` or `count`
    // but `&mut count` is less restrictive so it takes that. Immediately
    // borrows `count`.
    //
    // A `mut` is required on `inc` because a `&mut` is stored inside. Thus,
    // calling the closure mutates the closure which requires a `mut`.
    let mut inc = || {
        count += 1;
        println!("`count`: {}", count);
    };

    // Call the closure using a mutable borrow.
    inc();

    // The closure still mutably borrows `count` because it is called later.
    // An attempt to reborrow will lead to an error.
    // let _reborrow = &count;
    // ^ TODO: try uncommenting this line.
    inc();

    // The closure no longer needs to borrow `&mut count`. Therefore, it is
    // possible to reborrow without an error
    let _count_reborrowed = &mut count;

    // A non-copy type.
    let movable = Box::new(3);

    // `mem::drop` requires `T` so this must take by value. A copy type
    // would copy into the closure leaving the original untouched.
    // A non-copy must move and so `movable` immediately moves into
    // the closure.
    let consume = || {
        println!("`movable`: {:?}", movable);
        mem::drop(movable);
    };

    // `consume` consumes the variable so this can only be called once.
    consume();
    // consume();
    // ^ TODO: Try uncommenting this line.
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let color :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::From",
                Ty.path "alloc::string::String",
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "from",
                []
              |),
              [ M.read (| Value.String "green" |) ]
            |)
          |) in
        let print :=
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
                                                  M.read (| Value.String "`color`: " |);
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
                                                      [ Ty.path "alloc::string::String" ]
                                                    |),
                                                    [ color ]
                                                  |)
                                                ]
                                            |))
                                        ]
                                      |)
                                    ]
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
              M.get_trait_method (|
                "core::ops::function::Fn",
                Ty.function [ Ty.tuple [] ] (Ty.tuple []),
                [ Ty.tuple [] ],
                "call",
                []
              |),
              [ print; Value.Tuple [] ]
            |)
          |) in
        let _reborrow := M.alloc (| color |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::Fn",
                Ty.function [ Ty.tuple [] ] (Ty.tuple []),
                [ Ty.tuple [] ],
                "call",
                []
              |),
              [ print; Value.Tuple [] ]
            |)
          |) in
        let _color_moved := M.copy (| color |) in
        let count := M.alloc (| Value.Integer Integer.I32 0 |) in
        let inc :=
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
                                let β := count in
                                M.write (|
                                  β,
                                  BinOp.Panic.add (| M.read (| β |), Value.Integer Integer.I32 1 |)
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
                                                    M.read (| Value.String "`count`: " |);
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
                                                        [ Ty.path "i32" ]
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
              M.get_trait_method (|
                "core::ops::function::FnMut",
                Ty.function [ Ty.tuple [] ] (Ty.tuple []),
                [ Ty.tuple [] ],
                "call_mut",
                []
              |),
              [ inc; Value.Tuple [] ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnMut",
                Ty.function [ Ty.tuple [] ] (Ty.tuple []),
                [ Ty.tuple [] ],
                "call_mut",
                []
              |),
              [ inc; Value.Tuple [] ]
            |)
          |) in
        let _count_reborrowed := M.alloc (| count |) in
        let movable :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              [ Value.Integer Integer.I32 3 ]
            |)
          |) in
        let consume :=
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
                                                    M.read (| Value.String "`movable`: " |);
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
                                                        "new_debug",
                                                        [
                                                          Ty.apply
                                                            (Ty.path "alloc::boxed::Box")
                                                            [
                                                              Ty.path "i32";
                                                              Ty.path "alloc::alloc::Global"
                                                            ]
                                                        ]
                                                      |),
                                                      [ movable ]
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
                                    M.get_function (|
                                      "core::mem::drop",
                                      [
                                        Ty.apply
                                          (Ty.path "alloc::boxed::Box")
                                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                                      ]
                                    |),
                                    [ M.read (| movable |) ]
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
              M.get_trait_method (|
                "core::ops::function::FnOnce",
                Ty.function [ Ty.tuple [] ] (Ty.tuple []),
                [ Ty.tuple [] ],
                "call_once",
                []
              |),
              [ M.read (| consume |); Value.Tuple [] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
