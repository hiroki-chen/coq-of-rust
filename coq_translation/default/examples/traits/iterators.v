(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Fibonacci.
Section Fibonacci.
  Record t : Set := {
    curr : u32.t;
    next : u32.t;
  }.
  
  Global Instance Get_curr : Notation.Dot "curr" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(curr) : M _;
  }.
  Global Instance Get_AF_curr : Notation.DoubleColon t "curr" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(curr) : M _;
  }.
  Global Instance Get_next : Notation.Dot "next" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(next) : M _;
  }.
  Global Instance Get_AF_next : Notation.DoubleColon t "next" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(next) : M _;
  }.
End Fibonacci.
End Fibonacci.
Definition Fibonacci : Set := M.Val Fibonacci.t.

Module  Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci_t.
Section Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci_t.
  Ltac Self := exact iterators.Fibonacci.t.
  
  Definition Item : Set := u32.t.
  
  Definition next
      (self : M.Val (mut_ref ltac:(Self)))
      : M (M.Val (core.option.Option.t Item.t)) :=
    M.function_body
      (let* current : ltac:(refine (M.Val u32.t)) :=
        let* α0 : ltac:(refine (M.Val iterators.Fibonacci.t)) := deref self in
        α0.["curr"] in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val iterators.Fibonacci.t)) := deref self in
        let* α1 : ltac:(refine (M.Val u32.t)) := α0.["curr"] in
        let* α2 : ltac:(refine (M.Val iterators.Fibonacci.t)) := deref self in
        let* α3 : ltac:(refine (M.Val u32.t)) := α2.["next"] in
        assign α1 α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val iterators.Fibonacci.t)) := deref self in
        let* α1 : ltac:(refine (M.Val u32.t)) := α0.["next"] in
        let* α2 : ltac:(refine (M.Val iterators.Fibonacci.t)) := deref self in
        let* α3 : ltac:(refine (M.Val u32.t)) := α2.["next"] in
        let* α4 : ltac:(refine (M.Val u32.t)) := BinOp.add current α3 in
        assign α1 α4 in
      let* α0 := M.read current in
      M.alloc (core.option.Option.Some α0)).
  
  Global Instance AssociatedFunction_next :
    Notation.DoubleColon ltac:(Self) "next" := {
    Notation.double_colon := next;
  }.
  
  Global Instance ℐ :
    core.iter.traits.iterator.Iterator.Required.Trait ltac:(Self) := {
    core.iter.traits.iterator.Iterator.Item := Item;
    core.iter.traits.iterator.Iterator.next := next;
    core.iter.traits.iterator.Iterator.next_chunk := Datatypes.None;
    core.iter.traits.iterator.Iterator.size_hint := Datatypes.None;
    core.iter.traits.iterator.Iterator.count := Datatypes.None;
    core.iter.traits.iterator.Iterator.last := Datatypes.None;
    core.iter.traits.iterator.Iterator.advance_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.nth := Datatypes.None;
    core.iter.traits.iterator.Iterator.step_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.chain := Datatypes.None;
    core.iter.traits.iterator.Iterator.zip := Datatypes.None;
    core.iter.traits.iterator.Iterator.intersperse := Datatypes.None;
    core.iter.traits.iterator.Iterator.intersperse_with := Datatypes.None;
    core.iter.traits.iterator.Iterator.map := Datatypes.None;
    core.iter.traits.iterator.Iterator.for_each := Datatypes.None;
    core.iter.traits.iterator.Iterator.filter := Datatypes.None;
    core.iter.traits.iterator.Iterator.filter_map := Datatypes.None;
    core.iter.traits.iterator.Iterator.enumerate := Datatypes.None;
    core.iter.traits.iterator.Iterator.peekable := Datatypes.None;
    core.iter.traits.iterator.Iterator.skip_while := Datatypes.None;
    core.iter.traits.iterator.Iterator.take_while := Datatypes.None;
    core.iter.traits.iterator.Iterator.map_while := Datatypes.None;
    core.iter.traits.iterator.Iterator.skip := Datatypes.None;
    core.iter.traits.iterator.Iterator.take := Datatypes.None;
    core.iter.traits.iterator.Iterator.scan := Datatypes.None;
    core.iter.traits.iterator.Iterator.flat_map := Datatypes.None;
    core.iter.traits.iterator.Iterator.flatten := Datatypes.None;
    core.iter.traits.iterator.Iterator.fuse := Datatypes.None;
    core.iter.traits.iterator.Iterator.inspect := Datatypes.None;
    core.iter.traits.iterator.Iterator.by_ref := Datatypes.None;
    core.iter.traits.iterator.Iterator.collect := Datatypes.None;
    core.iter.traits.iterator.Iterator.try_collect := Datatypes.None;
    core.iter.traits.iterator.Iterator.collect_into := Datatypes.None;
    core.iter.traits.iterator.Iterator.partition := Datatypes.None;
    core.iter.traits.iterator.Iterator.partition_in_place := Datatypes.None;
    core.iter.traits.iterator.Iterator.is_partitioned := Datatypes.None;
    core.iter.traits.iterator.Iterator.try_fold := Datatypes.None;
    core.iter.traits.iterator.Iterator.try_for_each := Datatypes.None;
    core.iter.traits.iterator.Iterator.fold := Datatypes.None;
    core.iter.traits.iterator.Iterator.reduce := Datatypes.None;
    core.iter.traits.iterator.Iterator.try_reduce := Datatypes.None;
    core.iter.traits.iterator.Iterator.all := Datatypes.None;
    core.iter.traits.iterator.Iterator.any := Datatypes.None;
    core.iter.traits.iterator.Iterator.find := Datatypes.None;
    core.iter.traits.iterator.Iterator.find_map := Datatypes.None;
    core.iter.traits.iterator.Iterator.try_find := Datatypes.None;
    core.iter.traits.iterator.Iterator.position := Datatypes.None;
    core.iter.traits.iterator.Iterator.rposition := Datatypes.None;
    core.iter.traits.iterator.Iterator.max := Datatypes.None;
    core.iter.traits.iterator.Iterator.min := Datatypes.None;
    core.iter.traits.iterator.Iterator.max_by_key := Datatypes.None;
    core.iter.traits.iterator.Iterator.max_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.min_by_key := Datatypes.None;
    core.iter.traits.iterator.Iterator.min_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.rev := Datatypes.None;
    core.iter.traits.iterator.Iterator.unzip := Datatypes.None;
    core.iter.traits.iterator.Iterator.copied := Datatypes.None;
    core.iter.traits.iterator.Iterator.cloned := Datatypes.None;
    core.iter.traits.iterator.Iterator.cycle := Datatypes.None;
    core.iter.traits.iterator.Iterator.array_chunks := Datatypes.None;
    core.iter.traits.iterator.Iterator.sum := Datatypes.None;
    core.iter.traits.iterator.Iterator.product := Datatypes.None;
    core.iter.traits.iterator.Iterator.cmp := Datatypes.None;
    core.iter.traits.iterator.Iterator.cmp_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.partial_cmp := Datatypes.None;
    core.iter.traits.iterator.Iterator.partial_cmp_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.eq := Datatypes.None;
    core.iter.traits.iterator.Iterator.eq_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.ne := Datatypes.None;
    core.iter.traits.iterator.Iterator.lt := Datatypes.None;
    core.iter.traits.iterator.Iterator.le := Datatypes.None;
    core.iter.traits.iterator.Iterator.gt := Datatypes.None;
    core.iter.traits.iterator.Iterator.ge := Datatypes.None;
    core.iter.traits.iterator.Iterator.is_sorted := Datatypes.None;
    core.iter.traits.iterator.Iterator.is_sorted_by := Datatypes.None;
    core.iter.traits.iterator.Iterator.is_sorted_by_key := Datatypes.None;
    core.iter.traits.iterator.Iterator.__iterator_get_unchecked :=
      Datatypes.None;
  }.
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci_t.
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci_t.

Definition fibonacci : M (M.Val iterators.Fibonacci.t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 0 in
    let* α1 := M.read α0 in
    let* α2 : ltac:(refine (M.Val u32.t)) := M.alloc 1 in
    let* α3 := M.read α2 in
    M.alloc
      {| iterators.Fibonacci.curr := α1; iterators.Fibonacci.next := α3; |}).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* sequence : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α3 := M.read α2 in
      M.alloc
        {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
        |} in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Four consecutive `next` calls on 0..3
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
          borrow_mut sequence in
        let* α4 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
          (core.iter.traits.iterator.Iterator.next
              (Self := core.ops.range.Range.t i32.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref (core.option.Option.t i32.t)))) :=
          borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
          borrow_mut sequence in
        let* α4 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
          (core.iter.traits.iterator.Iterator.next
              (Self := core.ops.range.Range.t i32.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref (core.option.Option.t i32.t)))) :=
          borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
          borrow_mut sequence in
        let* α4 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
          (core.iter.traits.iterator.Iterator.next
              (Self := core.ops.range.Range.t i32.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref (core.option.Option.t i32.t)))) :=
          borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "> "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
          borrow_mut sequence in
        let* α4 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
          (core.iter.traits.iterator.Iterator.next
              (Self := core.ops.range.Range.t i32.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : ltac:(refine (M.Val (ref (core.option.Option.t i32.t)))) :=
          borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Iterate through 0..3 using `for`
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc 3 in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        M.alloc
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      let* α5 : ltac:(refine (M.Val (core.ops.range.Range.t i32.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 := M.read α5 in
      let* α7 : ltac:(refine (M.Val unit)) :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val (mut_ref (core.ops.range.Range.t i32.t)))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (M.Val (core.option.Option.t i32.t))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some i =>
                let* i := M.alloc i in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* _ : ltac:(refine (M.Val unit)) :=
                    let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                      M.alloc [ mk_str "> "; mk_str "
" ] in
                    let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                      borrow α0 in
                    let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                      pointer_coercion "Unsize" α1 in
                    let* α3 : ltac:(refine (M.Val (ref i32.t))) := borrow i in
                    let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                      core.fmt.rt.Argument.t::["new_display"] α3 in
                    let* α5 :
                        ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                      M.alloc [ α4 ] in
                    let* α6 :
                        ltac:(refine
                          (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                      borrow α5 in
                    let* α7 :
                        ltac:(refine
                          (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                      pointer_coercion "Unsize" α6 in
                    let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                      core.fmt.Arguments.t::["new_v1"] α2 α7 in
                    std.io.stdio._print α8 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α7 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "The first four terms of the Fibonacci sequence are: 
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val iterators.Fibonacci.t)) :=
        iterators.fibonacci in
      let* α1 : ltac:(refine (M.Val usize.t)) := M.alloc 4 in
      let* α2 :
          ltac:(refine
            (M.Val (core.iter.adapters.take.Take.t iterators.Fibonacci.t))) :=
        (core.iter.traits.iterator.Iterator.take
            (Self := iterators.Fibonacci.t)
            (Trait := ltac:(refine _)))
          α0
          α1 in
      let* α3 :
          ltac:(refine
            (M.Val (core.iter.adapters.take.Take.t iterators.Fibonacci.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.iter.adapters.take.Take.t iterators.Fibonacci.t)
            (Trait := ltac:(refine _)))
          α2 in
      let* α4 := M.read α3 in
      let* α5 : ltac:(refine (M.Val unit)) :=
        match α4 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val
                      (mut_ref
                        (core.iter.adapters.take.Take.t
                          iterators.Fibonacci.t)))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (M.Val (core.option.Option.t u32.t))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      core.iter.adapters.take.Take.t iterators.Fibonacci.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some i =>
                let* i := M.alloc i in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* _ : ltac:(refine (M.Val unit)) :=
                    let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                      M.alloc [ mk_str "> "; mk_str "
" ] in
                    let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                      borrow α0 in
                    let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                      pointer_coercion "Unsize" α1 in
                    let* α3 : ltac:(refine (M.Val (ref u32.t))) := borrow i in
                    let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                      core.fmt.rt.Argument.t::["new_display"] α3 in
                    let* α5 :
                        ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                      M.alloc [ α4 ] in
                    let* α6 :
                        ltac:(refine
                          (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                      borrow α5 in
                    let* α7 :
                        ltac:(refine
                          (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                      pointer_coercion "Unsize" α6 in
                    let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                      core.fmt.Arguments.t::["new_v1"] α2 α7 in
                    std.io.stdio._print α8 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α5 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "The next four terms of the Fibonacci sequence are: 
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_const"] α2 in
        std.io.stdio._print α3 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 : ltac:(refine (M.Val iterators.Fibonacci.t)) :=
        iterators.fibonacci in
      let* α1 : ltac:(refine (M.Val usize.t)) := M.alloc 4 in
      let* α2 :
          ltac:(refine
            (M.Val (core.iter.adapters.skip.Skip.t iterators.Fibonacci.t))) :=
        (core.iter.traits.iterator.Iterator.skip
            (Self := iterators.Fibonacci.t)
            (Trait := ltac:(refine _)))
          α0
          α1 in
      let* α3 : ltac:(refine (M.Val usize.t)) := M.alloc 4 in
      let* α4 :
          ltac:(refine
            (M.Val
              (core.iter.adapters.take.Take.t
                (core.iter.adapters.skip.Skip.t iterators.Fibonacci.t)))) :=
        (core.iter.traits.iterator.Iterator.take
            (Self := core.iter.adapters.skip.Skip.t iterators.Fibonacci.t)
            (Trait := ltac:(refine _)))
          α2
          α3 in
      let* α5 :
          ltac:(refine
            (M.Val
              (core.iter.adapters.take.Take.t
                (core.iter.adapters.skip.Skip.t iterators.Fibonacci.t)))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              core.iter.adapters.take.Take.t
                (core.iter.adapters.skip.Skip.t iterators.Fibonacci.t))
            (Trait := ltac:(refine _)))
          α4 in
      let* α6 := M.read α5 in
      let* α7 : ltac:(refine (M.Val unit)) :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val
                      (mut_ref
                        (core.iter.adapters.take.Take.t
                          (core.iter.adapters.skip.Skip.t
                            iterators.Fibonacci.t))))) :=
                borrow_mut iter in
              let* α1 : ltac:(refine (M.Val (core.option.Option.t u32.t))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      core.iter.adapters.take.Take.t
                        (core.iter.adapters.skip.Skip.t iterators.Fibonacci.t))
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some i =>
                let* i := M.alloc i in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* _ : ltac:(refine (M.Val unit)) :=
                    let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                      M.alloc [ mk_str "> "; mk_str "
" ] in
                    let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                      borrow α0 in
                    let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                      pointer_coercion "Unsize" α1 in
                    let* α3 : ltac:(refine (M.Val (ref u32.t))) := borrow i in
                    let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                      core.fmt.rt.Argument.t::["new_display"] α3 in
                    let* α5 :
                        ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                      M.alloc [ α4 ] in
                    let* α6 :
                        ltac:(refine
                          (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                      borrow α5 in
                    let* α7 :
                        ltac:(refine
                          (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                      pointer_coercion "Unsize" α6 in
                    let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                      core.fmt.Arguments.t::["new_v1"] α2 α7 in
                    std.io.stdio._print α8 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α7 in
    let* array : ltac:(refine (M.Val (array u32.t))) :=
      let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 1 in
      let* α1 : ltac:(refine (M.Val u32.t)) := M.alloc 3 in
      let* α2 : ltac:(refine (M.Val u32.t)) := M.alloc 3 in
      let* α3 : ltac:(refine (M.Val u32.t)) := M.alloc 7 in
      M.alloc [ α0; α1; α2; α3 ] in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Iterate the following array "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref (array u32.t)))) := borrow array in
        let* α4 : ltac:(refine (M.Val (ref (ref (array u32.t))))) :=
          borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α4 in
        let* α6 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5 ] in
        let* α7 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α6 in
        let* α8 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α7 in
        let* α9 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α8 in
        std.io.stdio._print α9 in
      M.alloc tt in
    let* α0 : ltac:(refine (M.Val (ref (array u32.t)))) := borrow array in
    let* α1 : ltac:(refine (M.Val (ref (slice u32.t)))) :=
      pointer_coercion "Unsize" α0 in
    let* α2 : ltac:(refine (M.Val (core.slice.iter.Iter.t u32.t))) :=
      (slice u32.t)::["iter"] α1 in
    let* α3 : ltac:(refine (M.Val (core.slice.iter.Iter.t u32.t))) :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.slice.iter.Iter.t u32.t)
          (Trait := ltac:(refine _)))
        α2 in
    let* α4 := M.read α3 in
    let* α5 : ltac:(refine (M.Val unit)) :=
      match α4 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : ltac:(refine (M.Val unit)) :=
            let* α0 :
                ltac:(refine
                  (M.Val (mut_ref (core.slice.iter.Iter.t u32.t)))) :=
              borrow_mut iter in
            let* α1 :
                ltac:(refine (M.Val (core.option.Option.t (ref u32.t)))) :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := core.slice.iter.Iter.t u32.t)
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 := M.read α1 in
            match α2 with
            | core.option.Option.None  =>
              let* α0 : ltac:(refine (M.Val never.t)) := Break in
              never_to_any α0
            | core.option.Option.Some i =>
              let* i := M.alloc i in
              let* _ : ltac:(refine (M.Val unit)) :=
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                    M.alloc [ mk_str "> "; mk_str "
" ] in
                  let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                    borrow α0 in
                  let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                    pointer_coercion "Unsize" α1 in
                  let* α3 : ltac:(refine (M.Val (ref (ref u32.t)))) :=
                    borrow i in
                  let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                    core.fmt.rt.Argument.t::["new_display"] α3 in
                  let* α5 :
                      ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                    M.alloc [ α4 ] in
                  let* α6 :
                      ltac:(refine
                        (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                    borrow α5 in
                  let* α7 :
                      ltac:(refine
                        (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                    pointer_coercion "Unsize" α6 in
                  let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                    core.fmt.Arguments.t::["new_v1"] α2 α7 in
                  std.io.stdio._print α8 in
                M.alloc tt in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    use α5).
