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
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str" in
      let* α1 := M.read f in
      let* α2 :=
        match_operator
          self
          (Value.Array
            [
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple
                    =>
                  let* α0 := M.read (mk_str "Apple") in
                  M.alloc α0
                | _ => M.break_match 
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.Orange
                    =>
                  let* α0 := M.read (mk_str "Orange") in
                  M.alloc α0
                | _ => M.break_match 
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.Banana
                    =>
                  let* α0 := M.read (mk_str "Banana") in
                  M.alloc α0
                | _ => M.break_match 
                end);
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
                end);
              fun γ =>
                (let* γ :=
                  let* α0 := M.read γ in
                  M.pure (deref α0) in
                let* α0 := M.read γ in
                match α0 with
                |
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.Lemon
                    =>
                  let* α0 := M.read (mk_str "Lemon") in
                  M.alloc α0
                | _ => M.break_match 
                end)
            ]) in
      let* α3 := M.read α2 in
      M.call α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
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
    let* my_fruit :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* apple :=
      M.alloc
        (Value.StructTuple
          "unpacking_options_and_defaults_via_get_or_insert::Fruit::Apple"
          []) in
    let* first_available_fruit :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit"
            ])
          "get_or_insert" in
      let* α1 := M.read apple in
      let* α2 := M.call α0 [ my_fruit; α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
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
        let* α0 := M.get_function "std::io::stdio::_print" in
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
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
