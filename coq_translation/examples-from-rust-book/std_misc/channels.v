(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Definition NTHREADS (_ : unit) :=
  3.

Definition main (_ : unit) :=
  let (tx, rx) := mpsc.channel tt in
  let children := ImplVec.new tt in
  match into_iter {| Range.start := 0; Range.end := NTHREADS; |} with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := id; |} =>
      let thread_tx := clone tx in
      let child := thread.spawn
        (fun  => unwrap (send thread_tx id) ;;
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["thread ";" finished\n"]
            [_crate::fmt::ImplArgumentV1.new_display id]) ;;
        tt ;;
        tt) in
      push children child ;;
      tt
    end ;;
    tt from for
  end ;;
  let ids := ImplVec.with_capacity NTHREADS in
  match into_iter {| Range.start := 0; Range.end := NTHREADS; |} with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := _; |} =>
      push ids (recv rx) ;;
      tt
    end ;;
    tt from for
  end ;;
  match into_iter children with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := child; |} =>
      expect (join child) "oops! the child thread panicked" ;;
      tt
    end ;;
    tt from for
  end ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug ids]) ;;
  tt ;;
  tt.