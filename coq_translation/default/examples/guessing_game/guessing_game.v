(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition gen_range : M (M.Val u32.t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val never.t)) :=
      core.panicking.panic (mk_str "not yet implemented") in
    never_to_any α0).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Guess the number!
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* secret_number : ltac:(refine (M.Val u32.t)) :=
      guessing_game.gen_range in
    loop
      (let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Please input your guess.
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt in
      let* guess : ltac:(refine (M.Val alloc.string.String.t)) :=
        alloc.string.String.t::["new"] in
      let* _ : ltac:(refine (M.Val usize.t)) :=
        let* α0 : ltac:(refine (M.Val std.io.stdio.Stdin.t)) :=
          std.io.stdio.stdin in
        let* α1 : ltac:(refine (M.Val (ref std.io.stdio.Stdin.t))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (mut_ref alloc.string.String.t))) :=
          borrow_mut guess in
        let* α3 :
            ltac:(refine
              (M.Val (core.result.Result.t usize.t std.io.error.Error.t))) :=
          std.io.stdio.Stdin.t::["read_line"] α1 α2 in
        let* α4 : ltac:(refine (M.Val str)) :=
          deref (mk_str "Failed to read line") in
        let* α5 : ltac:(refine (M.Val (ref str))) := borrow α4 in
        (core.result.Result.t usize.t std.io.error.Error.t)::["expect"] α3 α5 in
      let* guess : ltac:(refine (M.Val u32.t)) :=
        let* α0 : ltac:(refine (M.Val (ref alloc.string.String.t))) :=
          borrow guess in
        let* α1 : ltac:(refine (M.Val (ref str))) :=
          (core.ops.deref.Deref.deref
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            α0 in
        let* α2 : ltac:(refine (M.Val str)) := deref α1 in
        let* α3 : ltac:(refine (M.Val (ref str))) := borrow α2 in
        let* α4 : ltac:(refine (M.Val (ref str))) := str::["trim"] α3 in
        let* α5 : ltac:(refine (M.Val str)) := deref α4 in
        let* α6 : ltac:(refine (M.Val (ref str))) := borrow α5 in
        let* α7 :
            ltac:(refine
              (M.Val
                (core.result.Result.t u32.t core.num.error.ParseIntError.t))) :=
          str::["parse"] α6 in
        let* α8 := M.read α7 in
        match α8 with
        | core.result.Result.Ok num =>
          let* num := M.alloc num in
          M.pure num
        | core.result.Result.Err _ =>
          let* α0 : ltac:(refine (M.Val never.t)) := Continue in
          never_to_any α0
        end in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "You guessed: "; mk_str "
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref u32.t))) := borrow guess in
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
      let* α0 : ltac:(refine (M.Val (ref u32.t))) := borrow guess in
      let* α1 : ltac:(refine (M.Val (ref u32.t))) := borrow secret_number in
      let* α2 : ltac:(refine (M.Val core.cmp.Ordering.t)) :=
        (core.cmp.Ord.cmp (Self := u32.t) (Trait := ltac:(refine _))) α0 α1 in
      let* α3 := M.read α2 in
      match α3 with
      | core.cmp.Ordering.Less  =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Too small!
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      | core.cmp.Ordering.Greater  =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "Too big!
" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_const"] α2 in
          std.io.stdio._print α3 in
        M.alloc tt
      | core.cmp.Ordering.Equal  =>
        let* _ : ltac:(refine (M.Val unit)) :=
          let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
              M.alloc [ mk_str "You win!
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
      end)).
