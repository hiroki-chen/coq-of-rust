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

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
  Definition Self `{State.Trait} := unpacking_options_and_defaults_via_or.Fruit.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 := deref f core.fmt.Formatter in
    let* α1 := borrow_mut α0 core.fmt.Formatter in
    let* α2 :=
      match self with
      | unpacking_options_and_defaults_via_or.Fruit  =>
        let* α0 := deref (mk_str "Apple") str in
        borrow α0 str
      | unpacking_options_and_defaults_via_or.Fruit  =>
        let* α0 := deref (mk_str "Orange") str in
        borrow α0 str
      | unpacking_options_and_defaults_via_or.Fruit  =>
        let* α0 := deref (mk_str "Banana") str in
        borrow α0 str
      | unpacking_options_and_defaults_via_or.Fruit  =>
        let* α0 := deref (mk_str "Kiwi") str in
        borrow α0 str
      | unpacking_options_and_defaults_via_or.Fruit  =>
        let* α0 := deref (mk_str "Lemon") str in
        borrow α0 str
      end in
    core.fmt.Formatter::["write_str"] α1 α2.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let apple :=
    core.option.Option.Some
      (unpacking_options_and_defaults_via_or.Fruit.Apple tt) in
  let orange :=
    core.option.Option.Some
      (unpacking_options_and_defaults_via_or.Fruit.Orange tt) in
  let no_fruit := core.option.Option.None tt in
  let* first_available_fruit :=
    let* α0 := (core.option.Option _)::["or"] no_fruit orange in
    (core.option.Option _)::["or"] α0 apple in
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
          (core.option.Option unpacking_options_and_defaults_via_or.Fruit) in
      let* α5 :=
        deref
          α4
          (core.option.Option unpacking_options_and_defaults_via_or.Fruit) in
      let* α6 :=
        borrow
          α5
          (core.option.Option unpacking_options_and_defaults_via_or.Fruit) in
      let* α7 := core.fmt.rt.Argument::["new_debug"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt in
  Pure tt.
