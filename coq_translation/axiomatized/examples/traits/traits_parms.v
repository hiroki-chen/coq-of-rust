(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Foo.
Section Foo.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Foo.
End Foo.

Module  Bar.
Section Bar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Bar.
End Bar.

Module  Tar.
Section Tar.
  Unset Primitive Projections.
  Class Trait (Self : Set) : Type := {
  }.
  Global Set Primitive Projections.
End Tar.
End Tar.

Module  SomeTrait.
Section SomeTrait.
  Class Trait (Self : Set) : Type := {
    SomeType : Set;
    ℒ_0 :: traits_parms.Foo.Trait SomeType;
    ℒ_1 :: traits_parms.Bar.Trait SomeType;
    ℒ_2 :: traits_parms.Tar.Trait SomeType;
    some_fn : M unit;
  }.
  
  Global Instance Method_SomeType `(Trait) :
    Notation.DoubleColonType Self "SomeType" := {
    Notation.double_colon_type := SomeType;
  }.
End SomeTrait.
End SomeTrait.

Module  SomeOtherType.
Section SomeOtherType.
  Record t : Set := {
    x0 : u32.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End SomeOtherType.
End SomeOtherType.

Module  Impl_traits_parms_Foo_for_traits_parms_SomeOtherType_t.
Section Impl_traits_parms_Foo_for_traits_parms_SomeOtherType_t.
  Ltac Self := exact traits_parms.SomeOtherType.t.
  
  Global Instance ℐ : traits_parms.Foo.Trait ltac:(Self) := {
  }.
End Impl_traits_parms_Foo_for_traits_parms_SomeOtherType_t.
End Impl_traits_parms_Foo_for_traits_parms_SomeOtherType_t.

Module  Impl_traits_parms_Bar_for_traits_parms_SomeOtherType_t.
Section Impl_traits_parms_Bar_for_traits_parms_SomeOtherType_t.
  Ltac Self := exact traits_parms.SomeOtherType.t.
  
  Global Instance ℐ : traits_parms.Bar.Trait ltac:(Self) := {
  }.
End Impl_traits_parms_Bar_for_traits_parms_SomeOtherType_t.
End Impl_traits_parms_Bar_for_traits_parms_SomeOtherType_t.

Module  Impl_traits_parms_Tar_for_traits_parms_SomeOtherType_t.
Section Impl_traits_parms_Tar_for_traits_parms_SomeOtherType_t.
  Ltac Self := exact traits_parms.SomeOtherType.t.
  
  Global Instance ℐ : traits_parms.Tar.Trait ltac:(Self) := {
  }.
End Impl_traits_parms_Tar_for_traits_parms_SomeOtherType_t.
End Impl_traits_parms_Tar_for_traits_parms_SomeOtherType_t.

Module  Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
Section Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
  Ltac Self := exact traits_parms.SomeOtherType.t.
  
  Definition SomeType : Set := traits_parms.SomeOtherType.t.
  
  Parameter some_fn : M (M.Val unit).
  
  Global Instance AssociatedFunction_some_fn :
    Notation.DoubleColon ltac:(Self) "some_fn" := {
    Notation.double_colon := some_fn;
  }.
  
  Global Instance ℐ : traits_parms.SomeTrait.Trait ltac:(Self) := {
    traits_parms.SomeTrait.SomeType := SomeType;
    traits_parms.SomeTrait.some_fn := some_fn;
  }.
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
