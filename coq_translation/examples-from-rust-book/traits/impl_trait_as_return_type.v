(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module iter := std.iter.

Module IntoIter := std.vec.IntoIter.
Definition IntoIter := IntoIter.t.

Definition combine_vecs_explicit_return_type (v : Vec) (u : Vec) : iter.Cycle :=
  (v.["into_iter"].["chain"] u.["into_iter"]).["cycle"].

Definition combine_vecs (v : Vec) (u : Vec) : OpaqueDef :=
  (v.["into_iter"].["chain"] u.["into_iter"]).["cycle"].

Error OpaqueTy.

Definition main (_ : unit) : unit :=
  let v1 := Slice::["into_vec"] [ 1; 2; 3 ] in
  let v2 := Slice::["into_vec"] [ 4; 5 ] in
  let v3 := combine_vecs v1 v2 in
  match (Some 1, v3.["next"]) with
  | (left_val, right_val) =>
    if (not (eqb (deref left_val) (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (Some 2, v3.["next"]) with
  | (left_val, right_val) =>
    if (not (eqb (deref left_val) (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (Some 3, v3.["next"]) with
  | (left_val, right_val) =>
    if (not (eqb (deref left_val) (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (Some 4, v3.["next"]) with
  | (left_val, right_val) =>
    if (not (eqb (deref left_val) (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (Some 5, v3.["next"]) with
  | (left_val, right_val) =>
    if (not (eqb (deref left_val) (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  _crate.io._print (_crate.fmt.Arguments::["new_v1"] [ "all done\n" ] [  ]) ;;
  tt ;;
  tt.
