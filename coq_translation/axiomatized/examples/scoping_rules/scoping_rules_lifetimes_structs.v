(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Borrowed.
  Unset Primitive Projections.
  Record t : Set := {
    _ : ref i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Borrowed.
Definition Borrowed := Borrowed.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Definition Self := scoping_rules_lifetimes_structs.Borrowed.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.

Module NamedBorrowed.
  Unset Primitive Projections.
  Record t : Set := {
    x : ref i32;
    y : ref i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End NamedBorrowed.
Definition NamedBorrowed : Set := NamedBorrowed.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Definition Self := scoping_rules_lifetimes_structs.NamedBorrowed.
  
  Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
    string -> StaticRef_i32 -> 
    string -> StaticRef_i32 -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field2_finish" := {
    Notation.double_colon := debug_struct_field2_finish; }.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.

Module Either.
  Inductive t : Set :=
  | Num (_ : i32)
  | Ref (_ : ref i32).
End Either.
Definition Either := Either.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
  Definition Self := scoping_rules_lifetimes_structs.Either.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{H : State.Trait}, M (H := H) unit.
