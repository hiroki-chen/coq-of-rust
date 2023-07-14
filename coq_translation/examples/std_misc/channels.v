(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS `{H : State.Trait} : i32 := run (Pure 3).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* '(tx, rx) := std.sync.mpsc.channel tt in
  let* children := alloc.vec.Vec::["new"] tt in
  let* _ :=
    let* α0 :=
      into_iter Range {| Range.start := 0; Range.end := channels.NTHREADS; |} in
    match α0 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := next (addr_of iter) in
          match α0 with
          | None  => Break
          | Some id =>
            let* thread_tx := tx.["clone"] in
            let* child :=
              std.thread.spawn
                (fun  =>
                  let* _ :=
                    let* α0 := thread_tx.["send"] id in
                    α0.["unwrap"] in
                  let* _ :=
                    let* _ :=
                      let* α0 :=
                        format_argument::["new_display"] (addr_of id) in
                      let* α1 :=
                        format_arguments::["new_v1"]
                          (addr_of [ "thread "; " finished
" ])
                          (addr_of [ α0 ]) in
                      std.io.stdio._print α1 in
                    Pure tt in
                  Pure tt) in
            let* _ := children.["push"] child in
            Pure tt
          end in
        Pure tt)
    end in
  let* ids := alloc.vec.Vec::["with_capacity"] (cast channels.NTHREADS usize) in
  let* _ :=
    let* α0 :=
      into_iter Range {| Range.start := 0; Range.end := channels.NTHREADS; |} in
    match α0 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := next (addr_of iter) in
          match α0 with
          | None  => Break
          | Some _ =>
            let* _ :=
              let* α0 := rx.["recv"] in
              ids.["push"] α0 in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* α0 := into_iter children in
    match α0 with
    | iter =>
      loop
        (let* _ :=
          let* α0 := next (addr_of iter) in
          match α0 with
          | None  => Break
          | Some child =>
            let* _ :=
              let* α0 := child.["join"] in
              α0.["expect"] "oops! the child thread panicked" in
            Pure tt
          end in
        Pure tt)
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of ids) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
