(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Flip.
Section Flip.
  Class Trait (Self : Set) : Type := {
    flip : (mut_ref ltac:(Self)) -> M unit;
    get : (ref ltac:(Self)) -> M bool.t;
  }.
  
End Flip.
End Flip.

Module  Flipper.
Section Flipper.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Flipper.
End Flipper.

Module  Impl_trait_flipper_Flipper_t.
Section Impl_trait_flipper_Flipper_t.
  Ltac Self := exact trait_flipper.Flipper.t.
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Parameter new : M ltac:(Self).
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
End Impl_trait_flipper_Flipper_t.
End Impl_trait_flipper_Flipper_t.

Module  Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
Section Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
  Ltac Self := exact trait_flipper.Flipper.t.
  
  (*
      fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Parameter flip : (mut_ref ltac:(Self)) -> M unit.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon ltac:(Self) "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      fn get(&self) -> bool {
          self.value
      }
  *)
  Parameter get : (ref ltac:(Self)) -> M bool.t.
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
  
  Global Instance ℐ : trait_flipper.Flip.Trait ltac:(Self) := {
    trait_flipper.Flip.flip := flip;
    trait_flipper.Flip.get := get;
  }.
End Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
End Impl_trait_flipper_Flip_for_trait_flipper_Flipper_t.
