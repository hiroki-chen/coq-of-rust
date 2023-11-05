(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition analyze_slice
    `{ℋ : State.Trait}
    (slice : ref (slice i32))
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "first element of the slice: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (slice i32)) := deref slice in
        let* α6 : ltac:(refine (ref i32)) := borrow α5[M.alloc 0] in
        let* α7 : ltac:(refine i32) := deref α6 in
        let* α8 : ltac:(refine (ref i32)) := borrow α7 in
        let* α9 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α8 in
        let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α9 ] in
        let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) := deref α11 in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α14 in
        std.io.stdio._print α15 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "the slice has "; mk_str " elements
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (slice i32)) := deref slice in
        let* α6 : ltac:(refine (ref (slice i32))) := borrow α5 in
        let* α7 : ltac:(refine usize) := (slice i32)::["len"] α6 in
        let* α8 : ltac:(refine (ref usize)) := borrow α7 in
        let* α9 : ltac:(refine usize) := deref α8 in
        let* α10 : ltac:(refine (ref usize)) := borrow α9 in
        let* α11 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α11 ] in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (array core.fmt.rt.Argument)) := deref α13 in
        let* α15 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α14 in
        let* α16 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α15 in
        let* α17 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α16 in
        std.io.stdio._print α17 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* xs : ltac:(refine (array i32)) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 2 in
      let* α2 : ltac:(refine i32) := M.alloc 3 in
      let* α3 : ltac:(refine i32) := M.alloc 4 in
      let* α4 : ltac:(refine i32) := M.alloc 5 in
      M.alloc [ α0; α1; α2; α3; α4 ] in
    let* ys : ltac:(refine (array i32)) :=
      let* α0 : ltac:(refine i32) := M.alloc 0 in
      repeat α0 500 in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "first element of the array: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow xs[M.alloc 0] in
        let* α6 : ltac:(refine i32) := deref α5 in
        let* α7 : ltac:(refine (ref i32)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "second element of the array: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref i32)) := borrow xs[M.alloc 1] in
        let* α6 : ltac:(refine i32) := deref α5 in
        let* α7 : ltac:(refine (ref i32)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "number of elements in array: "; mk_str "
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (array i32))) := borrow xs in
        let* α6 : ltac:(refine (ref (slice i32))) :=
          pointer_coercion "Unsize" α5 in
        let* α7 : ltac:(refine usize) := (slice i32)::["len"] α6 in
        let* α8 : ltac:(refine (ref usize)) := borrow α7 in
        let* α9 : ltac:(refine usize) := deref α8 in
        let* α10 : ltac:(refine (ref usize)) := borrow α9 in
        let* α11 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α10 in
        let* α12 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α11 ] in
        let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α12 in
        let* α14 : ltac:(refine (array core.fmt.rt.Argument)) := deref α13 in
        let* α15 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α14 in
        let* α16 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α15 in
        let* α17 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α16 in
        std.io.stdio._print α17 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "array occupies "; mk_str " bytes
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (array i32))) := borrow xs in
        let* α6 : ltac:(refine (array i32)) := deref α5 in
        let* α7 : ltac:(refine (ref (array i32))) := borrow α6 in
        let* α8 : ltac:(refine usize) := core.mem.size_of_val α7 in
        let* α9 : ltac:(refine (ref usize)) := borrow α8 in
        let* α10 : ltac:(refine usize) := deref α9 in
        let* α11 : ltac:(refine (ref usize)) := borrow α10 in
        let* α12 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α11 in
        let* α13 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α12 ] in
        let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α13 in
        let* α15 : ltac:(refine (array core.fmt.rt.Argument)) := deref α14 in
        let* α16 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α15 in
        let* α17 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α17 in
        std.io.stdio._print α18 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "borrow the whole array as a slice
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
      let* α0 : ltac:(refine (ref (array i32))) := borrow xs in
      let* α1 : ltac:(refine (array i32)) := deref α0 in
      let* α2 : ltac:(refine (ref (array i32))) := borrow α1 in
      let* α3 : ltac:(refine (ref (slice i32))) :=
        pointer_coercion "Unsize" α2 in
      arrays_and_slices.analyze_slice α3 in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "borrow a section of the array as a slice
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
      let* α0 : ltac:(refine (ref (array i32))) := borrow ys in
      let* α1 : ltac:(refine usize) := M.alloc 1 in
      let* α2 : ltac:(refine usize) := M.alloc 4 in
      let* α3 : ltac:(refine (core.ops.range.Range usize)) :=
        M.alloc
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α2;
          |} in
      let* α4 : ltac:(refine (ref (slice i32))) :=
        (core.ops.index.Index.index
            (Self := array i32)
            (Trait := ltac:(refine _)))
          α0
          α3 in
      let* α5 : ltac:(refine (slice i32)) := deref α4 in
      let* α6 : ltac:(refine (ref (slice i32))) := borrow α5 in
      let* α7 : ltac:(refine (slice i32)) := deref α6 in
      let* α8 : ltac:(refine (ref (slice i32))) := borrow α7 in
      arrays_and_slices.analyze_slice α8 in
    let* empty_array : ltac:(refine (array u32)) := M.alloc [ ] in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (array u32))) := borrow empty_array in
      let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
      let* α2 : ltac:(refine (array u32)) := M.alloc [ ] in
      let* α3 : ltac:(refine (ref (array u32))) := borrow α2 in
      let* α4 : ltac:(refine (ref (ref (array u32)))) := borrow α3 in
      let*
          α5 :
          ltac:(refine
            (M.Val ((ref (ref (array u32))) * (ref (ref (array u32)))))) :=
        M.alloc (α1, α4) in
      let* α6 := M.read α5 in
      match α6 with
      | (left_val, right_val) =>
        let* α0 : ltac:(refine (ref (array u32))) := deref left_val in
        let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (array u32))) := deref right_val in
        let* α3 : ltac:(refine (ref (ref (array u32)))) := borrow α2 in
        let* α4 : ltac:(refine bool) :=
          (core.cmp.PartialEq.eq
              (Self := ref (array u32))
              (Trait := ltac:(refine _)))
            α1
            α3 in
        let* α5 : ltac:(refine bool) := UnOp.not α4 in
        let* α6 : ltac:(refine bool) := use α5 in
        if (α6 : bool) then
          let* kind : ltac:(refine core.panicking.AssertKind) :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : ltac:(refine never) :=
            let* α0 : ltac:(refine (ref (array u32))) := deref left_val in
            let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
            let* α2 : ltac:(refine (ref (array u32))) := deref α1 in
            let* α3 : ltac:(refine (ref (ref (array u32)))) := borrow α2 in
            let* α4 : ltac:(refine (ref (array u32))) := deref right_val in
            let* α5 : ltac:(refine (ref (ref (array u32)))) := borrow α4 in
            let* α6 : ltac:(refine (ref (array u32))) := deref α5 in
            let* α7 : ltac:(refine (ref (ref (array u32)))) := borrow α6 in
            let* α8 : ltac:(refine (core.option.Option core.fmt.Arguments)) :=
              M.alloc core.option.Option.None in
            core.panicking.assert_failed kind α3 α7 α8 in
          let* α0 : ltac:(refine unit) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (array u32))) := borrow empty_array in
      let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
      let* α2 : ltac:(refine (array u32)) := M.alloc [ ] in
      let* α3 : ltac:(refine (ref (array u32))) := borrow α2 in
      let* α4 : ltac:(refine core.ops.range.RangeFull) :=
        M.alloc core.ops.range.RangeFull.Build_t in
      let* α5 : ltac:(refine (ref (slice u32))) :=
        (core.ops.index.Index.index
            (Self := array u32)
            (Trait := ltac:(refine _)))
          α3
          α4 in
      let* α6 : ltac:(refine (slice u32)) := deref α5 in
      let* α7 : ltac:(refine (ref (slice u32))) := borrow α6 in
      let* α8 : ltac:(refine (ref (ref (slice u32)))) := borrow α7 in
      let*
          α9 :
          ltac:(refine
            (M.Val ((ref (ref (array u32))) * (ref (ref (slice u32)))))) :=
        M.alloc (α1, α8) in
      let* α10 := M.read α9 in
      match α10 with
      | (left_val, right_val) =>
        let* α0 : ltac:(refine (ref (array u32))) := deref left_val in
        let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
        let* α2 : ltac:(refine (ref (slice u32))) := deref right_val in
        let* α3 : ltac:(refine (ref (ref (slice u32)))) := borrow α2 in
        let* α4 : ltac:(refine bool) :=
          (core.cmp.PartialEq.eq
              (Self := ref (array u32))
              (Trait := ltac:(refine _)))
            α1
            α3 in
        let* α5 : ltac:(refine bool) := UnOp.not α4 in
        let* α6 : ltac:(refine bool) := use α5 in
        if (α6 : bool) then
          let* kind : ltac:(refine core.panicking.AssertKind) :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : ltac:(refine never) :=
            let* α0 : ltac:(refine (ref (array u32))) := deref left_val in
            let* α1 : ltac:(refine (ref (ref (array u32)))) := borrow α0 in
            let* α2 : ltac:(refine (ref (array u32))) := deref α1 in
            let* α3 : ltac:(refine (ref (ref (array u32)))) := borrow α2 in
            let* α4 : ltac:(refine (ref (slice u32))) := deref right_val in
            let* α5 : ltac:(refine (ref (ref (slice u32)))) := borrow α4 in
            let* α6 : ltac:(refine (ref (slice u32))) := deref α5 in
            let* α7 : ltac:(refine (ref (ref (slice u32)))) := borrow α6 in
            let* α8 : ltac:(refine (core.option.Option core.fmt.Arguments)) :=
              M.alloc core.option.Option.None in
            core.panicking.assert_failed kind α3 α7 α8 in
          let* α0 : ltac:(refine unit) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    let* α0 : ltac:(refine usize) := M.alloc 0 in
    let* α1 : ltac:(refine (ref (array i32))) := borrow xs in
    let* α2 : ltac:(refine (ref (slice i32))) := pointer_coercion "Unsize" α1 in
    let* α3 : ltac:(refine usize) := (slice i32)::["len"] α2 in
    let* α4 : ltac:(refine usize) := M.alloc 1 in
    let* α5 : ltac:(refine usize) := BinOp.add α3 α4 in
    let* α6 : ltac:(refine (core.ops.range.Range usize)) :=
      M.alloc
        {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α5;
        |} in
    let* α7 : ltac:(refine (core.ops.range.Range usize)) :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range usize)
          (Trait := ltac:(refine _)))
        α6 in
    let* α8 := M.read α7 in
    let* α9 : ltac:(refine unit) :=
      match α8 with
      | iter =>
        loop
          (let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine (mut_ref (core.ops.range.Range usize))) :=
              borrow_mut iter in
            let* α1 : ltac:(refine (core.ops.range.Range usize)) := deref α0 in
            let* α2 : ltac:(refine (mut_ref (core.ops.range.Range usize))) :=
              borrow_mut α1 in
            let* α3 : ltac:(refine (core.option.Option usize)) :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range usize)
                  (Trait := ltac:(refine _)))
                α2 in
            let* α4 := M.read α3 in
            match α4 with
            | core.option.Option  =>
              let* α0 : ltac:(refine never) := Break in
              never_to_any α0
            | core.option.Option i =>
              let* α0 : ltac:(refine (ref (array i32))) := borrow xs in
              let* α1 : ltac:(refine (ref (slice i32))) :=
                pointer_coercion "Unsize" α0 in
              let* α2 : ltac:(refine (core.option.Option (ref i32))) :=
                (slice i32)::["get"] α1 i in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option xval =>
                let* _ : ltac:(refine unit) :=
                  let* α0 : ltac:(refine (array (ref str))) :=
                    M.alloc [ mk_str ""; mk_str ": "; mk_str "
" ] in
                  let* α1 : ltac:(refine (ref (array (ref str)))) :=
                    borrow α0 in
                  let* α2 : ltac:(refine (array (ref str))) := deref α1 in
                  let* α3 : ltac:(refine (ref (array (ref str)))) :=
                    borrow α2 in
                  let* α4 : ltac:(refine (ref (slice (ref str)))) :=
                    pointer_coercion "Unsize" α3 in
                  let* α5 : ltac:(refine (ref usize)) := borrow i in
                  let* α6 : ltac:(refine usize) := deref α5 in
                  let* α7 : ltac:(refine (ref usize)) := borrow α6 in
                  let* α8 : ltac:(refine core.fmt.rt.Argument) :=
                    core.fmt.rt.Argument::["new_display"] α7 in
                  let* α9 : ltac:(refine (ref (ref i32))) := borrow xval in
                  let* α10 : ltac:(refine (ref i32)) := deref α9 in
                  let* α11 : ltac:(refine (ref (ref i32))) := borrow α10 in
                  let* α12 : ltac:(refine core.fmt.rt.Argument) :=
                    core.fmt.rt.Argument::["new_display"] α11 in
                  let* α13 : ltac:(refine (array core.fmt.rt.Argument)) :=
                    M.alloc [ α8; α12 ] in
                  let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
                    borrow α13 in
                  let* α15 : ltac:(refine (array core.fmt.rt.Argument)) :=
                    deref α14 in
                  let* α16 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
                    borrow α15 in
                  let* α17 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
                    pointer_coercion "Unsize" α16 in
                  let* α18 : ltac:(refine core.fmt.Arguments) :=
                    core.fmt.Arguments::["new_v1"] α4 α17 in
                  std.io.stdio._print α18 in
                M.alloc tt
              | core.option.Option  =>
                let* _ : ltac:(refine unit) :=
                  let* α0 : ltac:(refine (array (ref str))) :=
                    M.alloc [ mk_str "Slow down! "; mk_str " is too far!
" ] in
                  let* α1 : ltac:(refine (ref (array (ref str)))) :=
                    borrow α0 in
                  let* α2 : ltac:(refine (array (ref str))) := deref α1 in
                  let* α3 : ltac:(refine (ref (array (ref str)))) :=
                    borrow α2 in
                  let* α4 : ltac:(refine (ref (slice (ref str)))) :=
                    pointer_coercion "Unsize" α3 in
                  let* α5 : ltac:(refine (ref usize)) := borrow i in
                  let* α6 : ltac:(refine usize) := deref α5 in
                  let* α7 : ltac:(refine (ref usize)) := borrow α6 in
                  let* α8 : ltac:(refine core.fmt.rt.Argument) :=
                    core.fmt.rt.Argument::["new_display"] α7 in
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
                M.alloc tt
              end
            end in
          M.alloc tt)
      end in
    use α9).
