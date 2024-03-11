(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn give_adult(drink: Option<&str>) {
    // Specify a course of action for each case.
    match drink {
        Some("lemonade") => println!("Yuck! Too sugary."),
        Some(inner) => println!("{}? How nice.", inner),
        None => println!("No drink? Oh well."),
    }
}
*)
Definition give_adult (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ drink ] =>
    let* drink := M.alloc drink in
    let* α0 :=
      match_operator
        drink
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "Yuck! Too sugary.
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* inner := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "") in
              let* α3 := M.read (mk_str "? How nice.
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.call α5 [ inner ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "No drink? Oh well.
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn drink(drink: Option<&str>) {
    // `unwrap` returns a `panic` when it receives a `None`.
    let inside = drink.unwrap();
    if inside == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("I love {}s!!!!!", inside);
}
*)
Definition drink (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ drink ] =>
    let* drink := M.alloc drink in
    let* inside :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "unwrap" in
      let* α1 := M.read drink in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "&") [ Ty.path "str" ];
            (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ] in
      let* α1 := M.call α0 [ inside; mk_str "lemonade" ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.read (M.use α2) in
      if Value.is_true α3 then
        let* α0 :=
          M.get_function
            "std::panicking::begin_panic"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α1 := M.read (mk_str "AAAaaaaa!!!!") in
        let* α2 := M.call α0 [ α1 ] in
        let* α3 := M.never_to_any α2 in
        M.alloc α3
      else
        M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "I love ") in
        let* α3 := M.read (mk_str "s!!!!!
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ inside ] in
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

(*
fn main() {
    let water = Some("water");
    let lemonade = Some("lemonade");
    let void = None;

    give_adult(water);
    give_adult(lemonade);
    give_adult(void);

    let coffee = Some("coffee");
    let nothing = None;

    drink(coffee);
    drink(nothing);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* water :=
      let* α0 := M.read (mk_str "water") in
      M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
    let* lemonade :=
      let* α0 := M.read (mk_str "lemonade") in
      M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
    let* void := M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* _ :=
      let* α0 := M.get_function "option_and_unwrap::give_adult" [] in
      let* α1 := M.read water in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "option_and_unwrap::give_adult" [] in
      let* α1 := M.read lemonade in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "option_and_unwrap::give_adult" [] in
      let* α1 := M.read void in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* coffee :=
      let* α0 := M.read (mk_str "coffee") in
      M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
    let* nothing :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* _ :=
      let* α0 := M.get_function "option_and_unwrap::drink" [] in
      let* α1 := M.read coffee in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "option_and_unwrap::drink" [] in
      let* α1 := M.read nothing in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
