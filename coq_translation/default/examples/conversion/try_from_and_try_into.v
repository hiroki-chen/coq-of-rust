(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module EvenNumber.
  Record t : Set := { _ : i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End EvenNumber.
Definition EvenNumber := EvenNumber.t.

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  Definition Self := try_from_and_try_into.EvenNumber.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "EvenNumber"
      (addr_of (addr_of (self.[0]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module
  Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self := try_from_and_try_into.EvenNumber.
  
  Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
    core.marker.StructuralPartialEq.Build_Trait _.
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self := try_from_and_try_into.EvenNumber.
  
  Definition eq
      `{H : State.Trait}
      (self : ref Self)
      (other : ref try_from_and_try_into.EvenNumber)
      : M (H := H) bool :=
    (self.[0]).["eq"] (other.[0]).
  
  Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : core.cmp.PartialEq.Trait Self := {
    core.cmp.PartialEq.eq `{H : State.Trait} := eq;
  }.
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.
  Definition Self := try_from_and_try_into.EvenNumber.
  
  Definition Error : Set := unit.
  
  Definition try_from
      `{H : State.Trait}
      (value : i32)
      : M (H := H) (core.result.Result Self ImplSelf.Error) :=
    let* α0 := value.["rem"] 2 in
    let* α1 := α0.["eq"] 0 in
    if (α1 : bool) then
      Pure
        (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t value))
    else
      Pure (core.result.Result.Err tt).
  
  Global Instance AssociatedFunction_try_from `{H : State.Trait} :
    Notation.DoubleColon Self "try_from" := {
    Notation.double_colon := try_from;
  }.
  
  Global Instance I : core.convert.TryFrom.Trait Self (T := i32) := {
    core.convert.TryFrom.try_from `{H : State.Trait} := try_from;
  }.
End Impl_core_convert_TryFrom_for_try_from_and_try_into_EvenNumber.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* α0 := try_from_and_try_into.EvenNumber::["try_from"] 8 in
    match
      (addr_of α0,
        addr_of
          (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t 8)))
    with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* α0 := try_from_and_try_into.EvenNumber::["try_from"] 5 in
    match (addr_of α0, addr_of (core.result.Result.Err tt)) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* result := 8.["try_into"] in
  let* _ :=
    match
      (addr_of result,
        addr_of
          (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t 8)))
    with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* result := 5.["try_into"] in
  let* _ :=
    match (addr_of result, addr_of (core.result.Result.Err tt)) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  Pure tt.
