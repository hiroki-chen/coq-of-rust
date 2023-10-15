(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fruit.
  Inductive t : Set :=
  | Apple
  | Orange
  | Banana
  | Kiwi
  | Lemon.
End Fruit.
Definition Fruit : Set := Fruit.t.

Module
  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
  Definition Self :=
    unpacking_options_and_defaults_via_get_or_insert_with.Fruit.
  
  Definition fmt
      `{H' : State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M (H := H') core.fmt.Result :=
    let* α0 := deref f core.fmt.Formatter in
    let* α1 := borrow_mut α0 core.fmt.Formatter in
    let* α2 :=
      match self with
      | unpacking_options_and_defaults_via_get_or_insert_with.Fruit  =>
        let* α0 := deref "Apple" str in
        borrow α0 str
      | unpacking_options_and_defaults_via_get_or_insert_with.Fruit  =>
        let* α0 := deref "Orange" str in
        borrow α0 str
      | unpacking_options_and_defaults_via_get_or_insert_with.Fruit  =>
        let* α0 := deref "Banana" str in
        borrow α0 str
      | unpacking_options_and_defaults_via_get_or_insert_with.Fruit  =>
        let* α0 := deref "Kiwi" str in
        borrow α0 str
      | unpacking_options_and_defaults_via_get_or_insert_with.Fruit  =>
        let* α0 := deref "Lemon" str in
        borrow α0 str
      end in
    core.fmt.Formatter::["write_str"] α1 α2.
  
  Global Instance Method_fmt `{H' : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H' : State.Trait} := fmt;
  }.
  Global Hint Resolve I : core.
End
  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let my_fruit := core.option.Option.None tt in
  let get_lemon_as_fallback :=
    let* _ :=
      let* _ :=
        let* α0 := borrow [ "Providing lemon as fallback
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := core.fmt.Arguments::["new_const"] α3 in
        std.io.stdio._print α4 in
      Pure tt in
    Pure
      (unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Lemon tt) in
  let* first_available_fruit :=
    let* α0 :=
      borrow_mut
        my_fruit
        (core.option.Option
          unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
    (core.option.Option _)::["get_or_insert_with"] α0 get_lemon_as_fallback in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "my_fruit is: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          first_available_fruit
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α5 :=
        deref
          α4
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α6 :=
        borrow
          α5
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ "first_available_fruit is: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          first_available_fruit
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α5 :=
        deref
          α4
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α6 :=
        borrow
          α5
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let my_apple :=
    core.option.Option.Some
      (unpacking_options_and_defaults_via_get_or_insert_with.Fruit.Apple tt) in
  let* should_be_apple :=
    let* α0 :=
      borrow_mut
        my_apple
        (core.option.Option
          unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
    (core.option.Option _)::["get_or_insert_with"] α0 get_lemon_as_fallback in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "should_be_apple is: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          should_be_apple
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α5 :=
        deref
          α4
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α6 :=
        borrow
          α5
          (mut_ref
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ "my_apple is unchanged: "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 :=
        borrow
          my_apple
          (core.option.Option
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α5 :=
        deref
          α4
          (core.option.Option
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α6 :=
        borrow
          α5
          (core.option.Option
            unpacking_options_and_defaults_via_get_or_insert_with.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
