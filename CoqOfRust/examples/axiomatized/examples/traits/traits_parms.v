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
    Notations.DoubleColonType Self "SomeType" := {
    Notations.double_colon_type := SomeType;
  }.
End SomeTrait.
End SomeTrait.

Module  SomeOtherType.
Section SomeOtherType.
  Record t : Set := {
    x0 : u32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
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
  
  (*
      type SomeType = SomeOtherType;
  *)
  Definition SomeType : Set := traits_parms.SomeOtherType.t.
  
  (*
      fn some_fn() {}
  *)
  Parameter some_fn : M unit.
  
  Global Instance AssociatedFunction_some_fn :
    Notations.DoubleColon ltac:(Self) "some_fn" := {
    Notations.double_colon := some_fn;
  }.
  
  Global Instance ℐ : traits_parms.SomeTrait.Trait ltac:(Self) := {
    traits_parms.SomeTrait.SomeType := SomeType;
    traits_parms.SomeTrait.some_fn := some_fn;
  }.
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType_t.
