(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Point.
  Record t : Set := {
    x : f64;
    y : f64;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Point.
Definition Point : Set := Point.t.

Module Impl_associated_functions_and_methods_Point.
  Definition Self := associated_functions_and_methods.Point.
  
  Parameter origin : unit -> M associated_functions_and_methods.Point.
  
  Global Instance AssociatedFunction_origin :
    Notation.DoubleColon Self "origin" := {
    Notation.double_colon := origin;
  }.
  
  Parameter new : f64-> f64 -> M associated_functions_and_methods.Point.
  
  Global Instance AssociatedFunction_new : Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_associated_functions_and_methods_Point.

Module Rectangle.
  Record t : Set := {
    p1 : associated_functions_and_methods.Point;
    p2 : associated_functions_and_methods.Point;
  }.
  
  Global Instance Get_p1 : Notation.Dot "p1" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_p2 : Notation.Dot "p2" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Rectangle.
Definition Rectangle : Set := Rectangle.t.

Module Impl_associated_functions_and_methods_Rectangle.
  Definition Self := associated_functions_and_methods.Rectangle.
  
  Parameter get_p1 : ref Self -> M associated_functions_and_methods.Point.
  
  Global Instance Method_get_p1 : Notation.Dot "get_p1" := {
    Notation.dot := get_p1;
  }.
  
  Parameter area : ref Self -> M f64.
  
  Global Instance Method_area : Notation.Dot "area" := {
    Notation.dot := area;
  }.
  
  Parameter perimeter : ref Self -> M f64.
  
  Global Instance Method_perimeter : Notation.Dot "perimeter" := {
    Notation.dot := perimeter;
  }.
  
  Parameter translate : mut_ref Self-> f64-> f64 -> M unit.
  
  Global Instance Method_translate : Notation.Dot "translate" := {
    Notation.dot := translate;
  }.
End Impl_associated_functions_and_methods_Rectangle.

Module Pair.
  Record t : Set := { _ : alloc.boxed.Box i32; _ : alloc.boxed.Box i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Pair.
Definition Pair := Pair.t.

Module Impl_associated_functions_and_methods_Pair.
  Definition Self := associated_functions_and_methods.Pair.
  
  Parameter destroy : Self -> M unit.
  
  Global Instance Method_destroy : Notation.Dot "destroy" := {
    Notation.dot := destroy;
  }.
End Impl_associated_functions_and_methods_Pair.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
