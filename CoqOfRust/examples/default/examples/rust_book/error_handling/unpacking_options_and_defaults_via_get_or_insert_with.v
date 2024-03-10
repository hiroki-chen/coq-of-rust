(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str" in
      let* α1 := M.read f in
      let* α2 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ := M.read γ in
              let* α0 := M.read (mk_str "Apple") in
              M.alloc α0);
            fun γ =>
              (let* γ := M.read γ in
              let* α0 := M.read (mk_str "Orange") in
              M.alloc α0);
            fun γ =>
              (let* γ := M.read γ in
              let* α0 := M.read (mk_str "Banana") in
              M.alloc α0);
            fun γ =>
              (let* γ := M.read γ in
              let* α0 := M.read (mk_str "Kiwi") in
              M.alloc α0);
            fun γ =>
              (let* γ := M.read γ in
              let* α0 := M.read (mk_str "Lemon") in
              M.alloc α0)
          ] in
      let* α3 := M.read α2 in
      M.call α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "unpacking_options_and_defaults_via_get_or_insert_with::Fruit")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_with_Fruit.

(*
fn main() {
    let mut my_fruit: Option<Fruit> = None;
    let get_lemon_as_fallback = || {
        println!("Providing lemon as fallback");
        Fruit::Lemon
    };
    let first_available_fruit = my_fruit.get_or_insert_with(get_lemon_as_fallback);
    println!("my_fruit is: {:?}", first_available_fruit);
    println!("first_available_fruit is: {:?}", first_available_fruit);
    // Providing lemon as fallback
    // my_fruit is: Lemon
    // first_available_fruit is: Lemon

    // If the Option has a value, it is left unchanged, and the closure is not invoked
    let mut my_apple = Some(Fruit::Apple);
    let should_be_apple = my_apple.get_or_insert_with(get_lemon_as_fallback);
    println!("should_be_apple is: {:?}", should_be_apple);
    println!("my_apple is unchanged: {:?}", my_apple);
    // The output is a follows. Note that the closure `get_lemon_as_fallback` is not invoked
    // should_be_apple is: Apple
    // my_apple is unchanged: Some(Apple)
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* my_fruit :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* get_lemon_as_fallback :=
      M.alloc
        (fun α0 (* : Ty.path "unit" *) =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_const" in
                    let* α2 := M.read (mk_str "Providing lemon as fallback
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    let* α4 :=
                      M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                    let* α5 := M.call α0 [ α4 ] in
                    M.alloc α5 in
                  M.alloc (Value.Tuple []) in
                let* α0 :=
                  M.alloc
                    (Value.StructTuple
                      "unpacking_options_and_defaults_via_get_or_insert_with::Fruit::Lemon"
                      []) in
                M.read α0)
            ])) in
    let* first_available_fruit :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.path
                "unpacking_options_and_defaults_via_get_or_insert_with::Fruit"
            ])
          "get_or_insert_with" in
      let* α1 := M.read get_lemon_as_fallback in
      let* α2 := M.call α0 [ my_fruit; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "my_fruit is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ first_available_fruit ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "first_available_fruit is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ first_available_fruit ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* my_apple :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [
            Value.StructTuple
              "unpacking_options_and_defaults_via_get_or_insert_with::Fruit::Apple"
              []
          ]) in
    let* should_be_apple :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.path
                "unpacking_options_and_defaults_via_get_or_insert_with::Fruit"
            ])
          "get_or_insert_with" in
      let* α1 := M.read get_lemon_as_fallback in
      let* α2 := M.call α0 [ my_apple; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "should_be_apple is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ should_be_apple ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "my_apple is unchanged: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ my_apple ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
