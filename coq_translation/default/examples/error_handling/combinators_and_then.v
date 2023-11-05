(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Food.
  Inductive t `{ℋ : State.Trait} : Set :=
  | CordonBleu
  | Steak
  | Sushi.
End Food.
Definition Food `{ℋ : State.Trait} : Set := M.Val Food.t.

Module  Impl_core_fmt_Debug_for_combinators_and_then_Food.
Section Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := combinators_and_then.Food.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
      let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
      let* α2 := M.read self in
      let* α3 : ltac:(refine (ref str)) :=
        match α2 with
        | combinators_and_then.Food  =>
          let* α0 : ltac:(refine str) := deref (mk_str "CordonBleu") in
          borrow α0
        | combinators_and_then.Food  =>
          let* α0 : ltac:(refine str) := deref (mk_str "Steak") in
          borrow α0
        | combinators_and_then.Food  =>
          let* α0 : ltac:(refine str) := deref (mk_str "Sushi") in
          borrow α0
        end in
      core.fmt.Formatter::["write_str"] α1 α3).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_and_then_Food.
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

Module Day.
  Inductive t `{ℋ : State.Trait} : Set :=
  | Monday
  | Tuesday
  | Wednesday.
End Day.
Definition Day `{ℋ : State.Trait} : Set := M.Val Day.t.

Module  Impl_core_fmt_Debug_for_combinators_and_then_Day.
Section Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Context `{ℋ : State.Trait}.
  
  Definition Self : Set := combinators_and_then.Day.
  
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M ltac:(core.fmt.Result) :=
    M.function_body
      (let* α0 : ltac:(refine core.fmt.Formatter) := deref f in
      let* α1 : ltac:(refine (mut_ref core.fmt.Formatter)) := borrow_mut α0 in
      let* α2 := M.read self in
      let* α3 : ltac:(refine (ref str)) :=
        match α2 with
        | combinators_and_then.Day  =>
          let* α0 : ltac:(refine str) := deref (mk_str "Monday") in
          borrow α0
        | combinators_and_then.Day  =>
          let* α0 : ltac:(refine str) := deref (mk_str "Tuesday") in
          borrow α0
        | combinators_and_then.Day  =>
          let* α0 : ltac:(refine str) := deref (mk_str "Wednesday") in
          borrow α0
        end in
      core.fmt.Formatter::["write_str"] α1 α3).
  
  Global Instance AssociatedFunction_fmt : Notation.DoubleColon Self "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_combinators_and_then_Day.
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

Definition have_ingredients
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  M.function_body
    (let* α0 := M.read food in
    match α0 with
    | combinators_and_then.Food  => M.alloc core.option.Option.None
    | _ => M.alloc (core.option.Option.Some food)
    end).

Definition have_recipe
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  M.function_body
    (let* α0 := M.read food in
    match α0 with
    | combinators_and_then.Food  => M.alloc core.option.Option.None
    | _ => M.alloc (core.option.Option.Some food)
    end).

Definition cookable_v1
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  M.function_body
    (let* α0 : ltac:(refine (core.option.Option combinators_and_then.Food)) :=
      combinators_and_then.have_recipe food in
    let* α1 := M.read α0 in
    match α1 with
    | core.option.Option  => M.alloc core.option.Option.None
    | core.option.Option food =>
      let* α0 : ltac:(refine (core.option.Option combinators_and_then.Food)) :=
        combinators_and_then.have_ingredients food in
      let* α1 := M.read α0 in
      match α1 with
      | core.option.Option  => M.alloc core.option.Option.None
      | core.option.Option food => M.alloc (core.option.Option.Some food)
      end
    end).

Definition cookable_v2
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    : M (core.option.Option combinators_and_then.Food) :=
  M.function_body
    (let* α0 : ltac:(refine (core.option.Option combinators_and_then.Food)) :=
      combinators_and_then.have_recipe food in
    (core.option.Option combinators_and_then.Food)::["and_then"]
      α0
      combinators_and_then.have_ingredients).

Definition eat
    `{ℋ : State.Trait}
    (food : combinators_and_then.Food)
    (day : combinators_and_then.Day)
    : M unit :=
  M.function_body
    (let* α0 : ltac:(refine (core.option.Option combinators_and_then.Food)) :=
      combinators_and_then.cookable_v2 food in
    let* α1 := M.read α0 in
    match α1 with
    | core.option.Option food =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc
            [ mk_str "Yay! On "; mk_str " we get to eat "; mk_str ".
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref combinators_and_then.Day)) := borrow day in
        let* α6 : ltac:(refine combinators_and_then.Day) := deref α5 in
        let* α7 : ltac:(refine (ref combinators_and_then.Day)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (ref combinators_and_then.Food)) :=
          borrow food in
        let* α10 : ltac:(refine combinators_and_then.Food) := deref α9 in
        let* α11 : ltac:(refine (ref combinators_and_then.Food)) :=
          borrow α10 in
        let* α12 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α11 in
        let* α13 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8; α12 ] in
        let* α14 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α13 in
        let* α15 : ltac:(refine (array core.fmt.rt.Argument)) := deref α14 in
        let* α16 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α15 in
        let* α17 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α16 in
        let* α18 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α17 in
        std.io.stdio._print α18 in
      M.alloc tt
    | core.option.Option  =>
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Oh no. We don't get to eat on "; mk_str "?
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref combinators_and_then.Day)) := borrow day in
        let* α6 : ltac:(refine combinators_and_then.Day) := deref α5 in
        let* α7 : ltac:(refine (ref combinators_and_then.Day)) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt
    end).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let*
        '(cordon_bleu, steak, sushi) :
        ltac:(refine
          (M.Val
            (combinators_and_then.Food *
              combinators_and_then.Food *
              combinators_and_then.Food))) :=
      let* α0 : ltac:(refine combinators_and_then.Food) :=
        M.alloc combinators_and_then.Food.CordonBleu in
      let* α1 : ltac:(refine combinators_and_then.Food) :=
        M.alloc combinators_and_then.Food.Steak in
      let* α2 : ltac:(refine combinators_and_then.Food) :=
        M.alloc combinators_and_then.Food.Sushi in
      M.alloc (α0, α1, α2) in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine combinators_and_then.Day) :=
        M.alloc combinators_and_then.Day.Monday in
      combinators_and_then.eat cordon_bleu α0 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine combinators_and_then.Day) :=
        M.alloc combinators_and_then.Day.Tuesday in
      combinators_and_then.eat steak α0 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine combinators_and_then.Day) :=
        M.alloc combinators_and_then.Day.Wednesday in
      combinators_and_then.eat sushi α0 in
    M.alloc tt).
