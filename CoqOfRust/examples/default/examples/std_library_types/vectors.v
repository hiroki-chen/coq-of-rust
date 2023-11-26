(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Iterators can be collected into vectors
    let collected_iterator: Vec<i32> = (0..10).collect();
    println!("Collected (0..10) into: {:?}", collected_iterator);

    // The `vec!` macro can be used to initialize a vector
    let mut xs = vec![1i32, 2, 3];
    println!("Initial vector: {:?}", xs);

    // Insert new element at the end of the vector
    println!("Push 4 into the vector");
    xs.push(4);
    println!("Vector: {:?}", xs);

    // Error! Immutable vectors can't grow
    // collected_iterator.push(0);
    // FIXME ^ Comment out this line

    // The `len` method yields the number of elements currently stored in a vector
    println!("Vector length: {}", xs.len());

    // Indexing is done using the square brackets (indexing starts at 0)
    println!("Second element: {}", xs[1]);

    // `pop` removes the last element from the vector and returns it
    println!("Pop last element: {:?}", xs.pop());

    // Out of bounds indexing yields a panic
    // println!("Fourth element: {}", xs[3]);
    // FIXME ^ Comment out this line

    // `Vector`s can be easily iterated over
    println!("Contents of xs:");
    for x in xs.iter() {
        println!("> {}", x);
    }

    // A `Vector` can also be iterated over while the iteration
    // count is enumerated in a separate variable (`i`)
    for (i, x) in xs.iter().enumerate() {
        println!("In position {} we have value {}", i, x);
    }

    // Thanks to `iter_mut`, mutable `Vector`s can also be iterated
    // over in a way that allows modifying each value
    for x in xs.iter_mut() {
        *x *= 3;
    }
    println!("Updated vector: {:?}", xs);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* collected_iterator :
        M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 10 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
        (core.iter.traits.iterator.Iterator.collect
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Collected (0..10) into: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow collected_iterator in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* xs : M.Val (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
      let* α0 : M.Val i32.t := M.alloc 1 in
      let* α1 : M.Val i32.t := M.alloc 2 in
      let* α2 : M.Val i32.t := M.alloc 3 in
      let* α3 : M.Val (array i32.t) := M.alloc [ α0; α1; α2 ] in
      let* α4 : M.Val (alloc.boxed.Box.t (array i32.t) alloc.alloc.Global.t) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let* α5 : M.Val (alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t) :=
        pointer_coercion "Unsize" α4 in
      let* α6 : alloc.boxed.Box.t (slice i32.t) alloc.alloc.Global.t :=
        M.read α5 in
      let* α7 : alloc.vec.Vec.t i32.t alloc.alloc.Global.t :=
        (slice i32.t)::["into_vec"] α6 in
      M.alloc α7 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Initial vector: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow xs in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Push 4 into the vector
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_const"] α4 in
        let* α6 : unit := std.io.stdio._print α5 in
        M.alloc α6 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* α0 : mut_ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
        borrow_mut xs in
      let* α1 : M.Val i32.t := M.alloc 4 in
      let* α2 : i32.t := M.read α1 in
      let* α3 : unit :=
        (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["push"] α0 α2 in
      M.alloc α3 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Vector: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow xs in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Vector length: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow xs in
        let* α6 : usize.t :=
          (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["len"] α5 in
        let* α7 : M.Val usize.t := M.alloc α6 in
        let* α8 : ref usize.t := borrow α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Second element: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow xs in
        let* α6 : M.Val usize.t := M.alloc 1 in
        let* α7 : usize.t := M.read α6 in
        let* α8 : ref i32.t :=
          (core.ops.index.Index.index
              (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α5
            α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Pop last element: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : mut_ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow_mut xs in
        let* α6 : core.option.Option.t i32.t :=
          (alloc.vec.Vec.t i32.t alloc.alloc.Global.t)::["pop"] α5 in
        let* α7 : M.Val (core.option.Option.t i32.t) := M.alloc α6 in
        let* α8 : ref (core.option.Option.t i32.t) := borrow α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Contents of xs:
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_const"] α4 in
        let* α6 : unit := std.io.stdio._print α5 in
        M.alloc α6 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* α0 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) := borrow xs in
      let* α1 : ref (slice i32.t) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : core.slice.iter.Iter.t i32.t := (slice i32.t)::["iter"] α1 in
      let* α3 : core.slice.iter.Iter.t i32.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.slice.iter.Iter.t i32.t)
            (Trait := ltac:(refine _)))
          α2 in
      let* α4 : M.Val (core.slice.iter.Iter.t i32.t) := M.alloc α3 in
      let* α5 := M.read α4 in
      let* α6 : M.Val unit :=
        match α5 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.slice.iter.Iter.t i32.t) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t (ref i32.t) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.slice.iter.Iter.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t (ref i32.t)) :=
                M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some x =>
                let* x := M.alloc x in
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : M.Val (array (ref str.t)) :=
                      M.alloc [ mk_str "> "; mk_str "
" ] in
                    let* α1 : ref (array (ref str.t)) := borrow α0 in
                    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                    let* α3 : M.Val (ref (slice (ref str.t))) :=
                      pointer_coercion "Unsize" α2 in
                    let* α4 : ref (slice (ref str.t)) := M.read α3 in
                    let* α5 : ref (ref i32.t) := borrow x in
                    let* α6 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α5 in
                    let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                    let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                      M.alloc [ α7 ] in
                    let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
                    let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                      M.alloc α9 in
                    let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                      pointer_coercion "Unsize" α10 in
                    let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                      M.read α11 in
                    let* α13 : core.fmt.Arguments.t :=
                      core.fmt.Arguments.t::["new_v1"] α4 α12 in
                    let* α14 : unit := std.io.stdio._print α13 in
                    M.alloc α14 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α6 in
    let* _ : M.Val unit :=
      let* α0 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) := borrow xs in
      let* α1 : ref (slice i32.t) :=
        (core.ops.deref.Deref.deref
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : core.slice.iter.Iter.t i32.t := (slice i32.t)::["iter"] α1 in
      let* α3 :
          core.iter.adapters.enumerate.Enumerate.t
            (core.slice.iter.Iter.t i32.t) :=
        (core.iter.traits.iterator.Iterator.enumerate
            (Self := core.slice.iter.Iter.t i32.t)
            (Trait := ltac:(refine _)))
          α2 in
      let* α4 :
          core.iter.adapters.enumerate.Enumerate.t
            (core.slice.iter.Iter.t i32.t) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              core.iter.adapters.enumerate.Enumerate.t
                (core.slice.iter.Iter.t i32.t))
            (Trait := ltac:(refine _)))
          α3 in
      let* α5 :
          M.Val
            (core.iter.adapters.enumerate.Enumerate.t
              (core.slice.iter.Iter.t i32.t)) :=
        M.alloc α4 in
      let* α6 := M.read α5 in
      let* α7 : M.Val unit :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 :
                  mut_ref
                    (core.iter.adapters.enumerate.Enumerate.t
                      (core.slice.iter.Iter.t i32.t)) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t (usize.t * (ref i32.t)) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      core.iter.adapters.enumerate.Enumerate.t
                        (core.slice.iter.Iter.t i32.t))
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t (usize.t * (ref i32.t))) :=
                M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some (i, x) =>
                let* x := M.alloc x in
                let* i := M.alloc i in
                let* _ : M.Val unit :=
                  let* _ : M.Val unit :=
                    let* α0 : M.Val (array (ref str.t)) :=
                      M.alloc
                        [
                          mk_str "In position ";
                          mk_str " we have value ";
                          mk_str "
"
                        ] in
                    let* α1 : ref (array (ref str.t)) := borrow α0 in
                    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                    let* α3 : M.Val (ref (slice (ref str.t))) :=
                      pointer_coercion "Unsize" α2 in
                    let* α4 : ref (slice (ref str.t)) := M.read α3 in
                    let* α5 : ref usize.t := borrow i in
                    let* α6 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α5 in
                    let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                    let* α8 : ref (ref i32.t) := borrow x in
                    let* α9 : core.fmt.rt.Argument.t :=
                      core.fmt.rt.Argument.t::["new_display"] α8 in
                    let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
                    let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
                      M.alloc [ α7; α10 ] in
                    let* α12 : ref (array core.fmt.rt.Argument.t) :=
                      borrow α11 in
                    let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                      M.alloc α12 in
                    let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                      pointer_coercion "Unsize" α13 in
                    let* α15 : ref (slice core.fmt.rt.Argument.t) :=
                      M.read α14 in
                    let* α16 : core.fmt.Arguments.t :=
                      core.fmt.Arguments.t::["new_v1"] α4 α15 in
                    let* α17 : unit := std.io.stdio._print α16 in
                    M.alloc α17 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α7 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
        borrow_mut xs in
      let* α1 : mut_ref (slice i32.t) :=
        (core.ops.deref.DerefMut.deref_mut
            (Self := alloc.vec.Vec.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 : core.slice.iter.IterMut.t i32.t :=
        (slice i32.t)::["iter_mut"] α1 in
      let* α3 : core.slice.iter.IterMut.t i32.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.slice.iter.IterMut.t i32.t)
            (Trait := ltac:(refine _)))
          α2 in
      let* α4 : M.Val (core.slice.iter.IterMut.t i32.t) := M.alloc α3 in
      let* α5 := M.read α4 in
      let* α6 : M.Val unit :=
        match α5 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.slice.iter.IterMut.t i32.t) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t (mut_ref i32.t) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.slice.iter.IterMut.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t (mut_ref i32.t)) :=
                M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some x =>
                let* x := M.alloc x in
                let* _ : M.Val unit :=
                  let* α0 : mut_ref i32.t := M.read x in
                  let* α1 : M.Val i32.t := deref α0 in
                  let* α2 : M.Val i32.t := M.alloc 3 in
                  assign_op mul α1 α2 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α6 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Updated vector: "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref (alloc.vec.Vec.t i32.t alloc.alloc.Global.t) :=
          borrow xs in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
