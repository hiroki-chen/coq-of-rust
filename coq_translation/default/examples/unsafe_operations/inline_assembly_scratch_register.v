(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* x := M.alloc 4 in
  let* _ :=
    let _ := InlineAssembly in
    M.alloc tt in
  let* _ :=
    let* α0 := borrow x u64 in
    let* α1 := M.alloc 4 in
    let* α2 := M.alloc 6 in
    let* α3 := mul α1 α2 in
    let* α4 := borrow α3 u64 in
    match (α0, α4) with
    | (left_val, right_val) =>
      let* α0 := deref left_val u64 in
      let* α1 := deref right_val u64 in
      let* α2 := eq α0 α1 in
      let* α3 := not α2 in
      let* α4 := use α3 in
      if (α4 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 := deref left_val u64 in
          let* α1 := borrow α0 u64 in
          let* α2 := deref α1 u64 in
          let* α3 := borrow α2 u64 in
          let* α4 := deref right_val u64 in
          let* α5 := borrow α4 u64 in
          let* α6 := deref α5 u64 in
          let* α7 := borrow α6 u64 in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        let* α0 := M.alloc tt in
        never_to_any α0
      else
        M.alloc tt
    end in
  M.alloc tt.
