(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* optional : ltac:(refine (core.option.Option i32)) :=
      let* α0 : ltac:(refine i32) := M.alloc 0 in
      M.alloc (core.option.Option.Some α0) in
    loop
      (let* α0 := M.read optional in
      match α0 with
      | core.option.Option i =>
        let* α0 : ltac:(refine i32) := M.alloc 9 in
        let* α1 : ltac:(refine bool) := BinOp.gt i α0 in
        let* α2 : ltac:(refine bool) := use α1 in
        if (α2 : bool) then
          let* _ : ltac:(refine unit) :=
            let* _ : ltac:(refine unit) :=
              let* α0 : ltac:(refine (array (ref str))) :=
                M.alloc [ mk_str "Greater than 9, quit!
" ] in
              let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
              let* α2 : ltac:(refine (array (ref str))) := deref α1 in
              let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
              let* α4 : ltac:(refine (ref (slice (ref str)))) :=
                pointer_coercion "Unsize" α3 in
              let* α5 : ltac:(refine core.fmt.Arguments) :=
                core.fmt.Arguments::["new_const"] α4 in
              std.io.stdio._print α5 in
            M.alloc tt in
          let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine (core.option.Option i32)) :=
              M.alloc core.option.Option.None in
            assign optional α0 in
          M.alloc tt
        else
          let* _ : ltac:(refine unit) :=
            let* _ : ltac:(refine unit) :=
              let* α0 : ltac:(refine (array (ref str))) :=
                M.alloc [ mk_str "`i` is `"; mk_str "`. Try again.
" ] in
              let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
              let* α2 : ltac:(refine (array (ref str))) := deref α1 in
              let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
              let* α4 : ltac:(refine (ref (slice (ref str)))) :=
                pointer_coercion "Unsize" α3 in
              let* α5 : ltac:(refine (ref i32)) := borrow i in
              let* α6 : ltac:(refine i32) := deref α5 in
              let* α7 : ltac:(refine (ref i32)) := borrow α6 in
              let* α8 : ltac:(refine core.fmt.rt.Argument) :=
                core.fmt.rt.Argument::["new_debug"] α7 in
              let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
                M.alloc [ α8 ] in
              let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
                borrow α9 in
              let* α11 : ltac:(refine (array core.fmt.rt.Argument)) :=
                deref α10 in
              let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
                borrow α11 in
              let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
                pointer_coercion "Unsize" α12 in
              let* α14 : ltac:(refine core.fmt.Arguments) :=
                core.fmt.Arguments::["new_v1"] α4 α13 in
              std.io.stdio._print α14 in
            M.alloc tt in
          let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine i32) := M.alloc 1 in
            let* α1 : ltac:(refine i32) := BinOp.add i α0 in
            let* α2 : ltac:(refine (core.option.Option i32)) :=
              M.alloc (core.option.Option.Some α1) in
            assign optional α2 in
          M.alloc tt
      | _ =>
        let* _ : ltac:(refine never) := Break in
        let* α0 : ltac:(refine unit) := M.alloc tt in
        never_to_any α0
      end)).
