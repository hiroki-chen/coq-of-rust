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
Definition Fruit := Fruit.t.

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.
  Definition Self := unpacking_options_and_defaults_via_or.Fruit.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 :=
      match self with
      | unpacking_options_and_defaults_via_or.Fruit.Apple => Pure "Apple"
      | unpacking_options_and_defaults_via_or.Fruit.Orange => Pure "Orange"
      | unpacking_options_and_defaults_via_or.Fruit.Banana => Pure "Banana"
      | unpacking_options_and_defaults_via_or.Fruit.Kiwi => Pure "Kiwi"
      | unpacking_options_and_defaults_via_or.Fruit.Lemon => Pure "Lemon"
      end in
    core.fmt.Formatter::["write_str"] f α0.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let apple :=
    core.option.Option.Some unpacking_options_and_defaults_via_or.Fruit.Apple in
  let orange :=
    core.option.Option.Some
      unpacking_options_and_defaults_via_or.Fruit.Orange in
  let no_fruit := core.option.Option.None in
  let* first_available_fruit :=
    let* α0 := no_fruit.["or"] orange in
    α0.["or"] apple in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_debug"] (addr_of first_available_fruit) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "first_available_fruit: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
