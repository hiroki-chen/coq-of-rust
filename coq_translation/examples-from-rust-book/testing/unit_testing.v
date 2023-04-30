(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition add (a : i32) (b : i32) : i32 := a.["add"] b.

Definition bad_add (a : i32) (b : i32) : i32 := a.["sub"] b.

Module tests.
  Import super.
  
  Definition test_add (_ : unit) : unit :=
    match (add 1 2, 3) with
    | (left_val, right_val) =>
      if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
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
    tt.
  
  Definition test_bad_add (_ : unit) : unit :=
    match (bad_add 1 2, 3) with
    | (left_val, right_val) =>
      if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
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
    tt.
End tests.

Import super.

Definition test_add (_ : unit) : unit :=
  match (add 1 2, 3) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
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
  tt.

Definition test_bad_add (_ : unit) : unit :=
  match (bad_add 1 2, 3) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
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
  tt.
