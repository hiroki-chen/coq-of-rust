(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Module Point.
  Record t : Set := {
    x : i32;
    y : i32;
  }.
End Point.
Definition Point : Set := Point.t.

(* Impl [Point] of trait [_crate.clone.Clone]*)
Module ImplPoint.
  Definition clone (self : static_ref Self) : Point :=
    let _ := tt in
    deref self.
End ImplPoint.
(* End impl [Point] *)

(* Impl [Point] of trait [_crate.marker.Copy]*)
Module ImplPoint.
  
End ImplPoint.
(* End impl [Point] *)

Definition main (_ : unit) :=
  let c := Q in
  let ref_c1 := c in
  let ref_c2 := c in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["ref_c1 equals ref_c2: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        (eq (deref ref_c1) (deref ref_c2))]) ;;
  tt ;;
  let point := {| Point.x := 0; Point.y := 0; |} in
  let _copy_of_x := let {| Point.x := ref_to_x; Point.y := _; |} := point in
  deref ref_to_x in
  let mutable_point := point in
  let {| Point.x := _; Point.y := mut_ref_to_y; |} := mutable_point in
  assign deref mut_ref_to_y := 1 ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["point is (";", ";")\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        point.x;_crate::fmt::ImplArgumentV1.new_display point.y]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["mutable_point is (";", ";")\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        mutable_point.x;_crate::fmt::ImplArgumentV1.new_display
        mutable_point.y]) ;;
  tt ;;
  let mutable_tuple := (ImplBox.new 5, 3) in
  let (_, last) := mutable_tuple in
  assign deref last := 2 ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["tuple is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug mutable_tuple]) ;;
  tt ;;
  tt.