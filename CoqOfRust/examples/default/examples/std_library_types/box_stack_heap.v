(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Point.
Section Point.
  Record t : Set := {
    x : f64.t;
    y : f64.t;
  }.
  
  Global Instance Get_x : Notations.Dot "x" := {
    Notations.dot := Ref.map (fun x' => x'.(x)) (fun v x' => x' <| x := v |>);
  }.
  Global Instance Get_AF_x : Notations.DoubleColon t "x" := {
    Notations.double_colon (x' : M.Val t) := x'.["x"];
  }.
  Global Instance Get_y : Notations.Dot "y" := {
    Notations.dot := Ref.map (fun x => x.(y)) (fun v x => x <| y := v |>);
  }.
  Global Instance Get_AF_y : Notations.DoubleColon t "y" := {
    Notations.double_colon (x : M.Val t) := x.["y"];
  }.
End Point.
End Point.

Module  Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
Section Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
  Definition Self : Set := box_stack_heap.Point.t.
  
  (*
  Debug
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Point") in
    let* α2 : ref str.t := M.read (mk_str "x") in
    let* α3 : ref box_stack_heap.Point.t := M.read self in
    let* α4 : M.Val (ref f64.t) := M.alloc (borrow (deref α3).["x"]) in
    let* α5 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : ref str.t := M.read (mk_str "y") in
    let* α7 : ref box_stack_heap.Point.t := M.read self in
    let* α8 : M.Val (ref f64.t) := M.alloc (borrow (deref α7).["y"]) in
    let* α9 : M.Val (ref (ref f64.t)) := M.alloc (borrow α8) in
    let* α10 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α9) in
    M.call
      (core.fmt.Formatter.t::["debug_struct_field2_finish"] α0 α1 α2 α5 α6 α10).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.

Module  Impl_core_clone_Clone_for_box_stack_heap_Point_t.
Section Impl_core_clone_Clone_for_box_stack_heap_Point_t.
  Definition Self : Set := box_stack_heap.Point.t.
  
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone (self : ref Self) : M box_stack_heap.Point.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let _ : unit := tt in
    let* α0 : ref box_stack_heap.Point.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.

Module  Impl_core_marker_Copy_for_box_stack_heap_Point_t.
Section Impl_core_marker_Copy_for_box_stack_heap_Point_t.
  Definition Self : Set := box_stack_heap.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_box_stack_heap_Point_t.
End Impl_core_marker_Copy_for_box_stack_heap_Point_t.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Rectangle.
Section Rectangle.
  Record t : Set := {
    top_left : box_stack_heap.Point.t;
    bottom_right : box_stack_heap.Point.t;
  }.
  
  Global Instance Get_top_left : Notations.Dot "top_left" := {
    Notations.dot :=
      Ref.map (fun x => x.(top_left)) (fun v x => x <| top_left := v |>);
  }.
  Global Instance Get_AF_top_left : Notations.DoubleColon t "top_left" := {
    Notations.double_colon (x : M.Val t) := x.["top_left"];
  }.
  Global Instance Get_bottom_right : Notations.Dot "bottom_right" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(bottom_right))
        (fun v x => x <| bottom_right := v |>);
  }.
  Global Instance Get_AF_bottom_right :
    Notations.DoubleColon t "bottom_right" := {
    Notations.double_colon (x : M.Val t) := x.["bottom_right"];
  }.
End Rectangle.
End Rectangle.

(*
fn origin() -> Point {
    Point { x: 0.0, y: 0.0 }
}
*)
Definition origin : M box_stack_heap.Point.t :=
  let* α0 : f64.t := M.read UnsupportedLiteral in
  let* α1 : f64.t := M.read UnsupportedLiteral in
  M.pure {| box_stack_heap.Point.x := α0; box_stack_heap.Point.y := α1; |}.

(*
fn boxed_origin() -> Box<Point> {
    // Allocate this point on the heap, and return a pointer to it
    Box::new(Point { x: 0.0, y: 0.0 })
}
*)
Definition boxed_origin
    : M (alloc.boxed.Box.t box_stack_heap.Point.t alloc.boxed.Box.Default.A) :=
  let* α0 : f64.t := M.read UnsupportedLiteral in
  let* α1 : f64.t := M.read UnsupportedLiteral in
  M.call
    ((alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)::["new"]
      {| box_stack_heap.Point.x := α0; box_stack_heap.Point.y := α1; |}).

(*
fn main() {
    // (all the type annotations are superfluous)
    // Stack allocated variables
    let point: Point = origin();
    let rectangle: Rectangle = Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    };

    // Heap allocated rectangle
    let boxed_rectangle: Box<Rectangle> = Box::new(Rectangle {
        top_left: origin(),
        bottom_right: Point { x: 3.0, y: -4.0 },
    });

    // The output of functions can be boxed
    let boxed_point: Box<Point> = Box::new(origin());

    // Double indirection
    let box_in_a_box: Box<Box<Point>> = Box::new(boxed_origin());

    println!(
        "Point occupies {} bytes on the stack",
        mem::size_of_val(&point)
    );
    println!(
        "Rectangle occupies {} bytes on the stack",
        mem::size_of_val(&rectangle)
    );

    // box size == pointer size
    println!(
        "Boxed point occupies {} bytes on the stack",
        mem::size_of_val(&boxed_point)
    );
    println!(
        "Boxed rectangle occupies {} bytes on the stack",
        mem::size_of_val(&boxed_rectangle)
    );
    println!(
        "Boxed box occupies {} bytes on the stack",
        mem::size_of_val(&box_in_a_box)
    );

    // Copy the data contained in `boxed_point` into `unboxed_point`
    let unboxed_point: Point = *boxed_point;
    println!(
        "Unboxed point occupies {} bytes on the stack",
        mem::size_of_val(&unboxed_point)
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* point : M.Val box_stack_heap.Point.t :=
    let* α0 : box_stack_heap.Point.t := M.call box_stack_heap.origin in
    M.alloc α0 in
  let* rectangle : M.Val box_stack_heap.Rectangle.t :=
    let* α0 : box_stack_heap.Point.t := M.call box_stack_heap.origin in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : f64.t := M.read UnsupportedLiteral in
    M.alloc
      {|
        box_stack_heap.Rectangle.top_left := α0;
        box_stack_heap.Rectangle.bottom_right :=
          {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α2; |};
      |} in
  let* boxed_rectangle :
      M.Val
        (alloc.boxed.Box.t box_stack_heap.Rectangle.t alloc.alloc.Global.t) :=
    let* α0 : box_stack_heap.Point.t := M.call box_stack_heap.origin in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : f64.t := M.read UnsupportedLiteral in
    let* α3 :
        alloc.boxed.Box.t box_stack_heap.Rectangle.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t
              box_stack_heap.Rectangle.t
              alloc.alloc.Global.t)::["new"]
          {|
            box_stack_heap.Rectangle.top_left := α0;
            box_stack_heap.Rectangle.bottom_right :=
              {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α2; |};
          |}) in
    M.alloc α3 in
  let* boxed_point :
      M.Val (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t) :=
    let* α0 : box_stack_heap.Point.t := M.call box_stack_heap.origin in
    let* α1 : alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t
              box_stack_heap.Point.t
              alloc.alloc.Global.t)::["new"]
          α0) in
    M.alloc α1 in
  let* box_in_a_box :
      M.Val
        (alloc.boxed.Box.t
          (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)
          alloc.alloc.Global.t) :=
    let* α0 : alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t :=
      M.call box_stack_heap.boxed_origin in
    let* α1 :
        alloc.boxed.Box.t
          (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)
          alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t
              (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)
              alloc.alloc.Global.t)::["new"]
          α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Point occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t := M.call (core.mem.size_of_val (borrow point)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Rectangle occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t := M.call (core.mem.size_of_val (borrow rectangle)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Boxed point occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t := M.call (core.mem.size_of_val (borrow boxed_point)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Boxed rectangle occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t :=
        M.call (core.mem.size_of_val (borrow boxed_rectangle)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Boxed box occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t :=
        M.call (core.mem.size_of_val (borrow box_in_a_box)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* unboxed_point : M.Val box_stack_heap.Point.t :=
    let* α0 : alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t :=
      M.read boxed_point in
    M.copy (deref α0) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Unboxed point occupies ") in
      let* α1 : ref str.t := M.read (mk_str " bytes on the stack
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : usize.t :=
        M.call (core.mem.size_of_val (borrow unboxed_point)) in
      let* α6 : M.Val usize.t := M.alloc α5 in
      let* α7 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α6)) in
      let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
      let* α9 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α8) in
      let* α10 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α9) in
      let* α11 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α10) in
      let* α12 : unit := M.call (std.io.stdio._print α11) in
      M.alloc α12 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
