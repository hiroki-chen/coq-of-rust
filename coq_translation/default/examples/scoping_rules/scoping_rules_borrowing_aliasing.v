(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Point.
  Unset Primitive Projections.
  Record t : Set := {
    x : i32;
    y : i32;
    z : i32;
  }.
  Global Set Primitive Projections.
  
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

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let point :=
    {|
      scoping_rules_borrowing_aliasing.Point.x := 0;
      scoping_rules_borrowing_aliasing.Point.y := 0;
      scoping_rules_borrowing_aliasing.Point.z := 0;
    |} in
  let borrowed_point := addr_of point in
  let another_borrow := addr_of point in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of borrowed_point.["x"]) in
      let* α1 :=
        format_argument::["new_display"] (addr_of another_borrow.["y"]) in
      let* α2 := format_argument::["new_display"] (addr_of point.["z"]) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Point has coordinates: ("; ", "; ", "; ")
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of borrowed_point.["x"]) in
      let* α1 :=
        format_argument::["new_display"] (addr_of another_borrow.["y"]) in
      let* α2 := format_argument::["new_display"] (addr_of point.["z"]) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Point has coordinates: ("; ", "; ", "; ")
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  let mutable_borrow := addr_of point in
  let* _ := assign mutable_borrow.["x"] 5 in
  let* _ := assign mutable_borrow.["y"] 2 in
  let* _ := assign mutable_borrow.["z"] 1 in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of mutable_borrow.["x"]) in
      let* α1 :=
        format_argument::["new_display"] (addr_of mutable_borrow.["y"]) in
      let* α2 :=
        format_argument::["new_display"] (addr_of mutable_borrow.["z"]) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Point has coordinates: ("; ", "; ", "; ")
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  let new_borrowed_point := addr_of point in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"] (addr_of new_borrowed_point.["x"]) in
      let* α1 :=
        format_argument::["new_display"] (addr_of new_borrowed_point.["y"]) in
      let* α2 :=
        format_argument::["new_display"] (addr_of new_borrowed_point.["z"]) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Point now has coordinates: ("; ", "; ", "; ")
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  Pure tt.
