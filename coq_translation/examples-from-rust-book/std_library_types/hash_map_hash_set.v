(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module HashSet := std.collections.HashSet.
Definition HashSet := HashSet.t.

Definition main (_ : unit) : unit :=
  let a := (Slice::["into_vec"] [ 1; 2; 3 ]).["into_iter"].["collect"] in
  let b := (Slice::["into_vec"] [ 2; 3; 4 ]).["into_iter"].["collect"] in
  if (not (a.["insert"] 4) : bool) then
    _crate.panicking.panic "assertion failed: a.insert(4)"
  else
    tt ;;
  if (not (a.["contains"] 4) : bool) then
    _crate.panicking.panic "assertion failed: a.contains(&4)"
  else
    tt ;;
  b.["insert"] 5 ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "A: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] a ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "B: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] b ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Union: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (a.["union"] b).["collect"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Difference: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (a.["difference"] b).["collect"]
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Intersection: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] (a.["intersection"] b).["collect"]
      ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Symmetric Difference: "; "
" ]
      [
        _crate.fmt.ArgumentV1::["new_debug"]
          (a.["symmetric_difference"] b).["collect"]
      ]) ;;
  tt ;;
  tt.
