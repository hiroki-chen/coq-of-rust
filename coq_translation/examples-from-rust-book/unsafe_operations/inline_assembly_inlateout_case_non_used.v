(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let a := 4 in
  let b := 4 in
  let c := 4 in
  InlineAsm ;;
  tt ;;
  match (a, 12) with
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

Module asm := std.arch.asm.
