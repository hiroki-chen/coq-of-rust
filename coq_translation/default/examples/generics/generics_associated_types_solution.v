(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Container.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    _ : i32;
    _ : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_1 : Notation.Dot 1 := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Container.
Definition Container := @Container.t.

Module Contains.
  Class Trait (Self : Set) : Type := {
    A : Set;
    B : Set;
    contains `{State.Trait} : (ref Self) -> (ref A) -> (ref B) -> M bool;
    first `{State.Trait} : (ref Self) -> M i32;
    last `{State.Trait} : (ref Self) -> M i32;
    a `{State.Trait} : (ref Self) -> M A;
  }.
  
  Global Instance Method_A `(Trait) : Notation.DoubleColonType Self "A" := {
    Notation.double_colon_type := A;
  }.
  Global Instance Method_B `(Trait) : Notation.DoubleColonType Self "B" := {
    Notation.double_colon_type := B;
  }.
  Global Instance Method_contains `{State.Trait} `(Trait)
    : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  Global Instance Method_first `{State.Trait} `(Trait)
    : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  Global Instance Method_last `{State.Trait} `(Trait) : Notation.Dot "last" := {
    Notation.dot := last;
  }.
  Global Instance Method_a `{State.Trait} `(Trait) : Notation.Dot "a" := {
    Notation.dot := a;
  }.
End Contains.

Module
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.
  Definition Self `{State.Trait} :=
    generics_associated_types_solution.Container.
  
  Definition A : Set := i32.
  
  Definition B : Set := i32.
  
  Definition contains
      `{State.Trait}
      (self : ref Self)
      (number_1 : ref i32)
      (number_2 : ref i32)
      : M bool :=
    let* α0 := deref self generics_associated_types_solution.Container in
    let* α1 := α0.["0"] in
    let* α2 := borrow α1 i32 in
    let* α3 := borrow α2 (ref i32) in
    let* α4 := borrow number_1 (ref i32) in
    let* α5 := core.cmp.PartialEq.eq α3 α4 in
    let* α6 := deref self generics_associated_types_solution.Container in
    let* α7 := α6.["1"] in
    let* α8 := borrow α7 i32 in
    let* α9 := borrow α8 (ref i32) in
    let* α10 := borrow number_2 (ref i32) in
    let* α11 := core.cmp.PartialEq.eq α9 α10 in
    and α5 α11.
  
  Global Instance Method_contains `{State.Trait} : Notation.Dot "contains" := {
    Notation.dot := contains;
  }.
  
  Definition first `{State.Trait} (self : ref Self) : M i32 :=
    let* α0 := deref self generics_associated_types_solution.Container in
    α0.["0"].
  
  Global Instance Method_first `{State.Trait} : Notation.Dot "first" := {
    Notation.dot := first;
  }.
  
  Definition last `{State.Trait} (self : ref Self) : M i32 :=
    let* α0 := deref self generics_associated_types_solution.Container in
    α0.["1"].
  
  Global Instance Method_last `{State.Trait} : Notation.Dot "last" := {
    Notation.dot := last;
  }.
  
  Definition a `{State.Trait} (self : ref Self) : M i32 :=
    let* α0 := deref self generics_associated_types_solution.Container in
    α0.["0"].
  
  Global Instance Method_a `{State.Trait} : Notation.Dot "a" := {
    Notation.dot := a;
  }.
  
  Global Instance I `{State.Trait}
    : generics_associated_types_solution.Contains.Trait Self := {
    generics_associated_types_solution.Contains.A := A;
    generics_associated_types_solution.Contains.B := B;
    generics_associated_types_solution.Contains.contains := contains;
    generics_associated_types_solution.Contains.first := first;
    generics_associated_types_solution.Contains.last := last;
    generics_associated_types_solution.Contains.a := a;
  }.
  Global Hint Resolve I : core.
End
  Impl_generics_associated_types_solution_Contains_for_generics_associated_types_solution_Container.

Definition difference
    `{State.Trait}
    {C : Set}
    `{generics_associated_types_solution.Contains.Trait C}
    (container : ref C)
    : M i32 :=
  let* α0 := deref container _ in
  let* α1 := borrow α0 _ in
  let* α2 := generics_associated_types_solution.Contains.last α1 in
  let* α3 := deref container _ in
  let* α4 := borrow α3 _ in
  let* α5 := generics_associated_types_solution.Contains.first α4 in
  sub α2 α5.

Definition get_a
    `{State.Trait}
    {C : Set}
    `{generics_associated_types_solution.Contains.Trait C}
    (container : ref C)
    : M C::type["A"] :=
  let* α0 := deref container _ in
  let* α1 := borrow α0 _ in
  generics_associated_types_solution.Contains.a α1.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* number_1 := M.alloc 3 in
  let* number_2 := M.alloc 10 in
  let container :=
    generics_associated_types_solution.Container.Build_t number_1 number_2 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [
            mk_str "Does container contain ";
            mk_str " and ";
            mk_str ": ";
            mk_str "
"
          ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow number_1 i32 in
      let* α5 := borrow α4 (ref i32) in
      let* α6 := deref α5 (ref i32) in
      let* α7 := borrow α6 (ref i32) in
      let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
      let* α9 := borrow number_2 i32 in
      let* α10 := borrow α9 (ref i32) in
      let* α11 := deref α10 (ref i32) in
      let* α12 := borrow α11 (ref i32) in
      let* α13 := core.fmt.rt.Argument::["new_display"] α12 in
      let* α14 :=
        borrow container generics_associated_types_solution.Container in
      let* α15 := borrow number_1 i32 in
      let* α16 := deref α15 i32 in
      let* α17 := borrow α16 i32 in
      let* α18 := borrow number_2 i32 in
      let* α19 := deref α18 i32 in
      let* α20 := borrow α19 i32 in
      let* α21 :=
        generics_associated_types_solution.Contains.contains α14 α17 α20 in
      let* α22 := borrow α21 bool in
      let* α23 := deref α22 bool in
      let* α24 := borrow α23 bool in
      let* α25 := core.fmt.rt.Argument::["new_display"] α24 in
      let* α26 := borrow [ α8; α13; α25 ] (list core.fmt.rt.Argument) in
      let* α27 := deref α26 (list core.fmt.rt.Argument) in
      let* α28 := borrow α27 (list core.fmt.rt.Argument) in
      let* α29 := pointer_coercion "Unsize" α28 in
      let* α30 := core.fmt.Arguments::["new_v1"] α3 α29 in
      std.io.stdio._print α30 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "First number: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow container generics_associated_types_solution.Container in
      let* α5 := generics_associated_types_solution.Contains.first α4 in
      let* α6 := borrow α5 i32 in
      let* α7 := deref α6 i32 in
      let* α8 := borrow α7 i32 in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
      let* α11 := deref α10 (list core.fmt.rt.Argument) in
      let* α12 := borrow α11 (list core.fmt.rt.Argument) in
      let* α13 := pointer_coercion "Unsize" α12 in
      let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
      std.io.stdio._print α14 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "Last number: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow container generics_associated_types_solution.Container in
      let* α5 := generics_associated_types_solution.Contains.last α4 in
      let* α6 := borrow α5 i32 in
      let* α7 := deref α6 i32 in
      let* α8 := borrow α7 i32 in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
      let* α11 := deref α10 (list core.fmt.rt.Argument) in
      let* α12 := borrow α11 (list core.fmt.rt.Argument) in
      let* α13 := pointer_coercion "Unsize" α12 in
      let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
      std.io.stdio._print α14 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "The difference is: "; mk_str "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow container generics_associated_types_solution.Container in
      let* α5 := deref α4 generics_associated_types_solution.Container in
      let* α6 := borrow α5 generics_associated_types_solution.Container in
      let* α7 := generics_associated_types_solution.difference α6 in
      let* α8 := borrow α7 i32 in
      let* α9 := deref α8 i32 in
      let* α10 := borrow α9 i32 in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    Pure tt in
  Pure tt.
