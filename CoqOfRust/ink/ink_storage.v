(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.
Require CoqOfRust.ink.ink_storage_traits.

(* #[allow(dead_code)] - module was ignored by the compiler *)
Module lazy.
  Module mapping.
    Module Mapping.
      Section Mapping.
        Context {K V KeyType : Set}.
        Context
          `{ink_storage_traits.storage.Packed.Trait V}
          `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
        Unset Primitive Projections.
        Record t : Set := {
          _marker : core.marker.PhantomData ((K * V) * KeyType);
        }.
        Global Set Primitive Projections.
        
        Global Instance Get__marker : Notation.Dot "_marker" := {
          Notation.dot '(Build_t x0) := x0;
        }.
      End Mapping.
    End Mapping.
    Definition Mapping := @Mapping.t.
    Arguments Mapping {_} {_}.
  End mapping.
  
  Module Lazy.
    Section Lazy.
      Context {V KeyType : Set}.
      Context `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData (V * KeyType);
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End Lazy.
  End Lazy.
  Definition Lazy := @Lazy.t.
  Arguments Lazy {_}.
End lazy.

Module mapping.
  Module Mapping.
    Section Mapping.
      Context {K V KeyType : Set}.
      Context
        `{ink_storage_traits.storage.Packed.Trait V}
        `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
      Unset Primitive Projections.
      Record t : Set := {
        _marker : core.marker.PhantomData ((K * V) * KeyType);
      }.
      Global Set Primitive Projections.
      
      Global Instance Get__marker : Notation.Dot "_marker" := {
        Notation.dot '(Build_t x0) := x0;
      }.
    End Mapping.
  End Mapping.
  Definition Mapping := @Mapping.t.
  Arguments Mapping {_} {_}.
End mapping.

Module Mapping.
  Section Mapping.
    Context {K V KeyType : Set}.
    Context
      `{ink_storage_traits.storage.Packed.Trait V}
      `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData ((K * V) * KeyType);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Mapping.
End Mapping.
Definition Mapping := @Mapping.t.
Arguments Mapping {_} {_}.

Module Lazy.
  Section Lazy.
    Context {V KeyType : Set}.
    Context `{ink_storage_traits.storage.StorageKey.Trait KeyType}.
    Unset Primitive Projections.
    Record t : Set := {
      _marker : core.marker.PhantomData (V * KeyType);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get__marker : Notation.Dot "_marker" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Lazy.
End Lazy.
Definition Lazy := @Lazy.t.
Arguments Lazy {_}.
