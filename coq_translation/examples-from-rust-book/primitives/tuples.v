(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition reverse (pair : i32 * bool) : bool * i32 :=
  let '(int_param, bool_param) := pair in
  (bool_param, int_param).

Module Matrix.
  Record t : Set := { _ : f32; _ : f32; _ : f32; _ : f32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _ _ _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1 _ _) := x1;
  }.
  Global Instance Get_2 : Notation.Dot 2 := {
    Notation.dot '(Build_t _ _ x2 _) := x2;
  }.
  Global Instance Get_3 : Notation.Dot 3 := {
    Notation.dot '(Build_t _ _ _ x3) := x3;
  }.
End Matrix.
Definition Matrix := Matrix.t.

Module Impl__crate_fmt_Debug_for_Matrix.
  Definition Self := Matrix.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field4_finish"]
      f
      "Matrix"
      (IndexedField.get (index := 0) self)
      (IndexedField.get (index := 1) self)
      (IndexedField.get (index := 2) self)
      (IndexedField.get (index := 3) self).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Matrix.

Definition main (_ : unit) : unit :=
  let long_tuple :=
    (1,
      2,
      3,
      4,
      neg 1,
      neg 2,
      neg 3,
      neg 4,
      0 (* 0.1 *),
      0 (* 0.2 *),
      a,
      true) in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "long tuple first value: "; "\n" ]
      [
        _crate.fmt.ArgumentV1::["new_display"]
          (IndexedField.get (index := 0) long_tuple)
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "long tuple second value: "; "\n" ]
      [
        _crate.fmt.ArgumentV1::["new_display"]
          (IndexedField.get (index := 1) long_tuple)
      ]) ;;
  tt ;;
  let tuple_of_tuples := ((1, 2, 2), (4, neg 1), neg 2) in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "tuple of tuples: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] tuple_of_tuples ]) ;;
  tt ;;
  let pair := (1, true) in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "pair is "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] pair ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "the reversed pair is "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (reverse pair) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "one element tuple: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (5) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "just an integer: "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] 5 ]) ;;
  tt ;;
  let tuple := (1, "hello", 5 (* 4.5 *), true) in
  let '(a, b, c, d) := tuple in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; ", "; ", "; ", "; "\n" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"] a;
        _crate.fmt.ArgumentV1::["new_debug"] b;
        _crate.fmt.ArgumentV1::["new_debug"] c;
        _crate.fmt.ArgumentV1::["new_debug"] d
      ]) ;;
  tt ;;
  let matrix := Matrix.Build 1 (* 1.1 *) 1 (* 1.2 *) 2 (* 2.1 *) 2 (* 2.2 *) in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ ""; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] matrix ]) ;;
  tt ;;
  tt.
