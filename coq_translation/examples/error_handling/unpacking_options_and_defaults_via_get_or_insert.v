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

Module
  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.
  Definition Self := unpacking_options_and_defaults_via_get_or_insert.Fruit.
  
  Definition fmt
      `{State.Trait}
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter)
      : M core.fmt.Result :=
    let* α0 :=
      match self with
      | unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple =>
        Pure "Apple"
      | unpacking_options_and_defaults_via_get_or_insert.Fruit.Orange =>
        Pure "Orange"
      | unpacking_options_and_defaults_via_get_or_insert.Fruit.Banana =>
        Pure "Banana"
      | unpacking_options_and_defaults_via_get_or_insert.Fruit.Kiwi =>
        Pure "Kiwi"
      | unpacking_options_and_defaults_via_get_or_insert.Fruit.Lemon =>
        Pure "Lemon"
      end in
    core.fmt.Formatter::["write_str"] f α0.
  
  Global Instance Method_fmt : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End
  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let my_fruit := core.option.Option.None in
  let apple := unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple in
  let* first_available_fruit := my_fruit.["get_or_insert"] apple in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_debug"] (addr_of first_available_fruit) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "my_fruit is: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_debug"] (addr_of first_available_fruit) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "first_available_fruit is: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
