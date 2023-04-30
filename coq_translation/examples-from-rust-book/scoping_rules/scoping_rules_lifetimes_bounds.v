(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Ref.
  Record t : Set := { _ : ref T;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Ref.
Definition Ref := Ref.t.

Module Impl__crate_fmt_Debug_for_Ref_T.
  Definition Self := Ref T.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref _crate.fmt.Formatter)
      : _crate.fmt.Result :=
    _crate.fmt.Formatter::["debug_tuple_field1_finish"] f "Ref" (self.[0]).
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I T : _crate.fmt.Debug.Trait Self := {
    _crate.fmt.Debug.fmt := fmt;
  }.
End Impl__crate_fmt_Debug_for_Ref_T.

Definition print {T : Set} `{Debug.Trait T} (t : T) : unit :=
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "`print`: t is "; "
" ]
      [ format_argument::["new_debug"] t ]) ;;
  tt ;;
  tt.

Definition print_ref {T : Set} `{Debug.Trait T} (t : ref T) : unit :=
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "`print_ref`: t is "; "
" ]
      [ format_argument::["new_debug"] t ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let x := 7 in
  let ref_x := Ref.Build_t x in
  print_ref ref_x ;;
  print ref_x ;;
  tt.
