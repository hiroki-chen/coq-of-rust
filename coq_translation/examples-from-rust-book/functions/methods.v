(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Module Point.
  Record t : Set := {
    x : f64;
    y : f64;
  }.
End Point.
Definition Point : Set := Point.t.

(* Impl [Point] *)
Module ImplPoint.
  Definition origin (_ : unit) : Point :=
    {| Point.y := 0 (* 0.0 *); Point.x := 1 (* 1.0 *); |}.
  
  Definition new (x : f64) (y : f64) : Point :=
    {| Point.x := x; Point.y := y; |}.
End ImplPoint.
(* End impl [Point] *)

Module Rectangle.
  Record t : Set := {
    p1 : Point;
    p2 : Point;
  }.
End Rectangle.
Definition Rectangle : Set := Rectangle.t.

(* Impl [Rectangle] *)
Module ImplRectangle.
  Definition get_p1 (self : ref Self) : Point :=
    self.p1.
  
  Definition area (self : ref Self) : f64 :=
    let {| Point.x := x1; Point.y := y1; |} := self.p1 in
    let {| Point.x := x2; Point.y := y2; |} := self.p2 in
    abs (mul (sub x1 x2) (sub y1 y2)).
  
  Definition perimeter (self : ref Self) : f64 :=
    let {| Point.x := x1; Point.y := y1; |} := self.p1 in
    let {| Point.x := x2; Point.y := y2; |} := self.p2 in
    mul 2 (* 2.0 *) (add (abs (sub x1 x2)) (abs (sub y1 y2))).
  
  Definition translate (self : ref Self) (x : f64) (y : f64) :=
    assign self.p1.x := add self.p1.x x ;;
    assign self.p2.x := add self.p2.x x ;;
    assign self.p1.y := add self.p1.y y ;;
    assign self.p2.y := add self.p2.y y ;;
    tt.
End ImplRectangle.
(* End impl [Rectangle] *)

Definition Pair : Set :=
  Box * Box.

(* Impl [Pair] *)
Module ImplPair.
  Definition destroy (self : Self) :=
    let Pair (first, second) := self in
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Destroying Pair(";", ";")\n"]
        [_crate::fmt::ImplArgumentV1.new_display
          first;_crate::fmt::ImplArgumentV1.new_display second]) ;;
    tt ;;
    tt.
End ImplPair.
(* End impl [Pair] *)

Definition main (_ : unit) :=
  let rectangle := {|
    Rectangle.p1 := ImplPoint.origin tt;
    Rectangle.p2 := ImplPoint.new 3 (* 3.0 *) 4 (* 4.0 *);
  |} in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Rectangle perimeter: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (perimeter rectangle)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["Rectangle area: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (area rectangle)]) ;;
  tt ;;
  let square := {|
    Rectangle.p1 := ImplPoint.origin tt;
    Rectangle.p2 := ImplPoint.new 1 (* 1.0 *) 1 (* 1.0 *);
  |} in
  translate square 1 (* 1.0 *) 1 (* 1.0 *) ;;
  let pair := Pair (ImplBox.new 1) (ImplBox.new 2) in
  destroy pair ;;
  tt.