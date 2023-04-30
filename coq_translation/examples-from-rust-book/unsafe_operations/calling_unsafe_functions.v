(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module slice := std.slice.

Definition main (_ : unit) : unit :=
  let some_vector :=
    Slice::["into_vec"] (_crate.boxed.Box::["new"] [ 1; 2; 3; 4 ]) in
  let pointer := some_vector.["as_ptr"] in
  let length := some_vector.["len"] in
  let my_slice := slice.from_raw_parts pointer length in
  match (some_vector.["as_slice"], my_slice) with
  | (left_val, right_val) =>
    if ((left_val.["deref"].["eq"] right_val.["deref"]).["not"] : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        left_val.["deref"]
        right_val.["deref"]
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  tt.
