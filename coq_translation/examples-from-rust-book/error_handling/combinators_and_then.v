(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Error Enum.

(* Impl [Food] of trait [_crate.fmt.Debug]*)
Module ImplFood.
  Definition
    fmt
    (self : static_ref Self)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    match self with
    | Food.CordonBleu => _crate::fmt::ImplFormatter.write_str f "CordonBleu"
    | Food.Steak => _crate::fmt::ImplFormatter.write_str f "Steak"
    | Food.Sushi => _crate::fmt::ImplFormatter.write_str f "Sushi"
    end.
End ImplFood.
(* End impl [Food] *)

Error Enum.

(* Impl [Day] of trait [_crate.fmt.Debug]*)
Module ImplDay.
  Definition
    fmt
    (self : static_ref Self)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    match self with
    | Day.Monday => _crate::fmt::ImplFormatter.write_str f "Monday"
    | Day.Tuesday => _crate::fmt::ImplFormatter.write_str f "Tuesday"
    | Day.Wednesday => _crate::fmt::ImplFormatter.write_str f "Wednesday"
    end.
End ImplDay.
(* End impl [Day] *)

Definition have_ingredients (_ : unit) :=
  match food with
  | Food.Sushi => None
  | _ => Some food
  end.

Definition have_recipe (_ : unit) :=
  match food with
  | Food.CordonBleu => None
  | _ => Some food
  end.

Definition cookable_v1 (_ : unit) :=
  match have_recipe food with
  | None => None
  | Some (food) =>
    match have_ingredients food with
    | None => None
    | Some (food) => Some food
    end
  end.

Definition cookable_v2 (_ : unit) :=
  and_then (have_recipe food) have_ingredients.

Definition eat (_ : unit) :=
  match cookable_v2 food with
  | Some (food) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Yay! On ";" we get to eat ";".\n"]
        [_crate::fmt::ImplArgumentV1.new_debug
          day;_crate::fmt::ImplArgumentV1.new_debug food]) ;;
    tt
  | None =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["Oh no. We don't get to eat on ";"?\n"]
        [_crate::fmt::ImplArgumentV1.new_debug day]) ;;
    tt
  end.

Definition main (_ : unit) :=
  let (cordon_bleu, steak, sushi) := (Food.CordonBleu, Food.Steak, Food.Sushi) in
  eat cordon_bleu Day.Monday ;;
  eat steak Day.Tuesday ;;
  eat sushi Day.Wednesday ;;
  tt.