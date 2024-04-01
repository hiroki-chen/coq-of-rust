(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Orange";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Banana";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Kiwi";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Lemon";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
  Definition Self : Ty.t := Ty.path "unpacking_options_and_defaults_via_or_else::Fruit".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.get_associated_function (Ty.path "core::fmt::Formatter") "write_str" [] in
      let* α1 := M.read f in
      let* α2 :=
        M.match_operator
          self
          [
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Apple") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Orange") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Banana") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Kiwi") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Lemon") in
              M.alloc α0
          ] in
      let* α3 := M.read α2 in
      M.call_closure α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* apple :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.StructTuple "unpacking_options_and_defaults_via_or_else::Fruit::Apple" [] ]) in
    let* no_fruit := M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* get_kiwi_as_fallback :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_const"
                            [] in
                        let* α4 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "Providing kiwi as fallback
") in
                            let* α3 := M.alloc (Value.Array [ α2 ]) in
                            M.pure (M.pointer_coercion α3) in
                        let* α5 := M.call_closure α1 [ α4 ] in
                        let* α6 := M.call_closure α0 [ α5 ] in
                        M.alloc α6 in
                      M.alloc (Value.Tuple []) in
                    let* α0 :=
                      M.alloc
                        (Value.StructTuple
                          "core::option::Option::Some"
                          [
                            Value.StructTuple
                              "unpacking_options_and_defaults_via_or_else::Fruit::Kiwi"
                              []
                          ]) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* get_lemon_as_fallback :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_const"
                            [] in
                        let* α4 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "Providing lemon as fallback
") in
                            let* α3 := M.alloc (Value.Array [ α2 ]) in
                            M.pure (M.pointer_coercion α3) in
                        let* α5 := M.call_closure α1 [ α4 ] in
                        let* α6 := M.call_closure α0 [ α5 ] in
                        M.alloc α6 in
                      M.alloc (Value.Tuple []) in
                    let* α0 :=
                      M.alloc
                        (Value.StructTuple
                          "core::option::Option::Some"
                          [
                            Value.StructTuple
                              "unpacking_options_and_defaults_via_or_else::Fruit::Lemon"
                              []
                          ]) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* first_available_fruit :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ])
          "or_else"
          [
            Ty.function
              [ Ty.tuple [] ]
              (Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ])
          ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ])
          "or_else"
          [
            Ty.function
              [ Ty.tuple [] ]
              (Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ])
          ] in
      let* α2 := M.read no_fruit in
      let* α3 := M.read get_kiwi_as_fallback in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.read get_lemon_as_fallback in
      let* α6 := M.call_closure α0 [ α4; α5 ] in
      M.alloc α6 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "first_available_fruit: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::option::Option")
                    [ Ty.path "unpacking_options_and_defaults_via_or_else::Fruit" ]
                ] in
            let* α7 := M.call_closure α6 [ first_available_fruit ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
