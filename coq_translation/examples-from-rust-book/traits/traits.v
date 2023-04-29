(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Sheep.
  Record t : Set := {
    naked : bool;
    name : ref str;
  }.
  
  Global Instance Get_naked : Notation.Dot "naked" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_name : Notation.Dot "name" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Sheep.
Definition Sheep : Set := Sheep.t.

Module Animal.
  Class Trait (Self : Set) : Set := {
    new : (ref str) -> Self;
    name : (ref Self) -> (ref str);
    noise : (ref Self) -> (ref str);
  }.
  
  Global Instance Method_new `(Trait) : Notation.Dot "new" := {
    Notation.dot := new;
  }.
  Global Instance Method_name `(Trait) : Notation.Dot "name" := {
    Notation.dot := name;
  }.
  Global Instance Method_noise `(Trait) : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  Global Instance Method_talk `(Trait) : Notation.Dot "talk" := {
    Notation.dot (self : ref Self) :=
      (_crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ ""; " says "; "
" ]
          [
            _crate.fmt.ArgumentV1::["new_display"] self.["name"];
            _crate.fmt.ArgumentV1::["new_display"] self.["noise"]
          ]) ;;
      tt ;;
      tt
      : unit);
  }.
End Animal.

Module ImplSheep.
  Definition Self := Sheep.
  
  Definition is_naked (self : ref Self) : bool := self.["naked"].
  
  Global Instance Method_is_naked : Notation.Dot "is_naked" := {
    Notation.dot := is_naked;
  }.
End ImplSheep.

Module Impl_Animal_for_Sheep.
  Definition Self := Sheep.
  
  Definition new (name : ref str) : Sheep :=
    {| Sheep.name := name; Sheep.naked := false; |}.
  
  Global Instance AssociatedFunction_new : Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Definition name (self : ref Self) : ref str := self.["name"].
  
  Global Instance Method_name : Notation.Dot "name" := {
    Notation.dot := name;
  }.
  
  Definition noise (self : ref Self) : ref str :=
    if (self.["is_naked"] : bool) then
      "baaaaah?"
    else
      "baaaaah!".
  
  Global Instance Method_noise : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  
  Definition talk (self : ref Self) :=
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ ""; " pauses briefly... "; "
" ]
        [
          _crate.fmt.ArgumentV1::["new_display"] self.["name"];
          _crate.fmt.ArgumentV1::["new_display"] self.["noise"]
        ]) ;;
    tt ;;
    tt.
  
  Global Instance Method_talk : Notation.Dot "talk" := {
    Notation.dot := talk;
  }.
  
  Global Instance I : Animal.Trait Self := {
    Animal.new := new;
    Animal.name := name;
    Animal.noise := noise;
  }.
End Impl_Animal_for_Sheep.

Module ImplSheep_2.
  Definition Self := Sheep.
  
  Definition shear (self : mut_ref Self) :=
    if (self.["is_naked"] : bool) then
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ ""; " is already naked...
" ]
          [ _crate.fmt.ArgumentV1::["new_display"] self.["name"] ]) ;;
      tt ;;
      tt
    else
      _crate.io._print
        (_crate.fmt.Arguments::["new_v1"]
          [ ""; " gets a haircut!
" ]
          [ _crate.fmt.ArgumentV1::["new_display"] self.["name"] ]) ;;
      tt ;;
      assign self.["naked"] true ;;
      tt.
  
  Global Instance Method_shear : Notation.Dot "shear" := {
    Notation.dot := shear;
  }.
End ImplSheep_2.

Definition main (_ : unit) : unit :=
  let dolly := ((Animal.new "Dolly") : Sheep) in
  dolly.["talk"] ;;
  dolly.["shear"] ;;
  dolly.["talk"] ;;
  tt.
