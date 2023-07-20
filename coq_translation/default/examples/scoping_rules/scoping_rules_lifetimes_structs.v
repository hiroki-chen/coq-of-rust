(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Borrowed.
  Record t : Set := { _ : ref i32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Borrowed.
Definition Borrowed := Borrowed.t.

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Definition Self := scoping_rules_lifetimes_structs.Borrowed.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_tuple_field1_finish"]
      f
      "Borrowed"
      (addr_of (addr_of (self.[0]))).
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.

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

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Definition Self := scoping_rules_lifetimes_structs.NamedBorrowed.
  
  Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
    string -> StaticRef_i32 -> 
    string -> StaticRef_i32 -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field2_finish" := {
    Notation.double_colon := debug_struct_field2_finish; }.
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    core.fmt.Formatter::["debug_struct_field2_finish"]
      f
      "NamedBorrowed"
      "x"
      (addr_of self.["x"])
      "y"
      (addr_of (addr_of self.["y"])).
  
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
  
  Definition fmt
      `{H : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H) core.fmt.Result :=
    match self with
    | scoping_rules_lifetimes_structs.Either.Num __self_0 =>
      core.fmt.Formatter::["debug_tuple_field1_finish"]
        f
        "Num"
        (addr_of __self_0)
    | scoping_rules_lifetimes_structs.Either.Ref __self_0 =>
      core.fmt.Formatter::["debug_tuple_field1_finish"]
        f
        "Ref"
        (addr_of __self_0)
    end.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let x := 18 in
  let y := 15 in
  let single := scoping_rules_lifetimes_structs.Borrowed.Build_t (addr_of x) in
  let double :=
    {|
      scoping_rules_lifetimes_structs.NamedBorrowed.x := addr_of x;
      scoping_rules_lifetimes_structs.NamedBorrowed.y := addr_of y;
    |} in
  let reference := scoping_rules_lifetimes_structs.Either.Ref (addr_of x) in
  let number := scoping_rules_lifetimes_structs.Either.Num y in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of single) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "x is borrowed in "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of double) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "x and y are borrowed in "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of reference) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "x is borrowed in "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of number) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "y is *not* borrowed in "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
