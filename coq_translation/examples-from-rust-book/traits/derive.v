(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Centimeters.
  Inductive t : Set := Build (_ : f64).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {
    IndexedField.get '(Build x0) := x0;
  }.
End Centimeters.
Definition Centimeters := Centimeters.t.

Module Impl__crate_marker_StructuralPartialEq_for_Centimeters.
  Definition Self := Centimeters.
  
  Global Instance I : _crate.marker.StructuralPartialEq.Trait Self :=
    _crate.marker.StructuralPartialEq.Build_Class _.
End Impl__crate_marker_StructuralPartialEq_for_Centimeters.

Module Impl__crate_cmp_PartialEq_for_Centimeters.
  Definition Self := Centimeters.
  
  Definition eq (self : ref Self) (other : ref Centimeters) : bool :=
    (IndexedField.get (index := 0) self).["eq"]
      (IndexedField.get (index := 0) other).
  
  Global Instance Method_eq : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : _crate.cmp.PartialEq.Trait Self := {
    _crate.cmp.PartialEq.eq := eq;
  }.
End Impl__crate_cmp_PartialEq_for_Centimeters.

Module Impl__crate_cmp_PartialOrd_for_Centimeters.
  Definition Self := Centimeters.
  
  Definition partial_cmp
      (self : ref Self)
      (other : ref Centimeters)
      : _crate.option.Option _crate.cmp.Ordering :=
    _crate.cmp.PartialOrd.partial_cmp
      (IndexedField.get (index := 0) self)
      (IndexedField.get (index := 0) other).
  
  Global Instance Method_partial_cmp : Notation.Dot "partial_cmp" := {
    Notation.dot := partial_cmp;
  }.
  
  Global Instance I : _crate.cmp.PartialOrd.Trait Self := {
    _crate.cmp.PartialOrd.partial_cmp := partial_cmp;
  }.
End Impl__crate_cmp_PartialOrd_for_Centimeters.

Module Inches.
  Inductive t : Set := Build (_ : i32).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {
    IndexedField.get '(Build x0) := x0;
  }.
End Inches.
Definition Inches := Inches.t.

Module Impl__crate_fmt_Debug_for_Inches.
  Definition Self := Inches.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "Inches"
      (IndexedField.get (index := 0) self).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Inches.

Module ImplInches.
  Definition Self := Inches.
  
  Definition to_centimeters (self : ref Self) : Centimeters :=
    let 'Inches (inches) := self in
    Centimeters.Build ((cast inches f64).["mul"] 3 (* 2.54 *)).
  
  Global Instance Method_to_centimeters : Notation.Dot "to_centimeters" := {
    Notation.dot := to_centimeters;
  }.
End ImplInches.

Module Seconds.
  Inductive t : Set := Build (_ : i32).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {
    IndexedField.get '(Build x0) := x0;
  }.
End Seconds.
Definition Seconds := Seconds.t.

Definition main (_ : unit) : unit :=
  let _one_second := Seconds.Build 1 in
  let foot := Inches.Build 12 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "One foot equals "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] foot ]) ;;
  tt ;;
  let meter := Centimeters.Build 100 (* 100.0 *) in
  let cmp :=
    if (foot.["to_centimeters"].["lt"] meter : bool) then
      "smaller"
    else
      "bigger" in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "One foot is "; " than one meter.\n" ]
      [ _crate.fmt.ArgumentV1::["new_display"] cmp ]) ;;
  tt ;;
  tt.
