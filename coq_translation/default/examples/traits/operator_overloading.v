(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set := Build.
End Foo.
Definition Foo := @Foo.t.

Module Bar.
  Inductive t : Set := Build.
End Bar.
Definition Bar := @Bar.t.

Module FooBar.
  Inductive t : Set := Build.
End FooBar.
Definition FooBar := @FooBar.t.

Module Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self := operator_overloading.FooBar.
  
  Definition fmt
      `{H' : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H') core.fmt.Result :=
    core.fmt.Formatter::["write_str"] f "FooBar".
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.

Module BarFoo.
  Inductive t : Set := Build.
End BarFoo.
Definition BarFoo := @BarFoo.t.

Module Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self := operator_overloading.BarFoo.
  
  Definition fmt
      `{H' : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H') core.fmt.Result :=
    core.fmt.Formatter::["write_str"] f "BarFoo".
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Foo.
  Definition Self := operator_overloading.Foo.
  
  Definition Output : Set := operator_overloading.FooBar.
  
  Definition add
      `{H' : State.Trait}
      (self : Self)
      (_rhs : operator_overloading.Bar)
      : M (H := H') operator_overloading.FooBar :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "> Foo.add(Bar) was called
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure operator_overloading.FooBar.Build.
  
  Global Instance Method_add `{H' : State.Trait} : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I
    : core.ops.arith.Add.Trait Self (Rhs := operator_overloading.Bar) := {
    core.ops.arith.Add.Output := Output;
    core.ops.arith.Add.add `{H' : State.Trait} := add;
  }.
  Global Hint Resolve I : core.
End Impl_core_ops_arith_Add_for_operator_overloading_Foo.

Module Impl_core_ops_arith_Add_for_operator_overloading_Bar.
  Definition Self := operator_overloading.Bar.
  
  Definition Output : Set := operator_overloading.BarFoo.
  
  Definition add
      `{H' : State.Trait}
      (self : Self)
      (_rhs : operator_overloading.Foo)
      : M (H := H') operator_overloading.BarFoo :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "> Bar.add(Foo) was called
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure operator_overloading.BarFoo.Build.
  
  Global Instance Method_add `{H' : State.Trait} : Notation.Dot "add" := {
    Notation.dot := add;
  }.
  
  Global Instance I
    : core.ops.arith.Add.Trait Self (Rhs := operator_overloading.Foo) := {
    core.ops.arith.Add.Output := Output;
    core.ops.arith.Add.add `{H' : State.Trait} := add;
  }.
  Global Hint Resolve I : core.
End Impl_core_ops_arith_Add_for_operator_overloading_Bar.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        operator_overloading.Foo.Build.["add"] operator_overloading.Bar.Build in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Foo + Bar = "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        operator_overloading.Bar.Build.["add"] operator_overloading.Foo.Build in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Bar + Foo = "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
