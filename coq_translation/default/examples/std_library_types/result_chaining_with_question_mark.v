(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError : Set := MathError.t.
  
  Module
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self := result_chaining_with_question_mark.checked.MathError.
    
    Definition fmt
        `{H' : State.Trait}
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M (H := H') core.fmt.Result :=
      let* α0 :=
        match self with
        | result_chaining_with_question_mark.checked.MathError.DivisionByZero =>
          Pure "DivisionByZero"
        |
            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
            =>
          Pure "NonPositiveLogarithm"
        |
            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
            =>
          Pure "NegativeSquareRoot"
        end in
      core.fmt.Formatter::["write_str"] f α0.
    
    Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
    }.
    Global Hint Resolve I : core.
  End
    Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Definition MathResult : Set :=
    core.result.Result f64 result_chaining_with_question_mark.checked.MathError.
  
  Definition div
      `{H' : State.Trait}
      (x : f64)
      (y : f64)
      : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
    let* α0 := y.["eq"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.DivisionByZero)
    else
      let* α0 := x.["div"] y in
      Pure (core.result.Result.Ok α0).
  
  Definition sqrt
      `{H' : State.Trait}
      (x : f64)
      : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
    let* α0 := x.["lt"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
    else
      let* α0 := x.["sqrt"] in
      Pure (core.result.Result.Ok α0).
  
  Definition ln
      `{H' : State.Trait}
      (x : f64)
      : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
    let* α0 := x.["le"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
    else
      let* α0 := x.["ln"] in
      Pure (core.result.Result.Ok α0).
  
  Definition op_
      `{H' : State.Trait}
      (x : f64)
      (y : f64)
      : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
    let* ratio :=
      let* α0 := result_chaining_with_question_mark.checked.div x y in
      let* α1 := α0.["branch"] in
      match α1 with
      | LanguageItem.Break residual =>
        let* α0 := residual.["from_residual"] in
        Return α0
      | LanguageItem.Continue val => Pure val
      end in
    let* ln :=
      let* α0 := result_chaining_with_question_mark.checked.ln ratio in
      let* α1 := α0.["branch"] in
      match α1 with
      | LanguageItem.Break residual =>
        let* α0 := residual.["from_residual"] in
        Return α0
      | LanguageItem.Continue val => Pure val
      end in
    result_chaining_with_question_mark.checked.sqrt ln.
  
  Definition op `{H' : State.Trait} (x : f64) (y : f64) : M (H := H') unit :=
    let* α0 := result_chaining_with_question_mark.checked.op_ x y in
    match α0 with
    | core.result.Result.Err why =>
      let* α0 :=
        match why with
        |
            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
            =>
          Pure "logarithm of non-positive number"
        | result_chaining_with_question_mark.checked.MathError.DivisionByZero =>
          Pure "division by zero"
        |
            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
            =>
          Pure "square root of negative number"
        end in
      core.panicking.panic_display (addr_of α0)
    | core.result.Result.Ok value =>
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of value) in
        let* α1 :=
          format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    end.
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError : Set := MathError.t.

Module
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  Definition Self := result_chaining_with_question_mark.checked.MathError.
  
  Definition fmt
      `{H' : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H') core.fmt.Result :=
    let* α0 :=
      match self with
      | result_chaining_with_question_mark.checked.MathError.DivisionByZero =>
        Pure "DivisionByZero"
      |
          result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
          =>
        Pure "NonPositiveLogarithm"
      |
          result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
          =>
        Pure "NegativeSquareRoot"
      end in
    core.fmt.Formatter::["write_str"] f α0.
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.

Definition MathResult : Set :=
  core.result.Result f64 result_chaining_with_question_mark.checked.MathError.

Definition div
    `{H' : State.Trait}
    (x : f64)
    (y : f64)
    : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
  let* α0 := y.["eq"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure
      (core.result.Result.Err
        result_chaining_with_question_mark.checked.MathError.DivisionByZero)
  else
    let* α0 := x.["div"] y in
    Pure (core.result.Result.Ok α0).

Definition sqrt
    `{H' : State.Trait}
    (x : f64)
    : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
  let* α0 := x.["lt"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure
      (core.result.Result.Err
        result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
  else
    let* α0 := x.["sqrt"] in
    Pure (core.result.Result.Ok α0).

Definition ln
    `{H' : State.Trait}
    (x : f64)
    : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
  let* α0 := x.["le"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure
      (core.result.Result.Err
        result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
  else
    let* α0 := x.["ln"] in
    Pure (core.result.Result.Ok α0).

Definition op_
    `{H' : State.Trait}
    (x : f64)
    (y : f64)
    : M (H := H') result_chaining_with_question_mark.checked.MathResult :=
  let* ratio :=
    let* α0 := result_chaining_with_question_mark.checked.div x y in
    let* α1 := α0.["branch"] in
    match α1 with
    | LanguageItem.Break residual =>
      let* α0 := residual.["from_residual"] in
      Return α0
    | LanguageItem.Continue val => Pure val
    end in
  let* ln :=
    let* α0 := result_chaining_with_question_mark.checked.ln ratio in
    let* α1 := α0.["branch"] in
    match α1 with
    | LanguageItem.Break residual =>
      let* α0 := residual.["from_residual"] in
      Return α0
    | LanguageItem.Continue val => Pure val
    end in
  result_chaining_with_question_mark.checked.sqrt ln.

Definition op `{H' : State.Trait} (x : f64) (y : f64) : M (H := H') unit :=
  let* α0 := result_chaining_with_question_mark.checked.op_ x y in
  match α0 with
  | core.result.Result.Err why =>
    let* α0 :=
      match why with
      |
          result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
          =>
        Pure "logarithm of non-positive number"
      | result_chaining_with_question_mark.checked.MathError.DivisionByZero =>
        Pure "division by zero"
      |
          result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
          =>
        Pure "square root of negative number"
      end in
    core.panicking.panic_display (addr_of α0)
  | core.result.Result.Ok value =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of value) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* _ :=
    result_chaining_with_question_mark.checked.op 1 (* 1.0 *) 10 (* 10.0 *) in
  Pure tt.
