(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition reverse (_ : unit) :=
  let (int_param, bool_param) := pair in
  (bool_param, int_param).

Definition Matrix : Set :=
  f32 * f32 * f32 * f32.

(* Impl [Matrix] of trait [_crate.fmt.Debug]*)
Module ImplMatrix.
  Definition
    fmt
    (self : ref Self)
    (f : ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field4_finish
      f
      "Matrix"
      self.0
      self.1
      self.2
      self.3.
End ImplMatrix.
(* End impl [Matrix] *)

Definition main (_ : unit) :=
  let long_tuple := (1, 2, 3, 4, neg 1, neg 2, neg 3, neg
    4, 0 (* 0.1 *), 0 (* 0.2 *), a, true) in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["long tuple first value: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display long_tuple.0]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["long tuple second value: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display long_tuple.1]) ;;
  tt ;;
  let tuple_of_tuples := ((1, 2, 2), (4, neg 1), neg 2) in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["tuple of tuples: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug tuple_of_tuples]) ;;
  tt ;;
  let pair := (1, true) in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["pair is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug pair]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["the reversed pair is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (reverse pair)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["one element tuple: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug (5)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["just an integer: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug 5]) ;;
  tt ;;
  let tuple := (1, "hello", 5 (* 4.5 *), true) in
  let (a, b, c, d) := tuple in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";", ";", ";", ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug
        a;_crate::fmt::ImplArgumentV1.new_debug
        b;_crate::fmt::ImplArgumentV1.new_debug
        c;_crate::fmt::ImplArgumentV1.new_debug d]) ;;
  tt ;;
  let matrix := Matrix 1 (* 1.1 *) 1 (* 1.2 *) 2 (* 2.1 *) 2 (* 2.2 *) in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug matrix]) ;;
  tt ;;
  tt.