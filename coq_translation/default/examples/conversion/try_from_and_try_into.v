(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module EvenNumber.
  Section EvenNumber.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : i32;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
    Admitted.
  End EvenNumber.
End EvenNumber.
Definition EvenNumber `{ℋ : State.Trait} : Set := M.val EvenNumber.t.

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  Section Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := try_from_and_try_into.EvenNumber.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 := deref (mk_str "EvenNumber") str in
      let* α3 := borrow α2 str in
      let* α4 := deref self try_from_and_try_into.EvenNumber in
      let* α5 := α4.["0"] in
      let* α6 := borrow α5 i32 in
      let* α7 := borrow α6 (ref i32) in
      let* α8 := deref α7 (ref i32) in
      let* α9 := borrow α8 (ref i32) in
      let* α10 := pointer_coercion "Unsize" α9 in
      core.fmt.Formatter::["debug_tuple_field1_finish"] α1 α3 α10.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module
  Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Section
    Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := try_from_and_try_into.EvenNumber.
    
    #[refine] Global Instance ℐ :
      core.marker.StructuralPartialEq.Trait Self := {
    }.
    Admitted.
  End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Global Hint Resolve ℐ : core.
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  Section Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := try_from_and_try_into.EvenNumber.
    
    Definition eq
        (self : ref Self)
        (other : ref try_from_and_try_into.EvenNumber)
        : M bool :=
      let* α0 := deref self try_from_and_try_into.EvenNumber in
      let* α1 := α0.["0"] in
      let* α2 := deref other try_from_and_try_into.EvenNumber in
      let* α3 := α2.["0"] in
      eq α1 α3.
    
    Global Instance AssociatedFunction_eq : Notation.DoubleColon Self "eq" := {
      Notation.double_colon := eq;
    }.
    
    #[refine] Global Instance ℐ :
      core.cmp.PartialEq.Trait Self
        (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
      core.cmp.PartialEq.eq := eq;
    }.
    Admitted.
  End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  Global Hint Resolve ℐ : core.
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.
  Section Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := try_from_and_try_into.EvenNumber.
    
    Definition Error : Set := unit.
    
    Definition try_from (value : i32) : M (core.result.Result Self Error) :=
      let* α0 := M.alloc 2 in
      let* α1 := rem value α0 in
      let* α2 := M.alloc 0 in
      let* α3 := eq α1 α2 in
      let* α4 := use α3 in
      if (α4 : bool) then
        Pure
          (core.result.Result.Ok
            (try_from_and_try_into.EvenNumber.Build_t value))
      else
        let* α0 := M.alloc tt in
        Pure (core.result.Result.Err α0).
    
    Global Instance AssociatedFunction_try_from :
      Notation.DoubleColon Self "try_from" := {
      Notation.double_colon := try_from;
    }.
    
    #[refine] Global Instance ℐ :
      core.convert.TryFrom.Trait Self (T := i32) := {
      core.convert.TryFrom.Error := Error;
      core.convert.TryFrom.try_from := try_from;
    }.
    Admitted.
  End Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.
  Global Hint Resolve ℐ : core.
End Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _ :=
    let* α0 := M.alloc 8 in
    let* α1 :=
      (core.convert.TryFrom.try_from (Self := try_from_and_try_into.EvenNumber))
        α0 in
    let* α2 :=
      borrow α1 (core.result.Result try_from_and_try_into.EvenNumber unit) in
    let* α3 := M.alloc 8 in
    let* α4 :=
      borrow
        (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t α3))
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    match (α2, α4) with
    | (left_val, right_val) =>
      let* α0 :=
        deref
          left_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α1 :=
        borrow α0 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α2 :=
        deref
          right_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α3 :=
        borrow α2 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α4 :=
        (core.cmp.PartialEq.eq
            (Self :=
              (core.result.Result try_from_and_try_into.EvenNumber unit)))
          α1
          α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 :=
            deref
              left_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α1 :=
            borrow
              α0
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α2 :=
            deref
              α1
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α3 :=
            borrow
              α2
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α4 :=
            deref
              right_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α5 :=
            borrow
              α4
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α6 :=
            deref
              α5
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α7 :=
            borrow
              α6
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        let* α0 := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt
    end in
  let* _ :=
    let* α0 := M.alloc 5 in
    let* α1 :=
      (core.convert.TryFrom.try_from (Self := try_from_and_try_into.EvenNumber))
        α0 in
    let* α2 :=
      borrow α1 (core.result.Result try_from_and_try_into.EvenNumber unit) in
    let* α3 := M.alloc tt in
    let* α4 :=
      borrow
        (core.result.Result.Err α3)
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    match (α2, α4) with
    | (left_val, right_val) =>
      let* α0 :=
        deref
          left_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α1 :=
        borrow α0 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α2 :=
        deref
          right_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α3 :=
        borrow α2 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α4 :=
        (core.cmp.PartialEq.eq
            (Self :=
              (core.result.Result try_from_and_try_into.EvenNumber unit)))
          α1
          α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 :=
            deref
              left_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α1 :=
            borrow
              α0
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α2 :=
            deref
              α1
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α3 :=
            borrow
              α2
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α4 :=
            deref
              right_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α5 :=
            borrow
              α4
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α6 :=
            deref
              α5
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α7 :=
            borrow
              α6
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        let* α0 := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt
    end in
  let* result :=
    let* α0 := M.alloc 8 in
    (core.convert.TryInto.try_into (Self := i32)) α0 in
  let* _ :=
    let* α0 :=
      borrow
        result
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    let* α1 := M.alloc 8 in
    let* α2 :=
      borrow
        (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t α1))
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    match (α0, α2) with
    | (left_val, right_val) =>
      let* α0 :=
        deref
          left_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α1 :=
        borrow α0 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α2 :=
        deref
          right_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α3 :=
        borrow α2 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α4 :=
        (core.cmp.PartialEq.eq
            (Self :=
              (core.result.Result try_from_and_try_into.EvenNumber unit)))
          α1
          α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 :=
            deref
              left_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α1 :=
            borrow
              α0
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α2 :=
            deref
              α1
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α3 :=
            borrow
              α2
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α4 :=
            deref
              right_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α5 :=
            borrow
              α4
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α6 :=
            deref
              α5
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α7 :=
            borrow
              α6
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        let* α0 := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt
    end in
  let* result :=
    let* α0 := M.alloc 5 in
    (core.convert.TryInto.try_into (Self := i32)) α0 in
  let* _ :=
    let* α0 :=
      borrow
        result
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    let* α1 := M.alloc tt in
    let* α2 :=
      borrow
        (core.result.Result.Err α1)
        (core.result.Result try_from_and_try_into.EvenNumber unit) in
    match (α0, α2) with
    | (left_val, right_val) =>
      let* α0 :=
        deref
          left_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α1 :=
        borrow α0 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α2 :=
        deref
          right_val
          (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α3 :=
        borrow α2 (core.result.Result try_from_and_try_into.EvenNumber unit) in
      let* α4 :=
        (core.cmp.PartialEq.eq
            (Self :=
              (core.result.Result try_from_and_try_into.EvenNumber unit)))
          α1
          α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 :=
            deref
              left_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α1 :=
            borrow
              α0
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α2 :=
            deref
              α1
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α3 :=
            borrow
              α2
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α4 :=
            deref
              right_val
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α5 :=
            borrow
              α4
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α6 :=
            deref
              α5
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          let* α7 :=
            borrow
              α6
              (core.result.Result try_from_and_try_into.EvenNumber unit) in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        let* α0 := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt
    end in
  M.alloc tt.
