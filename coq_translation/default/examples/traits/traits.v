(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Sheep.
  Section Sheep.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      naked : bool;
      name : ref str;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_naked : Notation.Dot "naked" := {
      Notation.dot x := let* x := M.read x in Pure x.(naked) : M _;
    }.
    Global Instance Get_AF_naked : Notation.DoubleColon t "naked" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(naked) : M _;
    }.
    Global Instance Get_name : Notation.Dot "name" := {
      Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
    }.
  End Sheep.
End Sheep.
Definition Sheep `{ℋ : State.Trait} : Set := M.val Sheep.t.

Module Animal.
  Section Animal.
    Context `{ℋ : State.Trait}.
    
    Class Trait (Self : Set) : Type := {
      new : (ref str) -> M Self;
      name : (ref Self) -> M (ref str);
      noise : (ref Self) -> M (ref str);
    }.
    
  End Animal.
End Animal.

Module Impl_traits_Sheep.
  Section Impl_traits_Sheep.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := traits.Sheep.
    
    Definition is_naked (self : ref Self) : M bool :=
      let* α0 := deref self traits.Sheep in
      α0.["naked"].
    
    Global Instance AssociatedFunction_is_naked :
      Notation.DoubleColon Self "is_naked" := {
      Notation.double_colon := is_naked;
    }.
  End Impl_traits_Sheep.
End Impl_traits_Sheep.

Module Impl_traits_Animal_for_traits_Sheep.
  Section Impl_traits_Animal_for_traits_Sheep.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := traits.Sheep.
    
    Definition new (name : ref str) : M traits.Sheep :=
      let* α0 := M.alloc false in
      M.alloc {| traits.Sheep.name := name; traits.Sheep.naked := α0; |}.
    
    Global Instance AssociatedFunction_new :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
    
    Definition name (self : ref Self) : M (ref str) :=
      let* α0 := deref self traits.Sheep in
      α0.["name"].
    
    Global Instance AssociatedFunction_name :
      Notation.DoubleColon Self "name" := {
      Notation.double_colon := name;
    }.
    
    Definition noise (self : ref Self) : M (ref str) :=
      let* α0 := deref self traits.Sheep in
      let* α1 := borrow α0 traits.Sheep in
      let* α2 := traits.Sheep::["is_naked"] α1 in
      let* α3 := use α2 in
      if (α3 : bool) then
        Pure (mk_str "baaaaah?")
      else
        Pure (mk_str "baaaaah!").
    
    Global Instance AssociatedFunction_noise :
      Notation.DoubleColon Self "noise" := {
      Notation.double_colon := noise;
    }.
    
    Definition talk (self : ref Self) : M unit :=
      let* _ :=
        let* _ :=
          let* α0 :=
            borrow
              [ mk_str ""; mk_str " pauses briefly... "; mk_str "
" ]
              (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := deref self traits.Sheep in
          let* α5 := α4.["name"] in
          let* α6 := borrow α5 (ref str) in
          let* α7 := deref α6 (ref str) in
          let* α8 := borrow α7 (ref str) in
          let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
          let* α10 := deref self traits.Sheep in
          let* α11 := borrow α10 traits.Sheep in
          let* α12 :=
            (traits.Animal.noise
                (Self := traits.Sheep)
                (Trait := ltac:(refine _)))
              α11 in
          let* α13 := borrow α12 (ref str) in
          let* α14 := deref α13 (ref str) in
          let* α15 := borrow α14 (ref str) in
          let* α16 := core.fmt.rt.Argument::["new_display"] α15 in
          let* α17 := borrow [ α9; α16 ] (list core.fmt.rt.Argument) in
          let* α18 := deref α17 (list core.fmt.rt.Argument) in
          let* α19 := borrow α18 (list core.fmt.rt.Argument) in
          let* α20 := pointer_coercion "Unsize" α19 in
          let* α21 := core.fmt.Arguments::["new_v1"] α3 α20 in
          std.io.stdio._print α21 in
        M.alloc tt in
      M.alloc tt.
    
    Global Instance AssociatedFunction_talk :
      Notation.DoubleColon Self "talk" := {
      Notation.double_colon := talk;
    }.
    
    Global Instance ℐ : traits.Animal.Required.Trait Self := {
      traits.Animal.new := new;
      traits.Animal.name := name;
      traits.Animal.noise := noise;
      traits.Animal.talk := Datatypes.Some talk;
    }.
  End Impl_traits_Animal_for_traits_Sheep.
End Impl_traits_Animal_for_traits_Sheep.

Module Impl_traits_Sheep_2.
  Section Impl_traits_Sheep_2.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := traits.Sheep.
    
    Definition shear (self : mut_ref Self) : M unit :=
      let* α0 := deref self traits.Sheep in
      let* α1 := borrow α0 traits.Sheep in
      let* α2 := traits.Sheep::["is_naked"] α1 in
      let* α3 := use α2 in
      if (α3 : bool) then
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow
                [ mk_str ""; mk_str " is already naked...
" ]
                (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := deref self traits.Sheep in
            let* α5 := borrow α4 traits.Sheep in
            let* α6 :=
              (traits.Animal.name
                  (Self := traits.Sheep)
                  (Trait := ltac:(refine _)))
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
        M.alloc tt
      else
        let* _ :=
          let* _ :=
            let* α0 :=
              borrow
                [ mk_str ""; mk_str " gets a haircut!
" ]
                (list (ref str)) in
            let* α1 := deref α0 (list (ref str)) in
            let* α2 := borrow α1 (list (ref str)) in
            let* α3 := pointer_coercion "Unsize" α2 in
            let* α4 := deref self traits.Sheep in
            let* α5 := α4.["name"] in
            let* α6 := borrow α5 (ref str) in
            let* α7 := deref α6 (ref str) in
            let* α8 := borrow α7 (ref str) in
            let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
            let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
            let* α11 := deref α10 (list core.fmt.rt.Argument) in
            let* α12 := borrow α11 (list core.fmt.rt.Argument) in
            let* α13 := pointer_coercion "Unsize" α12 in
            let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
            std.io.stdio._print α14 in
          M.alloc tt in
        let* _ :=
          let* α0 := deref self traits.Sheep in
          let* α1 := α0.["naked"] in
          let* α2 := M.alloc true in
          assign α1 α2 in
        M.alloc tt.
    
    Global Instance AssociatedFunction_shear :
      Notation.DoubleColon Self "shear" := {
      Notation.double_colon := shear;
    }.
  End Impl_traits_Sheep_2.
End Impl_traits_Sheep_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* dolly :=
    (traits.Animal.new (Self := traits.Sheep) (Trait := ltac:(refine _)))
      (mk_str "Dolly") in
  let* _ :=
    let* α0 := borrow dolly traits.Sheep in
    (traits.Animal.talk (Self := traits.Sheep) (Trait := ltac:(refine _))) α0 in
  let* _ :=
    let* α0 := borrow_mut dolly traits.Sheep in
    traits.Sheep::["shear"] α0 in
  let* _ :=
    let* α0 := borrow dolly traits.Sheep in
    (traits.Animal.talk (Self := traits.Sheep) (Trait := ltac:(refine _))) α0 in
  M.alloc tt.
