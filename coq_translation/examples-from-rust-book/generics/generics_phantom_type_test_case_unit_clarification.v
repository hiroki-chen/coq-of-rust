(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module PhantomData := std.marker.PhantomData.
Definition PhantomData := PhantomData.t.

Module Inch.
  Inductive t : Set :=
  .
End Inch.
Definition Inch := Inch.t.

Module Impl__crate_fmt_Debug_for_Inch.
  Definition Self := Inch.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.intrinsics.unreachable tt.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Inch.

Module Impl__crate_clone_Clone_for_Inch.
  Definition Self := Inch.
  
  Definition clone (self : ref Self) : Inch := deref self.
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_Inch.

Module Impl__crate_marker_Copy_for_Inch.
  Definition Self := Inch.
  
  Global Instance I : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Inch.

Module Mm.
  Inductive t : Set :=
  .
End Mm.
Definition Mm := Mm.t.

Module Impl__crate_fmt_Debug_for_Mm.
  Definition Self := Mm.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.intrinsics.unreachable tt.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Mm.

Module Impl__crate_clone_Clone_for_Mm.
  Definition Self := Mm.
  
  Definition clone (self : ref Self) : Mm := deref self.
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_Mm.

Module Impl__crate_marker_Copy_for_Mm.
  Definition Self := Mm.
  
  Global Instance I : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Mm.

Module Length.
  Record t : Set := { _ : f64; _ : PhantomData Unit;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Length.
Definition Length := Length.t.

Module Impl__crate_fmt_Debug_for_Length_Unit.
  Definition Self := Length Unit.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field2_finish"]
      f
      "Length"
      (self.[0])
      (self.[1]).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I Unit : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Length_Unit.

Module Impl__crate_clone_Clone_for_Length_Unit.
  Definition Self := Length Unit.
  
  Definition clone (self : ref Self) : Length Unit :=
    Length.Build_t
      (_crate.clone.Clone.clone (self.[0]))
      (_crate.clone.Clone.clone (self.[1])).
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I Unit : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_Length_Unit.

Module Impl__crate_marker_Copy_for_Length_Unit.
  Definition Self := Length Unit.
  
  Global Instance I Unit : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Length_Unit.

Module Impl_Add_for_Length_Unit.
  Definition Self := Length Unit.
  
  Definition Output : Set := Length Unit.
  
  Definition add (self : Self) (rhs : Length Unit) : Length Unit :=
    Length.Build_t ((self.[0]).["add"] (rhs.[0])) PhantomData.Build.
  
  Global Instance Method_add : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I Unit : Add.Trait Self := {
    Add.add := add;
  }.
End Impl_Add_for_Length_Unit.

Definition main (_ : unit) : unit :=
  let one_foot := Length.Build_t 12 (* 12.0 *) PhantomData.Build in
  let one_meter := Length.Build_t 1000 (* 1000.0 *) PhantomData.Build in
  let two_feet := one_foot.["add"] one_foot in
  let two_meters := one_meter.["add"] one_meter in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "one foot + one_foot = "; " in
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (two_feet.[0]) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "one meter + one_meter = "; " mm
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (two_meters.[0]) ]) ;;
  tt ;;
  tt.
