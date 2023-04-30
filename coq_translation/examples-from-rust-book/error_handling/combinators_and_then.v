(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Food.
  Inductive t : Set :=
  | CordonBleu
  | Steak
  | Sushi.
End Food.
Definition Food := Food.t.

Module Impl__crate_fmt_Debug_for_Food.
  Definition Self := Food.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    match self with
    | Food.CordonBleu => _crate.fmt.Formatter::["write_str"] f "CordonBleu"
    | Food.Steak => _crate.fmt.Formatter::["write_str"] f "Steak"
    | Food.Sushi => _crate.fmt.Formatter::["write_str"] f "Sushi"
    end.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Food.

Module Day.
  Inductive t : Set :=
  | Monday
  | Tuesday
  | Wednesday.
End Day.
Definition Day := Day.t.

Module Impl__crate_fmt_Debug_for_Day.
  Definition Self := Day.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    match self with
    | Day.Monday => _crate.fmt.Formatter::["write_str"] f "Monday"
    | Day.Tuesday => _crate.fmt.Formatter::["write_str"] f "Tuesday"
    | Day.Wednesday => _crate.fmt.Formatter::["write_str"] f "Wednesday"
    end.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Day.

Definition have_ingredients (food : Food) : Option Food :=
  match food with
  | Food.Sushi => None
  | _ => Some food
  end.

Definition have_recipe (food : Food) : Option Food :=
  match food with
  | Food.CordonBleu => None
  | _ => Some food
  end.

Definition cookable_v1 (food : Food) : Option Food :=
  match have_recipe food with
  | None => None
  | Some food =>
    match have_ingredients food with
    | None => None
    | Some food => Some food
    end
  end.

Definition cookable_v2 (food : Food) : Option Food :=
  (have_recipe food).["and_then"] have_ingredients.

Definition eat (food : Food) (day : Day) : unit :=
  match cookable_v2 food with
  | Some food =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Yay! On "; " we get to eat "; ".
" ]
        [
          _crate.fmt.ArgumentV1::["new_debug"] day;
          _crate.fmt.ArgumentV1::["new_debug"] food
        ]) ;;
    tt
  | None =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Oh no. We don't get to eat on "; "?
" ]
        [ _crate.fmt.ArgumentV1::["new_debug"] day ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  let '(cordon_bleu, steak, sushi) :=
    (Food.CordonBleu, Food.Steak, Food.Sushi) in
  eat cordon_bleu Day.Monday ;;
  eat steak Day.Tuesday ;;
  eat sushi Day.Wednesday ;;
  tt.
