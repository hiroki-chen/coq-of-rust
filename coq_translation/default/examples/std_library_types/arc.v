(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* apple := (alloc.sync.Arc T)::["new"] (mk_str "the same apple") in
  let* _ :=
    let* α0 := M.alloc 0 in
    let* α1 := M.alloc 10 in
    let* α2 :=
      M.alloc
        {| core.ops.range.Range.start := α0; core.ops.range.Range.end := α1;
        |} in
    let* α3 :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := (core.ops.range.Range i32)))
        α2 in
    let* α4 :=
      match α3 with
      | iter =>
        loop
          (let* _ :=
            let* α0 := borrow_mut iter (core.ops.range.Range i32) in
            let* α1 := deref α0 (core.ops.range.Range i32) in
            let* α2 := borrow_mut α1 (core.ops.range.Range i32) in
            let* α3 :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := (core.ops.range.Range i32)))
                α2 in
            match α3 with
            | core.option.Option  =>
              let* α0 := Break in
              never_to_any α0
            | core.option.Option _ =>
              let* apple :=
                let* α0 := borrow apple (alloc.sync.Arc (ref str)) in
                let* α1 := deref α0 (alloc.sync.Arc (ref str)) in
                let* α2 := borrow α1 (alloc.sync.Arc (ref str)) in
                (core.clone.Clone.clone (Self := (alloc.sync.Arc (ref str))))
                  α2 in
              let* _ :=
                std.thread.spawn
                  (let* _ :=
                    let* _ :=
                      let* α0 :=
                        borrow [ mk_str ""; mk_str "
" ] (list (ref str)) in
                      let* α1 := deref α0 (list (ref str)) in
                      let* α2 := borrow α1 (list (ref str)) in
                      let* α3 := pointer_coercion "Unsize" α2 in
                      let* α4 := borrow apple (alloc.sync.Arc (ref str)) in
                      let* α5 := deref α4 (alloc.sync.Arc (ref str)) in
                      let* α6 := borrow α5 (alloc.sync.Arc (ref str)) in
                      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
                      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
                      let* α9 := deref α8 (list core.fmt.rt.Argument) in
                      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
                      let* α11 := pointer_coercion "Unsize" α10 in
                      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
                      std.io.stdio._print α12 in
                    M.alloc tt in
                  M.alloc tt) in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    use α4 in
  let* _ :=
    let* α0 := M.alloc 1 in
    let* α1 := core.time.Duration::["from_secs"] α0 in
    std.thread.sleep α1 in
  M.alloc tt.
