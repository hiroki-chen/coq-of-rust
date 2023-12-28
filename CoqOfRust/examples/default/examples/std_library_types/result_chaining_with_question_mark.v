(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  
  Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
    Definition Self : Set :=
      result_chaining_with_question_mark.checked.MathError.t.
    
    (*
        Debug
    *)
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter.t)
        : M ltac:(core.fmt.Result) :=
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref result_chaining_with_question_mark.checked.MathError.t :=
        M.read self in
      let* α2 : M.Val (ref str.t) :=
        match_operator
          α1
          [
            fun α =>
              match α with
              |
                  result_chaining_with_question_mark.checked.MathError.DivisionByZero
                  =>
                let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
                M.alloc α0
              | _ => M.break_match
              end :
              M (M.Val (ref str.t));
            fun α =>
              match α with
              |
                  result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                  =>
                let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
                M.alloc α0
              | _ => M.break_match
              end :
              M (M.Val (ref str.t));
            fun α =>
              match α with
              |
                  result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                  =>
                let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
                M.alloc α0
              | _ => M.break_match
              end :
              M (M.Val (ref str.t))
          ] in
      let* α3 : ref str.t := M.read α2 in
      M.call (core.fmt.Formatter.t::["write_str"] α0 α3).
    
    Global Instance AssociatedFunction_fmt :
      Notations.DoubleColon Self "fmt" := {
      Notations.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  
  Ltac MathResult :=
    exact
      (core.result.Result.t
        f64.t
        result_chaining_with_question_mark.checked.MathError.t).
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Definition div
      (x : f64.t)
      (y : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x := M.alloc x in
    let* y := M.alloc y in
    let* α0 : f64.t := M.read y in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.eq α0 α1) in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if α3 then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.DivisionByZero)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := M.read y in
        let* α2 : f64.t := BinOp.Panic.div α0 α1 in
        M.alloc (core.result.Result.Ok α2) in
    M.read α4.
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt
      (x : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x := M.alloc x in
    let* α0 : f64.t := M.read x in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.lt α0 α1) in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if α3 then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := M.call (f64.t::["sqrt"] α0) in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4.
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln
      (x : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x := M.alloc x in
    let* α0 : f64.t := M.read x in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.le α0 α1) in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      if α3 then
        M.alloc
          (core.result.Result.Err
            result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
      else
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := M.call (f64.t::["ln"] α0) in
        M.alloc (core.result.Result.Ok α1) in
    M.read α4.
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Definition op_
      (x : f64.t)
      (y : f64.t)
      : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
    let* x := M.alloc x in
    let* y := M.alloc y in
    let return_ :=
      M.return_
        (R := ltac:(result_chaining_with_question_mark.checked.MathResult)) in
    M.catch_return
      (let* ratio : M.Val f64.t :=
        let* α0 : f64.t := M.read x in
        let* α1 : f64.t := M.read y in
        let* α2 :
            core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t :=
          M.call (result_chaining_with_question_mark.checked.div α0 α1) in
        let* α3 :
            core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t :=
          M.call
            ((core.ops.try_trait.Try.branch
                (Self :=
                  core.result.Result.t
                    f64.t
                    result_chaining_with_question_mark.checked.MathError.t)
                (Trait := ltac:(refine _)))
              α2) in
        let* α4 : M.Val f64.t :=
          match_operator
            α3
            [
              fun α =>
                match α with
                | core.ops.control_flow.ControlFlow.Break residual =>
                  let* residual := M.alloc residual in
                  let* α0 :
                      core.result.Result.t
                        core.convert.Infallible.t
                        result_chaining_with_question_mark.checked.MathError.t :=
                    M.read residual in
                  let* α1 :
                      core.result.Result.t
                        f64.t
                        result_chaining_with_question_mark.checked.MathError.t :=
                    M.call
                      ((core.ops.try_trait.FromResidual.from_residual
                          (Self :=
                            core.result.Result.t
                              f64.t
                              result_chaining_with_question_mark.checked.MathError.t)
                          (Trait := ltac:(refine _)))
                        α0) in
                  let* α2 : M.Val never.t := return_ α1 in
                  let* α3 := M.read α2 in
                  let* α4 : f64.t := never_to_any α3 in
                  M.alloc α4
                | _ => M.break_match
                end :
                M (M.Val f64.t);
              fun α =>
                match α with
                | core.ops.control_flow.ControlFlow.Continue val =>
                  let* val := M.alloc val in
                  M.pure val
                | _ => M.break_match
                end :
                M (M.Val f64.t)
            ] in
        M.copy α4 in
      let* ln : M.Val f64.t :=
        let* α0 : f64.t := M.read ratio in
        let* α1 :
            core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t :=
          M.call (result_chaining_with_question_mark.checked.ln α0) in
        let* α2 :
            core.ops.control_flow.ControlFlow.t
              (core.result.Result.t
                core.convert.Infallible.t
                result_chaining_with_question_mark.checked.MathError.t)
              f64.t :=
          M.call
            ((core.ops.try_trait.Try.branch
                (Self :=
                  core.result.Result.t
                    f64.t
                    result_chaining_with_question_mark.checked.MathError.t)
                (Trait := ltac:(refine _)))
              α1) in
        let* α3 : M.Val f64.t :=
          match_operator
            α2
            [
              fun α =>
                match α with
                | core.ops.control_flow.ControlFlow.Break residual =>
                  let* residual := M.alloc residual in
                  let* α0 :
                      core.result.Result.t
                        core.convert.Infallible.t
                        result_chaining_with_question_mark.checked.MathError.t :=
                    M.read residual in
                  let* α1 :
                      core.result.Result.t
                        f64.t
                        result_chaining_with_question_mark.checked.MathError.t :=
                    M.call
                      ((core.ops.try_trait.FromResidual.from_residual
                          (Self :=
                            core.result.Result.t
                              f64.t
                              result_chaining_with_question_mark.checked.MathError.t)
                          (Trait := ltac:(refine _)))
                        α0) in
                  let* α2 : M.Val never.t := return_ α1 in
                  let* α3 := M.read α2 in
                  let* α4 : f64.t := never_to_any α3 in
                  M.alloc α4
                | _ => M.break_match
                end :
                M (M.Val f64.t);
              fun α =>
                match α with
                | core.ops.control_flow.ControlFlow.Continue val =>
                  let* val := M.alloc val in
                  M.pure val
                | _ => M.break_match
                end :
                M (M.Val f64.t)
            ] in
        M.copy α3 in
      let* α0 : f64.t := M.read ln in
      let* α1 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        M.call (result_chaining_with_question_mark.checked.sqrt α0) in
      let* α0 :
          M.Val
            (core.result.Result.t
              f64.t
              result_chaining_with_question_mark.checked.MathError.t) :=
        M.alloc α1 in
      M.read α0).
  
  (*
      pub fn op(x: f64, y: f64) {
          match op_(x, y) {
              Err(why) => panic!(
                  "{}",
                  match why {
                      MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                      MathError::DivisionByZero => "division by zero",
                      MathError::NegativeSquareRoot => "square root of negative number",
                  }
              ),
              Ok(value) => println!("{}", value),
          }
      }
  *)
  Definition op (x : f64.t) (y : f64.t) : M unit :=
    let* x := M.alloc x in
    let* y := M.alloc y in
    let* α0 : f64.t := M.read x in
    let* α1 : f64.t := M.read y in
    let* α2 :
        core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t :=
      M.call (result_chaining_with_question_mark.checked.op_ α0 α1) in
    let* α3 : M.Val unit :=
      match_operator
        α2
        [
          fun α =>
            match α with
            | core.result.Result.Err why =>
              let* why := M.alloc why in
              let* α0 :
                  result_chaining_with_question_mark.checked.MathError.t :=
                M.read why in
              let* α1 : M.Val (ref str.t) :=
                match_operator
                  α0
                  [
                    fun α =>
                      match α with
                      |
                          result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                          =>
                        M.pure (mk_str "logarithm of non-positive number")
                      | _ => M.break_match
                      end :
                      M (M.Val (ref str.t));
                    fun α =>
                      match α with
                      |
                          result_chaining_with_question_mark.checked.MathError.DivisionByZero
                          =>
                        let* α0 : ref str.t :=
                          M.read (mk_str "division by zero") in
                        M.alloc α0
                      | _ => M.break_match
                      end :
                      M (M.Val (ref str.t));
                    fun α =>
                      match α with
                      |
                          result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                          =>
                        let* α0 : ref str.t :=
                          M.read (mk_str "square root of negative number") in
                        M.alloc α0
                      | _ => M.break_match
                      end :
                      M (M.Val (ref str.t))
                  ] in
              let* α2 : never.t :=
                M.call (core.panicking.panic_display (borrow α1)) in
              let* α3 : unit := never_to_any α2 in
              M.alloc α3
            | _ => M.break_match
            end :
            M (M.Val unit);
          fun α =>
            match α with
            | core.result.Result.Ok value =>
              let* value := M.alloc value in
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "") in
                let* α1 : ref str.t := M.read (mk_str "
") in
                let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
                let* α3 : M.Val (ref (array (ref str.t))) :=
                  M.alloc (borrow α2) in
                let* α4 : ref (slice (ref str.t)) :=
                  M.read (pointer_coercion "Unsize" α3) in
                let* α5 : core.fmt.rt.Argument.t :=
                  M.call
                    (core.fmt.rt.Argument.t::["new_display"] (borrow value)) in
                let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                  M.alloc [ α5 ] in
                let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                  M.alloc (borrow α6) in
                let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                  M.read (pointer_coercion "Unsize" α7) in
                let* α9 : core.fmt.Arguments.t :=
                  M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
                let* α10 : unit := M.call (std.io.stdio._print α9) in
                M.alloc α10 in
              M.alloc tt
            | _ => M.break_match
            end :
            M (M.Val unit)
        ] in
    M.read α3.
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.

Module  Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
Section Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
  Definition Self : Set :=
    result_chaining_with_question_mark.checked.MathError.t.
  
  (*
      Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref result_chaining_with_question_mark.checked.MathError.t :=
      M.read self in
    let* α2 : M.Val (ref str.t) :=
      match_operator
        α1
        [
          fun α =>
            match α with
            |
                result_chaining_with_question_mark.checked.MathError.DivisionByZero
                =>
              let* α0 : ref str.t := M.read (mk_str "DivisionByZero") in
              M.alloc α0
            | _ => M.break_match
            end :
            M (M.Val (ref str.t));
          fun α =>
            match α with
            |
                result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                =>
              let* α0 : ref str.t := M.read (mk_str "NonPositiveLogarithm") in
              M.alloc α0
            | _ => M.break_match
            end :
            M (M.Val (ref str.t));
          fun α =>
            match α with
            |
                result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                =>
              let* α0 : ref str.t := M.read (mk_str "NegativeSquareRoot") in
              M.alloc α0
            | _ => M.break_match
            end :
            M (M.Val (ref str.t))
        ] in
    let* α3 : ref str.t := M.read α2 in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α3).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.
End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError_t.

Ltac MathResult :=
  exact
    (core.result.Result.t
      f64.t
      result_chaining_with_question_mark.checked.MathError.t).

(*
    fn div(x: f64, y: f64) -> MathResult {
        if y == 0.0 {
            Err(MathError::DivisionByZero)
        } else {
            Ok(x / y)
        }
    }
*)
Definition div
    (x : f64.t)
    (y : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x := M.alloc x in
  let* y := M.alloc y in
  let* α0 : f64.t := M.read y in
  let* α1 : f64.t := M.read UnsupportedLiteral in
  let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.eq α0 α1) in
  let* α3 : bool.t := M.read (use α2) in
  let* α4 :
      M.Val
        (core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t) :=
    if α3 then
      M.alloc
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.DivisionByZero)
    else
      let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.read y in
      let* α2 : f64.t := BinOp.Panic.div α0 α1 in
      M.alloc (core.result.Result.Ok α2) in
  M.read α4.

(*
    fn sqrt(x: f64) -> MathResult {
        if x < 0.0 {
            Err(MathError::NegativeSquareRoot)
        } else {
            Ok(x.sqrt())
        }
    }
*)
Definition sqrt
    (x : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x := M.alloc x in
  let* α0 : f64.t := M.read x in
  let* α1 : f64.t := M.read UnsupportedLiteral in
  let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.lt α0 α1) in
  let* α3 : bool.t := M.read (use α2) in
  let* α4 :
      M.Val
        (core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t) :=
    if α3 then
      M.alloc
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot)
    else
      let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.call (f64.t::["sqrt"] α0) in
      M.alloc (core.result.Result.Ok α1) in
  M.read α4.

(*
    fn ln(x: f64) -> MathResult {
        if x <= 0.0 {
            Err(MathError::NonPositiveLogarithm)
        } else {
            Ok(x.ln())
        }
    }
*)
Definition ln
    (x : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x := M.alloc x in
  let* α0 : f64.t := M.read x in
  let* α1 : f64.t := M.read UnsupportedLiteral in
  let* α2 : M.Val bool.t := M.alloc (BinOp.Pure.le α0 α1) in
  let* α3 : bool.t := M.read (use α2) in
  let* α4 :
      M.Val
        (core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t) :=
    if α3 then
      M.alloc
        (core.result.Result.Err
          result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm)
    else
      let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.call (f64.t::["ln"] α0) in
      M.alloc (core.result.Result.Ok α1) in
  M.read α4.

(*
    fn op_(x: f64, y: f64) -> MathResult {
        // if `div` "fails", then `DivisionByZero` will be `return`ed
        let ratio = div(x, y)?;

        // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
        let ln = ln(ratio)?;

        sqrt(ln)
    }
*)
Definition op_
    (x : f64.t)
    (y : f64.t)
    : M ltac:(result_chaining_with_question_mark.checked.MathResult) :=
  let* x := M.alloc x in
  let* y := M.alloc y in
  let return_ :=
    M.return_
      (R := ltac:(result_chaining_with_question_mark.checked.MathResult)) in
  M.catch_return
    (let* ratio : M.Val f64.t :=
      let* α0 : f64.t := M.read x in
      let* α1 : f64.t := M.read y in
      let* α2 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        M.call (result_chaining_with_question_mark.checked.div α0 α1) in
      let* α3 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              result_chaining_with_question_mark.checked.MathError.t)
            f64.t :=
        M.call
          ((core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t)
              (Trait := ltac:(refine _)))
            α2) in
      let* α4 : M.Val f64.t :=
        match_operator
          α3
          [
            fun α =>
              match α with
              | core.ops.control_flow.ControlFlow.Break residual =>
                let* residual := M.alloc residual in
                let* α0 :
                    core.result.Result.t
                      core.convert.Infallible.t
                      result_chaining_with_question_mark.checked.MathError.t :=
                  M.read residual in
                let* α1 :
                    core.result.Result.t
                      f64.t
                      result_chaining_with_question_mark.checked.MathError.t :=
                  M.call
                    ((core.ops.try_trait.FromResidual.from_residual
                        (Self :=
                          core.result.Result.t
                            f64.t
                            result_chaining_with_question_mark.checked.MathError.t)
                        (Trait := ltac:(refine _)))
                      α0) in
                let* α2 : M.Val never.t := return_ α1 in
                let* α3 := M.read α2 in
                let* α4 : f64.t := never_to_any α3 in
                M.alloc α4
              | _ => M.break_match
              end :
              M (M.Val f64.t);
            fun α =>
              match α with
              | core.ops.control_flow.ControlFlow.Continue val =>
                let* val := M.alloc val in
                M.pure val
              | _ => M.break_match
              end :
              M (M.Val f64.t)
          ] in
      M.copy α4 in
    let* ln : M.Val f64.t :=
      let* α0 : f64.t := M.read ratio in
      let* α1 :
          core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t :=
        M.call (result_chaining_with_question_mark.checked.ln α0) in
      let* α2 :
          core.ops.control_flow.ControlFlow.t
            (core.result.Result.t
              core.convert.Infallible.t
              result_chaining_with_question_mark.checked.MathError.t)
            f64.t :=
        M.call
          ((core.ops.try_trait.Try.branch
              (Self :=
                core.result.Result.t
                  f64.t
                  result_chaining_with_question_mark.checked.MathError.t)
              (Trait := ltac:(refine _)))
            α1) in
      let* α3 : M.Val f64.t :=
        match_operator
          α2
          [
            fun α =>
              match α with
              | core.ops.control_flow.ControlFlow.Break residual =>
                let* residual := M.alloc residual in
                let* α0 :
                    core.result.Result.t
                      core.convert.Infallible.t
                      result_chaining_with_question_mark.checked.MathError.t :=
                  M.read residual in
                let* α1 :
                    core.result.Result.t
                      f64.t
                      result_chaining_with_question_mark.checked.MathError.t :=
                  M.call
                    ((core.ops.try_trait.FromResidual.from_residual
                        (Self :=
                          core.result.Result.t
                            f64.t
                            result_chaining_with_question_mark.checked.MathError.t)
                        (Trait := ltac:(refine _)))
                      α0) in
                let* α2 : M.Val never.t := return_ α1 in
                let* α3 := M.read α2 in
                let* α4 : f64.t := never_to_any α3 in
                M.alloc α4
              | _ => M.break_match
              end :
              M (M.Val f64.t);
            fun α =>
              match α with
              | core.ops.control_flow.ControlFlow.Continue val =>
                let* val := M.alloc val in
                M.pure val
              | _ => M.break_match
              end :
              M (M.Val f64.t)
          ] in
      M.copy α3 in
    let* α0 : f64.t := M.read ln in
    let* α1 :
        core.result.Result.t
          f64.t
          result_chaining_with_question_mark.checked.MathError.t :=
      M.call (result_chaining_with_question_mark.checked.sqrt α0) in
    let* α0 :
        M.Val
          (core.result.Result.t
            f64.t
            result_chaining_with_question_mark.checked.MathError.t) :=
      M.alloc α1 in
    M.read α0).

(*
    pub fn op(x: f64, y: f64) {
        match op_(x, y) {
            Err(why) => panic!(
                "{}",
                match why {
                    MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                    MathError::DivisionByZero => "division by zero",
                    MathError::NegativeSquareRoot => "square root of negative number",
                }
            ),
            Ok(value) => println!("{}", value),
        }
    }
*)
Definition op (x : f64.t) (y : f64.t) : M unit :=
  let* x := M.alloc x in
  let* y := M.alloc y in
  let* α0 : f64.t := M.read x in
  let* α1 : f64.t := M.read y in
  let* α2 :
      core.result.Result.t
        f64.t
        result_chaining_with_question_mark.checked.MathError.t :=
    M.call (result_chaining_with_question_mark.checked.op_ α0 α1) in
  let* α3 : M.Val unit :=
    match_operator
      α2
      [
        fun α =>
          match α with
          | core.result.Result.Err why =>
            let* why := M.alloc why in
            let* α0 : result_chaining_with_question_mark.checked.MathError.t :=
              M.read why in
            let* α1 : M.Val (ref str.t) :=
              match_operator
                α0
                [
                  fun α =>
                    match α with
                    |
                        result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                        =>
                      M.pure (mk_str "logarithm of non-positive number")
                    | _ => M.break_match
                    end :
                    M (M.Val (ref str.t));
                  fun α =>
                    match α with
                    |
                        result_chaining_with_question_mark.checked.MathError.DivisionByZero
                        =>
                      let* α0 : ref str.t :=
                        M.read (mk_str "division by zero") in
                      M.alloc α0
                    | _ => M.break_match
                    end :
                    M (M.Val (ref str.t));
                  fun α =>
                    match α with
                    |
                        result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                        =>
                      let* α0 : ref str.t :=
                        M.read (mk_str "square root of negative number") in
                      M.alloc α0
                    | _ => M.break_match
                    end :
                    M (M.Val (ref str.t))
                ] in
            let* α2 : never.t :=
              M.call (core.panicking.panic_display (borrow α1)) in
            let* α3 : unit := never_to_any α2 in
            M.alloc α3
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | core.result.Result.Ok value =>
            let* value := M.alloc value in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "") in
              let* α1 : ref str.t := M.read (mk_str "
") in
              let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
              let* α3 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α2) in
              let* α4 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α3) in
              let* α5 : core.fmt.rt.Argument.t :=
                M.call
                  (core.fmt.rt.Argument.t::["new_display"] (borrow value)) in
              let* α6 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α5 ] in
              let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α6) in
              let* α8 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α7) in
              let* α9 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
              let* α10 : unit := M.call (std.io.stdio._print α9) in
              M.alloc α10 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit)
      ] in
  M.read α3.

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* α0 : f64.t := M.read UnsupportedLiteral in
    let* α1 : f64.t := M.read UnsupportedLiteral in
    let* α2 : unit :=
      M.call (result_chaining_with_question_mark.checked.op α0 α1) in
    M.alloc α2 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
