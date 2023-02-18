(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition main (_ : unit) :=
  fizzbuzz_to 100 ;;
  tt.

Definition is_divisible_by (_ : unit) :=
  if eq rhs 0 then
    Return false ;;
    tt
  else
    tt ;;
  eq (rem lhs rhs) 0.

Definition fizzbuzz (_ : unit) :=
  if is_divisible_by n 15 then
    _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["fizzbuzz\n"] []) ;;
    tt ;;
    tt
  else
    if is_divisible_by n 3 then
      _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["fizz\n"] []) ;;
      tt ;;
      tt
    else
      if is_divisible_by n 5 then
        _crate.io._print (_crate::fmt::ImplArguments.new_v1 ["buzz\n"] []) ;;
        tt ;;
        tt
      else
        _crate.io._print
          (_crate::fmt::ImplArguments.new_v1
            ["";"\n"]
            [_crate::fmt::ImplArgumentV1.new_display n]) ;;
        tt ;;
        tt.

Definition fizzbuzz_to (_ : unit) :=
  match into_iter (range_inclusive_new 1 n) with
  | iter =>
    loop match next iter with
    | {|  |} => Break
    | {| Some.0 := n; |} =>
      fizzbuzz n ;;
      tt
    end ;;
    tt from for
  end.