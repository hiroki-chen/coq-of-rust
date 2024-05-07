(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "EvenNumber";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
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
            M.read (| Value.String "EvenNumber" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "try_from_and_try_into::EvenNumber",
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
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  (* PartialEq *)
  Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        BinOp.Pure.eq
          (M.read (|
            M.SubPointer.get_struct_tuple_field (|
              M.read (| self |),
              "try_from_and_try_into::EvenNumber",
              0
            |)
          |))
          (M.read (|
            M.SubPointer.get_struct_tuple_field (|
              M.read (| other |),
              "try_from_and_try_into::EvenNumber",
              0
            |)
          |))))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.
  Definition Self : Ty.t := Ty.path "try_from_and_try_into::EvenNumber".
  
  (*     type Error = (); *)
  Definition _Error : Ty.t := Ty.tuple [].
  
  (*
      fn try_from(value: i32) -> Result<Self, Self::Error> {
          if value % 2 == 0 {
              Ok(EvenNumber(value))
          } else {
              Err(())
          }
      }
  *)
  Definition try_from (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ value ] =>
      ltac:(M.monadic
        (let value := M.alloc (| value |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        BinOp.Pure.eq
                          (BinOp.Panic.rem (| Integer.I32, M.read (| value |), Value.Integer 2 |))
                          (Value.Integer 0)
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [ Value.StructTuple "try_from_and_try_into::EvenNumber" [ M.read (| value |) ]
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (| Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ] |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::TryFrom"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *)
      [ ("Error", InstanceField.Ty _Error); ("try_from", InstanceField.Method try_from) ].
End Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.

(*
fn main() {
    // TryFrom

    assert_eq!(EvenNumber::try_from(8), Ok(EvenNumber(8)));
    assert_eq!(EvenNumber::try_from(5), Err(()));

    // TryInto

    let result: Result<EvenNumber, ()> = 8i32.try_into();
    assert_eq!(result, Ok(EvenNumber(8)));
    let result: Result<EvenNumber, ()> = 5i32.try_into();
    assert_eq!(result, Err(()));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::convert::TryFrom",
                        Ty.path "try_from_and_try_into::EvenNumber",
                        [ Ty.path "i32" ],
                        "try_from",
                        []
                      |),
                      [ Value.Integer 8 ]
                    |)
                  |);
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [ Value.StructTuple "try_from_and_try_into::EvenNumber" [ Value.Integer 8 ] ]
                  |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                        ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ];
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::convert::TryFrom",
                        Ty.path "try_from_and_try_into::EvenNumber",
                        [ Ty.path "i32" ],
                        "try_from",
                        []
                      |),
                      [ Value.Integer 5 ]
                    |)
                  |);
                  M.alloc (| Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ] |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                        ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ];
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        let result :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::TryInto",
                Ty.path "i32",
                [ Ty.path "try_from_and_try_into::EvenNumber" ],
                "try_into",
                []
              |),
              [ Value.Integer 8 ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  result;
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [ Value.StructTuple "try_from_and_try_into::EvenNumber" [ Value.Integer 8 ] ]
                  |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                        ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ];
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        let result :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::TryInto",
                Ty.path "i32",
                [ Ty.path "try_from_and_try_into::EvenNumber" ],
                "try_into",
                []
              |),
              [ Value.Integer 5 ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  result;
                  M.alloc (| Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ] |)
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                        ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ];
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          [ Ty.path "try_from_and_try_into::EvenNumber"; Ty.tuple []
                                          ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
