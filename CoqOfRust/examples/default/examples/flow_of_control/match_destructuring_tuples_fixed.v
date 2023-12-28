(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let triple = (0, -2, 3);
    // TODO ^ Try different values for `triple`

    println!("Tell me about {:?}", triple);
    // Match can be used to destructure a tuple
    match triple {
        // Destructure the second and third elements
        (0, y, z) => println!("First is `0`, `y` is {:?}, and `z` is {:?}", y, z),
        (1, _, _) => println!("First is `1` and the rest doesn't matter"),
        (.., 2) => println!("last is `2` and the rest doesn't matter"),
        (3, _, 4) => println!("First is `3`, last is `4`, and the rest doesn't matter"),
        // `..` can be used to ignore the rest of the tuple
        _ => println!("It doesn't matter what they are"),
        // `_` means don't bind the value to a variable
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* triple : M.Val ((i32.t * i32.t) * i32.t) :=
    M.alloc (Integer.of_Z 0, Integer.of_Z (-2), Integer.of_Z 3) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Tell me about ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow triple)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : (i32.t * i32.t) * i32.t := M.read triple in
  let* α0 : M.Val unit :=
    match_operator
      α0
      [
        fun α =>
          match α with
          | (_, y, z) =>
            let* y := M.alloc y in
            let* z := M.alloc z in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "First is `0`, `y` is ") in
              let* α1 : ref str.t := M.read (mk_str ", and `z` is ") in
              let* α2 : ref str.t := M.read (mk_str "
") in
              let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
              let* α4 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α3) in
              let* α5 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α4) in
              let* α6 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow y)) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow z)) in
              let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α6; α7 ] in
              let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α8) in
              let* α10 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α9) in
              let* α11 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
              let* α12 : unit := M.call (std.io.stdio._print α11) in
              M.alloc α12 in
            M.alloc tt
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | (_, _, _) =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "First is `1` and the rest doesn't matter
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | (_) =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "last is `2` and the rest doesn't matter
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | (_, _, _) =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read
                  (mk_str
                    "First is `3`, last is `4`, and the rest doesn't matter
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | _ =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t :=
                M.read (mk_str "It doesn't matter what they are
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          end :
          M (M.Val unit)
      ] in
  M.read α0.
