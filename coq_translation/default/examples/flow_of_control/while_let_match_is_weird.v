(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* optional :=
    let* α0 := M.alloc 0 in
    Pure (core.option.Option.Some α0) in
  loop
    (match optional with
    | core.option.Option i =>
      let* α0 := M.alloc 9 in
      let* α1 := gt i α0 in
      let* α2 := use α1 in
      if (α2 : bool) then
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow [ mk_str "Greater than 9, quit!
" ] (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := core.fmt.Arguments::["new_const"] α3 in
            std.io.stdio._print α4 in
          M.alloc tt in
        let* _ := assign optional (core.option.Option.None tt) in
        M.alloc tt
      else
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow
                [ mk_str "`i` is `"; mk_str "`. Try again.
" ]
                (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := borrow i i32 in
            let* α5 := deref α4 i32 in
            let* α6 := borrow α5 i32 in
            let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
            let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
            let* α9 := deref α8 (list core.fmt.rt.Argument) in
            let* α10 := borrow α9 (list core.fmt.rt.Argument) in
            let* α11 := pointer_coercion "Unsize" α10 in
            let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
            std.io.stdio._print α12 in
          M.alloc tt in
        let* _ :=
          let* α0 := M.alloc 1 in
          let* α1 := add i α0 in
          assign optional (core.option.Option.Some α1) in
        M.alloc tt
    | _ =>
      let* _ := Break in
      let* α0 := M.alloc tt in
      never_to_any α0
    end).
