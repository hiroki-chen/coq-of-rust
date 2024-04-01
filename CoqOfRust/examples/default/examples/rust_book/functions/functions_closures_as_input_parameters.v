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
    let* f := M.alloc f in
    let* _ :=
      let* α0 :=
        M.get_trait_method "core::ops::function::FnOnce" F [ Ty.tuple [] ] "call_once" [] in
      let* α1 := M.read f in
      let* α2 := M.call_closure α0 [ α1; Value.Tuple [] ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
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
    let* f := M.alloc f in
    let* α0 :=
      M.get_trait_method "core::ops::function::Fn" F [ Ty.tuple [ Ty.path "i32" ] ] "call" [] in
    M.call_closure α0 [ f; Value.Tuple [ Value.Integer Integer.I32 3 ] ]
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
    let* greeting := M.copy (mk_str "hello") in
    let* farewell :=
      let* α0 := M.get_trait_method "alloc::borrow::ToOwned" (Ty.path "str") [] "to_owned" [] in
      let* α1 := M.read (mk_str "goodbye") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* diary :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                        let* α5 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "I said ") in
                            let* α3 := M.read (mk_str ".
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            M.pure (M.pointer_coercion α4) in
                        let* α9 :=
                          (* Unsize *)
                            let* α6 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                            let* α7 := M.call_closure α6 [ greeting ] in
                            let* α8 := M.alloc (Value.Array [ α7 ]) in
                            M.pure (M.pointer_coercion α8) in
                        let* α10 := M.call_closure α1 [ α5; α9 ] in
                        let* α11 := M.call_closure α0 [ α10 ] in
                        M.alloc α11 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      let* α0 :=
                        M.get_associated_function (Ty.path "alloc::string::String") "push_str" [] in
                      let* α1 := M.read (mk_str "!!!") in
                      let* α2 := M.call_closure α0 [ farewell; α1 ] in
                      M.alloc α2 in
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                        let* α5 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "Then I screamed ") in
                            let* α3 := M.read (mk_str ".
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            M.pure (M.pointer_coercion α4) in
                        let* α9 :=
                          (* Unsize *)
                            let* α6 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "alloc::string::String" ] in
                            let* α7 := M.call_closure α6 [ farewell ] in
                            let* α8 := M.alloc (Value.Array [ α7 ]) in
                            M.pure (M.pointer_coercion α8) in
                        let* α10 := M.call_closure α1 [ α5; α9 ] in
                        let* α11 := M.call_closure α0 [ α10 ] in
                        M.alloc α11 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_const"
                            [] in
                        let* α4 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "Now I can sleep. zzzzz
") in
                            let* α3 := M.alloc (Value.Array [ α2 ]) in
                            M.pure (M.pointer_coercion α3) in
                        let* α5 := M.call_closure α1 [ α4 ] in
                        let* α6 := M.call_closure α0 [ α5 ] in
                        M.alloc α6 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      let* α0 :=
                        M.get_function "core::mem::drop" [ Ty.path "alloc::string::String" ] in
                      let* α1 := M.read farewell in
                      let* α2 := M.call_closure α0 [ α1 ] in
                      M.alloc α2 in
                    let* α0 := M.alloc (Value.Tuple []) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_function
          "functions_closures_as_input_parameters::apply"
          [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ] in
      let* α1 := M.read diary in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* double :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* x := M.copy γ in
                    let* α0 := M.read x in
                    BinOp.Panic.mul (Value.Integer Integer.I32 2) α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "3 doubled: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α13 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α7 :=
              M.get_function
                "functions_closures_as_input_parameters::apply_to_3"
                [ Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32") ] in
            let* α8 := M.read double in
            let* α9 := M.call_closure α7 [ α8 ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α6 [ α10 ] in
            let* α12 := M.alloc (Value.Array [ α11 ]) in
            M.pure (M.pointer_coercion α12) in
        let* α14 := M.call_closure α1 [ α5; α13 ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
