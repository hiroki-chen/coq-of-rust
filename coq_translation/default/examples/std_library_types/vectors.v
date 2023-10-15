(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* collected_iterator :=
    core.iter.traits.iterator.Iterator.collect
      {| core.ops.range.Range.start := 0; core.ops.range.Range.end := 10; |} in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Collected (0..10) into: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow collected_iterator (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* xs :=
    let* α0 :=
      (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] [ 1; 2; 3 ] in
    let* α1 := pointer_coercion "Unsize" α0 in
    (Slice _)::["into_vec"] α1 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Initial vector: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Push 4 into the vector
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* _ :=
    let* α0 := borrow_mut xs (alloc.vec.Vec i32 alloc.alloc.Global) in
    (alloc.vec.Vec _ _)::["push"] α0 4 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Vector: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Vector length: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := (alloc.vec.Vec _ _)::["len"] α4 in
      let* α6 := borrow α5 usize in
      let* α7 := deref α6 usize in
      let* α8 := borrow α7 usize in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
      let* α11 := deref α10 (list core.fmt.rt.Argument) in
      let* α12 := borrow α11 (list core.fmt.rt.Argument) in
      let* α13 := pointer_coercion "Unsize" α12 in
      let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
      std.io.stdio._print α14 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Second element: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := core.ops.index.Index.index α4 1 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := deref α7 i32 in
      let* α9 := borrow α8 i32 in
      let* α10 := core.fmt.rt.Argument::["new_display"] α9 in
      let* α11 := borrow [ α10 ] (list core.fmt.rt.Argument) in
      let* α12 := deref α11 (list core.fmt.rt.Argument) in
      let* α13 := borrow α12 (list core.fmt.rt.Argument) in
      let* α14 := pointer_coercion "Unsize" α13 in
      let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
      std.io.stdio._print α15 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Pop last element: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow_mut xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := (alloc.vec.Vec _ _)::["pop"] α4 in
      let* α6 := borrow α5 (core.option.Option i32) in
      let* α7 := deref α6 (core.option.Option i32) in
      let* α8 := borrow α7 (core.option.Option i32) in
      let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
      let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
      let* α11 := deref α10 (list core.fmt.rt.Argument) in
      let* α12 := borrow α11 (list core.fmt.rt.Argument) in
      let* α13 := pointer_coercion "Unsize" α12 in
      let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
      std.io.stdio._print α14 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Contents of xs:
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* _ :=
    let* α0 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
    let* α1 := core.ops.deref.Deref.deref α0 in
    let* α2 := deref α1 (Slice i32) in
    let* α3 := borrow α2 (Slice i32) in
    let* α4 := (Slice _)::["iter"] α3 in
    let* α5 := core.iter.traits.collect.IntoIterator.into_iter α4 in
    let* α6 :=
      match α5 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.slice.iter.Iter i32) in
            let* α1 := deref α0 (core.slice.iter.Iter i32) in
            let* α2 := borrow_mut α1 (core.slice.iter.Iter i32) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option x =>
              let* _ :=
                let* _ :=
                  let* α0 := borrow [ "> "; "
" ] (list (ref str)) in
                  let* α1 := deref α0 (list (ref str)) in
                  let* α2 := borrow α1 (list (ref str)) in
                  let* α3 := pointer_coercion "Unsize" α2 in
                  let* α4 := borrow x (ref i32) in
                  let* α5 := deref α4 (ref i32) in
                  let* α6 := borrow α5 (ref i32) in
                  let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                  let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
                  let* α9 := deref α8 (list core.fmt.rt.Argument) in
                  let* α10 := borrow α9 (list core.fmt.rt.Argument) in
                  let* α11 := pointer_coercion "Unsize" α10 in
                  let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
                  std.io.stdio._print α12 in
                Pure tt in
              Pure tt
            end in
          Pure tt)
      end in
    use α6 in
  let* _ :=
    let* α0 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
    let* α1 := core.ops.deref.Deref.deref α0 in
    let* α2 := deref α1 (Slice i32) in
    let* α3 := borrow α2 (Slice i32) in
    let* α4 := (Slice _)::["iter"] α3 in
    let* α5 := core.iter.traits.iterator.Iterator.enumerate α4 in
    let* α6 := core.iter.traits.collect.IntoIterator.into_iter α5 in
    let* α7 :=
      match α6 with
      | iter =>
        loop
          (let* _ :=
            let* α0 :=
              borrow_mut
                iter
                (core.iter.adapters.enumerate.Enumerate
                  (core.slice.iter.Iter i32)) in
            let* α1 :=
              deref
                α0
                (core.iter.adapters.enumerate.Enumerate
                  (core.slice.iter.Iter i32)) in
            let* α2 :=
              borrow_mut
                α1
                (core.iter.adapters.enumerate.Enumerate
                  (core.slice.iter.Iter i32)) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option (i, x) =>
              let* _ :=
                let* _ :=
                  let* α0 :=
                    borrow
                      [ "In position "; " we have value "; "
" ]
                      (list (ref str)) in
                  let* α1 := deref α0 (list (ref str)) in
                  let* α2 := borrow α1 (list (ref str)) in
                  let* α3 := pointer_coercion "Unsize" α2 in
                  let* α4 := borrow i usize in
                  let* α5 := deref α4 usize in
                  let* α6 := borrow α5 usize in
                  let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
                  let* α8 := borrow x (ref i32) in
                  let* α9 := deref α8 (ref i32) in
                  let* α10 := borrow α9 (ref i32) in
                  let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
                  let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
                  let* α13 := deref α12 (list core.fmt.rt.Argument) in
                  let* α14 := borrow α13 (list core.fmt.rt.Argument) in
                  let* α15 := pointer_coercion "Unsize" α14 in
                  let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
                  std.io.stdio._print α16 in
                Pure tt in
              Pure tt
            end in
          Pure tt)
      end in
    use α7 in
  let* _ :=
    let* α0 := borrow_mut xs (alloc.vec.Vec i32 alloc.alloc.Global) in
    let* α1 := core.ops.deref.DerefMut.deref_mut α0 in
    let* α2 := deref α1 (Slice i32) in
    let* α3 := borrow_mut α2 (Slice i32) in
    let* α4 := (Slice _)::["iter_mut"] α3 in
    let* α5 := core.iter.traits.collect.IntoIterator.into_iter α4 in
    let* α6 :=
      match α5 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.slice.iter.IterMut i32) in
            let* α1 := deref α0 (core.slice.iter.IterMut i32) in
            let* α2 := borrow_mut α1 (core.slice.iter.IterMut i32) in
            let* α3 := core.iter.traits.iterator.Iterator.next α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option x =>
              let* _ :=
                let* α0 := deref x i32 in
                assign_op mul α0 3 in
              Pure tt
            end in
          Pure tt)
      end in
    use α6 in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "Updated vector: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow xs (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α5 := deref α4 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α6 := borrow α5 (alloc.vec.Vec i32 alloc.alloc.Global) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
