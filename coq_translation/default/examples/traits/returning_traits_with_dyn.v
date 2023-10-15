(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Sheep.
  Unset Primitive Projections.
  Record t : Set := { }.
  Global Set Primitive Projections.
End Sheep.
Definition Sheep : Set := Sheep.t.

Module Cow.
  Unset Primitive Projections.
  Record t : Set := { }.
  Global Set Primitive Projections.
End Cow.
Definition Cow : Set := Cow.t.

Module Animal.
  Class Trait (Self : Set) : Type := {
    noise `{H' : State.Trait} : (ref Self) -> M (H := H') (ref str);
  }.
  
  Global Instance Method_noise `{H' : State.Trait} `(Trait)
    : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
End Animal.

Module
  Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.
  Definition Self := returning_traits_with_dyn.Sheep.
  
  Definition noise
      `{H' : State.Trait}
      (self : ref Self)
      : M (H := H') (ref str) :=
    Pure "baaaaah!".
  
  Global Instance Method_noise `{H' : State.Trait} : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  
  Global Instance I : returning_traits_with_dyn.Animal.Trait Self := {
    returning_traits_with_dyn.Animal.noise `{H' : State.Trait} := noise;
  }.
  Global Hint Resolve I : core.
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Sheep.

Module Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.
  Definition Self := returning_traits_with_dyn.Cow.
  
  Definition noise
      `{H' : State.Trait}
      (self : ref Self)
      : M (H := H') (ref str) :=
    Pure "moooooo!".
  
  Global Instance Method_noise `{H' : State.Trait} : Notation.Dot "noise" := {
    Notation.dot := noise;
  }.
  
  Global Instance I : returning_traits_with_dyn.Animal.Trait Self := {
    returning_traits_with_dyn.Animal.noise `{H' : State.Trait} := noise;
  }.
  Global Hint Resolve I : core.
End Impl_returning_traits_with_dyn_Animal_for_returning_traits_with_dyn_Cow.

Definition random_animal
    `{H' : State.Trait}
    (random_number : f64)
    : M (H := H') (alloc.boxed.Box _ (* dyn *) alloc.boxed.Box.Default.A) :=
  let* α0 := lt random_number 1 (* 0.5 *) in
  let* α1 := use α0 in
  let* α2 :=
    if (α1 : bool) then
      let* α0 :=
        (alloc.boxed.Box _ alloc.alloc.Global)::["new"]
          (returning_traits_with_dyn.Sheep.Build_t tt) in
      let* α0 := pointer_coercion "Unsize" α0 in
      pointer_coercion "Unsize" α0
    else
      let* α0 :=
        (alloc.boxed.Box _ alloc.alloc.Global)::["new"]
          (returning_traits_with_dyn.Cow.Build_t tt) in
      pointer_coercion "Unsize" α0 in
  let* α0 := pointer_coercion "Unsize" α2 in
  pointer_coercion "Unsize" α0.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let random_number := 0 (* 0.234 *) in
  let* animal := returning_traits_with_dyn.random_animal random_number in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ "You've randomly chosen an animal, and it says "; "
" ] in
      let* α1 := deref α0 in
      let* α2 := borrow α1 in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref animal in
      let* α5 := borrow α4 in
      let* α6 := returning_traits_with_dyn.Animal.noise α5 in
      let* α7 := borrow α6 in
      let* α8 := deref α7 in
      let* α9 := borrow α8 in
      let* α10 := core.fmt.rt.Argument::["new_display"] α9 in
      let* α11 := borrow [ α10 ] in
      let* α12 := deref α11 in
      let* α13 := borrow α12 in
      let* α14 := pointer_coercion "Unsize" α13 in
      let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
      std.io.stdio._print α15 in
    Pure tt in
  Pure tt.
