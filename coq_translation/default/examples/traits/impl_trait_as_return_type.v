(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition combine_vecs_explicit_return_type
    `{H : State.Trait}
    (v : alloc.vec.Vec i32)
    (u : alloc.vec.Vec i32)
    :
      M (H := H)
        (core.iter.adapters.cycle.Cycle
          (core.iter.adapters.chain.Chain
            (alloc.vec.into_iter.IntoIter i32)
            (alloc.vec.into_iter.IntoIter i32))) :=
  let* α0 := v.["into_iter"] in
  let* α1 := u.["into_iter"] in
  let* α2 := α0.["chain"] α1 in
  α2.["cycle"].

Definition combine_vecs
    `{H : State.Trait}
    (v : alloc.vec.Vec i32)
    (u : alloc.vec.Vec i32)
    : M (H := H) OpaqueDef :=
  let* α0 := v.["into_iter"] in
  let* α1 := u.["into_iter"] in
  let* α2 := α0.["chain"] α1 in
  α2.["cycle"].

Error OpaqueTy.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* v1 :=
    let* α0 := alloc.boxed.Box::["new"] [ 1; 2; 3 ] in
    Slice::["into_vec"] α0 in
  let* v2 :=
    let* α0 := alloc.boxed.Box::["new"] [ 4; 5 ] in
    Slice::["into_vec"] α0 in
  let* v3 := impl_trait_as_return_type.combine_vecs v1 v2 in
  let* _ :=
    let* α0 := v3.["next"] in
    match (addr_of (core.option.Option.Some 1), addr_of α0) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* α0 := v3.["next"] in
    match (addr_of (core.option.Option.Some 2), addr_of α0) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* α0 := v3.["next"] in
    match (addr_of (core.option.Option.Some 3), addr_of α0) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* α0 := v3.["next"] in
    match (addr_of (core.option.Option.Some 4), addr_of α0) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* α0 := v3.["next"] in
    match (addr_of (core.option.Option.Some 5), addr_of α0) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_arguments::["new_const"] (addr_of [ "all done
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.
