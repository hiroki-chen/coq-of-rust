(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module fmt := std.fmt.

Error ForeignMod.

Definition cos (z : Complex) : Complex := ccosf z.

Definition main (_ : unit) : unit :=
  let z := {| Complex.re := neg 1 (* 1. *); Complex.im := 0 (* 0. *); |} in
  let z_sqrt := csqrtf z in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "the square root of "; " is "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"] z;
        _crate.fmt.ArgumentV1::["new_debug"] z_sqrt
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "cos("; ") = "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"] z;
        _crate.fmt.ArgumentV1::["new_debug"] (cos z)
      ]) ;;
  tt ;;
  tt.

Module Complex.
  Record t : Set := {
    re : f32;
    im : f32;
  }.
  
  Global Instance Get_re : Notation.Dot "re" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_im : Notation.Dot "im" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Complex.
Definition Complex : Set := Complex.t.

Module Impl__crate_clone_Clone_for_Complex.
  Definition Self := Complex.
  
  Definition clone (self : ref Self) : Complex :=
    let '_ := tt in
    deref self.
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_Complex.

Module Impl__crate_marker_Copy_for_Complex.
  Definition Self := Complex.
  
  Global Instance I : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Complex.

Module Impl_fmt_Debug_for_Complex.
  Definition Self := Complex.
  
  Definition fmt (self : ref Self) (f : mut_ref fmt.Formatter) : fmt.Result :=
    if (self.["im"].["lt"] 0 (* 0. *) : bool) then
      f.["write_fmt"]
        (_crate.fmt.Arguments::["new_v1"]
          [ ""; "-"; "i" ]
          [
            _crate.fmt.ArgumentV1::["new_display"] self.["re"];
            _crate.fmt.ArgumentV1::["new_display"] (neg self.["im"])
          ])
    else
      f.["write_fmt"]
        (_crate.fmt.Arguments::["new_v1"]
          [ ""; "+"; "i" ]
          [
            _crate.fmt.ArgumentV1::["new_display"] self.["re"];
            _crate.fmt.ArgumentV1::["new_display"] self.["im"]
          ]).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : fmt.Debug.Trait Self := {
    fmt.Debug.fmt := fmt;
  }.
End Impl_fmt_Debug_for_Complex.
