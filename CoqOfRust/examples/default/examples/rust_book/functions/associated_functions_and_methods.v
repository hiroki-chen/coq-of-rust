(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Point";
    ty_params := [];
    fields := [ ("x", Ty.path "f64"); ("y", Ty.path "f64") ];
  } *)

Module Impl_associated_functions_and_methods_Point.
  Definition Self : Ty.t := Ty.path "associated_functions_and_methods::Point".
  
  (*
      fn origin() -> Point {
          Point { y: 0.0, x: 1.0 }
      }
  *)
  Definition origin (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.pure (Value.StructRecord "associated_functions_and_methods::Point" [ ("y", α0); ("x", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_origin : M.IsAssociatedFunction Self "origin" origin.
  
  (*
      fn new(x: f64, y: f64) -> Point {
          Point { x: x, y: y }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ x; y ] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 := M.read x in
      let* α1 := M.read y in
      M.pure (Value.StructRecord "associated_functions_and_methods::Point" [ ("x", α0); ("y", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
End Impl_associated_functions_and_methods_Point.

(* StructRecord
  {
    name := "Rectangle";
    ty_params := [];
    fields :=
      [
        ("p1", Ty.path "associated_functions_and_methods::Point");
        ("p2", Ty.path "associated_functions_and_methods::Point")
      ];
  } *)

Module Impl_associated_functions_and_methods_Rectangle.
  Definition Self : Ty.t := Ty.path "associated_functions_and_methods::Rectangle".
  
  (*
      fn get_p1(&self) -> Point {
          self.p1
      }
  *)
  Definition get_p1 (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p1")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_p1 : M.IsAssociatedFunction Self "get_p1" get_p1.
  
  (*
      fn area(&self) -> f64 {
          // `self` gives access to the struct fields via the dot operator
          let Point { x: x1, y: y1 } = self.p1;
          let Point { x: x2, y: y2 } = self.p2;
  
          // `abs` is a `f64` method that returns the absolute value of the
          // caller
          ((x1 - x2) * (y1 - y2)).abs()
      }
  *)
  Definition area (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.match_operator
          (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p1")
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_record_field_or_break_match
                  γ
                  "associated_functions_and_methods::Point"
                  "x" in
              let* γ0_1 :=
                M.get_struct_record_field_or_break_match
                  γ
                  "associated_functions_and_methods::Point"
                  "y" in
              let* x1 := M.copy γ0_0 in
              let* y1 := M.copy γ0_1 in
              let* α0 := M.read self in
              M.match_operator
                (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p2")
                [
                  fun γ =>
                    let* γ0_0 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "associated_functions_and_methods::Point"
                        "x" in
                    let* γ0_1 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "associated_functions_and_methods::Point"
                        "y" in
                    let* x2 := M.copy γ0_0 in
                    let* y2 := M.copy γ0_1 in
                    let* α0 := M.get_associated_function (Ty.path "f64") "abs" [] in
                    let* α1 := M.read x1 in
                    let* α2 := M.read x2 in
                    let* α3 := BinOp.Panic.sub α1 α2 in
                    let* α4 := M.read y1 in
                    let* α5 := M.read y2 in
                    let* α6 := BinOp.Panic.sub α4 α5 in
                    let* α7 := BinOp.Panic.mul α3 α6 in
                    let* α8 := M.call_closure α0 [ α7 ] in M.alloc α8
                ]
          ] in
      M.read α1
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_area : M.IsAssociatedFunction Self "area" area.
  
  (*
      fn perimeter(&self) -> f64 {
          let Point { x: x1, y: y1 } = self.p1;
          let Point { x: x2, y: y2 } = self.p2;
  
          2.0 * ((x1 - x2).abs() + (y1 - y2).abs())
      }
  *)
  Definition perimeter (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 :=
        M.match_operator
          (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p1")
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_record_field_or_break_match
                  γ
                  "associated_functions_and_methods::Point"
                  "x" in
              let* γ0_1 :=
                M.get_struct_record_field_or_break_match
                  γ
                  "associated_functions_and_methods::Point"
                  "y" in
              let* x1 := M.copy γ0_0 in
              let* y1 := M.copy γ0_1 in
              let* α0 := M.read self in
              M.match_operator
                (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p2")
                [
                  fun γ =>
                    let* γ0_0 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "associated_functions_and_methods::Point"
                        "x" in
                    let* γ0_1 :=
                      M.get_struct_record_field_or_break_match
                        γ
                        "associated_functions_and_methods::Point"
                        "y" in
                    let* x2 := M.copy γ0_0 in
                    let* y2 := M.copy γ0_1 in
                    let* α0 := M.read UnsupportedLiteral in
                    let* α1 := M.get_associated_function (Ty.path "f64") "abs" [] in
                    let* α2 := M.read x1 in
                    let* α3 := M.read x2 in
                    let* α4 := BinOp.Panic.sub α2 α3 in
                    let* α5 := M.call_closure α1 [ α4 ] in
                    let* α6 := M.get_associated_function (Ty.path "f64") "abs" [] in
                    let* α7 := M.read y1 in
                    let* α8 := M.read y2 in
                    let* α9 := BinOp.Panic.sub α7 α8 in
                    let* α10 := M.call_closure α6 [ α9 ] in
                    let* α11 := BinOp.Panic.add α5 α10 in
                    let* α12 := BinOp.Panic.mul α0 α11 in M.alloc α12
                ]
          ] in
      M.read α1
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_perimeter : M.IsAssociatedFunction Self "perimeter" perimeter.
  
  (*
      fn translate(&mut self, x: f64, y: f64) {
          self.p1.x += x;
          self.p2.x += x;
  
          self.p1.y += y;
          self.p2.y += y;
      }
  *)
  Definition translate (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; x; y ] =>
      let* self := M.alloc self in
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_record_field
              (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p1")
              "associated_functions_and_methods::Point"
              "x") in
        let* α0 := M.read β in
        let* α1 := M.read x in let* α2 := BinOp.Panic.add α0 α1 in M.assign β α2 in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_record_field
              (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p2")
              "associated_functions_and_methods::Point"
              "x") in
        let* α0 := M.read β in
        let* α1 := M.read x in let* α2 := BinOp.Panic.add α0 α1 in M.assign β α2 in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_record_field
              (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p1")
              "associated_functions_and_methods::Point"
              "y") in
        let* α0 := M.read β in
        let* α1 := M.read y in let* α2 := BinOp.Panic.add α0 α1 in M.assign β α2 in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_record_field
              (M.get_struct_record_field α0 "associated_functions_and_methods::Rectangle" "p2")
              "associated_functions_and_methods::Point"
              "y") in
        let* α0 := M.read β in
        let* α1 := M.read y in let* α2 := BinOp.Panic.add α0 α1 in M.assign β α2 in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_translate : M.IsAssociatedFunction Self "translate" translate.
End Impl_associated_functions_and_methods_Rectangle.

(* StructTuple
  {
    name := "Pair";
    ty_params := [];
    fields :=
      [
        Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
        Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
      ];
  } *)

Module Impl_associated_functions_and_methods_Pair.
  Definition Self : Ty.t := Ty.path "associated_functions_and_methods::Pair".
  
  (*
      fn destroy(self) {
          // Destructure `self`
          let Pair(first, second) = self;
  
          println!("Destroying Pair({}, {})", first, second);
  
          // `first` and `second` go out of scope and get freed
      }
  *)
  Definition destroy (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.match_operator
          self
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "associated_functions_and_methods::Pair"
                  0 in
              let* γ0_1 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "associated_functions_and_methods::Pair"
                  1 in
              let* first := M.copy γ0_0 in
              let* second := M.copy γ0_1 in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                  let* α6 :=
                    (* Unsize *)
                      let* α2 := M.read (mk_str "Destroying Pair(") in
                      let* α3 := M.read (mk_str ", ") in
                      let* α4 := M.read (mk_str ")
") in
                      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                      M.pure (M.pointer_coercion α5) in
                  let* α12 :=
                    (* Unsize *)
                      let* α7 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display"
                          [
                            Ty.apply
                              (Ty.path "alloc::boxed::Box")
                              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                          ] in
                      let* α8 := M.call_closure α7 [ first ] in
                      let* α9 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display"
                          [
                            Ty.apply
                              (Ty.path "alloc::boxed::Box")
                              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                          ] in
                      let* α10 := M.call_closure α9 [ second ] in
                      let* α11 := M.alloc (Value.Array [ α8; α10 ]) in
                      M.pure (M.pointer_coercion α11) in
                  let* α13 := M.call_closure α1 [ α6; α12 ] in
                  let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
                M.alloc (Value.Tuple []) in
              M.alloc (Value.Tuple [])
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_destroy : M.IsAssociatedFunction Self "destroy" destroy.
End Impl_associated_functions_and_methods_Pair.

(*
fn main() {
    let rectangle = Rectangle {
        // Associated functions are called using double colons
        p1: Point::origin(),
        p2: Point::new(3.0, 4.0),
    };

    // Methods are called using the dot operator
    // Note that the first argument `&self` is implicitly passed, i.e.
    // `rectangle.perimeter()` === `Rectangle::perimeter(&rectangle)`
    println!("Rectangle perimeter: {}", rectangle.perimeter());
    println!("Rectangle area: {}", rectangle.area());

    let mut square = Rectangle {
        p1: Point::origin(),
        p2: Point::new(1.0, 1.0),
    };

    // Error! `rectangle` is immutable, but this method requires a mutable
    // object
    //rectangle.translate(1.0, 0.0);
    // TODO ^ Try uncommenting this line

    // Okay! Mutable objects can call mutable methods
    square.translate(1.0, 1.0);

    let pair = Pair(Box::new(1), Box::new(2));

    pair.destroy();

    // Error! Previous `destroy` call "consumed" `pair`
    //pair.destroy();
    // TODO ^ Try uncommenting this line
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* rectangle :=
      let* α0 :=
        M.get_associated_function (Ty.path "associated_functions_and_methods::Point") "origin" [] in
      let* α1 := M.call_closure α0 [] in
      let* α2 :=
        M.get_associated_function (Ty.path "associated_functions_and_methods::Point") "new" [] in
      let* α3 := M.read UnsupportedLiteral in
      let* α4 := M.read UnsupportedLiteral in
      let* α5 := M.call_closure α2 [ α3; α4 ] in
      M.alloc
        (Value.StructRecord
          "associated_functions_and_methods::Rectangle"
          [ ("p1", α1); ("p2", α5) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Rectangle perimeter: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "f64" ] in
            let* α7 :=
              M.get_associated_function
                (Ty.path "associated_functions_and_methods::Rectangle")
                "perimeter"
                [] in
            let* α8 := M.call_closure α7 [ rectangle ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Rectangle area: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "f64" ] in
            let* α7 :=
              M.get_associated_function
                (Ty.path "associated_functions_and_methods::Rectangle")
                "area"
                [] in
            let* α8 := M.call_closure α7 [ rectangle ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* square :=
      let* α0 :=
        M.get_associated_function (Ty.path "associated_functions_and_methods::Point") "origin" [] in
      let* α1 := M.call_closure α0 [] in
      let* α2 :=
        M.get_associated_function (Ty.path "associated_functions_and_methods::Point") "new" [] in
      let* α3 := M.read UnsupportedLiteral in
      let* α4 := M.read UnsupportedLiteral in
      let* α5 := M.call_closure α2 [ α3; α4 ] in
      M.alloc
        (Value.StructRecord
          "associated_functions_and_methods::Rectangle"
          [ ("p1", α1); ("p2", α5) ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "associated_functions_and_methods::Rectangle")
          "translate"
          [] in
      let* α1 := M.read UnsupportedLiteral in
      let* α2 := M.read UnsupportedLiteral in
      let* α3 := M.call_closure α0 [ square; α1; α2 ] in M.alloc α3 in
    let* pair_ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 1 ] in
      let* α2 :=
        M.get_associated_function
          (Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α3 := M.call_closure α2 [ Value.Integer Integer.I32 2 ] in
      M.alloc (Value.StructTuple "associated_functions_and_methods::Pair" [ α1; α3 ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "associated_functions_and_methods::Pair") "destroy" [] in
      let* α1 := M.read pair_ in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
