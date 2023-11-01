(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* rc_examples :=
    let* α0 := deref (mk_str "Rc examples") str in
    let* α1 := borrow α0 str in
    (alloc.string.ToString.to_string (Self := str)) α1 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "--- rc_a is created ---
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* rc_a := (alloc.rc.Rc alloc.string.String)::["new"] rc_examples in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Reference Count of rc_a: "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
      let* α5 := deref α4 (alloc.rc.Rc alloc.string.String) in
      let* α6 := borrow α5 (alloc.rc.Rc alloc.string.String) in
      let* α7 := (alloc.rc.Rc alloc.string.String)::["strong_count"] α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "--- rc_a is cloned to rc_b ---
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt in
    let* rc_b :=
      let* α0 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
      let* α1 := deref α0 (alloc.rc.Rc alloc.string.String) in
      let* α2 := borrow α1 (alloc.rc.Rc alloc.string.String) in
      (core.clone.Clone.clone (Self := (alloc.rc.Rc alloc.string.String))) α2 in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "Reference Count of rc_b: "; mk_str "
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow rc_b (alloc.rc.Rc alloc.string.String) in
        let* α5 := deref α4 (alloc.rc.Rc alloc.string.String) in
        let* α6 := borrow α5 (alloc.rc.Rc alloc.string.String) in
        let* α7 := (alloc.rc.Rc alloc.string.String)::["strong_count"] α6 in
        let* α8 := borrow α7 usize in
        let* α9 := deref α8 usize in
        let* α10 := borrow α9 usize in
        let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
        let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
        let* α13 := deref α12 (list core.fmt.rt.Argument) in
        let* α14 := borrow α13 (list core.fmt.rt.Argument) in
        let* α15 := pointer_coercion "Unsize" α14 in
        let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
        std.io.stdio._print α16 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "Reference Count of rc_a: "; mk_str "
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
        let* α5 := deref α4 (alloc.rc.Rc alloc.string.String) in
        let* α6 := borrow α5 (alloc.rc.Rc alloc.string.String) in
        let* α7 := (alloc.rc.Rc alloc.string.String)::["strong_count"] α6 in
        let* α8 := borrow α7 usize in
        let* α9 := deref α8 usize in
        let* α10 := borrow α9 usize in
        let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
        let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
        let* α13 := deref α12 (list core.fmt.rt.Argument) in
        let* α14 := borrow α13 (list core.fmt.rt.Argument) in
        let* α15 := pointer_coercion "Unsize" α14 in
        let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
        std.io.stdio._print α16 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "rc_a and rc_b are equal: "; mk_str "
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
        let* α5 := borrow rc_b (alloc.rc.Rc alloc.string.String) in
        let* α6 := deref α5 (alloc.rc.Rc alloc.string.String) in
        let* α7 := borrow α6 (alloc.rc.Rc alloc.string.String) in
        let* α8 :=
          (core.cmp.PartialEq.eq (Self := (alloc.rc.Rc alloc.string.String)))
            α4
            α7 in
        let* α9 := borrow α8 bool in
        let* α10 := deref α9 bool in
        let* α11 := borrow α10 bool in
        let* α12 := core.fmt.rt.Argument::["new_display"] α11 in
        let* α13 := borrow [ α12 ] (list core.fmt.rt.Argument) in
        let* α14 := deref α13 (list core.fmt.rt.Argument) in
        let* α15 := borrow α14 (list core.fmt.rt.Argument) in
        let* α16 := pointer_coercion "Unsize" α15 in
        let* α17 := core.fmt.Arguments::["new_v1"] α3 α16 in
        std.io.stdio._print α17 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "Length of the value inside rc_a: "; mk_str "
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
        let* α5 :=
          (core.ops.deref.Deref.deref
              (Self := (alloc.rc.Rc alloc.string.String)))
            α4 in
        let* α6 := deref α5 alloc.string.String in
        let* α7 := borrow α6 alloc.string.String in
        let* α8 := alloc.string.String::["len"] α7 in
        let* α9 := borrow α8 usize in
        let* α10 := deref α9 usize in
        let* α11 := borrow α10 usize in
        let* α12 := core.fmt.rt.Argument::["new_display"] α11 in
        let* α13 := borrow [ α12 ] (list core.fmt.rt.Argument) in
        let* α14 := deref α13 (list core.fmt.rt.Argument) in
        let* α15 := borrow α14 (list core.fmt.rt.Argument) in
        let* α16 := pointer_coercion "Unsize" α15 in
        let* α17 := core.fmt.Arguments::["new_v1"] α3 α16 in
        std.io.stdio._print α17 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Value of rc_b: "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow rc_b (alloc.rc.Rc alloc.string.String) in
        let* α5 := deref α4 (alloc.rc.Rc alloc.string.String) in
        let* α6 := borrow α5 (alloc.rc.Rc alloc.string.String) in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow
            [ mk_str "--- rc_b is dropped out of scope ---
" ]
            (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "Reference Count of rc_a: "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow rc_a (alloc.rc.Rc alloc.string.String) in
      let* α5 := deref α4 (alloc.rc.Rc alloc.string.String) in
      let* α6 := borrow α5 (alloc.rc.Rc alloc.string.String) in
      let* α7 := (alloc.rc.Rc alloc.string.String)::["strong_count"] α6 in
      let* α8 := borrow α7 usize in
      let* α9 := deref α8 usize in
      let* α10 := borrow α9 usize in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "--- rc_a is dropped out of scope ---
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  M.alloc tt.
