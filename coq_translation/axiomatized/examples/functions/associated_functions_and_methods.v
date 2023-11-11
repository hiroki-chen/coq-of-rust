(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

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

Module  Impl_associated_functions_and_methods_Point_t.
Section Impl_associated_functions_and_methods_Point_t.
  Ltac Self := exact associated_functions_and_methods.Point.t.
  
  Parameter origin : M (M.Val associated_functions_and_methods.Point.t).
  
  Global Instance AssociatedFunction_origin :
    Notation.DoubleColon ltac:(Self) "origin" := {
    Notation.double_colon := origin;
  }.
  
  Parameter new :
      (M.Val f64.t) ->
        (M.Val f64.t) ->
        M (M.Val associated_functions_and_methods.Point.t).
  
  Global Instance AssociatedFunction_new :
    Notation.DoubleColon ltac:(Self) "new" := {
    Notation.double_colon := new;
  }.
End Impl_associated_functions_and_methods_Point_t.
End Impl_associated_functions_and_methods_Point_t.

Module  Rectangle.
Section Rectangle.
  Record t : Set := {
    p1 : associated_functions_and_methods.Point.t;
    p2 : associated_functions_and_methods.Point.t;
  }.
  
  Global Instance Get_p1 : Notation.Dot "p1" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(p1) : M _;
  }.
  Global Instance Get_AF_p1 : Notation.DoubleColon t "p1" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(p1) : M _;
  }.
  Global Instance Get_p2 : Notation.Dot "p2" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(p2) : M _;
  }.
  Global Instance Get_AF_p2 : Notation.DoubleColon t "p2" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(p2) : M _;
  }.
End Rectangle.
End Rectangle.

Module  Impl_associated_functions_and_methods_Rectangle_t.
Section Impl_associated_functions_and_methods_Rectangle_t.
  Ltac Self := exact associated_functions_and_methods.Rectangle.t.
  
  Parameter get_p1 :
      (M.Val (ref ltac:(Self))) ->
        M (M.Val associated_functions_and_methods.Point.t).
  
  Global Instance AssociatedFunction_get_p1 :
    Notation.DoubleColon ltac:(Self) "get_p1" := {
    Notation.double_colon := get_p1;
  }.
  
  Parameter area : (M.Val (ref ltac:(Self))) -> M (M.Val f64.t).
  
  Global Instance AssociatedFunction_area :
    Notation.DoubleColon ltac:(Self) "area" := {
    Notation.double_colon := area;
  }.
  
  Parameter perimeter : (M.Val (ref ltac:(Self))) -> M (M.Val f64.t).
  
  Global Instance AssociatedFunction_perimeter :
    Notation.DoubleColon ltac:(Self) "perimeter" := {
    Notation.double_colon := perimeter;
  }.
  
  Parameter translate :
      (M.Val (mut_ref ltac:(Self))) ->
        (M.Val f64.t) ->
        (M.Val f64.t) ->
        M (M.Val unit).
  
  Global Instance AssociatedFunction_translate :
    Notation.DoubleColon ltac:(Self) "translate" := {
    Notation.double_colon := translate;
  }.
End Impl_associated_functions_and_methods_Rectangle_t.
End Impl_associated_functions_and_methods_Rectangle_t.

Module  Pair.
Section Pair.
  Record t : Set := {
    x0 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
    x1 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
  Global Instance Get_1 : Notation.Dot "1" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x1) : M _;
  }.
End Pair.
End Pair.

Module  Impl_associated_functions_and_methods_Pair_t.
Section Impl_associated_functions_and_methods_Pair_t.
  Ltac Self := exact associated_functions_and_methods.Pair.t.
  
  Parameter destroy : (M.Val ltac:(Self)) -> M (M.Val unit).
  
  Global Instance AssociatedFunction_destroy :
    Notation.DoubleColon ltac:(Self) "destroy" := {
    Notation.double_colon := destroy;
  }.
End Impl_associated_functions_and_methods_Pair_t.
End Impl_associated_functions_and_methods_Pair_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
