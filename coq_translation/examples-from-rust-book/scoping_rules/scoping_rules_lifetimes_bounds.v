(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Debug := std.fmt.Debug.

Module Ref.
  Inductive t : Set := Build (_ : ref T).
  
  Global Instance Get_0 : IndexedField.Class t 0 _ := {|
    IndexedField.get '(Build x0) := x0;
  |}.
End Ref.
Definition Ref := Ref.t.

Module Impl__crate_fmt_Debug_for_Ref.
  Definition Self := Ref.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "Ref"
      (IndexedField.get (index := 0) self).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {|
    Notation.dot := fmt;
  |}.
  
  Global Instance I 'a T : _crate.fmt.Debug.Trait Self := {|
    _crate.fmt.Debug.fmt := fmt;
  |}.
End Impl__crate_fmt_Debug_for_Ref.

Definition print {T : Set} `{Debug.Trait T} (t : T) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "`print`: t is "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] t ]) ;;
  tt ;;
  tt.

Definition print_ref {T : Set} `{Debug.Trait T} (t : ref T) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "`print_ref`: t is "; "\n" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] t ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let x := 7 in
  let ref_x := Ref.Build x in
  print_ref ref_x ;;
  print ref_x ;;
  tt.
