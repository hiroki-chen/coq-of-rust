(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn call_me<F: Fn()>(f: F) {
    f();
}
*)
Definition call_me (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ F ], [ f ] =>
    ltac:(M.monadic
      (let f := M.alloc (| f |) in
      M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (| "core::ops::function::Fn", F, [ Ty.tuple [] ], "call", [] |),
              [ f; Value.Tuple [] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn function() {
    println!("I'm a function!");
}
*)
Definition function (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
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
                        (M.alloc (| Value.Array [ M.read (| Value.String "I'm a function!
" |) ] |))
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

(*
fn main() {
    // Define a closure satisfying the `Fn` bound
    let closure = || println!("I'm a closure!");

    call_me(closure);
    call_me(function);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let closure :=
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
                                          "new_const",
                                          []
                                        |),
                                        [
                                          (* Unsize *)
                                          M.pointer_coercion
                                            (M.alloc (|
                                              Value.Array
                                                [ M.read (| Value.String "I'm a closure!
" |) ]
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
              M.get_function (|
                "functions_closures_input_functions::call_me",
                [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ]
              |),
              [ M.read (| closure |) ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "functions_closures_input_functions::call_me",
                [ Ty.function [] (Ty.tuple []) ]
              |),
              [ M.get_function (| "functions_closures_input_functions::function", [] |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
