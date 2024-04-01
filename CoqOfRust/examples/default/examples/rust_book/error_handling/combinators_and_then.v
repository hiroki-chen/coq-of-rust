(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CordonBleu";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Steak";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Sushi";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Food.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Food".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure
          (|
            (M.get_associated_function (| (Ty.path "core::fmt::Formatter"), "write_str", [] |)),
            [
              M.read (| f |);
              M.read
                (|
                  (M.match_operator
                    (|
                      self,
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "CordonBleu") |)) |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "Steak") |)) |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "Sushi") |)) |)))
                      ]
                    |))
                |)
            ]
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Food.

(* Enum Day *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Monday";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Tuesday";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Wednesday";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_and_then_Day.
  Definition Self : Ty.t := Ty.path "combinators_and_then::Day".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure
          (|
            (M.get_associated_function (| (Ty.path "core::fmt::Formatter"), "write_str", [] |)),
            [
              M.read (| f |);
              M.read
                (|
                  (M.match_operator
                    (|
                      self,
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "Monday") |)) |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "Tuesday") |)) |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ := M.read (| γ |) in
                            M.alloc (| (M.read (| (mk_str "Wednesday") |)) |)))
                      ]
                    |))
                |)
            ]
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_and_then_Day.

(*
fn have_ingredients(food: Food) -> Option<Food> {
    match food {
        Food::Sushi => None,
        _ => Some(food),
    }
}
*)
Definition have_ingredients (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.read
        (|
          (M.match_operator
            (|
              food,
              [
                fun γ =>
                  ltac:(M.monadic
                    (M.alloc (| (Value.StructTuple "core::option::Option::None" []) |)));
                fun γ =>
                  ltac:(M.monadic
                    (M.alloc
                      (| (Value.StructTuple "core::option::Option::Some" [ M.read (| food |) ])
                      |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.

(*
fn have_recipe(food: Food) -> Option<Food> {
    match food {
        Food::CordonBleu => None,
        _ => Some(food),
    }
}
*)
Definition have_recipe (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.read
        (|
          (M.match_operator
            (|
              food,
              [
                fun γ =>
                  ltac:(M.monadic
                    (M.alloc (| (Value.StructTuple "core::option::Option::None" []) |)));
                fun γ =>
                  ltac:(M.monadic
                    (M.alloc
                      (| (Value.StructTuple "core::option::Option::Some" [ M.read (| food |) ])
                      |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.

(*
fn cookable_v1(food: Food) -> Option<Food> {
    match have_recipe(food) {
        None => None,
        Some(food) => match have_ingredients(food) {
            None => None,
            Some(food) => Some(food),
        },
    }
}
*)
Definition cookable_v1 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.read
        (|
          (M.match_operator
            (|
              (M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "combinators_and_then::have_recipe", [] |)),
                      [ M.read (| food |) ]
                    |))
                |)),
              [
                fun γ =>
                  ltac:(M.monadic
                    (M.alloc (| (Value.StructTuple "core::option::Option::None" []) |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match
                        (| γ, "core::option::Option::Some", 0
                        |) in
                    let food := M.copy (| γ0_0 |) in
                    M.match_operator
                      (|
                        (M.alloc
                          (|
                            (M.call_closure
                              (|
                                (M.get_function (| "combinators_and_then::have_ingredients", [] |)),
                                [ M.read (| food |) ]
                              |))
                          |)),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (M.alloc (| (Value.StructTuple "core::option::Option::None" []) |)));
                          fun γ =>
                            ltac:(M.monadic
                              (let γ0_0 :=
                                M.get_struct_tuple_field_or_break_match
                                  (| γ, "core::option::Option::Some", 0
                                  |) in
                              let food := M.copy (| γ0_0 |) in
                              M.alloc
                                (|
                                  (Value.StructTuple
                                    "core::option::Option::Some"
                                    [ M.read (| food |) ])
                                |)))
                        ]
                      |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.

(*
fn cookable_v2(food: Food) -> Option<Food> {
    have_recipe(food).and_then(have_ingredients)
}
*)
Definition cookable_v2 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.call_closure
        (|
          (M.get_associated_function
            (|
              (Ty.apply (Ty.path "core::option::Option") [ Ty.path "combinators_and_then::Food" ]),
              "and_then",
              [
                Ty.path "combinators_and_then::Food";
                Ty.function
                  [ Ty.path "combinators_and_then::Food" ]
                  (Ty.apply
                    (Ty.path "core::option::Option")
                    [ Ty.path "combinators_and_then::Food" ])
              ]
            |)),
          [
            M.call_closure
              (|
                (M.get_function (| "combinators_and_then::have_recipe", [] |)),
                [ M.read (| food |) ]
              |);
            M.get_function (| "combinators_and_then::have_ingredients", [] |)
          ]
        |)))
  | _, _ => M.impossible
  end.

(*
fn eat(food: Food, day: Day) {
    match cookable_v2(food) {
        Some(food) => println!("Yay! On {:?} we get to eat {:?}.", day, food),
        None => println!("Oh no. We don't get to eat on {:?}?", day),
    }
}
*)
Definition eat (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food; day ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      let day := M.alloc (| day |) in
      M.read
        (|
          (M.match_operator
            (|
              (M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "combinators_and_then::cookable_v2", [] |)),
                      [ M.read (| food |) ]
                    |))
                |)),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match
                        (| γ, "core::option::Option::Some", 0
                        |) in
                    let food := M.copy (| γ0_0 |) in
                    let _ :=
                      M.alloc
                        (|
                          (M.call_closure
                            (|
                              (M.get_function (| "std::io::stdio::_print", [] |)),
                              [
                                M.call_closure
                                  (|
                                    (M.get_associated_function
                                      (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                                      |)),
                                    [
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc
                                            (|
                                              (Value.Array
                                                [
                                                  M.read (| (mk_str "Yay! On ") |);
                                                  M.read (| (mk_str " we get to eat ") |);
                                                  M.read (| (mk_str ".
") |)
                                                ])
                                            |));
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc
                                            (|
                                              (Value.Array
                                                [
                                                  M.call_closure
                                                    (|
                                                      (M.get_associated_function
                                                        (|
                                                          (Ty.path "core::fmt::rt::Argument"),
                                                          "new_debug",
                                                          [ Ty.path "combinators_and_then::Day" ]
                                                        |)),
                                                      [ day ]
                                                    |);
                                                  M.call_closure
                                                    (|
                                                      (M.get_associated_function
                                                        (|
                                                          (Ty.path "core::fmt::rt::Argument"),
                                                          "new_debug",
                                                          [ Ty.path "combinators_and_then::Food" ]
                                                        |)),
                                                      [ food ]
                                                    |)
                                                ])
                                            |))
                                    ]
                                  |)
                              ]
                            |))
                        |) in
                    M.alloc (| (Value.Tuple []) |)));
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.alloc
                        (|
                          (M.call_closure
                            (|
                              (M.get_function (| "std::io::stdio::_print", [] |)),
                              [
                                M.call_closure
                                  (|
                                    (M.get_associated_function
                                      (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                                      |)),
                                    [
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc
                                            (|
                                              (Value.Array
                                                [
                                                  M.read
                                                    (| (mk_str "Oh no. We don't get to eat on ")
                                                    |);
                                                  M.read (| (mk_str "?
") |)
                                                ])
                                            |));
                                      (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc
                                            (|
                                              (Value.Array
                                                [
                                                  M.call_closure
                                                    (|
                                                      (M.get_associated_function
                                                        (|
                                                          (Ty.path "core::fmt::rt::Argument"),
                                                          "new_debug",
                                                          [ Ty.path "combinators_and_then::Day" ]
                                                        |)),
                                                      [ day ]
                                                    |)
                                                ])
                                            |))
                                    ]
                                  |)
                              ]
                            |))
                        |) in
                    M.alloc (| (Value.Tuple []) |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let (cordon_bleu, steak, sushi) = (Food::CordonBleu, Food::Steak, Food::Sushi);

    eat(cordon_bleu, Day::Monday);
    eat(steak, Day::Tuesday);
    eat(sushi, Day::Wednesday);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (M.match_operator
            (|
              (M.alloc
                (|
                  (Value.Tuple
                    [
                      Value.StructTuple "combinators_and_then::Food::CordonBleu" [];
                      Value.StructTuple "combinators_and_then::Food::Steak" [];
                      Value.StructTuple "combinators_and_then::Food::Sushi" []
                    ])
                |)),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 := M.get_tuple_field γ 0 in
                    let γ0_1 := M.get_tuple_field γ 1 in
                    let γ0_2 := M.get_tuple_field γ 2 in
                    let cordon_bleu := M.copy (| γ0_0 |) in
                    let steak := M.copy (| γ0_1 |) in
                    let sushi := M.copy (| γ0_2 |) in
                    let _ :=
                      M.alloc
                        (|
                          (M.call_closure
                            (|
                              (M.get_function (| "combinators_and_then::eat", [] |)),
                              [
                                M.read (| cordon_bleu |);
                                Value.StructTuple "combinators_and_then::Day::Monday" []
                              ]
                            |))
                        |) in
                    let _ :=
                      M.alloc
                        (|
                          (M.call_closure
                            (|
                              (M.get_function (| "combinators_and_then::eat", [] |)),
                              [
                                M.read (| steak |);
                                Value.StructTuple "combinators_and_then::Day::Tuesday" []
                              ]
                            |))
                        |) in
                    let _ :=
                      M.alloc
                        (|
                          (M.call_closure
                            (|
                              (M.get_function (| "combinators_and_then::eat", [] |)),
                              [
                                M.read (| sushi |);
                                Value.StructTuple "combinators_and_then::Day::Wednesday" []
                              ]
                            |))
                        |) in
                    M.alloc (| (Value.Tuple []) |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.
