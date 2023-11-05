(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* vec : ltac:(refine (alloc.vec.Vec i32 alloc.alloc.Global)) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 9 in
      let* α2 : ltac:(refine i32) := M.alloc 3 in
      let* α3 : ltac:(refine i32) := M.alloc 3 in
      let* α4 : ltac:(refine i32) := M.alloc 13 in
      let* α5 : ltac:(refine i32) := M.alloc 2 in
      let* α6 : ltac:(refine (array i32)) :=
        M.alloc [ α0; α1; α2; α3; α4; α5 ] in
      let*
          α7 :
          ltac:(refine (alloc.boxed.Box (array i32) alloc.alloc.Global)) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α6 in
      let*
          α8 :
          ltac:(refine (alloc.boxed.Box (slice i32) alloc.alloc.Global)) :=
        pointer_coercion "Unsize" α7 in
      (slice i32)::["into_vec"] α8 in
    let*
        index_of_first_even_number :
        ltac:(refine (core.option.Option usize)) :=
      let* α0 : ltac:(refine (ref (alloc.vec.Vec i32 alloc.alloc.Global))) :=
        borrow vec in
      let* α1 : ltac:(refine (ref (slice i32))) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec i32 alloc.alloc.Global)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : ltac:(refine (slice i32)) := deref α1 in
      let* α3 : ltac:(refine (ref (slice i32))) := borrow α2 in
      let* α4 : ltac:(refine (core.slice.iter.Iter i32)) :=
        (slice i32)::["iter"] α3 in
      let* α5 : ltac:(refine (mut_ref (core.slice.iter.Iter i32))) :=
        borrow_mut α4 in
      (core.iter.traits.iterator.Iterator.position
          (Self := core.slice.iter.Iter i32)
          (Trait := ltac:(refine _)))
        α5
        (let* α0 : ltac:(refine i32) := M.alloc 2 in
        let* α1 : ltac:(refine i32) := BinOp.rem x α0 in
        let* α2 : ltac:(refine i32) := M.alloc 0 in
        BinOp.eq α1 α2) in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (core.option.Option usize))) :=
        borrow index_of_first_even_number in
      let* α1 : ltac:(refine usize) := M.alloc 5 in
      let* α2 : ltac:(refine (core.option.Option usize)) :=
        M.alloc (core.option.Option.Some α1) in
      let* α3 : ltac:(refine (ref (core.option.Option usize))) := borrow α2 in
      let*
          α4 :
          ltac:(refine
            (M.Val
              ((ref (core.option.Option usize)) *
                (ref (core.option.Option usize))))) :=
        M.alloc (α0, α3) in
      let* α5 := M.read α4 in
      match α5 with
      | (left_val, right_val) =>
        let* α0 : ltac:(refine (core.option.Option usize)) := deref left_val in
        let* α1 : ltac:(refine (ref (core.option.Option usize))) := borrow α0 in
        let* α2 : ltac:(refine (core.option.Option usize)) := deref right_val in
        let* α3 : ltac:(refine (ref (core.option.Option usize))) := borrow α2 in
        let* α4 : ltac:(refine bool) :=
          (core.cmp.PartialEq.eq
              (Self := core.option.Option usize)
              (Trait := ltac:(refine _)))
            α1
            α3 in
        let* α5 : ltac:(refine bool) := UnOp.not α4 in
        let* α6 : ltac:(refine bool) := use α5 in
        if (α6 : bool) then
          let* kind : ltac:(refine core.panicking.AssertKind) :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : ltac:(refine never) :=
            let* α0 : ltac:(refine (core.option.Option usize)) :=
              deref left_val in
            let* α1 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α0 in
            let* α2 : ltac:(refine (core.option.Option usize)) := deref α1 in
            let* α3 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α2 in
            let* α4 : ltac:(refine (core.option.Option usize)) :=
              deref right_val in
            let* α5 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α4 in
            let* α6 : ltac:(refine (core.option.Option usize)) := deref α5 in
            let* α7 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α6 in
            let* α8 : ltac:(refine (core.option.Option core.fmt.Arguments)) :=
              M.alloc core.option.Option.None in
            core.panicking.assert_failed kind α3 α7 α8 in
          let* α0 : ltac:(refine unit) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let*
        index_of_first_negative_number :
        ltac:(refine (core.option.Option usize)) :=
      let*
          α0 :
          ltac:(refine (alloc.vec.into_iter.IntoIter i32 alloc.alloc.Global)) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := alloc.vec.Vec i32 alloc.alloc.Global)
            (Trait := ltac:(refine _)))
          vec in
      let*
          α1 :
          ltac:(refine
            (mut_ref (alloc.vec.into_iter.IntoIter i32 alloc.alloc.Global))) :=
        borrow_mut α0 in
      (core.iter.traits.iterator.Iterator.position
          (Self := alloc.vec.into_iter.IntoIter i32 alloc.alloc.Global)
          (Trait := ltac:(refine _)))
        α1
        (let* α0 : ltac:(refine i32) := M.alloc 0 in
        BinOp.lt x α0) in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (core.option.Option usize))) :=
        borrow index_of_first_negative_number in
      let* α1 : ltac:(refine (core.option.Option usize)) :=
        M.alloc core.option.Option.None in
      let* α2 : ltac:(refine (ref (core.option.Option usize))) := borrow α1 in
      let*
          α3 :
          ltac:(refine
            (M.Val
              ((ref (core.option.Option usize)) *
                (ref (core.option.Option usize))))) :=
        M.alloc (α0, α2) in
      let* α4 := M.read α3 in
      match α4 with
      | (left_val, right_val) =>
        let* α0 : ltac:(refine (core.option.Option usize)) := deref left_val in
        let* α1 : ltac:(refine (ref (core.option.Option usize))) := borrow α0 in
        let* α2 : ltac:(refine (core.option.Option usize)) := deref right_val in
        let* α3 : ltac:(refine (ref (core.option.Option usize))) := borrow α2 in
        let* α4 : ltac:(refine bool) :=
          (core.cmp.PartialEq.eq
              (Self := core.option.Option usize)
              (Trait := ltac:(refine _)))
            α1
            α3 in
        let* α5 : ltac:(refine bool) := UnOp.not α4 in
        let* α6 : ltac:(refine bool) := use α5 in
        if (α6 : bool) then
          let* kind : ltac:(refine core.panicking.AssertKind) :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : ltac:(refine never) :=
            let* α0 : ltac:(refine (core.option.Option usize)) :=
              deref left_val in
            let* α1 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α0 in
            let* α2 : ltac:(refine (core.option.Option usize)) := deref α1 in
            let* α3 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α2 in
            let* α4 : ltac:(refine (core.option.Option usize)) :=
              deref right_val in
            let* α5 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α4 in
            let* α6 : ltac:(refine (core.option.Option usize)) := deref α5 in
            let* α7 : ltac:(refine (ref (core.option.Option usize))) :=
              borrow α6 in
            let* α8 : ltac:(refine (core.option.Option core.fmt.Arguments)) :=
              M.alloc core.option.Option.None in
            core.panicking.assert_failed kind α3 α7 α8 in
          let* α0 : ltac:(refine unit) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    M.alloc tt).
