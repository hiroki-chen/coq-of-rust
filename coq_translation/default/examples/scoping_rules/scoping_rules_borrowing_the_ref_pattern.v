(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Point.
Section Point.
  Record t : Set := {
    x : i32.t;
    y : i32.t;
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

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Ltac Self := exact scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val scoping_rules_borrowing_the_ref_pattern.Point.t) :=
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
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_the_ref_pattern_Point_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
  Ltac Self := exact scoping_rules_borrowing_the_ref_pattern.Point.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_the_ref_pattern_Point_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* c : ltac:(refine (M.Val char.t)) := M.alloc "Q"%char in
    let ref_c1 := c in
    let* ref_c2 : ltac:(refine (M.Val (ref char.t))) := borrow c in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "ref_c1 equals ref_c2: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val char.t)) := deref ref_c1 in
        let* α4 : ltac:(refine (M.Val char.t)) := deref ref_c2 in
        let* α5 : ltac:(refine (M.Val bool.t)) := BinOp.eq α3 α4 in
        let* α6 : ltac:(refine (M.Val (ref bool.t))) := borrow α5 in
        let* α7 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α6 in
        let* α8 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α7 ] in
        let* α9 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α8 in
        let* α10 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α9 in
        let* α11 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α10 in
        std.io.stdio._print α11 in
      M.alloc tt in
    let* point :
        ltac:(refine (M.Val scoping_rules_borrowing_the_ref_pattern.Point.t)) :=
      let* α0 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val i32.t)) := M.alloc 0 in
      let* α3 := M.read α2 in
      M.alloc
        {|
          scoping_rules_borrowing_the_ref_pattern.Point.x := α1;
          scoping_rules_borrowing_the_ref_pattern.Point.y := α3;
        |} in
    let* _copy_of_x : ltac:(refine (M.Val i32.t)) :=
      let '{|
            scoping_rules_borrowing_the_ref_pattern.Point.x := ref_to_x;
            scoping_rules_borrowing_the_ref_pattern.Point.y := _;
          |} :=
        point in
      deref ref_to_x in
    let mutable_point := point in
    let* _ : ltac:(refine (M.Val unit)) :=
      let '{|
            scoping_rules_borrowing_the_ref_pattern.Point.x := _;
            scoping_rules_borrowing_the_ref_pattern.Point.y := mut_ref_to_y;
          |} :=
        mutable_point in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val i32.t)) := deref mut_ref_to_y in
        let* α1 : ltac:(refine (M.Val i32.t)) := M.alloc 1 in
        assign α0 α1 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "point is ("; mk_str ", "; mk_str ")
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := point.["x"] in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val i32.t)) := point.["y"] in
        let* α7 : ltac:(refine (M.Val (ref i32.t))) := borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5; α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "mutable_point is ("; mk_str ", "; mk_str ")
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val i32.t)) := mutable_point.["x"] in
        let* α4 : ltac:(refine (M.Val (ref i32.t))) := borrow α3 in
        let* α5 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α4 in
        let* α6 : ltac:(refine (M.Val i32.t)) := mutable_point.["y"] in
        let* α7 : ltac:(refine (M.Val (ref i32.t))) := borrow α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α7 in
        let* α9 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α5; α8 ] in
        let* α10 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α9 in
        let* α11 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α11 in
        std.io.stdio._print α12 in
      M.alloc tt in
    let* mutable_tuple :
        ltac:(refine
          (M.Val ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t))) :=
      let* α0 : ltac:(refine (M.Val u32.t)) := M.alloc 5 in
      let* α1 :
          ltac:(refine
            (M.Val (alloc.boxed.Box.t u32.t alloc.alloc.Global.t))) :=
        (alloc.boxed.Box.t u32.t alloc.alloc.Global.t)::["new"] α0 in
      let* α2 := M.read α1 in
      let* α3 : ltac:(refine (M.Val u32.t)) := M.alloc 3 in
      let* α4 := M.read α3 in
      M.alloc (α2, α4) in
    let* _ : ltac:(refine (M.Val unit)) :=
      let '(_, last) := mutable_tuple in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val u32.t)) := deref last in
        let* α1 : ltac:(refine (M.Val u32.t)) := M.alloc 2 in
        assign α0 α1 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "tuple is "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  ((alloc.boxed.Box.t u32.t alloc.alloc.Global.t) * u32.t)))) :=
          borrow mutable_tuple in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).
