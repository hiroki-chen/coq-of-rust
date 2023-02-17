(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Error TyAlias.

Error Enum.

(* Impl [DoubleError] of trait [_crate.fmt.Debug]*)
Module ImplDoubleError.
  Definition
    fmt
    (self : static_ref Self)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    match self with
    | DoubleError.EmptyVec => _crate::fmt::ImplFormatter.write_str f "EmptyVec"
    | DoubleError.Parse (__self_0) =>
      _crate::fmt::ImplFormatter.debug_tuple_field1_finish f "Parse" __self_0
    end.
End ImplDoubleError.
(* End impl [DoubleError] *)

(* Impl [DoubleError] of trait [fmt.Display]*)
Module ImplDoubleError.
  Definition
    fmt
    (self : static_ref Self)
    (f : mut_ref fmt.Formatter)
    : fmt.Result :=
    match deref self with
    | DoubleError.EmptyVec =>
      write_fmt
        f
        (_crate::fmt::ImplArguments.new_v1
          ["please use a vector with at least one element"]
          [])
    | DoubleError.Parse () =>
      write_fmt
        f
        (_crate::fmt::ImplArguments.new_v1
          ["the provided string could not be parsed as int"]
          [])
    end.
End ImplDoubleError.
(* End impl [DoubleError] *)

(* Impl [DoubleError] of trait [error.Error]*)
Module ImplDoubleError.
  Definition source (self : static_ref Self) : Option :=
    match deref self with
    | DoubleError.EmptyVec => None
    | DoubleError.Parse (e) => Some e
    end.
End ImplDoubleError.
(* End impl [DoubleError] *)

(* Impl [DoubleError] of trait [From]*)
Module ImplDoubleError.
  Definition from (err : ParseIntError) : DoubleError :=
    DoubleError.Parse err.
End ImplDoubleError.
(* End impl [DoubleError] *)

Definition double_first (_ : unit) :=
  let first := match branch (ok_or (first vec) DoubleError.EmptyVec) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  let parsed := match branch (parse first) with
  | {| Break.0 := residual; |} => Return (from_residual residual)
  | {| Continue.0 := val; |} => val
  end in
  Ok (mul 2 parsed).

Definition print (_ : unit) :=
  match result with
  | Ok (n) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["The first doubled is ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display n]) ;;
    tt
  | Err (e) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Error: ";"\n"]
        [_crate::fmt::ImplArgumentV1.new_display e]) ;;
    tt ;;
    if let_if Some (source) := source e then
      _crate.io._print
        (_crate::fmt::ImplArguments.new_v1
          ["  Caused by: ";"\n"]
          [_crate::fmt::ImplArgumentV1.new_display source]) ;;
      tt ;;
      tt
    else
      tt
  end.

Definition main (_ : unit) :=
  let numbers := ComplexTypePath.into_vec ["42";"93";"18"] in
  let empty := _crate::vec::ImplVec.new tt in
  let strings := ComplexTypePath.into_vec ["tofu";"93";"18"] in
  print (double_first numbers) ;;
  print (double_first empty) ;;
  print (double_first strings) ;;
  tt.