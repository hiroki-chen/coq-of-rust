(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* n := M.alloc 5 in
  let* _ :=
    let* α0 := M.alloc 0 in
    let* α1 := lt n α0 in
    let* α2 := use α1 in
    if (α2 : bool) then
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow [ mk_str ""; mk_str " is negative" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow n i32 in
          let* α5 := deref α4 i32 in
          let* α6 := borrow α5 i32 in
          let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
          let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
          let* α9 := deref α8 (list core.fmt.rt.Argument) in
          let* α10 := borrow α9 (list core.fmt.rt.Argument) in
          let* α11 := pointer_coercion "Unsize" α10 in
          let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
          std.io.stdio._print α12 in
        M.alloc tt in
      M.alloc tt
    else
      let* α0 := M.alloc 0 in
      let* α1 := gt n α0 in
      let* α2 := use α1 in
      if (α2 : bool) then
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow [ mk_str ""; mk_str " is positive" ] (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := borrow n i32 in
            let* α5 := deref α4 i32 in
            let* α6 := borrow α5 i32 in
            let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
            let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
            let* α9 := deref α8 (list core.fmt.rt.Argument) in
            let* α10 := borrow α9 (list core.fmt.rt.Argument) in
            let* α11 := pointer_coercion "Unsize" α10 in
            let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
            std.io.stdio._print α12 in
          M.alloc tt in
        M.alloc tt
      else
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow [ mk_str ""; mk_str " is zero" ] (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := borrow n i32 in
            let* α5 := deref α4 i32 in
            let* α6 := borrow α5 i32 in
            let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
            let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
            let* α9 := deref α8 (list core.fmt.rt.Argument) in
            let* α10 := borrow α9 (list core.fmt.rt.Argument) in
            let* α11 := pointer_coercion "Unsize" α10 in
            let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
            std.io.stdio._print α12 in
          M.alloc tt in
        M.alloc tt in
  let* big_n :=
    let* α0 := M.alloc 10 in
    let* α1 := lt n α0 in
    let* α2 := M.alloc (- 10) in
    let* α3 := gt n α2 in
    let* α4 := and α1 α3 in
    let* α5 := use α4 in
    if (α5 : bool) then
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow
              [ mk_str ", and is a small number, increase ten-fold
" ]
              (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := core.fmt.Arguments::["new_const"] α3 in
          std.io.stdio._print α4 in
        M.alloc tt in
      let* α0 := M.alloc 10 in
      mul α0 n
    else
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow
              [ mk_str ", and is a big number, halve the number
" ]
              (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := core.fmt.Arguments::["new_const"] α3 in
          std.io.stdio._print α4 in
        M.alloc tt in
      let* α0 := M.alloc 2 in
      div n α0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str ""; mk_str " -> "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow n i32 in
      let* α5 := deref α4 i32 in
      let* α6 := borrow α5 i32 in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow big_n i32 in
      let* α9 := deref α8 i32 in
      let* α10 := borrow α9 i32 in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt in
  M.alloc tt.
