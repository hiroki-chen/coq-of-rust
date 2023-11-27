(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS : u32.t := M.run (M.alloc 10).

(*
fn main() {
    // Make a vector to hold the children which are spawned.
    let mut children = vec![];

    for i in 0..NTHREADS {
        // Spin up another thread
        children.push(thread::spawn(move || {
            println!("this is thread number {}", i);
        }));
    }

    for child in children {
        // Wait for the thread to finish. Returns a result.
        let _ = child.join();
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* children :
      M.Val
        (alloc.vec.Vec.t (std.thread.JoinHandle.t unit) alloc.alloc.Global.t) :=
    let* α0 :
        alloc.vec.Vec.t (std.thread.JoinHandle.t unit) alloc.alloc.Global.t :=
      (alloc.vec.Vec.t
          (std.thread.JoinHandle.t unit)
          alloc.alloc.Global.t)::["new"] in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : M.Val u32.t := M.alloc 0 in
    let* α1 : u32.t := M.read α0 in
    let* α2 : u32.t := M.read threads.NTHREADS in
    let* α3 : core.ops.range.Range.t u32.t :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t u32.t)
          (Trait := ltac:(refine _)))
        {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α2;
        |} in
    let* α4 : M.Val unit :=
      match α3 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : M.Val unit :=
            let* α0 : mut_ref (core.ops.range.Range.t u32.t) :=
              borrow_mut iter in
            let* α1 : core.option.Option.t u32.t :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t u32.t)
                  (Trait := ltac:(refine _)))
                α0 in
            match α1 with
            | core.option.Option.None  =>
              let* α0 : M.Val never.t := Break in
              never_to_any α0
            | core.option.Option.Some i =>
              let* i := M.alloc i in
              let* _ : M.Val unit :=
                let* α0 :
                    mut_ref
                      (alloc.vec.Vec.t
                        (std.thread.JoinHandle.t unit)
                        alloc.alloc.Global.t) :=
                  borrow_mut children in
                let* α1 : type not implemented :=
                  M.read
                    (let* _ : M.Val unit :=
                      let* _ : M.Val unit :=
                        let* α0 : M.Val (array (ref str.t)) :=
                          M.alloc
                            [ mk_str "this is thread number "; mk_str "
" ] in
                        let* α1 : ref (array (ref str.t)) := borrow α0 in
                        let* α2 : M.Val (ref (array (ref str.t))) :=
                          M.alloc α1 in
                        let* α3 : M.Val (ref (slice (ref str.t))) :=
                          pointer_coercion "Unsize" α2 in
                        let* α4 : ref (slice (ref str.t)) := M.read α3 in
                        let* α5 : ref u32.t := borrow i in
                        let* α6 : core.fmt.rt.Argument.t :=
                          core.fmt.rt.Argument.t::["new_display"] α5 in
                        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
                        let* α8 : M.Val (array core.fmt.rt.Argument.t) :=
                          M.alloc [ α7 ] in
                        let* α9 : ref (array core.fmt.rt.Argument.t) :=
                          borrow α8 in
                        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                          M.alloc α9 in
                        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
                          pointer_coercion "Unsize" α10 in
                        let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                          M.read α11 in
                        let* α13 : core.fmt.Arguments.t :=
                          core.fmt.Arguments.t::["new_v1"] α4 α12 in
                        let* α14 : unit := std.io.stdio._print α13 in
                        M.alloc α14 in
                      M.alloc tt in
                    M.alloc tt) in
                let* α2 : std.thread.JoinHandle.t unit := std.thread.spawn α1 in
                let* α3 : unit :=
                  (alloc.vec.Vec.t
                        (std.thread.JoinHandle.t unit)
                        alloc.alloc.Global.t)::["push"]
                    α0
                    α2 in
                M.alloc α3 in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    use α4 in
  let* α0 :
      alloc.vec.Vec.t (std.thread.JoinHandle.t unit) alloc.alloc.Global.t :=
    M.read children in
  let* α1 :
      alloc.vec.into_iter.IntoIter.t
        (std.thread.JoinHandle.t unit)
        alloc.alloc.Global.t :=
    (core.iter.traits.collect.IntoIterator.into_iter
        (Self :=
          alloc.vec.Vec.t (std.thread.JoinHandle.t unit) alloc.alloc.Global.t)
        (Trait := ltac:(refine _)))
      α0 in
  let* α2 : M.Val unit :=
    match α1 with
    | iter =>
      let* iter := M.alloc iter in
      loop
        (let* _ : M.Val unit :=
          let* α0 :
              mut_ref
                (alloc.vec.into_iter.IntoIter.t
                  (std.thread.JoinHandle.t unit)
                  alloc.alloc.Global.t) :=
            borrow_mut iter in
          let* α1 : core.option.Option.t (std.thread.JoinHandle.t unit) :=
            (core.iter.traits.iterator.Iterator.next
                (Self :=
                  alloc.vec.into_iter.IntoIter.t
                    (std.thread.JoinHandle.t unit)
                    alloc.alloc.Global.t)
                (Trait := ltac:(refine _)))
              α0 in
          match α1 with
          | core.option.Option.None  =>
            let* α0 : M.Val never.t := Break in
            never_to_any α0
          | core.option.Option.Some child =>
            let* child := M.alloc child in
            let* _ :
                M.Val
                  (core.result.Result.t
                    unit
                    (alloc.boxed.Box.t
                      type not implemented
                      alloc.alloc.Global.t)) :=
              let* α0 : std.thread.JoinHandle.t unit := M.read child in
              let* α1 :
                  core.result.Result.t
                    unit
                    (alloc.boxed.Box.t
                      type not implemented
                      alloc.alloc.Global.t) :=
                (std.thread.JoinHandle.t unit)::["join"] α0 in
              M.alloc α1 in
            M.alloc tt
          end in
        M.alloc tt)
    end in
  let* α0 : M.Val unit := use α2 in
  M.read α0.
