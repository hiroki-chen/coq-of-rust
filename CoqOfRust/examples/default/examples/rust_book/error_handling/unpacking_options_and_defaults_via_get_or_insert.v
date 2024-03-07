(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple =>
                let* α0 := M.read (mk_str "Apple") in
                M.alloc α0
              | _ => M.break_match 
              end) :
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_get_or_insert.Fruit.Orange =>
                let* α0 := M.read (mk_str "Orange") in
                M.alloc α0
              | _ => M.break_match 
              end) :
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_get_or_insert.Fruit.Banana =>
                let* α0 := M.read (mk_str "Banana") in
                M.alloc α0
              | _ => M.break_match 
              end) :
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_get_or_insert.Fruit.Kiwi =>
                let* α0 := M.read (mk_str "Kiwi") in
                M.alloc α0
              | _ => M.break_match 
              end) :
              Ty.apply (Ty.path "ref") [ Ty.path "str" ];
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              | unpacking_options_and_defaults_via_get_or_insert.Fruit.Lemon =>
                let* α0 := M.read (mk_str "Lemon") in
                M.alloc α0
              | _ => M.break_match 
              end) :
              Ty.apply (Ty.path "ref") [ Ty.path "str" ]
          ] in
      let* α2 := M.read α1 in
      M.call (Ty.path "core::fmt::Formatter")::["write_str"] [ α0; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    let Self :=
      Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit" in
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      []
      [ ("fmt", InstanceField.Method fmt [ Self ]) ].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.

(*
fn main() {
    let mut my_fruit: Option<Fruit> = None;
    let apple = Fruit::Apple;
    let first_available_fruit = my_fruit.get_or_insert(apple);
    println!("my_fruit is: {:?}", first_available_fruit);
    println!("first_available_fruit is: {:?}", first_available_fruit);
    // my_fruit is: Apple
    // first_available_fruit is: Apple
    //println!("Variable named `apple` is moved: {:?}", apple);
    // TODO: uncomment the line above to see the compiler error
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* my_fruit := M.alloc core.option.Option.None in
    let* apple :=
      M.alloc unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple in
    let* first_available_fruit :=
      let* α0 := M.read apple in
      let* α1 :=
        M.call
          (Ty.apply
              (Ty.path "core::option::Option")
              [
                Ty.path
                  "unpacking_options_and_defaults_via_get_or_insert::Fruit"
              ])::["get_or_insert"]
          [ borrow_mut my_fruit; α0 ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "my_fruit is: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow first_available_fruit ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "first_available_fruit is: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow first_available_fruit ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
