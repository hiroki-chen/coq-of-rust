(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* immutable_box :=
    let* α0 := M.alloc 5 in
    (alloc.boxed.Box _ alloc.alloc.Global)::["new"] α0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "immutable_box contains "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow immutable_box (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let mutable_box := immutable_box in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "mutable_box contains "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow mutable_box (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* α0 := deref mutable_box u32 in
    let* α1 := M.alloc 4 in
    assign α0 α1 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "mutable_box now contains "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow mutable_box (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.boxed.Box u32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
