(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct EvenNumber *)

Module Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "EvenNumber") in
      let* α2 := M.var "try_from_and_try_into::EvenNumber::Get_0" in
      let* α3 := M.read self in
      let* α4 := M.alloc (borrow (α2 (deref α3))) in
      M.call
        (Ty.path "core::fmt::Formatter")::["debug_tuple_field1_finish"]
        [ α0; α1; pointer_coercion "Unsize" (borrow α4) ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      []
      [ ("fmt", InstanceField.Method fmt []) ].
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber.

Module Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      []
      [].
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 := M.var "BinOp::Pure::eq" in
      let* α1 := M.var "try_from_and_try_into::EvenNumber::Get_0" in
      let* α2 := M.read self in
      let* α3 := M.read (α1 (deref α2)) in
      let* α4 := M.var "try_from_and_try_into::EvenNumber::Get_0" in
      let* α5 := M.read other in
      let* α6 := M.read (α4 (deref α5)) in
      M.pure (α0 α3 α6)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      []
      [ ("eq", InstanceField.Method eq []) ].
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber.

Module Impl_core_convert_TryFrom_i32_for_try_from_and_try_into_EvenNumber.
  (*
      type Error = ();
  *)
  Definition Error : Set := Ty.tuple [].
  
  (*
      fn try_from(value: i32) -> Result<Self, Self::Error> {
          if value % 2 == 0 {
              Ok(EvenNumber(value))
          } else {
              Err(())
          }
      }
  *)
  Definition try_from (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.var "BinOp::Pure::eq" in
      let* α1 := M.var "BinOp::Panic::rem" in
      let* α2 := M.read value in
      let* α3 := α1 α2 ((Integer.of_Z 2) : Ty.path "i32") in
      let* α4 := M.alloc (α0 α3 ((Integer.of_Z 0) : Ty.path "i32")) in
      let* α5 := M.read (use α4) in
      let* α6 :=
        if α5 then
          let* α0 := M.read value in
          M.alloc
            (Value.StructTuple
              "core::result::Result::Ok"
              [ Value.StructTuple "try_from_and_try_into::EvenNumber" [ α0 ] ])
        else
          M.alloc (Value.StructTuple "core::result::Result::Err" [ tt ]) in
      M.read α6
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::TryFrom"
      (* Self *) (Ty.path "try_from_and_try_into::EvenNumber")
      [ (* T *) Ty.path "i32" ]
      [ ("Error", TODO); ("try_from", InstanceField.Method try_from []) ].
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_method
          "core::convert::TryFrom"
          "try_from"
          [
            (* Self *) Ty.path "try_from_and_try_into::EvenNumber";
            (* T *) Ty.path "i32"
          ] in
      let* α1 := M.call α0 [ (Integer.of_Z 8) : Ty.path "i32" ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.alloc
          (Value.StructTuple
            "core::result::Result::Ok"
            [
              Value.StructTuple
                "try_from_and_try_into::EvenNumber"
                [ (Integer.of_Z 8) : Ty.path "i32" ]
            ]) in
      let* α4 := M.alloc (borrow α2, borrow α3) in
      match_operator
        α4
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
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ]
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
    let* _ :=
      let* α0 :=
        M.get_method
          "core::convert::TryFrom"
          "try_from"
          [
            (* Self *) Ty.path "try_from_and_try_into::EvenNumber";
            (* T *) Ty.path "i32"
          ] in
      let* α1 := M.call α0 [ (Integer.of_Z 5) : Ty.path "i32" ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.alloc (Value.StructTuple "core::result::Result::Err" [ tt ]) in
      let* α4 := M.alloc (borrow α2, borrow α3) in
      match_operator
        α4
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
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ]
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
    let* result :=
      let* α0 :=
        M.get_method
          "core::convert::TryInto"
          "try_into"
          [
            (* Self *) Ty.path "i32";
            (* T *) Ty.path "try_from_and_try_into::EvenNumber"
          ] in
      let* α1 := M.call α0 [ (Integer.of_Z 8) : Ty.path "i32" ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.StructTuple
            "core::result::Result::Ok"
            [
              Value.StructTuple
                "try_from_and_try_into::EvenNumber"
                [ (Integer.of_Z 8) : Ty.path "i32" ]
            ]) in
      let* α1 := M.alloc (borrow result, borrow α0) in
      match_operator
        α1
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
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ]
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
    let* result :=
      let* α0 :=
        M.get_method
          "core::convert::TryInto"
          "try_into"
          [
            (* Self *) Ty.path "i32";
            (* T *) Ty.path "try_from_and_try_into::EvenNumber"
          ] in
      let* α1 := M.call α0 [ (Integer.of_Z 5) : Ty.path "i32" ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::result::Result::Err" [ tt ]) in
      let* α1 := M.alloc (borrow result, borrow α0) in
      match_operator
        α1
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
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ];
                    (* Rhs *)
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "try_from_and_try_into::EvenNumber";
                          Ty.tuple []
                        ]
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
