(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

Definition u8 : Set := Z.

(* Approximation *)
Definition f64 : Set := Z.

Class Person : Set := {
  name : static_ref Self -> String;
}.

Class Student : Set := {
  university : static_ref Self -> String;
}.

Class Programmer : Set := {
  fav_language : static_ref Self -> String;
}.

Class CompSciStudent : Set := {
  git_username : static_ref Self -> String;
}.

Definition comp_sci_student_greeting (_ : unit) :=
  let res := _crate.fmt.format
    (_crate::fmt::ImplArguments.new_v1
      ["My name is ";" and I attend ";". My favorite language is ";". My Git username is "]
      [_crate::fmt::ImplArgumentV1.new_display
        (name student);_crate::fmt::ImplArgumentV1.new_display
        (university student);_crate::fmt::ImplArgumentV1.new_display
        (fav_language student);_crate::fmt::ImplArgumentV1.new_display
        (git_username student)]) in
  res.

Definition main (_ : unit) :=
  tt.