(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError := MathError.t.
  
  Module Impl_core_fmt_Debug_for_result_checked_MathError.
    Definition Self := result.checked.MathError.
    
    Definition fmt
        `{State.Trait}
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M core.fmt.Result :=
      let* α0 :=
        match self with
        | result.checked.MathError.DivisionByZero => Pure "DivisionByZero"
        | result.checked.MathError.NonPositiveLogarithm =>
          Pure "NonPositiveLogarithm"
        | result.checked.MathError.NegativeSquareRoot =>
          Pure "NegativeSquareRoot"
        end in
      core.fmt.Formatter::["write_str"] f α0.
    
    Global Instance Method_fmt : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_checked_MathError.
  
  Definition MathResult : Set :=
    core.result.Result f64 result.checked.MathError.
  
  Definition div
      `{State.Trait}
      (x : f64)
      (y : f64)
      : M result.checked.MathResult :=
    let* α0 := y.["eq"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure (core.result.Result.Err result.checked.MathError.DivisionByZero)
    else
      let* α0 := x.["div"] y in
      Pure (core.result.Result.Ok α0).
  
  Definition sqrt `{State.Trait} (x : f64) : M result.checked.MathResult :=
    let* α0 := x.["lt"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure (core.result.Result.Err result.checked.MathError.NegativeSquareRoot)
    else
      let* α0 := x.["sqrt"] in
      Pure (core.result.Result.Ok α0).
  
  Definition ln `{State.Trait} (x : f64) : M result.checked.MathResult :=
    let* α0 := x.["le"] 0 (* 0.0 *) in
    if (α0 : bool) then
      Pure
        (core.result.Result.Err result.checked.MathError.NonPositiveLogarithm)
    else
      let* α0 := x.["ln"] in
      Pure (core.result.Result.Ok α0).
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError := MathError.t.

Module Impl_core_fmt_Debug_for_result_checked_MathError.
  Definition Self := result.checked.MathError.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 :=
      match self with
      | result.checked.MathError.DivisionByZero => Pure "DivisionByZero"
      | result.checked.MathError.NonPositiveLogarithm =>
        Pure "NonPositiveLogarithm"
      | result.checked.MathError.NegativeSquareRoot => Pure "NegativeSquareRoot"
      end in
    core.fmt.Formatter::["write_str"] f α0.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_result_checked_MathError.

Definition MathResult : Set := core.result.Result f64 result.checked.MathError.

Definition div
    `{State.Trait}
    (x : f64)
    (y : f64)
    : M result.checked.MathResult :=
  let* α0 := y.["eq"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure (core.result.Result.Err result.checked.MathError.DivisionByZero)
  else
    let* α0 := x.["div"] y in
    Pure (core.result.Result.Ok α0).

Definition sqrt `{State.Trait} (x : f64) : M result.checked.MathResult :=
  let* α0 := x.["lt"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure (core.result.Result.Err result.checked.MathError.NegativeSquareRoot)
  else
    let* α0 := x.["sqrt"] in
    Pure (core.result.Result.Ok α0).

Definition ln `{State.Trait} (x : f64) : M result.checked.MathResult :=
  let* α0 := x.["le"] 0 (* 0.0 *) in
  if (α0 : bool) then
    Pure (core.result.Result.Err result.checked.MathError.NonPositiveLogarithm)
  else
    let* α0 := x.["ln"] in
    Pure (core.result.Result.Ok α0).

Definition op `{State.Trait} (x : f64) (y : f64) : M f64 :=
  let* α0 := result.checked.div x y in
  match α0 with
  | core.result.Result.Err why =>
    let* α0 := format_argument::["new_debug"] (addr_of why) in
    let* α1 := format_arguments::["new_v1"] (addr_of [ "" ]) (addr_of [ α0 ]) in
    core.panicking.panic_fmt α1
  | core.result.Result.Ok ratio =>
    let* α0 := result.checked.ln ratio in
    match α0 with
    | core.result.Result.Err why =>
      let* α0 := format_argument::["new_debug"] (addr_of why) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ "" ]) (addr_of [ α0 ]) in
      core.panicking.panic_fmt α1
    | core.result.Result.Ok ln =>
      let* α0 := result.checked.sqrt ln in
      match α0 with
      | core.result.Result.Err why =>
        let* α0 := format_argument::["new_debug"] (addr_of why) in
        let* α1 :=
          format_arguments::["new_v1"] (addr_of [ "" ]) (addr_of [ α0 ]) in
        core.panicking.panic_fmt α1
      | core.result.Result.Ok sqrt => Pure sqrt
      end
    end
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := result.op 1 (* 1.0 *) 10 (* 10.0 *) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
