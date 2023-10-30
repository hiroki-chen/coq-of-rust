(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fruit.
  Inductive t `{ℋ : State.Trait} : Set :=
  | Apple
  | Orange
  | Banana
  | Kiwi
  | Lemon.
End Fruit.
Definition Fruit `{ℋ : State.Trait} : Set := Fruit.t.

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
  Section
    Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := unpacking_options_and_defaults_via_or_else.Fruit.
    
    Definition fmt
        (self : ref Self)
        (f : mut_ref core.fmt.Formatter)
        : M ltac:(core.fmt.Result) :=
      let* α0 := deref f core.fmt.Formatter in
      let* α1 := borrow_mut α0 core.fmt.Formatter in
      let* α2 :=
        match self with
        | unpacking_options_and_defaults_via_or_else.Fruit  =>
          let* α0 := deref (mk_str "Apple") str in
          borrow α0 str
        | unpacking_options_and_defaults_via_or_else.Fruit  =>
          let* α0 := deref (mk_str "Orange") str in
          borrow α0 str
        | unpacking_options_and_defaults_via_or_else.Fruit  =>
          let* α0 := deref (mk_str "Banana") str in
          borrow α0 str
        | unpacking_options_and_defaults_via_or_else.Fruit  =>
          let* α0 := deref (mk_str "Kiwi") str in
          borrow α0 str
        | unpacking_options_and_defaults_via_or_else.Fruit  =>
          let* α0 := deref (mk_str "Lemon") str in
          borrow α0 str
        end in
      core.fmt.Formatter::["write_str"] α1 α2.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let apple :=
    core.option.Option.Some
      (unpacking_options_and_defaults_via_or_else.Fruit.Apple tt) in
  let no_fruit := core.option.Option.None tt in
  let get_kiwi_as_fallback :=
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Providing kiwi as fallback
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt in
    Pure
      (core.option.Option.Some
        (unpacking_options_and_defaults_via_or_else.Fruit.Kiwi tt)) in
  let get_lemon_as_fallback :=
    let* _ :=
      let* _ :=
        let* α0 :=
          borrow [ mk_str "Providing lemon as fallback
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      M.alloc tt in
    Pure
      (core.option.Option.Some
        (unpacking_options_and_defaults_via_or_else.Fruit.Lemon tt)) in
  let* first_available_fruit :=
    let* α0 :=
      (core.option.Option T)::["or_else"] no_fruit get_kiwi_as_fallback in
    (core.option.Option T)::["or_else"] α0 get_lemon_as_fallback in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "first_available_fruit: "; mk_str "
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          first_available_fruit
          (core.option.Option
            unpacking_options_and_defaults_via_or_else.Fruit) in
      let* α5 :=
        deref
          α4
          (core.option.Option
            unpacking_options_and_defaults_via_or_else.Fruit) in
      let* α6 :=
        borrow
          α5
          (core.option.Option
            unpacking_options_and_defaults_via_or_else.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    M.alloc tt in
  M.alloc tt.
