(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* _ :=
    let* _ :=
      let* α0 := borrow [ ""; " and "; " is "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow "1i32 + 1 == 2i32" (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow "2i32 * 2 == 4i32" (ref str) in
      let* α9 := deref α8 (ref str) in
      let* α10 := borrow α9 (ref str) in
      let* α11 := core.fmt.rt.Argument::["new_debug"] α10 in
      let* α12 := add 1 1 in
      let* α13 := eq α12 2 in
      let* α14 := mul 2 2 in
      let* α15 := eq α14 4 in
      let* α16 := and α13 α15 in
      let* α17 := borrow α16 bool in
      let* α18 := deref α17 bool in
      let* α19 := borrow α18 bool in
      let* α20 := core.fmt.rt.Argument::["new_debug"] α19 in
      let* α21 := borrow [ α7; α11; α20 ] (list core.fmt.rt.Argument) in
      let* α22 := deref α21 (list core.fmt.rt.Argument) in
      let* α23 := borrow α22 (list core.fmt.rt.Argument) in
      let* α24 := pointer_coercion "Unsize" α23 in
      let* α25 := core.fmt.Arguments::["new_v1"] α3 α24 in
      std.io.stdio._print α25 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ ""; " or "; " is "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow "true" (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow "false" (ref str) in
      let* α9 := deref α8 (ref str) in
      let* α10 := borrow α9 (ref str) in
      let* α11 := core.fmt.rt.Argument::["new_debug"] α10 in
      let* α12 := or true false in
      let* α13 := borrow α12 bool in
      let* α14 := deref α13 bool in
      let* α15 := borrow α14 bool in
      let* α16 := core.fmt.rt.Argument::["new_debug"] α15 in
      let* α17 := borrow [ α7; α11; α16 ] (list core.fmt.rt.Argument) in
      let* α18 := deref α17 (list core.fmt.rt.Argument) in
      let* α19 := borrow α18 (list core.fmt.rt.Argument) in
      let* α20 := pointer_coercion "Unsize" α19 in
      let* α21 := core.fmt.Arguments::["new_v1"] α3 α20 in
      std.io.stdio._print α21 in
    Pure tt in
  Pure tt.
