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
Definition give_adult (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ drink ] =>
    ltac:(M.monadic
      (let drink := M.alloc (| drink |) in
      M.read (|
          M.match_operator (|
              drink,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (| γ, "core::option::Option::Some", 0
                        |) in
                    let _ :=
                      M.alloc (|
                          M.call_closure (|
                              M.get_function (| "std::io::stdio::_print", [] |),
                              [
                                M.call_closure (|
                                    M.get_associated_function (|
                                        Ty.path "core::fmt::Arguments",
                                        "new_const",
                                        []
                                      |),
                                    [
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                              Value.Array
                                                [ M.read (| mk_str "Yuck! Too sugary.
" |) ]
                                            |))
                                    ]
                                  |)
                              ]
                            |)
                        |) in
                    M.alloc (| Value.Tuple [] |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (| γ, "core::option::Option::Some", 0
                        |) in
                    let inner := M.copy (| γ0_0 |) in
                    let _ :=
                      M.alloc (|
                          M.call_closure (|
                              M.get_function (| "std::io::stdio::_print", [] |),
                              [
                                M.call_closure (|
                                    M.get_associated_function (|
                                        Ty.path "core::fmt::Arguments",
                                        "new_v1",
                                        []
                                      |),
                                    [
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                              Value.Array
                                                [
                                                  M.read (| mk_str "" |);
                                                  M.read (| mk_str "? How nice.
" |)
                                                ]
                                            |));
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                              Value.Array
                                                [
                                                  M.call_closure (|
                                                      M.get_associated_function (|
                                                          Ty.path "core::fmt::rt::Argument",
                                                          "new_display",
                                                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ]
                                                          ]
                                                        |),
                                                      [ inner ]
                                                    |)
                                                ]
                                            |))
                                    ]
                                  |)
                              ]
                            |)
                        |) in
                    M.alloc (| Value.Tuple [] |)));
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.alloc (|
                          M.call_closure (|
                              M.get_function (| "std::io::stdio::_print", [] |),
                              [
                                M.call_closure (|
                                    M.get_associated_function (|
                                        Ty.path "core::fmt::Arguments",
                                        "new_const",
                                        []
                                      |),
                                    [
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                              Value.Array
                                                [ M.read (| mk_str "No drink? Oh well.
" |) ]
                                            |))
                                    ]
                                  |)
                              ]
                            |)
                        |) in
                    M.alloc (| Value.Tuple [] |)))
              ]
            |)
        |)))
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
Definition drink (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ drink ] =>
    ltac:(M.monadic
      (let drink := M.alloc (| drink |) in
      M.read (|
          let inside :=
            M.alloc (|
                M.call_closure (|
                    M.get_associated_function (|
                        Ty.apply
                          (Ty.path "core::option::Option")
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                        "unwrap",
                        []
                      |),
                    [ M.read (| drink |) ]
                  |)
              |) in
          let _ :=
            M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ :=
                        M.use
                          (M.alloc (|
                              M.call_closure (|
                                  M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply (Ty.path "&") [ Ty.path "str" ],
                                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                                      "eq",
                                      []
                                    |),
                                  [ inside; mk_str "lemonade" ]
                                |)
                            |)) in
                      let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                      M.alloc (|
                          M.never_to_any (|
                              M.call_closure (|
                                  M.get_function (|
                                      "std::panicking::begin_panic",
                                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                    |),
                                  [ M.read (| mk_str "AAAaaaaa!!!!" |) ]
                                |)
                            |)
                        |)));
                  fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                ]
              |) in
          let _ :=
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                            M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.read (| mk_str "I love " |);
                                          M.read (| mk_str "s!!!!!
" |)
                                        ]
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.call_closure (|
                                              M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_display",
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |),
                                              [ inside ]
                                            |)
                                        ]
                                    |))
                            ]
                          |)
                      ]
                    |)
                |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let water :=
            M.alloc (|
                Value.StructTuple "core::option::Option::Some" [ M.read (| mk_str "water" |) ]
              |) in
          let lemonade :=
            M.alloc (|
                Value.StructTuple "core::option::Option::Some" [ M.read (| mk_str "lemonade" |) ]
              |) in
          let void := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "option_and_unwrap::give_adult", [] |),
                    [ M.read (| water |) ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "option_and_unwrap::give_adult", [] |),
                    [ M.read (| lemonade |) ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "option_and_unwrap::give_adult", [] |),
                    [ M.read (| void |) ]
                  |)
              |) in
          let coffee :=
            M.alloc (|
                Value.StructTuple "core::option::Option::Some" [ M.read (| mk_str "coffee" |) ]
              |) in
          let nothing := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "option_and_unwrap::drink", [] |),
                    [ M.read (| coffee |) ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "option_and_unwrap::drink", [] |),
                    [ M.read (| nothing |) ]
                  |)
              |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
