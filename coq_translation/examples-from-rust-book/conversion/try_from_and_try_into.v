(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module TryFrom := std.convert.TryFrom.

Module TryInto := std.convert.TryInto.

Module EvenNumber.
  Inductive t : Set := Build (_ : i32).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {
    IndexedField.get '(Build x0) := x0;
  }.
End EvenNumber.
Definition EvenNumber := EvenNumber.t.

Module Impl__crate_fmt_Debug_for_EvenNumber.
  Definition Self := EvenNumber.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "EvenNumber"
      (IndexedField.get (index := 0) self).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_EvenNumber.

Module Impl__crate_marker_StructuralPartialEq_for_EvenNumber.
  Definition Self := EvenNumber.
  
  Global Instance I : _crate.marker.StructuralPartialEq.Trait Self :=
    _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_EvenNumber.

Module Impl__crate_cmp_PartialEq_for_EvenNumber.
  Definition Self := EvenNumber.
  
  Definition eq (self : ref Self) (other : ref EvenNumber) : bool :=
    (IndexedField.get (index := 0) self).["eq"]
      (IndexedField.get (index := 0) other).
  
  Global Instance Method_eq : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : _crate.cmp.PartialEq.Trait Self := {
    _crate.cmp.PartialEq.eq := eq;
  }.
End Impl__crate_cmp_PartialEq_for_EvenNumber.

Module Impl_TryFrom_for_EvenNumber.
  Definition Self := EvenNumber.
  
  Definition Error : Set := .
  
  Definition try_from (value : i32) : Result Self ImplSelf.Error :=
    if ((value.["rem"] 2).["eq"] 0 : bool) then
      Ok (EvenNumber.Build value)
    else
      Err ().
  
  Global Instance AssociatedFunction_try_from :
    Notation.DoubleColon Self "try_from" := {
    Notation.double_colon := try_from;
  }.
  
  Global Instance I : TryFrom.Trait Self i32 := {
    TryFrom.try_from := try_from;
  }.
End Impl_TryFrom_for_EvenNumber.

Definition main (_ : unit) : unit :=
  match (EvenNumber::["try_from"] 8, Ok (EvenNumber.Build 8)) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (EvenNumber::["try_from"] 5, Err ()) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  let result := 8.["try_into"] in
  match (result, Ok (EvenNumber.Build 8)) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  let result := 5.["try_into"] in
  match (result, Err ()) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  tt.
