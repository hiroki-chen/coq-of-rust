(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  HasArea.
Section HasArea.
  Class Trait (Self : Set) : Type := {
    area : (ref Self) -> M f64.t;
  }.
  
End HasArea.
End HasArea.

Module  Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle_t.
Section Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle_t.
  Definition Self : Set := generics_bounds.Rectangle.t.
  
  (*
      fn area(&self) -> f64 {
          self.length * self.height
      }
  *)
  Definition area (self : ref Self) : M f64.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* α0 : ref generics_bounds.Rectangle.t := M.read self in
    let* α1 : f64.t := M.read (deref α0).["length"] in
    let* α2 : ref generics_bounds.Rectangle.t := M.read self in
    let* α3 : f64.t := M.read (deref α2).["height"] in
    BinOp.Panic.mul α1 α3.
  
  Global Instance AssociatedFunction_area :
    Notations.DoubleColon Self "area" := {
    Notations.double_colon := area;
  }.
  
  Global Instance ℐ : generics_bounds.HasArea.Trait Self := {
    generics_bounds.HasArea.area := area;
  }.
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle_t.
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle_t.

Module  Rectangle.
Section Rectangle.
  Record t : Set := {
    length : f64.t;
    height : f64.t;
  }.
  
  Global Instance Get_length : Notations.Dot "length" := {
    Notations.dot :=
      Ref.map (fun x => x.(length)) (fun v x => x <| length := v |>);
  }.
  Global Instance Get_AF_length : Notations.DoubleColon t "length" := {
    Notations.double_colon (x : M.Val t) := x.["length"];
  }.
  Global Instance Get_height : Notations.Dot "height" := {
    Notations.dot :=
      Ref.map (fun x => x.(height)) (fun v x => x <| height := v |>);
  }.
  Global Instance Get_AF_height : Notations.DoubleColon t "height" := {
    Notations.double_colon (x : M.Val t) := x.["height"];
  }.
End Rectangle.
End Rectangle.

Module  Impl_core_fmt_Debug_for_generics_bounds_Rectangle_t.
Section Impl_core_fmt_Debug_for_generics_bounds_Rectangle_t.
  Definition Self : Set := generics_bounds.Rectangle.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Rectangle") in
    let* α2 : ref str.t := M.read (mk_str "length") in
    let* α3 : ref generics_bounds.Rectangle.t := M.read self in
    let* α4 : M.Val (ref f64.t) := M.alloc (borrow (deref α3).["length"]) in
    let* α5 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α4) in
    let* α6 : ref str.t := M.read (mk_str "height") in
    let* α7 : ref generics_bounds.Rectangle.t := M.read self in
    let* α8 : M.Val (ref f64.t) := M.alloc (borrow (deref α7).["height"]) in
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
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle_t.
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle_t.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Triangle.
Section Triangle.
  Record t : Set := {
    length : f64.t;
    height : f64.t;
  }.
  
  Global Instance Get_length : Notations.Dot "length" := {
    Notations.dot :=
      Ref.map (fun x => x.(length)) (fun v x => x <| length := v |>);
  }.
  Global Instance Get_AF_length : Notations.DoubleColon t "length" := {
    Notations.double_colon (x : M.Val t) := x.["length"];
  }.
  Global Instance Get_height : Notations.Dot "height" := {
    Notations.dot :=
      Ref.map (fun x => x.(height)) (fun v x => x <| height := v |>);
  }.
  Global Instance Get_AF_height : Notations.DoubleColon t "height" := {
    Notations.double_colon (x : M.Val t) := x.["height"];
  }.
End Triangle.
End Triangle.

(*
fn print_debug<T: Debug>(t: &T) {
    println!("{:?}", t);
}
*)
Definition print_debug
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    (t : ref T)
    : M unit :=
  let* t : M.Val (ref T) := M.alloc t in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow t)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn area<T: HasArea>(t: &T) -> f64 {
    t.area()
}
*)
Definition area
    {T : Set}
    {ℋ_0 : generics_bounds.HasArea.Trait T}
    (t : ref T)
    : M f64.t :=
  let* t : M.Val (ref T) := M.alloc t in
  let* α0 : ref T := M.read t in
  M.call
    ((generics_bounds.HasArea.area (Self := T) (Trait := ltac:(refine _))) α0).

(*
fn main() {
    let rectangle = Rectangle {
        length: 3.0,
        height: 4.0,
    };
    let _triangle = Triangle {
        length: 3.0,
        height: 4.0,
    };

    print_debug(&rectangle);
    println!("Area: {}", rectangle.area());

    //print_debug(&_triangle);
    //println!("Area: {}", _triangle.area());
    // ^ TODO: Try uncommenting these.
    // | Error: Does not implement either `Debug` or `HasArea`.
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* rectangle : M.Val generics_bounds.Rectangle.t :=
    let* α0 : f64.t := M.read UnsupportedLiteral in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    M.alloc
      {|
        generics_bounds.Rectangle.length := α0;
        generics_bounds.Rectangle.height := α1;
      |} in
  let* _triangle : M.Val generics_bounds.Triangle.t :=
    let* α0 : f64.t := M.read UnsupportedLiteral in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    M.alloc
      {|
        generics_bounds.Triangle.length := α0;
        generics_bounds.Triangle.height := α1;
      |} in
  let* _ : M.Val unit :=
    let* α0 : unit := M.call (generics_bounds.print_debug (borrow rectangle)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Area: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : f64.t :=
        M.call
          ((generics_bounds.HasArea.area
              (Self := generics_bounds.Rectangle.t)
              (Trait := ltac:(refine _)))
            (borrow rectangle)) in
      let* α6 : M.Val f64.t := M.alloc α5 in
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
