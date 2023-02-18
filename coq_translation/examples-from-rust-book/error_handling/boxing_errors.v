(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error TyAlias.

Error Struct.

(* Impl [EmptyVec] of trait [_crate.fmt.Debug]*)
Module ImplEmptyVec.
  Definition
    fmt
    (self : static_ref EmptyVec)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.write_str f "EmptyVec".
End ImplEmptyVec.
(* End impl [EmptyVec] *)

(* Impl [EmptyVec] of trait [_crate.clone.Clone]*)
Module ImplEmptyVec.
  Definition clone (self : static_ref EmptyVec) : EmptyVec :=
    EmptyVec.
End ImplEmptyVec.
(* End impl [EmptyVec] *)

(* Impl [EmptyVec] of trait [fmt.Display]*)
Module ImplEmptyVec.
  Definition
    fmt
    (self : static_ref EmptyVec)
    (f : mut_ref fmt.Formatter)
    : fmt.Result :=
    write_fmt
      f
      (_crate::fmt::ImplArguments.new_v1 ["invalid first item to double"] []).
End ImplEmptyVec.
(* End impl [EmptyVec] *)

(* Impl [EmptyVec] of trait [error.Error]*)
Module ImplEmptyVec.
  
End ImplEmptyVec.
(* End impl [EmptyVec] *)

Definition double_first (_ : unit) :=
  and_then
    (ok_or_else (first vec) (fun  => into EmptyVec))
    (fun s => map (map_err (parse s) (fun e => into e)) (fun i => mul 2 i)).

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