(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition increase `{State.Trait} (number : i32) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := number.["add"] 1 in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.

Definition decrease `{State.Trait} (number : i32) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := number.["sub"] 1 in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.

Definition help `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of
            [
              "usage:
match_args <string>
    Check whether given string is the answer.
match_args {increase|decrease} <integer>
    Increase or decrease given integer by one.
"
            ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* args :=
    let* α0 := std.env.args tt in
    α0.["collect"] in
  let* α0 := args.["len"] in
  match α0 with
  | 1 =>
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of
              [ "My name is 'match_args'. Try passing some arguments!
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt
  | 2 =>
    let* α0 := args[1].["parse"] in
    match α0 with
    | core.result.Result.Ok 42 =>
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "This is the answer!
" ]) in
        std.io.stdio._print α0 in
      Pure tt
    | _ =>
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "This is not the answer.
" ]) in
        std.io.stdio._print α0 in
      Pure tt
    end
  | 3 =>
    let cmd := addr_of args[1] in
    let num := addr_of args[2] in
    let* number :=
      let* α0 := num.["parse"] in
      match α0 with
      | core.result.Result.Ok n => Pure n
      | core.result.Result.Err _ =>
        let* _ :=
          let* _ :=
            let* α0 :=
              format_arguments::["new_const"]
                (addr_of [ "error: second argument not an integer
" ]) in
            std.io.stdio._eprint α0 in
          Pure tt in
        let* _ := program_arguments_parsing.help tt in
        let* _ := Return tt in
        Pure tt
      end in
    match addr_of cmd[RangeFull {|  |}] with
    | "increase" => program_arguments_parsing.increase number
    | "decrease" => program_arguments_parsing.decrease number
    | _ =>
      let* _ :=
        let* _ :=
          let* α0 :=
            format_arguments::["new_const"]
              (addr_of [ "error: invalid command
" ]) in
          std.io.stdio._eprint α0 in
        Pure tt in
      let* _ := program_arguments_parsing.help tt in
      Pure tt
    end
  | _ =>
    let* _ := program_arguments_parsing.help tt in
    Pure tt
  end.
