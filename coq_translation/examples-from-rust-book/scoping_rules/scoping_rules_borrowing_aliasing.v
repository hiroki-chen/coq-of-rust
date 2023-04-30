(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Point.
  Record t : Set := {
    x : i32;
    y : i32;
    z : i32;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_z : Notation.Dot "z" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End Point.
Definition Point : Set := Point.t.

Definition main (_ : unit) : unit :=
  let point := {| Point.x := 0; Point.y := 0; Point.z := 0; |} in
  let borrowed_point := point in
  let another_borrow := point in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Point has coordinates: ("; ", "; ", "; ")
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] borrowed_point.["x"];
        _crate.fmt.ArgumentV1::["new_display"] another_borrow.["y"];
        _crate.fmt.ArgumentV1::["new_display"] point.["z"]
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Point has coordinates: ("; ", "; ", "; ")
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] borrowed_point.["x"];
        _crate.fmt.ArgumentV1::["new_display"] another_borrow.["y"];
        _crate.fmt.ArgumentV1::["new_display"] point.["z"]
      ]) ;;
  tt ;;
  let mutable_borrow := point in
  assign mutable_borrow.["x"] 5 ;;
  assign mutable_borrow.["y"] 2 ;;
  assign mutable_borrow.["z"] 1 ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Point has coordinates: ("; ", "; ", "; ")
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] mutable_borrow.["x"];
        _crate.fmt.ArgumentV1::["new_display"] mutable_borrow.["y"];
        _crate.fmt.ArgumentV1::["new_display"] mutable_borrow.["z"]
      ]) ;;
  tt ;;
  let new_borrowed_point := point in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Point now has coordinates: ("; ", "; ", "; ")
" ]
      [
        _crate.fmt.ArgumentV1::["new_display"] new_borrowed_point.["x"];
        _crate.fmt.ArgumentV1::["new_display"] new_borrowed_point.["y"];
        _crate.fmt.ArgumentV1::["new_display"] new_borrowed_point.["z"]
      ]) ;;
  tt ;;
  tt.
