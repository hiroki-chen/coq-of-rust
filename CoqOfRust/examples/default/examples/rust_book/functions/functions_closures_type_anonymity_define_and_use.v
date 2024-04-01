(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    F: Fn(),
{
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
              M.get_trait_method (| "core::ops::function::Fn", F, [ Ty.tuple [] ], "call", [] |),
              [ f; Value.Tuple [] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;

    // Capture `x` into an anonymous type and implement
    // `Fn` for it. Store it in `print`.
    let print = || println!("{}", x);

    apply(print);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let x := M.alloc (| Value.Integer Integer.I32 7 |) in
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
                                                [ M.read (| mk_str "" |); M.read (| mk_str "
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
                                                    [ x ]
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
              M.get_function (|
                "functions_closures_type_anonymity_define_and_use::apply",
                [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ]
              |),
              [ M.read (| print |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
