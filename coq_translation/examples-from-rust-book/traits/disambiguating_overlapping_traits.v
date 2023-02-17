(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Class UsernameWidget : Set := {
  get : static_ref Self -> String;
}.

Class AgeWidget : Set := {
  get : static_ref Self -> u8;
}.

Module Form.
  Record t : Set := {
    username : String;
    age : u8;
  }.
End Form.
Definition Form : Set := Form.t.

(* Impl [Form] of trait [UsernameWidget]*)
Module ImplForm.
  Definition get (self : static_ref Self) : String :=
    clone self.username.
End ImplForm.
(* End impl [Form] *)

(* Impl [Form] of trait [AgeWidget]*)
Module ImplForm.
  Definition get (self : static_ref Self) : u8 :=
    self.age.
End ImplForm.
(* End impl [Form] *)

Definition main (_ : unit) :=
  let form := {| Form.username := to_owned "rustacean"; Form.age := 28; |} in
  let username := UsernameWidget.get form in
  match (to_owned "rustacean", username) with
  | (left_val, right_val) =>
    if not (eq (deref left_val) (deref right_val)) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  let age := AgeWidget.get form in
  match (28, age) with
  | (left_val, right_val) =>
    if not (eq (deref left_val) (deref right_val)) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  tt.