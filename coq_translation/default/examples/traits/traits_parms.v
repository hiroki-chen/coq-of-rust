(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
  }.
  Global Set Primitive Projections.
End Foo.

Module Bar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
  }.
  Global Set Primitive Projections.
End Bar.

Module Tar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
  }.
  Global Set Primitive Projections.
End Tar.

Module SomeTrait.
  Class Trait
      (Self : Set)
      {SomeType : Set}
      `{traits_parms.Foo.Trait SomeType}
      `{traits_parms.Bar.Trait SomeType}
      `{traits_parms.Tar.Trait SomeType} :
      Set := {
    SomeType := SomeType;
    some_fn `{H : State.Trait} : (M (H := H) unit);
  }.
  
  Global Instance Method_SomeType `{H : State.Trait} `(Trait)
    : Notation.DoubleColonType Self "SomeType" := {
    Notation.double_colon_type := SomeType;
  }.
  Global Instance Method_some_fn `{H : State.Trait} `(Trait)
    : Notation.Dot "some_fn" := {
    Notation.dot := @some_fn;
  }.
End SomeTrait.

Module SomeOtherType.
  Unset Primitive Projections.
  Record t : Set := {
    _ : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End SomeOtherType.
Definition SomeOtherType := @SomeOtherType.t.

Module Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.
  Definition Self := traits_parms.SomeOtherType.
  
  Global Instance I : traits_parms.Foo.Trait Self :=
    traits_parms.Foo.Build_Trait _.
End Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.
  Definition Self := traits_parms.SomeOtherType.
  
  Global Instance I : traits_parms.Bar.Trait Self :=
    traits_parms.Bar.Build_Trait _.
End Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.
  Definition Self := traits_parms.SomeOtherType.
  
  Global Instance I : traits_parms.Tar.Trait Self :=
    traits_parms.Tar.Build_Trait _.
End Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
  Definition Self := traits_parms.SomeOtherType.
  
  Definition some_fn `{H : State.Trait} : M (H := H) unit := Pure tt.
  
  Global Instance AssociatedFunction_some_fn `{H : State.Trait} :
    Notation.DoubleColon Self "some_fn" := {
    Notation.double_colon := some_fn;
  }.
  
  Global Instance I : traits_parms.SomeTrait.Trait Self := {
    traits_parms.SomeTrait.some_fn `{H : State.Trait} := some_fn;
  }.
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
