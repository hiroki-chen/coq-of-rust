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
    let* color :=
      let* α0 :=
        M.get_trait_method
          "core::convert::From"
          (Ty.path "alloc::string::String")
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
          "from"
          [] in
      let* α1 := M.read (mk_str "green") in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* print :=
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
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "`color`: ") in
                          let* α3 := M.read (mk_str "
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
                          let* α7 := M.call_closure α6 [ color ] in
                          let* α8 := M.alloc (Value.Array [ α7 ]) in
                          M.pure (M.pointer_coercion α8) in
                      let* α10 := M.call_closure α1 [ α5; α9 ] in
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    let* α0 := M.alloc (Value.Tuple []) in M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::Fn"
          (Ty.function [ Ty.tuple [] ] (Ty.tuple []))
          [ Ty.tuple [] ]
          "call"
          [] in
      let* α1 := M.call_closure α0 [ print; Value.Tuple [] ] in M.alloc α1 in
    let* _reborrow := M.alloc color in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::Fn"
          (Ty.function [ Ty.tuple [] ] (Ty.tuple []))
          [ Ty.tuple [] ]
          "call"
          [] in
      let* α1 := M.call_closure α0 [ print; Value.Tuple [] ] in M.alloc α1 in
    let* _color_moved := M.copy color in
    let* count := M.alloc (Value.Integer Integer.I32 0) in
    let* inc :=
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
                      let β := count in
                      let* α0 := M.read β in
                      let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 1) in
                      M.assign β α1 in
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                        let* α5 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "`count`: ") in
                            let* α3 := M.read (mk_str "
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            M.pure (M.pointer_coercion α4) in
                        let* α9 :=
                          (* Unsize *)
                            let* α6 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "i32" ] in
                            let* α7 := M.call_closure α6 [ count ] in
                            let* α8 := M.alloc (Value.Array [ α7 ]) in
                            M.pure (M.pointer_coercion α8) in
                        let* α10 := M.call_closure α1 [ α5; α9 ] in
                        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                      M.alloc (Value.Tuple []) in
                    let* α0 := M.alloc (Value.Tuple []) in M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::FnMut"
          (Ty.function [ Ty.tuple [] ] (Ty.tuple []))
          [ Ty.tuple [] ]
          "call_mut"
          [] in
      let* α1 := M.call_closure α0 [ inc; Value.Tuple [] ] in M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::FnMut"
          (Ty.function [ Ty.tuple [] ] (Ty.tuple []))
          [ Ty.tuple [] ]
          "call_mut"
          [] in
      let* α1 := M.call_closure α0 [ inc; Value.Tuple [] ] in M.alloc α1 in
    let* _count_reborrowed := M.alloc count in
    let* movable :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 3 ] in M.alloc α1 in
    let* consume :=
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
                            let* α2 := M.read (mk_str "`movable`: ") in
                            let* α3 := M.read (mk_str "
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            M.pure (M.pointer_coercion α4) in
                        let* α9 :=
                          (* Unsize *)
                            let* α6 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_debug"
                                [
                                  Ty.apply
                                    (Ty.path "alloc::boxed::Box")
                                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                                ] in
                            let* α7 := M.call_closure α6 [ movable ] in
                            let* α8 := M.alloc (Value.Array [ α7 ]) in
                            M.pure (M.pointer_coercion α8) in
                        let* α10 := M.call_closure α1 [ α5; α9 ] in
                        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      let* α0 :=
                        M.get_function
                          "core::mem::drop"
                          [
                            Ty.apply
                              (Ty.path "alloc::boxed::Box")
                              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                          ] in
                      let* α1 := M.read movable in
                      let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
                    let* α0 := M.alloc (Value.Tuple []) in M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::FnOnce"
          (Ty.function [ Ty.tuple [] ] (Ty.tuple []))
          [ Ty.tuple [] ]
          "call_once"
          [] in
      let* α1 := M.read consume in
      let* α2 := M.call_closure α0 [ α1; Value.Tuple [] ] in M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
