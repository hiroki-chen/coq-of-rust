(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Container";
    ty_params := [];
    fields := [ Ty.path "i32"; Ty.path "i32" ];
  } *)

(* Trait *)
(* Empty module 'Contains' *)

Module Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.
  Definition Self : Ty.t := Ty.path "generics_associated_types_problem::Container".
  
  (*
      fn contains(&self, number_1: &i32, number_2: &i32) -> bool {
          (&self.0 == number_1) && (&self.1 == number_2)
      }
  *)
  Definition contains (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; number_1; number_2 ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let number_1 := M.alloc (| number_1 |) in
        let number_2 := M.alloc (| number_2 |) in
        LogicalOp.and (|
          M.call_closure (|
            M.get_trait_method (|
              "core::cmp::PartialEq",
              Ty.apply (Ty.path "&") [ Ty.path "i32" ],
              [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ],
              "eq",
              []
            |),
            [
              M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "generics_associated_types_problem::Container",
                  0
                |)
              |);
              number_1
            ]
          |),
          ltac:(M.monadic
            (M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "&") [ Ty.path "i32" ],
                [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ],
                "eq",
                []
              |),
              [
                M.alloc (|
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| self |),
                    "generics_associated_types_problem::Container",
                    1
                  |)
                |);
                number_2
              ]
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn first(&self) -> i32 {
          self.0
      }
  *)
  Definition first (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_tuple_field (|
            M.read (| self |),
            "generics_associated_types_problem::Container",
            0
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn last(&self) -> i32 {
          self.1
      }
  *)
  Definition last (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_tuple_field (|
            M.read (| self |),
            "generics_associated_types_problem::Container",
            1
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_associated_types_problem::Contains"
      Self
      (* Trait polymorphic types *) [ (* A *) Ty.path "i32"; (* B *) Ty.path "i32" ]
      (* Instance *)
      [
        ("contains", InstanceField.Method contains);
        ("first", InstanceField.Method first);
        ("last", InstanceField.Method last)
      ].
End Impl_generics_associated_types_problem_Contains_i32_i32_for_generics_associated_types_problem_Container.

(*
fn difference<A, B, C>(container: &C) -> i32
where
    C: Contains<A, B>,
{
    container.last() - container.first()
}
*)
Definition difference (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ A; B; C ], [ container ] =>
    ltac:(M.monadic
      (let container := M.alloc (| container |) in
      BinOp.Wrap.sub
        Integer.I32
        (M.call_closure (|
          M.get_trait_method (|
            "generics_associated_types_problem::Contains",
            C,
            [ A; B ],
            "last",
            []
          |),
          [ M.read (| container |) ]
        |))
        (M.call_closure (|
          M.get_trait_method (|
            "generics_associated_types_problem::Contains",
            C,
            [ A; B ],
            "first",
            []
          |),
          [ M.read (| container |) ]
        |))))
  | _, _ => M.impossible
  end.

Axiom Function_difference : M.IsFunction "generics_associated_types_problem::difference" difference.

(*
fn main() {
    let number_1 = 3;
    let number_2 = 10;

    let container = Container(number_1, number_2);

    println!(
        "Does container contain {} and {}: {}",
        &number_1,
        &number_2,
        container.contains(&number_1, &number_2)
    );
    println!("First number: {}", container.first());
    println!("Last number: {}", container.last());

    println!("The difference is: {}", difference(&container));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ number_1 := M.alloc (| Value.Integer 3 |) in
        let~ number_2 := M.alloc (| Value.Integer 10 |) in
        let~ container :=
          M.alloc (|
            Value.StructTuple
              "generics_associated_types_problem::Container"
              [ M.read (| number_1 |); M.read (| number_2 |) ]
          |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "Does container contain " |);
                              M.read (| Value.String " and " |);
                              M.read (| Value.String ": " |);
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
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                                |),
                                [ M.alloc (| number_1 |) ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                                |),
                                [ M.alloc (| number_2 |) ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.path "bool" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "generics_associated_types_problem::Contains",
                                        Ty.path "generics_associated_types_problem::Container",
                                        [ Ty.path "i32"; Ty.path "i32" ],
                                        "contains",
                                        []
                                      |),
                                      [ container; number_1; number_2 ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "First number: " |);
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
                                  "new_display",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "generics_associated_types_problem::Contains",
                                        Ty.path "generics_associated_types_problem::Container",
                                        [ Ty.path "i32"; Ty.path "i32" ],
                                        "first",
                                        []
                                      |),
                                      [ container ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "Last number: " |);
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
                                  "new_display",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "generics_associated_types_problem::Contains",
                                        Ty.path "generics_associated_types_problem::Container",
                                        [ Ty.path "i32"; Ty.path "i32" ],
                                        "last",
                                        []
                                      |),
                                      [ container ]
                                    |)
                                  |)
                                ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "The difference is: " |);
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
                                  "new_display",
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "generics_associated_types_problem::difference",
                                        [
                                          Ty.path "i32";
                                          Ty.path "i32";
                                          Ty.path "generics_associated_types_problem::Container"
                                        ]
                                      |),
                                      [ container ]
                                    |)
                                  |)
                                ]
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

Axiom Function_main : M.IsFunction "generics_associated_types_problem::main" main.
