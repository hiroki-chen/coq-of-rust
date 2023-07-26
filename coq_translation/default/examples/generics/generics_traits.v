(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Empty.
  Inductive t : Set :=
  Build.
End Empty.
Definition Empty := Empty.t.

Module Null.
  Inductive t : Set :=
  Build.
End Null.
Definition Null := Null.t.

Module DoubleDrop.
  Class Trait (Self : Set) {T : Set} : Set := {
    double_drop `{H : State.Trait} : Self -> T -> (M (H := H) unit);
  }.
  
  Global Instance Method_double_drop `{H : State.Trait} `(Trait)
    : Notation.Dot "double_drop" := {
    Notation.dot := double_drop;
  }.
End DoubleDrop.

Module Impl_generics_traits_DoubleDrop_for_U.
Section Impl_generics_traits_DoubleDrop_for_U.
  Context {T U : Set}.
  
  Definition Self := U.
  
  Definition double_drop
      `{H : State.Trait}
      (self : Self)
      (Pattern : T)
      : M (H := H) unit :=
    Pure tt.
  
  Global Instance Method_double_drop `{H : State.Trait} :
    Notation.Dot "double_drop" := {
    Notation.dot := double_drop;
  }.
  
  Global Instance I : generics_traits.DoubleDrop.Trait Self (T := T) := {
    generics_traits.DoubleDrop.double_drop `{H : State.Trait} := double_drop;
  }.
End Impl_generics_traits_DoubleDrop_for_U.
End Impl_generics_traits_DoubleDrop_for_U.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let empty := generics_traits.Empty.Build in
  let null := generics_traits.Null.Build in
  let* _ := empty.["double_drop"] null in
  Pure tt.
