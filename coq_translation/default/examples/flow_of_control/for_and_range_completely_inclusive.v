(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* α0 := (core.ops.range.RangeInclusive _)::["new"] 1 100 in
  let* α1 := core.iter.traits.collect.IntoIterator.into_iter α0 in
  let* α2 :=
    match α1 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := borrow_mut iter (core.ops.range.RangeInclusive i32) in
          let* α1 := deref α0 (core.ops.range.RangeInclusive i32) in
          let* α2 := borrow_mut α1 (core.ops.range.RangeInclusive i32) in
          let* α3 := core.iter.traits.iterator.Iterator.next α2 in
          match α3 with
          | core.option.Option  =>
            let* α0 := Break in
            never_to_any α0
          | core.option.Option n =>
            let* α0 := rem n 15 in
            let* α1 := eq α0 0 in
            let* α2 := use α1 in
            if (α2 : bool) then
              let* _ :=
                let* _ :=
                  let* α0 := borrow [ "fizzbuzz
" ] (list (ref str)) in
                  let* α1 := deref α0 (list (ref str)) in
                  let* α2 := borrow α1 (list (ref str)) in
                  let* α3 := pointer_coercion "Unsize" α2 in
                  let* α4 := core.fmt.Arguments::["new_const"] α3 in
                  std.io.stdio._print α4 in
                Pure tt in
              Pure tt
            else
              let* α0 := rem n 3 in
              let* α1 := eq α0 0 in
              let* α2 := use α1 in
              if (α2 : bool) then
                let* _ :=
                  let* _ :=
                    let* α0 := borrow [ "fizz
" ] (list (ref str)) in
                    let* α1 := deref α0 (list (ref str)) in
                    let* α2 := borrow α1 (list (ref str)) in
                    let* α3 := pointer_coercion "Unsize" α2 in
                    let* α4 := core.fmt.Arguments::["new_const"] α3 in
                    std.io.stdio._print α4 in
                  Pure tt in
                Pure tt
              else
                let* α0 := rem n 5 in
                let* α1 := eq α0 0 in
                let* α2 := use α1 in
                if (α2 : bool) then
                  let* _ :=
                    let* _ :=
                      let* α0 := borrow [ "buzz
" ] (list (ref str)) in
                      let* α1 := deref α0 (list (ref str)) in
                      let* α2 := borrow α1 (list (ref str)) in
                      let* α3 := pointer_coercion "Unsize" α2 in
                      let* α4 := core.fmt.Arguments::["new_const"] α3 in
                      std.io.stdio._print α4 in
                    Pure tt in
                  Pure tt
                else
                  let* _ :=
                    let* _ :=
                      let* α0 := borrow [ ""; "
" ] (list (ref str)) in
                      let* α1 := deref α0 (list (ref str)) in
                      let* α2 := borrow α1 (list (ref str)) in
                      let* α3 := pointer_coercion "Unsize" α2 in
                      let* α4 := borrow n i32 in
                      let* α5 := deref α4 i32 in
                      let* α6 := borrow α5 i32 in
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
  use α2.
