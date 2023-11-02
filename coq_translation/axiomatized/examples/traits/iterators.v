(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fibonacci.
  Section Fibonacci.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      curr : u32;
      next : u32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_curr : Notation.Dot "curr" := {
      Notation.dot x := let* x := M.read x in Pure x.(curr) : M _;
    }.
    Global Instance Get_AF_curr : Notation.DoubleColon t "curr" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(curr) : M _;
    }.
    Global Instance Get_next : Notation.Dot "next" := {
      Notation.dot x := let* x := M.read x in Pure x.(next) : M _;
    }.
    Global Instance Get_AF_next : Notation.DoubleColon t "next" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(next) : M _;
    }.
  End Fibonacci.
End Fibonacci.
Definition Fibonacci `{ℋ : State.Trait} : Set := M.val Fibonacci.t.

Module Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
  Section Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := iterators.Fibonacci.
    
    Definition Item : Set := u32.
    
    Parameter next : (mut_ref Self) -> M (core.option.Option Item).
    
    Global Instance AssociatedFunction_next :
      Notation.DoubleColon Self "next" := {
      Notation.double_colon := next;
    }.
    
    Global Instance ℐ :
      core.iter.traits.iterator.Iterator.Required.Trait Self := {
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
  End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.

Parameter fibonacci : forall `{ℋ : State.Trait}, M iterators.Fibonacci.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
