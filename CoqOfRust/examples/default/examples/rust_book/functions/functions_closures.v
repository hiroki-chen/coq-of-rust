(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let outer_var = 42;

    // A regular function can't refer to variables in the enclosing environment
    //fn function(i: i32) -> i32 { i + outer_var }
    // TODO: uncomment the line above and see the compiler error. The compiler
    // suggests that we define a closure instead.

    // Closures are anonymous, here we are binding them to references
    // Annotation is identical to function annotation but is optional
    // as are the `{}` wrapping the body. These nameless functions
    // are assigned to appropriately named variables.
    let closure_annotated = |i: i32| -> i32 { i + outer_var };
    let closure_inferred = |i| i + outer_var;

    // Call the closures.
    println!("closure_annotated: {}", closure_annotated(1));
    println!("closure_inferred: {}", closure_inferred(1));
    // Once closure's type has been inferred, it cannot be inferred again with another type.
    //println!("cannot reuse closure_inferred with another type: {}", closure_inferred(42i64));
    // TODO: uncomment the line above and see the compiler error.

    // A closure taking no arguments which returns an `i32`.
    // The return type is inferred.
    let one = || 1;
    println!("closure returning one: {}", one());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* outer_var := M.alloc (Value.Integer Integer.I32 42) in
    let* closure_annotated :=
      M.alloc
        (fun (α0 : Ty.path "i32") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            (Value.Array
              [
                fun γ =>
                  (let* i := M.copy γ in
                  let* α0 := M.read i in
                  let* α1 := M.read outer_var in
                  BinOp.Panic.add α0 α1)
              ]))) in
    let* closure_inferred :=
      M.alloc
        (fun (α0 : Ty.path "i32") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            (Value.Array
              [
                fun γ =>
                  (let* i := M.copy γ in
                  let* α0 := M.read i in
                  let* α1 := M.read outer_var in
                  BinOp.Panic.add α0 α1)
              ]))) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "closure_annotated: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_trait_method
            "core::ops::function::Fn"
            "call"
            [
              (* Self *)
                Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32");
              (* Args *) Ty.tuple [ Ty.path "i32" ]
            ] in
        let* α7 :=
          M.call
            α6
            [ closure_annotated; Value.Tuple [ Value.Integer Integer.I32 1 ]
            ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "closure_inferred: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_trait_method
            "core::ops::function::Fn"
            "call"
            [
              (* Self *)
                Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32");
              (* Args *) Ty.tuple [ Ty.path "i32" ]
            ] in
        let* α7 :=
          M.call
            α6
            [ closure_inferred; Value.Tuple [ Value.Integer Integer.I32 1 ] ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* one :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            (Value.Array
              [ fun γ => (M.pure (Value.Integer Integer.I32 1)) ]))) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "closure returning one: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.get_trait_method
            "core::ops::function::Fn"
            "call"
            [
              (* Self *) Ty.function [ Ty.tuple [] ] (Ty.path "i32");
              (* Args *) Ty.tuple []
            ] in
        let* α7 := M.call α6 [ one; Value.Tuple [] ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
