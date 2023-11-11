(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* reference : ltac:(refine (M.Val (ref i32.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 4 in
      borrow α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 := M.read reference in
      match α0 with
      | val =>
        let* val := M.alloc val in
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Got a value via destructuring: "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow val in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_debug"] α3 in
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
        M.alloc tt
      end in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := deref reference in
      let* α1 := M.read α0 in
      match α1 with
      | val =>
        let* val := M.alloc val in
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Got a value via dereferencing: "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow val in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_debug"] α3 in
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
        M.alloc tt
      end in
    let* _not_a_reference : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
    let* _is_a_reference : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
    let* value : ltac:(refine (M.Val i32.t)) := M.alloc 5 in
    let* mut_value : ltac:(refine (M.Val i32.t)) := M.alloc 6 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 := M.read value in
      match α0 with
      | r =>
        let* r := M.alloc r in
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Got a reference to a value: "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref (ref i32.t)))) := borrow r in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_debug"] α3 in
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
        M.alloc tt
      end in
    let* α0 := M.read mut_value in
    match α0 with
    | m =>
      let* m := M.alloc m in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val i32.t)) := deref m in
        let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 10 in
        assign_op add α0 α1 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "We added 10. `mut_value`: "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref (mut_ref i32.t)))) := borrow m in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_debug"] α3 in
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
      M.alloc tt
    end).
