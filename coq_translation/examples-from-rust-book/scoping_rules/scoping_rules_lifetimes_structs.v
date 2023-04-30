(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Borrowed.
  Record t : Set := { _ : ref i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Borrowed.
Definition Borrowed := Borrowed.t.

Module Impl__crate_fmt_Debug_for_Borrowed.
  Definition Self := Borrowed.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field1_finish"] f "Borrowed" (self.[0]).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Borrowed.

Module NamedBorrowed.
  Record t : Set := {
    x : ref i32;
    y : ref i32;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End NamedBorrowed.
Definition NamedBorrowed : Set := NamedBorrowed.t.

Module Impl__crate_fmt_Debug_for_NamedBorrowed.
  Definition Self := NamedBorrowed.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_struct_field2_finish"]
      f
      "NamedBorrowed"
      "x"
      self.["x"]
      "y"
      self.["y"].
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_NamedBorrowed.

Module Either.
  Inductive t : Set :=
  | Num (_ : i32)
  | Ref (_ : ref i32).
End Either.
Definition Either := Either.t.

Module Impl__crate_fmt_Debug_for_Either.
  Definition Self := Either.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    match self with
    | Either.Num __self_0 =>
      _crate.fmt.Formatter::["debug_tuple_field1_finish"] f "Num" __self_0
    | Either.Ref __self_0 =>
      _crate.fmt.Formatter::["debug_tuple_field1_finish"] f "Ref" __self_0
    end.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Either.

Definition main (_ : unit) : unit :=
  let x := 18 in
  let y := 15 in
  let single := Borrowed.Build_t x in
  let double := {| NamedBorrowed.x := x; NamedBorrowed.y := y; |} in
  let reference := Either.Ref x in
  let number := Either.Num y in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "x is borrowed in "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] single ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "x and y are borrowed in "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] double ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "x is borrowed in "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] reference ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "y is *not* borrowed in "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] number ]) ;;
  tt ;;
  tt.
