(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
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
              | unpacking_options_and_defaults_via_or_else.Fruit.Apple =>
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
              | unpacking_options_and_defaults_via_or_else.Fruit.Orange =>
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
              | unpacking_options_and_defaults_via_or_else.Fruit.Banana =>
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
              | unpacking_options_and_defaults_via_or_else.Fruit.Kiwi =>
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
              | unpacking_options_and_defaults_via_or_else.Fruit.Lemon =>
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
    let Self := Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" in
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      []
      [ ("fmt", InstanceField.Method fmt [ Self ]) ].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.

(*
fn main() {
    let apple = Some(Fruit::Apple);
    let no_fruit: Option<Fruit> = None;
    let get_kiwi_as_fallback = || {
        println!("Providing kiwi as fallback");
        Some(Fruit::Kiwi)
    };
    let get_lemon_as_fallback = || {
        println!("Providing lemon as fallback");
        Some(Fruit::Lemon)
    };

    let first_available_fruit = no_fruit
        .or_else(get_kiwi_as_fallback)
        .or_else(get_lemon_as_fallback);
    println!("first_available_fruit: {:?}", first_available_fruit);
    // Providing kiwi as fallback
    // first_available_fruit: Some(Kiwi)
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* apple :=
      M.alloc
        (core.option.Option.Some
          unpacking_options_and_defaults_via_or_else.Fruit.Apple) in
    let* no_fruit := M.alloc core.option.Option.None in
    let* get_kiwi_as_fallback :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "Providing kiwi as fallback
") in
                    let* α2 := M.alloc [ α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" (borrow α2) ] in
                    let* α4 := M.call α0 [ α3 ] in
                    M.alloc α4 in
                  M.alloc tt in
                let* α0 :=
                  M.alloc
                    (core.option.Option.Some
                      unpacking_options_and_defaults_via_or_else.Fruit.Kiwi) in
                M.read α0) :
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit"
                  ]
            ]) :
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ]) in
    let* get_lemon_as_fallback :=
      M.alloc
        (fun (α0 : Ty.path "unit") =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "Providing lemon as fallback
") in
                    let* α2 := M.alloc [ α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" (borrow α2) ] in
                    let* α4 := M.call α0 [ α3 ] in
                    M.alloc α4 in
                  M.alloc tt in
                let* α0 :=
                  M.alloc
                    (core.option.Option.Some
                      unpacking_options_and_defaults_via_or_else.Fruit.Lemon) in
                M.read α0) :
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit"
                  ]
            ]) :
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ]) in
    let* first_available_fruit :=
      let* α0 := M.read no_fruit in
      let* α1 := M.read get_kiwi_as_fallback in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "core::option::Option")
              [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit"
              ])::["or_else"]
          [ α0; α1 ] in
      let* α3 := M.read get_lemon_as_fallback in
      let* α4 :=
        M.call
          (Ty.apply
              (Ty.path "core::option::Option")
              [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit"
              ])::["or_else"]
          [ α2; α3 ] in
      M.alloc α4 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "first_available_fruit: ") in
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
