(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn matching(tuple: (i32, i32)) -> i32 {
    match tuple {
        (0, 0) => 0,
        (_, _) => 1,
    }
}
*)
Definition matching (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ tuple ] =>
    ltac:(M.monadic
      (let tuple := M.alloc (| tuple |) in
      M.read (|
        M.match_operator (|
          tuple,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_0 |), Value.Integer 0 |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ0_1 |), Value.Integer 0 |) in
                M.alloc (| Value.Integer 0 |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                M.alloc (| Value.Integer 1 |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_matching : M.IsFunction "constructor_as_function::matching" matching.

(* StructTuple
  {
    name := "Constructor";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_constructor_as_function_Constructor.
  Definition Self : Ty.t := Ty.path "constructor_as_function::Constructor".
  
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
            M.read (| Value.String "Constructor" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "constructor_as_function::Constructor",
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
End Impl_core_fmt_Debug_for_constructor_as_function_Constructor.

(*
fn main() {
    let v: Vec<_> = vec![1, 2, 3].into_iter().map(Constructor).collect();

    println!("{v:?}");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let v :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                Ty.apply
                  (Ty.path "core::iter::adapters::map::Map")
                  [
                    Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                    Ty.function [ Ty.path "i32" ] (Ty.path "constructor_as_function::Constructor")
                  ],
                [],
                "collect",
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "constructor_as_function::Constructor"; Ty.path "alloc::alloc::Global"
                    ]
                ]
              |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::iterator::Iterator",
                    Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                    [],
                    "map",
                    [
                      Ty.path "constructor_as_function::Constructor";
                      Ty.function [ Ty.path "i32" ] (Ty.path "constructor_as_function::Constructor")
                    ]
                  |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::collect::IntoIterator",
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                        [],
                        "into_iter",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                            "into_vec",
                            [ Ty.path "alloc::alloc::Global" ]
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.read (|
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                                        Ty.path "alloc::alloc::Global"
                                      ],
                                    "new",
                                    []
                                  |),
                                  [
                                    M.alloc (|
                                      Value.Array
                                        [ Value.Integer 1; Value.Integer 2; Value.Integer 3 ]
                                    |)
                                  ]
                                |)
                              |))
                          ]
                        |)
                      ]
                    |);
                    M.constructor_as_closure "constructor_as_function::Constructor"
                  ]
                |)
              ]
            |)
          |) in
        let _ :=
          let _ :=
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
                            [ M.read (| Value.String "" |); M.read (| Value.String "
" |) ]
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
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::vec::Vec")
                                      [
                                        Ty.path "constructor_as_function::Constructor";
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ]
                                |),
                                [ v ]
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

Axiom Function_main : M.IsFunction "constructor_as_function::main" main.
