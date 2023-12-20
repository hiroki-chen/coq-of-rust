(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn analyze_slice(slice: &[i32]) {
    println!("first element of the slice: {}", slice[0]);
    println!("the slice has {} elements", slice.len());
}
*)
Definition analyze_slice (slice : ref (slice i32.t)) : M unit :=
  let* slice : M.Val (ref (slice i32.t)) := M.alloc slice in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "first element of the slice: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : ref (slice i32.t) := M.read slice in
      let* α6 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow (deref α5)[M.alloc (Integer.of_Z 0)])) in
      let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
      let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α7) in
      let* α9 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α8) in
      let* α10 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
      let* α11 : unit := M.call (std.io.stdio._print α10) in
      M.alloc α11 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "the slice has ") in
      let* α1 : ref str.t := M.read (mk_str " elements
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : ref (slice i32.t) := M.read slice in
      let* α6 : usize.t := M.call ((slice i32.t)::["len"] α5) in
      let* α7 : M.Val usize.t := M.alloc α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α7)) in
      let* α9 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α8 ] in
      let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α9) in
      let* α11 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α10) in
      let* α12 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α11) in
      let* α13 : unit := M.call (std.io.stdio._print α12) in
      M.alloc α13 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn main() {
    // Fixed-size array (type signature is superfluous)
    let xs: [i32; 5] = [1, 2, 3, 4, 5];

    // All elements can be initialized to the same value
    let ys: [i32; 500] = [0; 500];

    // Indexing starts at 0
    println!("first element of the array: {}", xs[0]);
    println!("second element of the array: {}", xs[1]);

    // `len` returns the count of elements in the array
    println!("number of elements in array: {}", xs.len());

    // Arrays are stack allocated
    println!("array occupies {} bytes", mem::size_of_val(&xs));

    // Arrays can be automatically borrowed as slices
    println!("borrow the whole array as a slice");
    analyze_slice(&xs);

    // Slices can point to a section of an array
    // They are of the form [starting_index..ending_index]
    // starting_index is the first position in the slice
    // ending_index is one more than the last position in the slice
    println!("borrow a section of the array as a slice");
    analyze_slice(&ys[1 .. 4]);

    // Example of empty slice `&[]`
    let empty_array: [u32; 0] = [];
    assert_eq!(&empty_array, &[]);
    assert_eq!(&empty_array, &[][..]); // same but more verbose

    // Arrays can be safely accessed using `.get`, which returns an
    // `Option`. This can be matched as shown below, or used with
    // `.expect()` if you would like the program to exit with a nice
    // message instead of happily continue.
    for i in 0..xs.len() + 1 { // OOPS, one element too far
        match xs.get(i) {
            Some(xval) => println!("{}: {}", i, xval),
            None => println!("Slow down! {} is too far!", i),
        }
    }

    // Out of bound indexing causes runtime error
    //println!("{}", xs[5]);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* xs : M.Val (array i32.t) :=
    M.alloc
      [
        Integer.of_Z 1;
        Integer.of_Z 2;
        Integer.of_Z 3;
        Integer.of_Z 4;
        Integer.of_Z 5
      ] in
  let* ys : M.Val (array i32.t) := M.alloc (repeat (Integer.of_Z 0) 500) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "first element of the array: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow xs[M.alloc (Integer.of_Z 0)])) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "second element of the array: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_display"]
            (borrow xs[M.alloc (Integer.of_Z 1)])) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "number of elements in array: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : M.Val (ref (array i32.t)) := M.alloc (borrow xs) in
      let* α6 : ref (slice i32.t) := M.read (pointer_coercion "Unsize" α5) in
      let* α7 : usize.t := M.call ((slice i32.t)::["len"] α6) in
      let* α8 : M.Val usize.t := M.alloc α7 in
      let* α9 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α8)) in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
      let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α10) in
      let* α12 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α11) in
      let* α13 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α12) in
      let* α14 : unit := M.call (std.io.stdio._print α13) in
      M.alloc α14 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "array occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t := M.call (core.mem.size_of_val (borrow xs)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t :=
        M.read (mk_str "borrow the whole array as a slice
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : M.Val (ref (array i32.t)) := M.alloc (borrow xs) in
    let* α1 : ref (slice i32.t) := M.read (pointer_coercion "Unsize" α0) in
    let* α2 : unit := M.call (arrays_and_slices.analyze_slice α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t :=
        M.read (mk_str "borrow a section of the array as a slice
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* α0 : ref (slice i32.t) :=
      M.call
        ((core.ops.index.Index.index
            (Self := array i32.t)
            (Trait := ltac:(refine _)))
          (borrow ys)
          {|
            core.ops.range.Range.start := Integer.of_Z 1;
            core.ops.range.Range.end := Integer.of_Z 4;
          |}) in
    let* α1 : unit := M.call (arrays_and_slices.analyze_slice α0) in
    M.alloc α1 in
  let* empty_array : M.Val (array u32.t) := M.alloc [ ] in
  let* _ : M.Val unit :=
    let* α0 : M.Val (ref (array u32.t)) := M.alloc (borrow empty_array) in
    let* α1 : M.Val (array u32.t) := M.alloc [ ] in
    let* α2 : M.Val (ref (array u32.t)) := M.alloc (borrow α1) in
    match (borrow α0, borrow α2) with
    | (left_val, right_val) =>
      let* right_val := M.alloc right_val in
      let* left_val := M.alloc left_val in
      let* α0 : ref (ref (array u32.t)) := M.read left_val in
      let* α1 : ref (ref (array u32.t)) := M.read right_val in
      let* α2 : bool.t :=
        M.call
          ((core.cmp.PartialEq.eq
              (Self := ref (array u32.t))
              (Trait := ltac:(refine _)))
            α0
            α1) in
      if (use (UnOp.not α2) : bool) then
        let* kind : M.Val core.panicking.AssertKind.t :=
          M.alloc core.panicking.AssertKind.Eq in
        let* _ : M.Val never.t :=
          let* α0 : core.panicking.AssertKind.t := M.read kind in
          let* α1 : ref (ref (array u32.t)) := M.read left_val in
          let* α2 : ref (ref (array u32.t)) := M.read right_val in
          let* α3 : never.t :=
            M.call
              (core.panicking.assert_failed α0 α1 α2 core.option.Option.None) in
          M.alloc α3 in
        let* α0 : M.Val unit := M.alloc tt in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt
    end in
  let* _ : M.Val unit :=
    let* α0 : M.Val (ref (array u32.t)) := M.alloc (borrow empty_array) in
    let* α1 : M.Val (array u32.t) := M.alloc [ ] in
    let* α2 : ref (slice u32.t) :=
      M.call
        ((core.ops.index.Index.index
            (Self := array u32.t)
            (Trait := ltac:(refine _)))
          (borrow α1)
          core.ops.range.RangeFull.Build) in
    let* α3 : M.Val (ref (slice u32.t)) := M.alloc α2 in
    match (borrow α0, borrow α3) with
    | (left_val, right_val) =>
      let* right_val := M.alloc right_val in
      let* left_val := M.alloc left_val in
      let* α0 : ref (ref (array u32.t)) := M.read left_val in
      let* α1 : ref (ref (slice u32.t)) := M.read right_val in
      let* α2 : bool.t :=
        M.call
          ((core.cmp.PartialEq.eq
              (Self := ref (array u32.t))
              (Trait := ltac:(refine _)))
            α0
            α1) in
      if (use (UnOp.not α2) : bool) then
        let* kind : M.Val core.panicking.AssertKind.t :=
          M.alloc core.panicking.AssertKind.Eq in
        let* _ : M.Val never.t :=
          let* α0 : core.panicking.AssertKind.t := M.read kind in
          let* α1 : ref (ref (array u32.t)) := M.read left_val in
          let* α2 : ref (ref (slice u32.t)) := M.read right_val in
          let* α3 : never.t :=
            M.call
              (core.panicking.assert_failed α0 α1 α2 core.option.Option.None) in
          M.alloc α3 in
        let* α0 : M.Val unit := M.alloc tt in
        let* α1 := M.read α0 in
        let* α2 : unit := never_to_any α1 in
        M.alloc α2
      else
        M.alloc tt
    end in
  let* α0 : M.Val (ref (array i32.t)) := M.alloc (borrow xs) in
  let* α1 : ref (slice i32.t) := M.read (pointer_coercion "Unsize" α0) in
  let* α2 : usize.t := M.call ((slice i32.t)::["len"] α1) in
  let* α3 : usize.t := BinOp.Panic.add α2 (Integer.of_Z 1) in
  let* α4 : core.ops.range.Range.t usize.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t usize.t)
          (Trait := ltac:(refine _)))
        {|
          core.ops.range.Range.start := Integer.of_Z 0;
          core.ops.range.Range.end := α3;
        |}) in
  let* α5 : M.Val unit :=
    match α4 with
    | iter =>
      let* iter := M.alloc iter in
      loop
        (let* _ : M.Val unit :=
          let* α0 : core.option.Option.t usize.t :=
            M.call
              ((core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t usize.t)
                  (Trait := ltac:(refine _)))
                (borrow_mut iter)) in
          match α0 with
          | core.option.Option.None  =>
            let* α0 : M.Val never.t := Break in
            let* α1 := M.read α0 in
            let* α2 : unit := never_to_any α1 in
            M.alloc α2
          | core.option.Option.Some i =>
            let* i := M.alloc i in
            let* α0 : M.Val (ref (array i32.t)) := M.alloc (borrow xs) in
            let* α1 : ref (slice i32.t) :=
              M.read (pointer_coercion "Unsize" α0) in
            let* α2 : usize.t := M.read i in
            let* α3 : core.option.Option.t (ref i32.t) :=
              M.call ((slice i32.t)::["get"] α1 α2) in
            match α3 with
            | core.option.Option.Some xval =>
              let* xval := M.alloc xval in
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "") in
                let* α1 : ref str.t := M.read (mk_str ": ") in
                let* α2 : ref str.t := M.read (mk_str "
") in
                let* α3 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2 ] in
                let* α4 : M.Val (ref (array (ref str.t))) :=
                  M.alloc (borrow α3) in
                let* α5 : ref (slice (ref str.t)) :=
                  M.read (pointer_coercion "Unsize" α4) in
                let* α6 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_display"] (borrow i)) in
                let* α7 : core.fmt.rt.Argument.t :=
                  M.call
                    (core.fmt.rt.Argument.t::["new_display"] (borrow xval)) in
                let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α6; α7 ] in
                let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                  M.alloc (borrow α8) in
                let* α10 : ref (slice core.fmt.rt.Argument.t) :=
                  M.read (pointer_coercion "Unsize" α9) in
                let* α11 : core.fmt.Arguments.t :=
                  M.call (core.fmt.Arguments.t::["new_v1"] α5 α10) in
                let* α12 : unit := M.call (std.io.stdio._print α11) in
                M.alloc α12 in
              M.alloc tt
            | core.option.Option.None  =>
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Slow down! ") in
                let* α1 : ref str.t := M.read (mk_str " is too far!
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : M.Val (ref (array (ref str.t))) :=
                  M.alloc (borrow α2) in
                let* α4 : ref (slice (ref str.t)) :=
                  M.read (pointer_coercion "Unsize" α3) in
                let* α5 : core.fmt.rt.Argument.t :=
                  M.call (core.fmt.rt.Argument.t::["new_display"] (borrow i)) in
                let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α5 ] in
                let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                  M.alloc (borrow α6) in
                let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                  M.read (pointer_coercion "Unsize" α7) in
                let* α9 : core.fmt.Arguments.t :=
                  M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
                let* α10 : unit := M.call (std.io.stdio._print α9) in
                M.alloc α10 in
              M.alloc tt
            end
          end in
        M.alloc tt)
    end in
  let* α6 : unit := M.read α5 in
  let* α0 : M.Val unit := M.alloc (use α6) in
  M.read α0.
