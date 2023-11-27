(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn increase(number: i32) {
    println!("{}", number + 1);
}
*)
Definition increase (number : i32.t) : M unit :=
  let* number : M.Val i32.t := M.alloc number in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str ""; mk_str "
" ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : M.Val i32.t := M.alloc 1 in
      let* α6 : M.Val i32.t := BinOp.add number α5 in
      let* α7 : ref i32.t := borrow α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] α7 in
      let* α9 : M.Val core.fmt.rt.Argument.t := M.alloc α8 in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
      let* α11 : ref (array core.fmt.rt.Argument.t) := borrow α10 in
      let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α11 in
      let* α13 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
        pointer_coercion "Unsize" α12 in
      let* α14 : ref (slice core.fmt.rt.Argument.t) := M.read α13 in
      let* α15 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α4 α14 in
      let* α16 : unit := std.io.stdio._print α15 in
      M.alloc α16 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn decrease(number: i32) {
    println!("{}", number - 1);
}
*)
Definition decrease (number : i32.t) : M unit :=
  let* number : M.Val i32.t := M.alloc number in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str ""; mk_str "
" ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : M.Val i32.t := M.alloc 1 in
      let* α6 : M.Val i32.t := BinOp.sub number α5 in
      let* α7 : ref i32.t := borrow α6 in
      let* α8 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] α7 in
      let* α9 : M.Val core.fmt.rt.Argument.t := M.alloc α8 in
      let* α10 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α9 ] in
      let* α11 : ref (array core.fmt.rt.Argument.t) := borrow α10 in
      let* α12 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α11 in
      let* α13 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
        pointer_coercion "Unsize" α12 in
      let* α14 : ref (slice core.fmt.rt.Argument.t) := M.read α13 in
      let* α15 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α4 α14 in
      let* α16 : unit := std.io.stdio._print α15 in
      M.alloc α16 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn help() {
    println!(
        "usage:
match_args <string>
    Check whether given string is the answer.
match_args {{increase|decrease}} <integer>
    Increase or decrease given integer by one."
    );
}
*)
Definition help : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc
          [
            mk_str
              "usage:
match_args <string>
    Check whether given string is the answer.
match_args {increase|decrease} <integer>
    Increase or decrease given integer by one.
"
          ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_const"] α4 in
      let* α6 : unit := std.io.stdio._print α5 in
      M.alloc α6 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    match args.len() {
        // no arguments passed
        1 => {
            println!("My name is 'match_args'. Try passing some arguments!");
        }
        // one argument passed
        2 => match args[1].parse() {
            Ok(42) => println!("This is the answer!"),
            _ => println!("This is not the answer."),
        },
        // one command and one argument passed
        3 => {
            let cmd = &args[1];
            let num = &args[2];
            // parse the number
            let number: i32 = match num.parse() {
                Ok(n) => n,
                Err(_) => {
                    eprintln!("error: second argument not an integer");
                    help();
                    return;
                }
            };
            // parse the command
            match &cmd[..] {
                "increase" => increase(number),
                "decrease" => decrease(number),
                _ => {
                    eprintln!("error: invalid command");
                    help();
                }
            }
        }
        // all the other cases
        _ => {
            // show a help message
            help();
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let return_ := M.return_ (R := unit) in
  M.catch_return
    (let* args :
        M.Val (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
      let* α0 : std.env.Args.t := std.env.args in
      let* α1 : alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t :=
        (core.iter.traits.iterator.Iterator.collect
            (Self := std.env.Args.t)
            (Trait := ltac:(refine _)))
          α0 in
      M.alloc α1 in
    let* α0 :
        ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
      borrow args in
    let* α1 : usize.t :=
      (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)::["len"]
        α0 in
    let* α0 : M.Val unit :=
      match α1 with
      | _ =>
        let* _ : M.Val unit :=
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc
                [ mk_str "My name is 'match_args'. Try passing some arguments!
"
                ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
            let* α3 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α2 in
            let* α4 : ref (slice (ref str.t)) := M.read α3 in
            let* α5 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_const"] α4 in
            let* α6 : unit := std.io.stdio._print α5 in
            M.alloc α6 in
          M.alloc tt in
        M.alloc tt
      | _ =>
        let* α0 :
            ref (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
          borrow args in
        let* α1 : M.Val usize.t := M.alloc 1 in
        let* α2 : usize.t := M.read α1 in
        let* α3 : ref alloc.string.String.t :=
          (core.ops.index.Index.index
              (Self :=
                alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
              (Trait := ltac:(refine _)))
            α0
            α2 in
        let* α4 : ref str.t :=
          (core.ops.deref.Deref.deref
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            α3 in
        let* α5 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
          str.t::["parse"] α4 in
        match α5 with
        | core.result.Result.Ok _ =>
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "This is the answer!
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
            let* α3 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α2 in
            let* α4 : ref (slice (ref str.t)) := M.read α3 in
            let* α5 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_const"] α4 in
            let* α6 : unit := std.io.stdio._print α5 in
            M.alloc α6 in
          M.alloc tt
        | _ =>
          let* _ : M.Val unit :=
            let* α0 : M.Val (array (ref str.t)) :=
              M.alloc [ mk_str "This is not the answer.
" ] in
            let* α1 : ref (array (ref str.t)) := borrow α0 in
            let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
            let* α3 : M.Val (ref (slice (ref str.t))) :=
              pointer_coercion "Unsize" α2 in
            let* α4 : ref (slice (ref str.t)) := M.read α3 in
            let* α5 : core.fmt.Arguments.t :=
              core.fmt.Arguments.t::["new_const"] α4 in
            let* α6 : unit := std.io.stdio._print α5 in
            M.alloc α6 in
          M.alloc tt
        end
      | _ =>
        let* cmd : M.Val (ref alloc.string.String.t) :=
          let* α0 :
              ref
                (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
            borrow args in
          let* α1 : M.Val usize.t := M.alloc 1 in
          let* α2 : usize.t := M.read α1 in
          let* α3 : ref alloc.string.String.t :=
            (core.ops.index.Index.index
                (Self :=
                  alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
                (Trait := ltac:(refine _)))
              α0
              α2 in
          M.alloc α3 in
        let* num : M.Val (ref alloc.string.String.t) :=
          let* α0 :
              ref
                (alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t) :=
            borrow args in
          let* α1 : M.Val usize.t := M.alloc 2 in
          let* α2 : usize.t := M.read α1 in
          let* α3 : ref alloc.string.String.t :=
            (core.ops.index.Index.index
                (Self :=
                  alloc.vec.Vec.t alloc.string.String.t alloc.alloc.Global.t)
                (Trait := ltac:(refine _)))
              α0
              α2 in
          M.alloc α3 in
        let* number : M.Val i32.t :=
          let* α0 : ref alloc.string.String.t := M.read num in
          let* α1 : ref str.t :=
            (core.ops.deref.Deref.deref
                (Self := alloc.string.String.t)
                (Trait := ltac:(refine _)))
              α0 in
          let* α2 : core.result.Result.t i32.t core.num.error.ParseIntError.t :=
            str.t::["parse"] α1 in
          let* α3 : M.Val i32.t :=
            match α2 with
            | core.result.Result.Ok n =>
              let* n := M.alloc n in
              M.pure n
            | core.result.Result.Err _ =>
              let* _ : M.Val unit :=
                let* _ : M.Val unit :=
                  let* α0 : M.Val (array (ref str.t)) :=
                    M.alloc
                      [ mk_str "error: second argument not an integer
" ] in
                  let* α1 : ref (array (ref str.t)) := borrow α0 in
                  let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
                  let* α3 : M.Val (ref (slice (ref str.t))) :=
                    pointer_coercion "Unsize" α2 in
                  let* α4 : ref (slice (ref str.t)) := M.read α3 in
                  let* α5 : core.fmt.Arguments.t :=
                    core.fmt.Arguments.t::["new_const"] α4 in
                  let* α6 : unit := std.io.stdio._eprint α5 in
                  M.alloc α6 in
                M.alloc tt in
              let* _ : M.Val unit :=
                let* α0 : unit := program_arguments_parsing.help in
                M.alloc α0 in
              let* _ : M.Val never.t :=
                let* α0 : M.Val unit := M.alloc tt in
                return_ α0 in
              let* α0 : M.Val unit := M.alloc tt in
              never_to_any α0
            end in
          M.copy α3 in
        let* α0 : ref alloc.string.String.t := M.read cmd in
        let* α1 : ref str.t :=
          (core.ops.index.Index.index
              (Self := alloc.string.String.t)
              (Trait := ltac:(refine _)))
            α0
            core.ops.range.RangeFull.Build_t in
        match α1 with
        | _ =>
          let* α0 : i32.t := M.read number in
          let* α1 : unit := program_arguments_parsing.increase α0 in
          M.alloc α1
        | _ =>
          let* α0 : i32.t := M.read number in
          let* α1 : unit := program_arguments_parsing.decrease α0 in
          M.alloc α1
        | _ =>
          let* _ : M.Val unit :=
            let* _ : M.Val unit :=
              let* α0 : M.Val (array (ref str.t)) :=
                M.alloc [ mk_str "error: invalid command
" ] in
              let* α1 : ref (array (ref str.t)) := borrow α0 in
              let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
              let* α3 : M.Val (ref (slice (ref str.t))) :=
                pointer_coercion "Unsize" α2 in
              let* α4 : ref (slice (ref str.t)) := M.read α3 in
              let* α5 : core.fmt.Arguments.t :=
                core.fmt.Arguments.t::["new_const"] α4 in
              let* α6 : unit := std.io.stdio._eprint α5 in
              M.alloc α6 in
            M.alloc tt in
          let* _ : M.Val unit :=
            let* α0 : unit := program_arguments_parsing.help in
            M.alloc α0 in
          M.alloc tt
        end
      | _ =>
        let* _ : M.Val unit :=
          let* α0 : unit := program_arguments_parsing.help in
          M.alloc α0 in
        M.alloc tt
      end in
    M.read α0).
