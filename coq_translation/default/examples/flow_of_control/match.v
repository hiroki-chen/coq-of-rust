(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* number : ltac:(refine (M.Val i32.t)) := M.alloc 13 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Tell me about "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow number in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 := M.read number in
      match α0 with
      | _ =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "One!
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      | (_|_|_|_|_) =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "This is a prime
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      | _ =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "A teen
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      | _ =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Ain't special
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      end in
    let* boolean : ltac:(refine (M.Val bool.t)) := M.alloc true in
    let* binary : ltac:(refine (M.Val i32.t)) :=
      let* α0 := M.read boolean in
      match α0 with
      | _ => M.alloc 0
      | _ => M.alloc 1
      end in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str " -> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref bool.t))) := borrow boolean in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (ref i32.t))) := borrow binary in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4; α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    M.alloc tt).
