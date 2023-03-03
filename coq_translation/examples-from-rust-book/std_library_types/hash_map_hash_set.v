(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module HashSet := std.collections.HashSet.

Definition main (_ : unit) : unit :=
  let a :=
    method
      "collect"
      (method "into_iter" (ComplexTypePath.into_vec [ 1; 2; 3 ])) in
  let b :=
    method
      "collect"
      (method "into_iter" (ComplexTypePath.into_vec [ 2; 3; 4 ])) in
  if not (method "insert" a 4) then
    _crate.panicking.panic "assertion failed: a.insert(4)"
  else
    tt ;;
  if not (method "contains" a 4) then
    _crate.panicking.panic "assertion failed: a.contains(&4)"
  else
    tt ;;
  method "insert" b 5 ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "A: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug a ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "B: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_debug b ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Union: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "collect" (method "union" a b))
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Difference: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "collect" (method "difference" a b))
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Intersection: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "collect" (method "intersection" a b))
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Symmetric Difference: "; "\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_debug
          (method "collect" (method "symmetric_difference" a b))
      ]) ;;
  tt ;;
  tt.
