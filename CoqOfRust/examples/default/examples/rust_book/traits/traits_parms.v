(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module Foo.
  
End Foo.

(* Trait *)
Module Bar.
  
End Bar.

(* Trait *)
Module Tar.
  
End Tar.

(* Trait *)
Module SomeTrait.
  
End SomeTrait.

(* StructTuple
  {
    name := "SomeOtherType";
    ty_params := [];
    fields := [ Ty.path "u32" ];
  } *)

Module Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Axiom Implements :
    M.IsTraitInstance
      "traits_parms::Foo"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_traits_parms_Foo_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Axiom Implements :
    M.IsTraitInstance
      "traits_parms::Bar"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_traits_parms_Bar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  Axiom Implements :
    M.IsTraitInstance
      "traits_parms::Tar"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_traits_parms_Tar_for_traits_parms_SomeOtherType.

Module Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
  Definition Self : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  (*
      type SomeType = SomeOtherType;
  *)
  Definition SomeType : Ty.t := Ty.path "traits_parms::SomeOtherType".
  
  (*
      fn some_fn() {}
  *)
  Definition some_fn (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "traits_parms::SomeTrait"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("SomeType", InstanceField.Ty SomeType);
          ("some_fn", InstanceField.Method some_fn)
        ].
End Impl_traits_parms_SomeTrait_for_traits_parms_SomeOtherType.
