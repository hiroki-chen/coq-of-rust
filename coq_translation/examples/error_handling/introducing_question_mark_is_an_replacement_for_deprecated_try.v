(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition multiply
    `{State.Trait}
    (first_number_str : ref str)
    (second_number_str : ref str)
    : M (core.result.Result i32 core.num.error.ParseIntError) :=
  let* first_number :=
    let* α0 := first_number_str.["parse"] in
    match α0 with
    | core.result.Result.Ok val => Pure val
    | core.result.Result.Err err =>
      let* _ :=
        let* α0 := core.convert.From.from err in
        Return (core.result.Result.Err α0) in
      Pure tt
    end in
  let* second_number :=
    let* α0 := second_number_str.["parse"] in
    match α0 with
    | core.result.Result.Ok val => Pure val
    | core.result.Result.Err err =>
      let* _ :=
        let* α0 := core.convert.From.from err in
        Return (core.result.Result.Err α0) in
      Pure tt
    end in
  let* α0 := first_number.["mul"] second_number in
  Pure (core.result.Result.Ok α0).

Definition print
    `{State.Trait}
    (result : core.result.Result i32 core.num.error.ParseIntError)
    : M unit :=
  match result with
  | core.result.Result.Ok n =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of n) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "n is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  | core.result.Result.Err e =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of e) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Error: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* α0 :=
      introducing_question_mark_is_an_replacement_for_deprecated_try.multiply
        "10"
        "2" in
    introducing_question_mark_is_an_replacement_for_deprecated_try.print α0 in
  let* _ :=
    let* α0 :=
      introducing_question_mark_is_an_replacement_for_deprecated_try.multiply
        "t"
        "2" in
    introducing_question_mark_is_an_replacement_for_deprecated_try.print α0 in
  Pure tt.
