(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
(* Empty module 'HasArea' *)

(* StructRecord
  {
    name := "Rectangle";
    ty_params := [];
    fields := [ ("length", Ty.path "f64"); ("height", Ty.path "f64") ];
  } *)

Module Impl_core_fmt_Debug_for_generics_bounds_Rectangle.
  Definition Self : Ty.t := Ty.path "generics_bounds::Rectangle".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_struct_field2_finish"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Rectangle") in
      let* α3 := M.read (mk_str "length") in
      let* α5 :=
        (* Unsize *)
          let* α4 := M.read self in
          M.pure
            (M.pointer_coercion
              (M.get_struct_record_field
                α4
                "generics_bounds::Rectangle"
                "length")) in
      let* α6 := M.read (mk_str "height") in
      let* α9 :=
        (* Unsize *)
          let* α7 := M.read self in
          let* α8 :=
            M.alloc
              (M.get_struct_record_field
                α7
                "generics_bounds::Rectangle"
                "height") in
          M.pure (M.pointer_coercion α8) in
      M.call_closure α0 [ α1; α2; α3; α5; α6; α9 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_generics_bounds_Rectangle.

(* StructRecord
  {
    name := "Triangle";
    ty_params := [];
    fields := [ ("length", Ty.path "f64"); ("height", Ty.path "f64") ];
  } *)

Module Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.
  Definition Self : Ty.t := Ty.path "generics_bounds::Rectangle".
  
  (*
      fn area(&self) -> f64 {
          self.length * self.height
      }
  *)
  Definition area (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.read
          (M.get_struct_record_field
            α0
            "generics_bounds::Rectangle"
            "length") in
      let* α2 := M.read self in
      let* α3 :=
        M.read
          (M.get_struct_record_field
            α2
            "generics_bounds::Rectangle"
            "height") in
      BinOp.Panic.mul α1 α3
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds::HasArea"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("area", InstanceField.Method area) ].
End Impl_generics_bounds_HasArea_for_generics_bounds_Rectangle.

(*
fn print_debug<T: Debug>(t: &T) {
    println!("{:?}", t);
}
*)
Definition print_debug (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ T ] ] in
            let* α7 := M.call_closure α6 [ t ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn area<T: HasArea>(t: &T) -> f64 {
    t.area()
}
*)
Definition area (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* α0 := M.get_trait_method "generics_bounds::HasArea" T [] "area" [] in
    let* α1 := M.read t in
    M.call_closure α0 [ α1 ]
  | _, _ => M.impossible
  end.

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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* rectangle :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord
          "generics_bounds::Rectangle"
          [ ("length", α0); ("height", α1) ]) in
    let* _triangle :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructRecord
          "generics_bounds::Triangle"
          [ ("length", α0); ("height", α1) ]) in
    let* _ :=
      let* α0 :=
        M.get_function
          "generics_bounds::print_debug"
          [ Ty.path "generics_bounds::Rectangle" ] in
      let* α1 := M.call_closure α0 [ rectangle ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Area: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "f64" ] in
            let* α7 :=
              M.get_trait_method
                "generics_bounds::HasArea"
                (Ty.path "generics_bounds::Rectangle")
                []
                "area"
                [] in
            let* α8 := M.call_closure α7 [ rectangle ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
