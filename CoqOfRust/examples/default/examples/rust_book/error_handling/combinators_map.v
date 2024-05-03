(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Food
{
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Carrot";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Potato";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Module Impl_core_fmt_Debug_for_combinators_map_Food.
  Definition Self : Ty.t := Ty.path "combinators_map::Food".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [
            M.read (| f |);
            M.read (|
              M.match_operator (|
                self,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Apple" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Carrot" |) |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.read (| γ |) in
                      M.alloc (| M.read (| Value.String "Potato" |) |)))
                ]
              |)
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
End Impl_core_fmt_Debug_for_combinators_map_Food.

(* StructTuple
  {
    name := "Peeled";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Peeled.
  Definition Self : Ty.t := Ty.path "combinators_map::Peeled".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field1_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Peeled" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "combinators_map::Peeled",
                  0
                |)
              |))
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
End Impl_core_fmt_Debug_for_combinators_map_Peeled.

(* StructTuple
  {
    name := "Chopped";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Chopped.
  Definition Self : Ty.t := Ty.path "combinators_map::Chopped".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field1_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Chopped" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "combinators_map::Chopped",
                  0
                |)
              |))
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
End Impl_core_fmt_Debug_for_combinators_map_Chopped.

(* StructTuple
  {
    name := "Cooked";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Cooked.
  Definition Self : Ty.t := Ty.path "combinators_map::Cooked".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field1_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Cooked" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "combinators_map::Cooked",
                  0
                |)
              |))
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
End Impl_core_fmt_Debug_for_combinators_map_Cooked.

(*
fn peel(food: Option<Food>) -> Option<Peeled> {
    match food {
        Some(food) => Some(Peeled(food)),
        None => None,
    }
}
*)
Definition peel (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.read (|
        M.match_operator (|
          food,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let food := M.copy (| γ0_0 |) in
                M.alloc (|
                  Value.StructTuple
                    "core::option::Option::Some"
                    [ Value.StructTuple "combinators_map::Peeled" [ M.read (| food |) ] ]
                |)));
            fun γ =>
              ltac:(M.monadic (M.alloc (| Value.StructTuple "core::option::Option::None" [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn chop(peeled: Option<Peeled>) -> Option<Chopped> {
    match peeled {
        Some(Peeled(food)) => Some(Chopped(food)),
        None => None,
    }
}
*)
Definition chop (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ peeled ] =>
    ltac:(M.monadic
      (let peeled := M.alloc (| peeled |) in
      M.read (|
        M.match_operator (|
          peeled,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let γ1_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ0_0, "combinators_map::Peeled", 0 |) in
                let food := M.copy (| γ1_0 |) in
                M.alloc (|
                  Value.StructTuple
                    "core::option::Option::Some"
                    [ Value.StructTuple "combinators_map::Chopped" [ M.read (| food |) ] ]
                |)));
            fun γ =>
              ltac:(M.monadic (M.alloc (| Value.StructTuple "core::option::Option::None" [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn cook(chopped: Option<Chopped>) -> Option<Cooked> {
    chopped.map(|Chopped(food)| Cooked(food))
}
*)
Definition cook (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ chopped ] =>
    ltac:(M.monadic
      (let chopped := M.alloc (| chopped |) in
      M.call_closure (|
        M.get_associated_function (|
          Ty.apply (Ty.path "core::option::Option") [ Ty.path "combinators_map::Chopped" ],
          "map",
          [
            Ty.path "combinators_map::Cooked";
            Ty.function
              [ Ty.tuple [ Ty.path "combinators_map::Chopped" ] ]
              (Ty.path "combinators_map::Cooked")
          ]
        |),
        [
          M.read (| chopped |);
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.SubPointer.get_struct_tuple_field (|
                              γ,
                              "combinators_map::Chopped",
                              0
                            |) in
                          let food := M.copy (| γ0_0 |) in
                          Value.StructTuple "combinators_map::Cooked" [ M.read (| food |) ]))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        ]
      |)))
  | _, _ => M.impossible
  end.

(*
fn process(food: Option<Food>) -> Option<Cooked> {
    food.map(|f| Peeled(f))
        .map(|Peeled(f)| Chopped(f))
        .map(|Chopped(f)| Cooked(f))
}
*)
Definition process (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.call_closure (|
        M.get_associated_function (|
          Ty.apply (Ty.path "core::option::Option") [ Ty.path "combinators_map::Chopped" ],
          "map",
          [
            Ty.path "combinators_map::Cooked";
            Ty.function
              [ Ty.tuple [ Ty.path "combinators_map::Chopped" ] ]
              (Ty.path "combinators_map::Cooked")
          ]
        |),
        [
          M.call_closure (|
            M.get_associated_function (|
              Ty.apply (Ty.path "core::option::Option") [ Ty.path "combinators_map::Peeled" ],
              "map",
              [
                Ty.path "combinators_map::Chopped";
                Ty.function
                  [ Ty.tuple [ Ty.path "combinators_map::Peeled" ] ]
                  (Ty.path "combinators_map::Chopped")
              ]
            |),
            [
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::option::Option") [ Ty.path "combinators_map::Food" ],
                  "map",
                  [
                    Ty.path "combinators_map::Peeled";
                    Ty.function
                      [ Ty.tuple [ Ty.path "combinators_map::Food" ] ]
                      (Ty.path "combinators_map::Peeled")
                  ]
                |),
                [
                  M.read (| food |);
                  M.closure
                    (fun γ =>
                      ltac:(M.monadic
                        match γ with
                        | [ α0 ] =>
                          M.match_operator (|
                            M.alloc (| α0 |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (let f := M.copy (| γ |) in
                                  Value.StructTuple "combinators_map::Peeled" [ M.read (| f |) ]))
                            ]
                          |)
                        | _ => M.impossible (||)
                        end))
                ]
              |);
              M.closure
                (fun γ =>
                  ltac:(M.monadic
                    match γ with
                    | [ α0 ] =>
                      M.match_operator (|
                        M.alloc (| α0 |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (let γ0_0 :=
                                M.SubPointer.get_struct_tuple_field (|
                                  γ,
                                  "combinators_map::Peeled",
                                  0
                                |) in
                              let f := M.copy (| γ0_0 |) in
                              Value.StructTuple "combinators_map::Chopped" [ M.read (| f |) ]))
                        ]
                      |)
                    | _ => M.impossible (||)
                    end))
            ]
          |);
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.SubPointer.get_struct_tuple_field (|
                              γ,
                              "combinators_map::Chopped",
                              0
                            |) in
                          let f := M.copy (| γ0_0 |) in
                          Value.StructTuple "combinators_map::Cooked" [ M.read (| f |) ]))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        ]
      |)))
  | _, _ => M.impossible
  end.

(*
fn eat(food: Option<Cooked>) {
    match food {
        Some(food) => println!("Mmm. I love {:?}", food),
        None => println!("Oh no! It wasn't edible."),
    }
}
*)
Definition eat (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ food ] =>
    ltac:(M.monadic
      (let food := M.alloc (| food |) in
      M.read (|
        M.match_operator (|
          food,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let food := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "Mmm. I love " |);
                                    M.read (| Value.String "
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
                                        "new_debug",
                                        [ Ty.path "combinators_map::Cooked" ]
                                      |),
                                      [ food ]
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
                                  [ M.read (| Value.String "Oh no! It wasn't edible.
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
fn main() {
    let apple = Some(Food::Apple);
    let carrot = Some(Food::Carrot);
    let potato = None;

    let cooked_apple = cook(chop(peel(apple)));
    let cooked_carrot = cook(chop(peel(carrot)));
    // Let's try the simpler looking `process()` now.
    let cooked_potato = process(potato);

    eat(cooked_apple);
    eat(cooked_carrot);
    eat(cooked_potato);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let apple :=
          M.alloc (|
            Value.StructTuple
              "core::option::Option::Some"
              [ Value.StructTuple "combinators_map::Food::Apple" [] ]
          |) in
        let carrot :=
          M.alloc (|
            Value.StructTuple
              "core::option::Option::Some"
              [ Value.StructTuple "combinators_map::Food::Carrot" [] ]
          |) in
        let potato := M.alloc (| Value.StructTuple "core::option::Option::None" [] |) in
        let cooked_apple :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::cook", [] |),
              [
                M.call_closure (|
                  M.get_function (| "combinators_map::chop", [] |),
                  [
                    M.call_closure (|
                      M.get_function (| "combinators_map::peel", [] |),
                      [ M.read (| apple |) ]
                    |)
                  ]
                |)
              ]
            |)
          |) in
        let cooked_carrot :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::cook", [] |),
              [
                M.call_closure (|
                  M.get_function (| "combinators_map::chop", [] |),
                  [
                    M.call_closure (|
                      M.get_function (| "combinators_map::peel", [] |),
                      [ M.read (| carrot |) ]
                    |)
                  ]
                |)
              ]
            |)
          |) in
        let cooked_potato :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::process", [] |),
              [ M.read (| potato |) ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::eat", [] |),
              [ M.read (| cooked_apple |) ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::eat", [] |),
              [ M.read (| cooked_carrot |) ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "combinators_map::eat", [] |),
              [ M.read (| cooked_potato |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
