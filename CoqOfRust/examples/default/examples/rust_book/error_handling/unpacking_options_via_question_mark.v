(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "PhoneNumber";
    ty_params := [];
    fields :=
      [
        ("area_code", Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]);
        ("number", Ty.path "u32")
      ];
  } *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [
              fun γ =>
                ltac:(M.monadic
                  (M.match_operator (|
                    Value.DeclaredButUndefined,
                    [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::PhoneNumber".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

(* StructRecord
  {
    name := "Job";
    ty_params := [];
    fields :=
      [
        ("phone_number",
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_via_question_mark::PhoneNumber" ])
      ];
  } *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Job".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

(* StructRecord
  {
    name := "Person";
    ty_params := [];
    fields :=
      [
        ("job",
          Ty.apply
            (Ty.path "core::option::Option")
            [ Ty.path "unpacking_options_via_question_mark::Job" ])
      ];
  } *)

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self : Ty.t := Ty.path "unpacking_options_via_question_mark::Person".
  
  (*
      fn work_phone_area_code(&self) -> Option<u8> {
          // This would need many nested `match` statements without the `?` operator.
          // It would take a lot more code - try writing it yourself and see which
          // is easier.
          self.job?.phone_number?.area_code
      }
  *)
  Definition work_phone_area_code (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.catch_return (|
          ltac:(M.monadic
            (M.read (|
              M.SubPointer.get_struct_record_field (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::try_trait::Try",
                        Ty.apply
                          (Ty.path "core::option::Option")
                          [ Ty.path "unpacking_options_via_question_mark::PhoneNumber" ],
                        [],
                        "branch",
                        []
                      |),
                      [
                        M.read (|
                          M.SubPointer.get_struct_record_field (|
                            M.match_operator (|
                              M.alloc (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::try_trait::Try",
                                    Ty.apply
                                      (Ty.path "core::option::Option")
                                      [ Ty.path "unpacking_options_via_question_mark::Job" ],
                                    [],
                                    "branch",
                                    []
                                  |),
                                  [
                                    M.read (|
                                      M.SubPointer.get_struct_record_field (|
                                        M.read (| self |),
                                        "unpacking_options_via_question_mark::Person",
                                        "job"
                                      |)
                                    |)
                                  ]
                                |)
                              |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ0_0 :=
                                      M.SubPointer.get_struct_tuple_field (|
                                        γ,
                                        "core::ops::control_flow::ControlFlow::Break",
                                        0
                                      |) in
                                    let residual := M.copy (| γ0_0 |) in
                                    M.alloc (|
                                      M.never_to_any (|
                                        M.read (|
                                          M.return_ (|
                                            M.call_closure (|
                                              M.get_trait_method (|
                                                "core::ops::try_trait::FromResidual",
                                                Ty.apply
                                                  (Ty.path "core::option::Option")
                                                  [ Ty.path "u8" ],
                                                [
                                                  Ty.apply
                                                    (Ty.path "core::option::Option")
                                                    [ Ty.path "core::convert::Infallible" ]
                                                ],
                                                "from_residual",
                                                []
                                              |),
                                              [ M.read (| residual |) ]
                                            |)
                                          |)
                                        |)
                                      |)
                                    |)));
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ0_0 :=
                                      M.SubPointer.get_struct_tuple_field (|
                                        γ,
                                        "core::ops::control_flow::ControlFlow::Continue",
                                        0
                                      |) in
                                    let val := M.copy (| γ0_0 |) in
                                    val))
                              ]
                            |),
                            "unpacking_options_via_question_mark::Job",
                            "phone_number"
                          |)
                        |)
                      ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Break",
                            0
                          |) in
                        let residual := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::try_trait::FromResidual",
                                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ],
                                    [
                                      Ty.apply
                                        (Ty.path "core::option::Option")
                                        [ Ty.path "core::convert::Infallible" ]
                                    ],
                                    "from_residual",
                                    []
                                  |),
                                  [ M.read (| residual |) ]
                                |)
                              |)
                            |)
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Continue",
                            0
                          |) in
                        let val := M.copy (| γ0_0 |) in
                        val))
                  ]
                |),
                "unpacking_options_via_question_mark::PhoneNumber",
                "area_code"
              |)
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_work_phone_area_code :
    M.IsAssociatedFunction Self "work_phone_area_code" work_phone_area_code.
End Impl_unpacking_options_via_question_mark_Person.

(*
fn main() {
    let p = Person {
        job: Some(Job {
            phone_number: Some(PhoneNumber {
                area_code: Some(61),
                number: 439222222,
            }),
        }),
    };

    assert_eq!(p.work_phone_area_code(), Some(61));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ p :=
          M.alloc (|
            Value.StructRecord
              "unpacking_options_via_question_mark::Person"
              [
                ("job",
                  Value.StructTuple
                    "core::option::Option::Some"
                    [
                      Value.StructRecord
                        "unpacking_options_via_question_mark::Job"
                        [
                          ("phone_number",
                            Value.StructTuple
                              "core::option::Option::Some"
                              [
                                Value.StructRecord
                                  "unpacking_options_via_question_mark::PhoneNumber"
                                  [
                                    ("area_code",
                                      Value.StructTuple
                                        "core::option::Option::Some"
                                        [ Value.Integer 61 ]);
                                    ("number", Value.Integer 439222222)
                                  ]
                              ])
                        ]
                    ])
              ]
          |) in
        let~ _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "unpacking_options_via_question_mark::Person",
                        "work_phone_area_code",
                        []
                      |),
                      [ p ]
                    |)
                  |);
                  M.alloc (| Value.StructTuple "core::option::Option::Some" [ Value.Integer 61 ] |)
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
                                      Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ],
                                      [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]
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
                                let~ kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ];
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]
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

Axiom Function_main : M.IsFunction "unpacking_options_via_question_mark::main" main.
