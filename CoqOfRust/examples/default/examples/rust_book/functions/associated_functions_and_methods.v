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
      ltac:(M.monadic
        (Value.StructRecord
          "associated_functions_and_methods::Point"
          [ ("y", M.read (| UnsupportedLiteral |)); ("x", M.read (| UnsupportedLiteral |)) ]))
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
      ltac:(M.monadic
        (let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        Value.StructRecord
          "associated_functions_and_methods::Point"
          [ ("x", M.read (| x |)); ("y", M.read (| y |)) ]))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field
            (M.read (| self |))
            "associated_functions_and_methods::Rectangle"
            "p1"
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            M.get_struct_record_field
              (M.read (| self |))
              "associated_functions_and_methods::Rectangle"
              "p1",
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.get_struct_record_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Point",
                      "x"
                    |) in
                  let γ0_1 :=
                    M.get_struct_record_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Point",
                      "y"
                    |) in
                  let x1 := M.copy (| γ0_0 |) in
                  let y1 := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "associated_functions_and_methods::Rectangle"
                      "p2",
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.get_struct_record_field_or_break_match (|
                              γ,
                              "associated_functions_and_methods::Point",
                              "x"
                            |) in
                          let γ0_1 :=
                            M.get_struct_record_field_or_break_match (|
                              γ,
                              "associated_functions_and_methods::Point",
                              "y"
                            |) in
                          let x2 := M.copy (| γ0_0 |) in
                          let y2 := M.copy (| γ0_1 |) in
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (| Ty.path "f64", "abs", [] |),
                              [
                                BinOp.Panic.mul (|
                                  BinOp.Panic.sub (| M.read (| x1 |), M.read (| x2 |) |),
                                  BinOp.Panic.sub (| M.read (| y1 |), M.read (| y2 |) |)
                                |)
                              ]
                            |)
                          |)))
                    ]
                  |)))
            ]
          |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            M.get_struct_record_field
              (M.read (| self |))
              "associated_functions_and_methods::Rectangle"
              "p1",
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.get_struct_record_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Point",
                      "x"
                    |) in
                  let γ0_1 :=
                    M.get_struct_record_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Point",
                      "y"
                    |) in
                  let x1 := M.copy (| γ0_0 |) in
                  let y1 := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "associated_functions_and_methods::Rectangle"
                      "p2",
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.get_struct_record_field_or_break_match (|
                              γ,
                              "associated_functions_and_methods::Point",
                              "x"
                            |) in
                          let γ0_1 :=
                            M.get_struct_record_field_or_break_match (|
                              γ,
                              "associated_functions_and_methods::Point",
                              "y"
                            |) in
                          let x2 := M.copy (| γ0_0 |) in
                          let y2 := M.copy (| γ0_1 |) in
                          M.alloc (|
                            BinOp.Panic.mul (|
                              M.read (| UnsupportedLiteral |),
                              BinOp.Panic.add (|
                                M.call_closure (|
                                  M.get_associated_function (| Ty.path "f64", "abs", [] |),
                                  [ BinOp.Panic.sub (| M.read (| x1 |), M.read (| x2 |) |) ]
                                |),
                                M.call_closure (|
                                  M.get_associated_function (| Ty.path "f64", "abs", [] |),
                                  [ BinOp.Panic.sub (| M.read (| y1 |), M.read (| y2 |) |) ]
                                |)
                              |)
                            |)
                          |)))
                    ]
                  |)))
            ]
          |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let x := M.alloc (| x |) in
        let y := M.alloc (| y |) in
        M.read (|
          let _ :=
            let β :=
              M.get_struct_record_field
                (M.get_struct_record_field
                  (M.read (| self |))
                  "associated_functions_and_methods::Rectangle"
                  "p1")
                "associated_functions_and_methods::Point"
                "x" in
            M.assign (| β, BinOp.Panic.add (| M.read (| β |), M.read (| x |) |) |) in
          let _ :=
            let β :=
              M.get_struct_record_field
                (M.get_struct_record_field
                  (M.read (| self |))
                  "associated_functions_and_methods::Rectangle"
                  "p2")
                "associated_functions_and_methods::Point"
                "x" in
            M.assign (| β, BinOp.Panic.add (| M.read (| β |), M.read (| x |) |) |) in
          let _ :=
            let β :=
              M.get_struct_record_field
                (M.get_struct_record_field
                  (M.read (| self |))
                  "associated_functions_and_methods::Rectangle"
                  "p1")
                "associated_functions_and_methods::Point"
                "y" in
            M.assign (| β, BinOp.Panic.add (| M.read (| β |), M.read (| y |) |) |) in
          let _ :=
            let β :=
              M.get_struct_record_field
                (M.get_struct_record_field
                  (M.read (| self |))
                  "associated_functions_and_methods::Rectangle"
                  "p2")
                "associated_functions_and_methods::Point"
                "y" in
            M.assign (| β, BinOp.Panic.add (| M.read (| β |), M.read (| y |) |) |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            self,
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.get_struct_tuple_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Pair",
                      0
                    |) in
                  let γ0_1 :=
                    M.get_struct_tuple_field_or_break_match (|
                      γ,
                      "associated_functions_and_methods::Pair",
                      1
                    |) in
                  let first := M.copy (| γ0_0 |) in
                  let second := M.copy (| γ0_1 |) in
                  let _ :=
                    let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (| "std::io::stdio::_print", [] |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                              [
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array
                                      [
                                        M.read (| Value.String "Destroying Pair(" |);
                                        M.read (| Value.String ", " |);
                                        M.read (| Value.String ")
" |)
                                      ]
                                  |));
                                (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                    Value.Array
                                      [
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path "core::fmt::rt::Argument",
                                            "new_display",
                                            [
                                              Ty.apply
                                                (Ty.path "alloc::boxed::Box")
                                                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                                            ]
                                          |),
                                          [ first ]
                                        |);
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path "core::fmt::rt::Argument",
                                            "new_display",
                                            [
                                              Ty.apply
                                                (Ty.path "alloc::boxed::Box")
                                                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                                            ]
                                          |),
                                          [ second ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |) in
                  M.alloc (| Value.Tuple [] |)))
            ]
          |)
        |)))
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
    ltac:(M.monadic
      (M.read (|
        let rectangle :=
          M.alloc (|
            Value.StructRecord
              "associated_functions_and_methods::Rectangle"
              [
                ("p1",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "associated_functions_and_methods::Point",
                      "origin",
                      []
                    |),
                    []
                  |));
                ("p2",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "associated_functions_and_methods::Point",
                      "new",
                      []
                    |),
                    [ M.read (| UnsupportedLiteral |); M.read (| UnsupportedLiteral |) ]
                  |))
              ]
          |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "Rectangle perimeter: " |);
                              M.read (| Value.String "
" |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "f64" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "associated_functions_and_methods::Rectangle",
                                        "perimeter",
                                        []
                                      |),
                                      [ rectangle ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "Rectangle area: " |);
                              M.read (| Value.String "
" |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "f64" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "associated_functions_and_methods::Rectangle",
                                        "area",
                                        []
                                      |),
                                      [ rectangle ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let square :=
          M.alloc (|
            Value.StructRecord
              "associated_functions_and_methods::Rectangle"
              [
                ("p1",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "associated_functions_and_methods::Point",
                      "origin",
                      []
                    |),
                    []
                  |));
                ("p2",
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "associated_functions_and_methods::Point",
                      "new",
                      []
                    |),
                    [ M.read (| UnsupportedLiteral |); M.read (| UnsupportedLiteral |) ]
                  |))
              ]
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "associated_functions_and_methods::Rectangle",
                "translate",
                []
              |),
              [ square; M.read (| UnsupportedLiteral |); M.read (| UnsupportedLiteral |) ]
            |)
          |) in
        let pair_ :=
          M.alloc (|
            Value.StructTuple
              "associated_functions_and_methods::Pair"
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "alloc::boxed::Box")
                      [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                    "new",
                    []
                  |),
                  [ Value.Integer Integer.I32 1 ]
                |);
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "alloc::boxed::Box")
                      [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                    "new",
                    []
                  |),
                  [ Value.Integer Integer.I32 2 ]
                |)
              ]
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "associated_functions_and_methods::Pair",
                "destroy",
                []
              |),
              [ M.read (| pair_ |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
