(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* count : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Let's count until infinity!
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    loop
      (let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 1 in
        assign_op add count α0 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 3 in
        let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq count α0 in
        let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
        let* α3 := M.read α2 in
        if (α3 : bool) then
          let* _ : ltac:(refine (M.Val unit)) :=
            let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                M.alloc [ mk_str "three
" ] in
              let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                borrow α0 in
              let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                pointer_coercion "Unsize" α1 in
              let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                core.fmt.Arguments.t::["new_const"] α2 in
              std.io.stdio._print α3 in
            M.alloc tt in
          let* _ : ltac:(refine (M.Val never.t)) := Continue in
          let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str ""; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref u32.t))) := borrow count in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_display"] α3 in
          let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
            M.alloc [ α4 ] in
          let* α6 :
              ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
            borrow α5 in
          let* α7 :
              ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
            pointer_coercion "Unsize" α6 in
          let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_v1"] α2 α7 in
          std.io.stdio._print α8 in
        M.alloc tt in
      let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 5 in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq count α0 in
      let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
      let* α3 := M.read α2 in
      if (α3 : bool) then
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
              M.alloc [ mk_str "OK, that's enough
" ] in
            let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
              pointer_coercion "Unsize" α1 in
            let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
              core.fmt.Arguments.t::["new_const"] α2 in
            std.io.stdio._print α3 in
          M.alloc tt in
        let* _ : ltac:(refine (M.Val never.t)) := Break in
        let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt)).
