(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* name_buf := repeat 0 12 in
  let _ :=
    let _ := InlineAssembly in
    tt in
  let* name :=
    let* α0 := borrow name_buf (list u8) in
    let* α1 := deref α0 (list u8) in
    let* α2 := borrow α1 (list u8) in
    let* α3 := pointer_coercion "Unsize" α2 in
    let* α4 := core.str.converts.from_utf8 α3 in
    (core.result.Result _ _)::["unwrap"] α4 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "CPU Manufacturer ID: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow name (ref str) in
      let* α5 := deref α4 (ref str) in
      let* α6 := borrow α5 (ref str) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
