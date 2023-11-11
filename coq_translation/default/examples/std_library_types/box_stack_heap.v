(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Point.
Section Point.
  Record t : Set := {
    x : f64.t;
    y : f64.t;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
End Point.
End Point.

Module  Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
Section Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition fmt
      (self : M.Val (ref ltac:(Self)))
      (f : M.Val (mut_ref core.fmt.Formatter.t))
      : M (M.Val ltac:(core.fmt.Result)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
      let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
        borrow_mut α0 in
      let* α2 : ltac:(refine (M.Val str)) := deref (mk_str "Point") in
      let* α3 : ltac:(refine (M.Val (ref str))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val str)) := deref (mk_str "x") in
      let* α5 : ltac:(refine (M.Val (ref str))) := borrow α4 in
      let* α6 : ltac:(refine (M.Val box_stack_heap.Point.t)) := deref self in
      let* α7 : ltac:(refine (M.Val f64.t)) := α6.["x"] in
      let* α8 : ltac:(refine (M.Val (ref f64.t))) := borrow α7 in
      let* α9 : ltac:(refine (M.Val (ref type not implemented))) :=
        pointer_coercion "Unsize" α8 in
      let* α10 : ltac:(refine (M.Val str)) := deref (mk_str "y") in
      let* α11 : ltac:(refine (M.Val (ref str))) := borrow α10 in
      let* α12 : ltac:(refine (M.Val box_stack_heap.Point.t)) := deref self in
      let* α13 : ltac:(refine (M.Val f64.t)) := α12.["y"] in
      let* α14 : ltac:(refine (M.Val (ref f64.t))) := borrow α13 in
      let* α15 : ltac:(refine (M.Val (ref (ref f64.t)))) := borrow α14 in
      let* α16 : ltac:(refine (M.Val (ref type not implemented))) :=
        pointer_coercion "Unsize" α15 in
      core.fmt.Formatter.t::["debug_struct_field2_finish"] α1 α3 α5 α9 α11 α16).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.
End Impl_core_fmt_Debug_for_box_stack_heap_Point_t.

Module  Impl_core_clone_Clone_for_box_stack_heap_Point_t.
Section Impl_core_clone_Clone_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val box_stack_heap.Point.t) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      deref self).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.
End Impl_core_clone_Clone_for_box_stack_heap_Point_t.

Module  Impl_core_marker_Copy_for_box_stack_heap_Point_t.
Section Impl_core_marker_Copy_for_box_stack_heap_Point_t.
  Ltac Self := exact box_stack_heap.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
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
  
  Global Instance Get_top_left : Notation.Dot "top_left" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(top_left) : M _;
  }.
  Global Instance Get_AF_top_left : Notation.DoubleColon t "top_left" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(top_left) : M _;
  }.
  Global Instance Get_bottom_right : Notation.Dot "bottom_right" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(bottom_right) : M _;
  }.
  Global Instance Get_AF_bottom_right :
    Notation.DoubleColon t "bottom_right" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(bottom_right) : M _;
  }.
End Rectangle.
End Rectangle.

Definition origin : M (M.Val box_stack_heap.Point.t) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α1 := M.read α0 in
    let* α2 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α3 := M.read α2 in
    M.alloc {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α3; |}).

Definition boxed_origin
    :
      M
        (M.Val
          (alloc.boxed.Box.t
            box_stack_heap.Point.t
            alloc.boxed.Box.Default.A)) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α1 := M.read α0 in
    let* α2 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α3 := M.read α2 in
    let* α4 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
      M.alloc
        {| box_stack_heap.Point.x := α1; box_stack_heap.Point.y := α3; |} in
    (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)::["new"]
      α4).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* point : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
      box_stack_heap.origin in
    let* rectangle : ltac:(refine (M.Val box_stack_heap.Rectangle.t)) :=
      let* α0 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
        box_stack_heap.origin in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val f64.t)) := M.alloc 3 (* 3.0 *) in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val f64.t)) := M.alloc (- 4 (* 4.0 *)) in
      let* α5 := M.read α4 in
      let* α6 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
        M.alloc
          {| box_stack_heap.Point.x := α3; box_stack_heap.Point.y := α5; |} in
      let* α7 := M.read α6 in
      M.alloc
        {|
          box_stack_heap.Rectangle.top_left := α1;
          box_stack_heap.Rectangle.bottom_right := α7;
        |} in
    let* boxed_rectangle :
        ltac:(refine
          (M.Val
            (alloc.boxed.Box.t
              box_stack_heap.Rectangle.t
              alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
        box_stack_heap.origin in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val f64.t)) := M.alloc 3 (* 3.0 *) in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val f64.t)) := M.alloc (- 4 (* 4.0 *)) in
      let* α5 := M.read α4 in
      let* α6 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
        M.alloc
          {| box_stack_heap.Point.x := α3; box_stack_heap.Point.y := α5; |} in
      let* α7 := M.read α6 in
      let* α8 : ltac:(refine (M.Val box_stack_heap.Rectangle.t)) :=
        M.alloc
          {|
            box_stack_heap.Rectangle.top_left := α1;
            box_stack_heap.Rectangle.bottom_right := α7;
          |} in
      (alloc.boxed.Box.t
            box_stack_heap.Rectangle.t
            alloc.alloc.Global.t)::["new"]
        α8 in
    let* boxed_point :
        ltac:(refine
          (M.Val
            (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t))) :=
      let* α0 : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
        box_stack_heap.origin in
      (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)::["new"]
        α0 in
    let* box_in_a_box :
        ltac:(refine
          (M.Val
            (alloc.boxed.Box.t
              (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)
              alloc.alloc.Global.t))) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (alloc.boxed.Box.t
                box_stack_heap.Point.t
                alloc.alloc.Global.t))) :=
        box_stack_heap.boxed_origin in
      (alloc.boxed.Box.t
            (alloc.boxed.Box.t box_stack_heap.Point.t alloc.alloc.Global.t)
            alloc.alloc.Global.t)::["new"]
        α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Point occupies "; mk_str " bytes on the stack
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref box_stack_heap.Point.t))) :=
          borrow point in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "Rectangle occupies "; mk_str " bytes on the stack
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref box_stack_heap.Rectangle.t))) :=
          borrow rectangle in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "Boxed point occupies "; mk_str " bytes on the stack
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (alloc.boxed.Box.t
                    box_stack_heap.Point.t
                    alloc.alloc.Global.t)))) :=
          borrow boxed_point in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "Boxed rectangle occupies "; mk_str " bytes on the stack
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (alloc.boxed.Box.t
                    box_stack_heap.Rectangle.t
                    alloc.alloc.Global.t)))) :=
          borrow boxed_rectangle in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "Boxed box occupies "; mk_str " bytes on the stack
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (alloc.boxed.Box.t
                    (alloc.boxed.Box.t
                      box_stack_heap.Point.t
                      alloc.alloc.Global.t)
                    alloc.alloc.Global.t)))) :=
          borrow box_in_a_box in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    let* unboxed_point : ltac:(refine (M.Val box_stack_heap.Point.t)) :=
      deref boxed_point in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "Unboxed point occupies "; mk_str " bytes on the stack
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref box_stack_heap.Point.t))) :=
          borrow unboxed_point in
        let* α4 : ltac:(refine (M.Val usize.t)) := core.mem.size_of_val α3 in
        let* α5 : ltac:(refine (M.Val (ref usize.t))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6 ] in
        let* α8 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α7 in
        let* α9 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α9 in
        std.io.stdio._print α10 in
      M.alloc tt in
    M.alloc tt).
