(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    // The first argument is the path that was used to call the program.
    println!("My path is {}.", args[0]);

    // The rest of the arguments are the passed command line parameters.
    // Call the program like this:
    //   $ ./args arg1 arg2
    println!("I got {:?} arguments: {:?}.", args.len() - 1, &args[1..]);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* args :
        M.Val (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
      let* α0 : std.env.Args.t := std.env.args in
      let* α1 : alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t :=
        (core.iter.traits.iterator.Iterator.collect
            (Self := std.env.Args.t)
            (Trait := ltac:(refine _)))
          α0 in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "My path is "; mk_str ".
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α6 : M.Val usize.t := M.alloc 0 in
        let* α7 : usize.t := M.read α6 in
        let* α8 : ref alloc.string.String.t :=
          (core.ops.index.Index.index
              (Self :=
                alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α5
            α7 in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : unit := std.io.stdio._print α16 in
        M.alloc α17 in
      M.alloc tt in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "I got "; mk_str " arguments: "; mk_str ".
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α6 : usize.t :=
          (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)::["len"]
            α5 in
        let* α7 : M.Val usize.t := M.alloc α6 in
        let* α8 : M.Val usize.t := M.alloc 1 in
        let* α9 : M.Val usize.t := BinOp.sub α7 α8 in
        let* α10 : ref usize.t := borrow α9 in
        let* α11 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α10 in
        let* α12 : M.Val core.fmt.rt.Argument.t := M.alloc α11 in
        let* α13 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α14 : M.Val usize.t := M.alloc 1 in
        let* α15 : usize.t := M.read α14 in
        let* α16 : ref (slice alloc.string.String.t) :=
          (core.ops.index.Index.index
              (Self :=
                alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α13
            {| core.ops.range.RangeFrom.start := α15; |} in
        let* α17 : M.Val (ref (slice alloc.string.String.t)) := M.alloc α16 in
        let* α18 : ref (ref (slice alloc.string.String.t)) := borrow α17 in
        let* α19 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α18 in
        let* α20 : M.Val core.fmt.rt.Argument.t := M.alloc α19 in
        let* α21 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α12; α20 ] in
        let* α22 : ref (array core.fmt.rt.Argument.t) := borrow α21 in
        let* α23 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α22 in
        let* α24 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α23 in
        let* α25 : ref (slice core.fmt.rt.Argument.t) := M.read α24 in
        let* α26 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α25 in
        let* α27 : unit := std.io.stdio._print α26 in
        M.alloc α27 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
