(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Sheep.
  Section Sheep.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := { }.
    Global Set Primitive Projections.
  End Sheep.
End Sheep.
Definition Sheep `{ℋ : State.Trait} : Set := M.val Sheep.t.

Module Cow.
  Section Cow.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := { }.
    Global Set Primitive Projections.
  End Cow.
End Cow.
Definition Cow `{ℋ : State.Trait} : Set := M.val Cow.t.

Module Animal.
  Section Animal.
    Context `{ℋ : State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      noise : (ref Self) -> M (ref str);
    }.
    
  End Animal.
End Animal.

Module
  Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
  Section
    Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := returning_traits_with_dyn.Sheep.
    
    Definition noise (self : ref Self) : M (ref str) :=
      Pure (mk_str "baaaaah!").
    
    Global Instance AssociatedFunction_noise :
      Notation.DoubleColon Self "noise" := {
      Notation.double_colon := noise;
    }.
    
    #[refine] Global Instance ℐ :
      returning_traits_with_dyn.Animal.Trait Self := {
      returning_traits_with_dyn.Animal.noise := noise;
    }.
    Admitted.
  End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
  Global Hint Resolve ℐ : core.
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
  Section
    Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := returning_traits_with_dyn.Cow.
    
    Definition noise (self : ref Self) : M (ref str) :=
      Pure (mk_str "moooooo!").
    
    Global Instance AssociatedFunction_noise :
      Notation.DoubleColon Self "noise" := {
      Notation.double_colon := noise;
    }.
    
    #[refine] Global Instance ℐ :
      returning_traits_with_dyn.Animal.Trait Self := {
      returning_traits_with_dyn.Animal.noise := noise;
    }.
    Admitted.
  End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
  Global Hint Resolve ℐ : core.
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.

Definition random_animal
    `{ℋ : State.Trait}
    (random_number : f64)
    : M (alloc.boxed.Box _ (* dyn *) alloc.boxed.Box.Default.A) :=
  let* α0 := M.alloc 1 (* 0.5 *) in
  let* α1 := BinOp.lt random_number α0 in
  let* α2 := use α1 in
  let* α3 :=
    if (α2 : bool) then
      let* α0 := M.alloc (returning_traits_with_dyn.Sheep.Build_t tt) in
      let* α1 :=
        (alloc.boxed.Box
              returning_traits_with_dyn.Sheep
              alloc.alloc.Global)::["new"]
          α0 in
      let* α0 := pointer_coercion "Unsize" α1 in
      pointer_coercion "Unsize" α0
    else
      let* α0 := M.alloc (returning_traits_with_dyn.Cow.Build_t tt) in
      let* α1 :=
        (alloc.boxed.Box
              returning_traits_with_dyn.Cow
              alloc.alloc.Global)::["new"]
          α0 in
      pointer_coercion "Unsize" α1 in
  let* α0 := pointer_coercion "Unsize" α3 in
  pointer_coercion "Unsize" α0.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* random_number := M.alloc 0 (* 0.234 *) in
  let* animal := returning_traits_with_dyn.random_animal random_number in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "You've randomly chosen an animal, and it says "; mk_str "
"
          ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref animal type not implemented in
      let* α5 := borrow α4 type not implemented in
      let* α6 :=
        (returning_traits_with_dyn.Animal.noise (Self := type not implemented))
          α5 in
      let* α7 := borrow α6 (ref str) in
      let* α8 := deref α7 (ref str) in
      let* α9 := borrow α8 (ref str) in
      let* α10 := core.fmt.rt.Argument::["new_display"] α9 in
      let* α11 := borrow [ α10 ] (list core.fmt.rt.Argument) in
      let* α12 := deref α11 (list core.fmt.rt.Argument) in
      let* α13 := borrow α12 (list core.fmt.rt.Argument) in
      let* α14 := pointer_coercion "Unsize" α13 in
      let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
      std.io.stdio._print α15 in
    M.alloc tt in
  M.alloc tt.
