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
Definition apply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ F ], [ f ] =>
    let* f := M.alloc f in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::ops::function::FnOnce"
          "call_once"
          [ (* Self *) F; (* Args *) Ty.tuple [] ] in
      let* α1 := M.read f in
      let* α2 := M.call α0 [ α1; tt ] in
      M.alloc α2 in
    let* α0 := M.alloc tt in
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
Definition apply_to_3 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ F ], [ f ] =>
    let* f := M.alloc f in
    let* α0 :=
      M.get_method
        "core::ops::function::Fn"
        "call"
        [ (* Self *) F; (* Args *) Ty.tuple [ Ty.path "i32" ] ] in
    M.call α0 [ f; ((Integer.of_Z 3) : Ty.path "i32") ]
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* greeting := M.copy (mk_str "hello") in
    let* farewell :=
      let* α0 :=
        M.get_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "goodbye") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* diary :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "I said ") in
                    let* α2 := M.read (mk_str ".
") in
                    let* α3 := M.alloc [ α1; α2 ] in
                    let* α4 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_display"]
                        [ greeting ] in
                    let* α5 := M.alloc [ α4 ] in
                    let* α6 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_v1"]
                        [
                          pointer_coercion "Unsize" α3;
                          pointer_coercion "Unsize" α5
                        ] in
                    let* α7 := M.call α0 [ α6 ] in
                    M.alloc α7 in
                  M.alloc tt in
                let* _ :=
                  let* α0 := M.read (mk_str "!!!") in
                  let* α1 :=
                    M.call
                      (Ty.path "alloc::string::String")::["push_str"]
                      [ farewell; α0 ] in
                  M.alloc α1 in
                let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "Then I screamed ") in
                    let* α2 := M.read (mk_str ".
") in
                    let* α3 := M.alloc [ α1; α2 ] in
                    let* α4 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_display"]
                        [ farewell ] in
                    let* α5 := M.alloc [ α4 ] in
                    let* α6 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_v1"]
                        [
                          pointer_coercion "Unsize" α3;
                          pointer_coercion "Unsize" α5
                        ] in
                    let* α7 := M.call α0 [ α6 ] in
                    M.alloc α7 in
                  M.alloc tt in
                let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "Now I can sleep. zzzzz
") in
                    let* α2 := M.alloc [ α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" α2 ] in
                    let* α4 := M.call α0 [ α3 ] in
                    M.alloc α4 in
                  M.alloc tt in
                let* _ :=
                  let* α0 := M.var "core::mem::drop" in
                  let* α1 := M.read farewell in
                  let* α2 := M.call α0 [ α1 ] in
                  M.alloc α2 in
                let* α0 := M.alloc tt in
                M.read α0)
            ])) in
    let* _ :=
      let* α0 := M.var "functions_closures_as_input_parameters::apply" in
      let* α1 := M.read diary in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* double :=
      M.alloc
        (fun (α0 : Ty.path "i32") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* x := M.copy γ in
                let* α0 := M.var "BinOp::Panic::mul" in
                let* α1 := M.read x in
                α0 ((Integer.of_Z 2) : Ty.path "i32") α1)
            ])) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "3 doubled: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 := M.var "functions_closures_as_input_parameters::apply_to_3" in
        let* α5 := M.read double in
        let* α6 := M.call α4 [ α5 ] in
        let* α7 := M.alloc α6 in
        let* α8 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α7 ] in
        let* α9 := M.alloc [ α8 ] in
        let* α10 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α9 ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
