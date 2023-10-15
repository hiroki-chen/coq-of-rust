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
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_z : Notation.Dot "z" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
  Global Instance Get_AF_z : Notation.DoubleColon t "z" := {
    Notation.double_colon '(Build_t _ _ x2) := x2;
  }.
End Point.
Definition Point : Set := ⟅Point.t⟆.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let point :=
    {|
      scoping_rules_borrowing_aliasing.Point.x := 0;
      scoping_rules_borrowing_aliasing.Point.y := 0;
      scoping_rules_borrowing_aliasing.Point.z := 0;
    |} in
  let* borrowed_point := borrow point scoping_rules_borrowing_aliasing.Point in
  let* another_borrow := borrow point scoping_rules_borrowing_aliasing.Point in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ "Point has coordinates: ("; ", "; ", "; ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref borrowed_point scoping_rules_borrowing_aliasing.Point in
      let* α5 := borrow α4.["x"] i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := deref another_borrow scoping_rules_borrowing_aliasing.Point in
      let* α10 := borrow α9.["y"] i32 in
      let* α11 := deref α10 i32 in
      let* α12 := borrow α11 i32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 := borrow point.["z"] i32 in
      let* α15 := deref α14 i32 in
      let* α16 := borrow α15 i32 in
      let* α17 := core.fmt.rt.Argument::["new_display"] α16 in
      let* α18 := borrow [ α8; α13; α17 ] (list core.fmt.rt.Argument) in
      let* α19 := deref α18 (list core.fmt.rt.Argument) in
      let* α20 := borrow α19 (list core.fmt.rt.Argument) in
      let* α21 := pointer_coercion "Unsize" α20 in
      let* α22 := core.fmt.Arguments::["new_v1"] α3 α21 in
      std.io.stdio._print α22 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ "Point has coordinates: ("; ", "; ", "; ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref borrowed_point scoping_rules_borrowing_aliasing.Point in
      let* α5 := borrow α4.["x"] i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := deref another_borrow scoping_rules_borrowing_aliasing.Point in
      let* α10 := borrow α9.["y"] i32 in
      let* α11 := deref α10 i32 in
      let* α12 := borrow α11 i32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 := borrow point.["z"] i32 in
      let* α15 := deref α14 i32 in
      let* α16 := borrow α15 i32 in
      let* α17 := core.fmt.rt.Argument::["new_display"] α16 in
      let* α18 := borrow [ α8; α13; α17 ] (list core.fmt.rt.Argument) in
      let* α19 := deref α18 (list core.fmt.rt.Argument) in
      let* α20 := borrow α19 (list core.fmt.rt.Argument) in
      let* α21 := pointer_coercion "Unsize" α20 in
      let* α22 := core.fmt.Arguments::["new_v1"] α3 α21 in
      std.io.stdio._print α22 in
    Pure tt in
  let* mutable_borrow :=
    borrow_mut point scoping_rules_borrowing_aliasing.Point in
  let* _ :=
    let* α0 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
    assign α0.["x"] 5 in
  let* _ :=
    let* α0 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
    assign α0.["y"] 2 in
  let* _ :=
    let* α0 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
    assign α0.["z"] 1 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ "Point has coordinates: ("; ", "; ", "; ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
      let* α5 := borrow α4.["x"] i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
      let* α10 := borrow α9.["y"] i32 in
      let* α11 := deref α10 i32 in
      let* α12 := borrow α11 i32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 := deref mutable_borrow scoping_rules_borrowing_aliasing.Point in
      let* α15 := borrow α14.["z"] i32 in
      let* α16 := deref α15 i32 in
      let* α17 := borrow α16 i32 in
      let* α18 := core.fmt.rt.Argument::["new_display"] α17 in
      let* α19 := borrow [ α8; α13; α18 ] (list core.fmt.rt.Argument) in
      let* α20 := deref α19 (list core.fmt.rt.Argument) in
      let* α21 := borrow α20 (list core.fmt.rt.Argument) in
      let* α22 := pointer_coercion "Unsize" α21 in
      let* α23 := core.fmt.Arguments::["new_v1"] α3 α22 in
      std.io.stdio._print α23 in
    Pure tt in
  let* new_borrowed_point :=
    borrow point scoping_rules_borrowing_aliasing.Point in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ "Point now has coordinates: ("; ", "; ", "; ")
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        deref new_borrowed_point scoping_rules_borrowing_aliasing.Point in
      let* α5 := borrow α4.["x"] i32 in
      let* α6 := deref α5 i32 in
      let* α7 := borrow α6 i32 in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 :=
        deref new_borrowed_point scoping_rules_borrowing_aliasing.Point in
      let* α10 := borrow α9.["y"] i32 in
      let* α11 := deref α10 i32 in
      let* α12 := borrow α11 i32 in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 :=
        deref new_borrowed_point scoping_rules_borrowing_aliasing.Point in
      let* α15 := borrow α14.["z"] i32 in
      let* α16 := deref α15 i32 in
      let* α17 := borrow α16 i32 in
      let* α18 := core.fmt.rt.Argument::["new_display"] α17 in
      let* α19 := borrow [ α8; α13; α18 ] (list core.fmt.rt.Argument) in
      let* α20 := deref α19 (list core.fmt.rt.Argument) in
      let* α21 := borrow α20 (list core.fmt.rt.Argument) in
      let* α22 := pointer_coercion "Unsize" α21 in
      let* α23 := core.fmt.Arguments::["new_v1"] α3 α22 in
      std.io.stdio._print α23 in
    Pure tt in
  Pure tt.
