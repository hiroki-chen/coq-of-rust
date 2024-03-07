(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum PhoneNumber *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          [
            fun γ =>
              (match_operator
                Value.DeclaredButUndefined
                [
                  fun γ =>
                    (let* α0 := M.read self in
                    M.pure (deref α0)) :
                    Ty.path "unpacking_options_via_question_mark::PhoneNumber"
                ]) :
              Ty.path "unpacking_options_via_question_mark::PhoneNumber"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::PhoneNumber")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::PhoneNumber")
      []
      [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

(* Enum Job *)

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.path "unpacking_options_via_question_mark::Job"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::Job")
      []
      [ ("clone", InstanceField.Method clone []) ].
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "unpacking_options_via_question_mark::Job")
      []
      [].
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

(* Enum Person *)

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self : Ty.t :=
    Ty.path "unpacking_options_via_question_mark::Person".
  
  (*
      fn work_phone_area_code(&self) -> Option<u8> {
          // This would need many nested `match` statements without the `?` operator.
          // It would take a lot more code - try writing it yourself and see which
          // is easier.
          self.job?.phone_number?.area_code
      }
  *)
  Definition work_phone_area_code (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let return_ :=
        M.return_
          (R := Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]) in
      M.catch_return
        (let* α0 :=
          M.var
            "unpacking_options_via_question_mark::PhoneNumber::Get_area_code" in
        let* α1 :=
          M.get_method
            "core::ops::try_trait::Try"
            "branch"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.path "unpacking_options_via_question_mark::PhoneNumber" ]
            ] in
        let* α2 :=
          M.var "unpacking_options_via_question_mark::Job::Get_phone_number" in
        let* α3 :=
          M.get_method
            "core::ops::try_trait::Try"
            "branch"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.path "unpacking_options_via_question_mark::Job" ]
            ] in
        let* α4 :=
          M.var "unpacking_options_via_question_mark::Person::Get_job" in
        let* α5 := M.read self in
        let* α6 := M.read (α4 (deref α5)) in
        let* α7 := M.call α3 [ α6 ] in
        let* α8 := M.alloc α7 in
        let* α9 :=
          match_operator
            α8
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::option::Option")
                            [ Ty.path "u8" ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::option::Option")
                            [ Ty.path "core::convert::Infallible" ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end) :
                Ty.path "unpacking_options_via_question_mark::Job";
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end) :
                Ty.path "unpacking_options_via_question_mark::Job"
            ] in
        let* α10 := M.read (α2 α9) in
        let* α11 := M.call α1 [ α10 ] in
        let* α12 := M.alloc α11 in
        let* α13 :=
          match_operator
            α12
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::option::Option")
                            [ Ty.path "u8" ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::option::Option")
                            [ Ty.path "core::convert::Infallible" ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end) :
                Ty.path "unpacking_options_via_question_mark::PhoneNumber";
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end) :
                Ty.path "unpacking_options_via_question_mark::PhoneNumber"
            ] in
        M.read (α0 α13))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_work_phone_area_code :
    M.IsAssociatedFunction Self "work_phone_area_code" work_phone_area_code [].
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* p :=
      M.alloc
        (Value.StructRecord
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
                                    [ (Integer.of_Z 61) : Ty.path "u8" ]);
                                ("number",
                                  (Integer.of_Z 439222222) : Ty.path "u32")
                              ]
                          ])
                    ]
                ])
          ]) in
    let* _ :=
      let* α0 :=
        M.call
          (Ty.path
              "unpacking_options_via_question_mark::Person")::["work_phone_area_code"]
          [ borrow p ] in
      let* α1 := M.alloc α0 in
      let* α2 :=
        M.alloc
          (Value.StructTuple
            "core::option::Option::Some"
            [ (Integer.of_Z 61) : Ty.path "u8" ]) in
      let* α3 := M.alloc (borrow α1, borrow α2) in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 := M.var "UnOp::not" in
              let* α1 :=
                M.get_method
                  "core::cmp::PartialEq"
                  "eq"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "u8" ];
                    (* Rhs *)
                      Ty.apply (Ty.path "core::option::Option") [ Ty.path "u8" ]
                  ] in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 := M.call α1 [ α2; α3 ] in
              let* α5 := M.alloc (α0 α4) in
              let* α6 := M.read (use α5) in
              if α6 then
                let* kind := M.alloc core.panicking.AssertKind.Eq in
                let* α0 := M.var "core::panicking::assert_failed" in
                let* α1 := M.read kind in
                let* α2 := M.read left_val in
                let* α3 := M.read right_val in
                let* α4 := M.call α0 [ α1; α2; α3; core.option.Option.None ] in
                let* α0 := M.alloc α4 in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            Ty.tuple []
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
