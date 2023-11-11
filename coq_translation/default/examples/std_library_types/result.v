(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  Module MathError.
    Inductive t : Set :=
    | DivisionByZero
    | NonPositiveLogarithm
    | NegativeSquareRoot.
  End MathError.
  Definition MathError : Set := M.Val MathError.t.
  
  Module  Impl_core_fmt_Debug_for_result_checked_MathError_t.
  Section Impl_core_fmt_Debug_for_result_checked_MathError_t.
    Ltac Self := exact result.checked.MathError.t.
    
    Definition fmt
        (self : M.Val (ref ltac:(Self)))
        (f : M.Val (mut_ref core.fmt.Formatter.t))
        : M (M.Val ltac:(core.fmt.Result)) :=
      M.function_body
        (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
        let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
          borrow_mut α0 in
        let* α2 := M.read self in
        let* α3 : ltac:(refine (M.Val (ref str))) :=
          match α2 with
          | result.checked.MathError.DivisionByZero  =>
            let* α0 : ltac:(refine (M.Val str)) :=
              deref (mk_str "DivisionByZero") in
            borrow α0
          | result.checked.MathError.NonPositiveLogarithm  =>
            let* α0 : ltac:(refine (M.Val str)) :=
              deref (mk_str "NonPositiveLogarithm") in
            borrow α0
          | result.checked.MathError.NegativeSquareRoot  =>
            let* α0 : ltac:(refine (M.Val str)) :=
              deref (mk_str "NegativeSquareRoot") in
            borrow α0
          end in
        core.fmt.Formatter.t::["write_str"] α1 α3).
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon ltac:(Self) "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
      core.fmt.Debug.fmt := fmt;
    }.
  End Impl_core_fmt_Debug_for_result_checked_MathError_t.
  End Impl_core_fmt_Debug_for_result_checked_MathError_t.
  
  Ltac MathResult :=
    exact (core.result.Result.t f64.t result.checked.MathError.t).
  
  Definition div
      (x : M.Val f64.t)
      (y : M.Val f64.t)
      : M (M.Val ltac:(result.checked.MathResult)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq y α0 in
      let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
      let* α3 := M.read α2 in
      if (α3 : bool) then
        let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
          M.alloc result.checked.MathError.DivisionByZero in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Err α1)
      else
        let* α0 : ltac:(refine (M.Val f64.t)) := BinOp.div x y in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Ok α1)).
  
  Definition sqrt
      (x : M.Val f64.t)
      : M (M.Val ltac:(result.checked.MathResult)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.lt x α0 in
      let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
      let* α3 := M.read α2 in
      if (α3 : bool) then
        let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
          M.alloc result.checked.MathError.NegativeSquareRoot in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Err α1)
      else
        let* α0 : ltac:(refine (M.Val f64.t)) := f64.t::["sqrt"] x in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Ok α1)).
  
  Definition ln
      (x : M.Val f64.t)
      : M (M.Val ltac:(result.checked.MathResult)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
      let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.le x α0 in
      let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
      let* α3 := M.read α2 in
      if (α3 : bool) then
        let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
          M.alloc result.checked.MathError.NonPositiveLogarithm in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Err α1)
      else
        let* α0 : ltac:(refine (M.Val f64.t)) := f64.t::["ln"] x in
        let* α1 := M.read α0 in
        M.alloc (core.result.Result.Ok α1)).
End checked.

Module MathError.
  Inductive t : Set :=
  | DivisionByZero
  | NonPositiveLogarithm
  | NegativeSquareRoot.
End MathError.
Definition MathError : Set := M.Val MathError.t.

Module  Impl_core_fmt_Debug_for_result_checked_MathError_t.
Section Impl_core_fmt_Debug_for_result_checked_MathError_t.
  Ltac Self := exact result.checked.MathError.t.
  
  Definition fmt
      (self : M.Val (ref ltac:(Self)))
      (f : M.Val (mut_ref core.fmt.Formatter.t))
      : M (M.Val ltac:(core.fmt.Result)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
      let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
        borrow_mut α0 in
      let* α2 := M.read self in
      let* α3 : ltac:(refine (M.Val (ref str))) :=
        match α2 with
        | result.checked.MathError.DivisionByZero  =>
          let* α0 : ltac:(refine (M.Val str)) :=
            deref (mk_str "DivisionByZero") in
          borrow α0
        | result.checked.MathError.NonPositiveLogarithm  =>
          let* α0 : ltac:(refine (M.Val str)) :=
            deref (mk_str "NonPositiveLogarithm") in
          borrow α0
        | result.checked.MathError.NegativeSquareRoot  =>
          let* α0 : ltac:(refine (M.Val str)) :=
            deref (mk_str "NegativeSquareRoot") in
          borrow α0
        end in
      core.fmt.Formatter.t::["write_str"] α1 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_result_checked_MathError_t.
End Impl_core_fmt_Debug_for_result_checked_MathError_t.

Ltac MathResult :=
  exact (core.result.Result.t f64.t result.checked.MathError.t).

Definition div
    (x : M.Val f64.t)
    (y : M.Val f64.t)
    : M (M.Val ltac:(result.checked.MathResult)) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.eq y α0 in
    let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
    let* α3 := M.read α2 in
    if (α3 : bool) then
      let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
        M.alloc result.checked.MathError.DivisionByZero in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Err α1)
    else
      let* α0 : ltac:(refine (M.Val f64.t)) := BinOp.div x y in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Ok α1)).

Definition sqrt
    (x : M.Val f64.t)
    : M (M.Val ltac:(result.checked.MathResult)) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.lt x α0 in
    let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
    let* α3 := M.read α2 in
    if (α3 : bool) then
      let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
        M.alloc result.checked.MathError.NegativeSquareRoot in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Err α1)
    else
      let* α0 : ltac:(refine (M.Val f64.t)) := f64.t::["sqrt"] x in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Ok α1)).

Definition ln (x : M.Val f64.t) : M (M.Val ltac:(result.checked.MathResult)) :=
  M.function_body
    (let* α0 : ltac:(refine (M.Val f64.t)) := M.alloc 0 (* 0.0 *) in
    let* α1 : ltac:(refine (M.Val bool.t)) := BinOp.le x α0 in
    let* α2 : ltac:(refine (M.Val bool.t)) := use α1 in
    let* α3 := M.read α2 in
    if (α3 : bool) then
      let* α0 : ltac:(refine (M.Val result.checked.MathError.t)) :=
        M.alloc result.checked.MathError.NonPositiveLogarithm in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Err α1)
    else
      let* α0 : ltac:(refine (M.Val f64.t)) := f64.t::["ln"] x in
      let* α1 := M.read α0 in
      M.alloc (core.result.Result.Ok α1)).

Definition op (x : M.Val f64.t) (y : M.Val f64.t) : M (M.Val f64.t) :=
  M.function_body
    (let* α0 :
        ltac:(refine
          (M.Val (core.result.Result.t f64.t result.checked.MathError.t))) :=
      result.checked.div x y in
    let* α1 := M.read α0 in
    match α1 with
    | core.result.Result.Err why =>
      let* why := M.alloc why in
      let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
        M.alloc [ mk_str "" ] in
      let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
        pointer_coercion "Unsize" α1 in
      let* α3 : ltac:(refine (M.Val (ref result.checked.MathError.t))) :=
        borrow why in
      let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
        core.fmt.rt.Argument.t::["new_debug"] α3 in
      let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
        M.alloc [ α4 ] in
      let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
        borrow α5 in
      let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
        pointer_coercion "Unsize" α6 in
      let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
        core.fmt.Arguments.t::["new_v1"] α2 α7 in
      let* α9 : ltac:(refine (M.Val never.t)) := core.panicking.panic_fmt α8 in
      never_to_any α9
    | core.result.Result.Ok ratio =>
      let* ratio := M.alloc ratio in
      let* α0 :
          ltac:(refine
            (M.Val (core.result.Result.t f64.t result.checked.MathError.t))) :=
        result.checked.ln ratio in
      let* α1 := M.read α0 in
      match α1 with
      | core.result.Result.Err why =>
        let* why := M.alloc why in
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref result.checked.MathError.t))) :=
          borrow why in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        let* α9 : ltac:(refine (M.Val never.t)) :=
          core.panicking.panic_fmt α8 in
        never_to_any α9
      | core.result.Result.Ok ln =>
        let* ln := M.alloc ln in
        let* α0 :
            ltac:(refine
              (M.Val
                (core.result.Result.t f64.t result.checked.MathError.t))) :=
          result.checked.sqrt ln in
        let* α1 := M.read α0 in
        match α1 with
        | core.result.Result.Err why =>
          let* why := M.alloc why in
          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
            M.alloc [ mk_str "" ] in
          let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
            borrow α0 in
          let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
            pointer_coercion "Unsize" α1 in
          let* α3 : ltac:(refine (M.Val (ref result.checked.MathError.t))) :=
            borrow why in
          let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
            core.fmt.rt.Argument.t::["new_debug"] α3 in
          let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
            M.alloc [ α4 ] in
          let* α6 :
              ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
            borrow α5 in
          let* α7 :
              ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
            pointer_coercion "Unsize" α6 in
          let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
            core.fmt.Arguments.t::["new_v1"] α2 α7 in
          let* α9 : ltac:(refine (M.Val never.t)) :=
            core.panicking.panic_fmt α8 in
          never_to_any α9
        | core.result.Result.Ok sqrt =>
          let* sqrt := M.alloc sqrt in
          M.pure sqrt
        end
      end
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str ""; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val f64.t)) := M.alloc 1 (* 1.0 *) in
        let* α4 : ltac:(refine (M.Val f64.t)) := M.alloc 10 (* 10.0 *) in
        let* α5 : ltac:(refine (M.Val f64.t)) := result.op α3 α4 in
        let* α6 : ltac:(refine (M.Val (ref f64.t))) := borrow α5 in
        let* α7 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α6 in
        let* α8 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α7 ] in
        let* α9 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α8 in
        let* α10 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α9 in
        let* α11 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α10 in
        std.io.stdio._print α11 in
      M.alloc tt in
    M.alloc tt).
