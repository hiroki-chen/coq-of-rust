(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  EvenNumber.
Section EvenNumber.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
End EvenNumber.
End EvenNumber.

Module  Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber_t.
Section Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber_t.
  Definition Self : Set := try_from_and_try_into.EvenNumber.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "EvenNumber") in
    let* α2 : ref try_from_and_try_into.EvenNumber.t := M.read self in
    let* α3 : M.Val (ref i32.t) :=
      M.alloc (borrow (try_from_and_try_into.EvenNumber.Get_0 (deref α2))) in
    M.call
      (core.fmt.Formatter.t::["debug_tuple_field1_finish"]
        α0
        α1
        (pointer_coercion "Unsize" (borrow α3))).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber_t.
End Impl_core_fmt_Debug_for_try_from_and_try_into_EvenNumber_t.

Module  Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber_t.
Section Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber_t.
  Definition Self : Set := try_from_and_try_into.EvenNumber.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber_t.
End Impl_core_marker_StructuralPartialEq_for_try_from_and_try_into_EvenNumber_t.

Module  Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber_t.
Section Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber_t.
  Definition Self : Set := try_from_and_try_into.EvenNumber.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref Self)
      (other : ref try_from_and_try_into.EvenNumber.t)
      : M bool.t :=
    let* self := M.alloc self in
    let* other := M.alloc other in
    let* α0 : ref try_from_and_try_into.EvenNumber.t := M.read self in
    let* α1 : i32.t :=
      M.read (try_from_and_try_into.EvenNumber.Get_0 (deref α0)) in
    let* α2 : ref try_from_and_try_into.EvenNumber.t := M.read other in
    let* α3 : i32.t :=
      M.read (try_from_and_try_into.EvenNumber.Get_0 (deref α2)) in
    M.pure (BinOp.Pure.eq α1 α3).
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber_t.
End Impl_core_cmp_PartialEq_for_try_from_and_try_into_EvenNumber_t.

Module  Impl_core_convert_TryFrom_i32_t_for_try_from_and_try_into_EvenNumber_t.
Section Impl_core_convert_TryFrom_i32_t_for_try_from_and_try_into_EvenNumber_t.
  Definition Self : Set := try_from_and_try_into.EvenNumber.t.
  
  (*
      type Error = ();
  *)
  Definition Error : Set := unit.
  
  (*
      fn try_from(value: i32) -> Result<Self, Self::Error> {
          if value % 2 == 0 {
              Ok(EvenNumber(value))
          } else {
              Err(())
          }
      }
  *)
  Definition try_from (value : i32.t) : M (core.result.Result.t Self Error) :=
    let* value := M.alloc value in
    let* α0 : i32.t := M.read value in
    let* α1 : i32.t := BinOp.Panic.rem α0 ((Integer.of_Z 2) : i32.t) in
    let* α2 : M.Val bool.t :=
      M.alloc (BinOp.Pure.eq α1 ((Integer.of_Z 0) : i32.t)) in
    let* α3 : bool.t := M.read (use α2) in
    let* α4 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      if α3 then
        let* α0 : i32.t := M.read value in
        M.alloc
          (core.result.Result.Ok (try_from_and_try_into.EvenNumber.Build_t α0))
      else
        M.alloc (core.result.Result.Err tt) in
    M.read α4.
  
  Global Instance AssociatedFunction_try_from :
    Notations.DoubleColon Self "try_from" := {
    Notations.double_colon := try_from;
  }.
  
  Global Instance ℐ : core.convert.TryFrom.Trait Self (T := i32.t) := {
    core.convert.TryFrom.Error := Error;
    core.convert.TryFrom.try_from := try_from;
  }.
End Impl_core_convert_TryFrom_i32_t_for_try_from_and_try_into_EvenNumber_t.
End Impl_core_convert_TryFrom_i32_t_for_try_from_and_try_into_EvenNumber_t.

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
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* α0 :
        i32.t ->
          M (core.result.Result.t try_from_and_try_into.EvenNumber.t _) :=
      ltac:(M.get_method (fun ℐ =>
        core.convert.TryFrom.try_from
          (Self := try_from_and_try_into.EvenNumber.t)
          (T := i32.t)
          (Trait := ℐ))) in
    let* α1 : core.result.Result.t try_from_and_try_into.EvenNumber.t unit :=
      M.call (α0 ((Integer.of_Z 8) : i32.t)) in
    let* α2 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc α1 in
    let* α3 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc
        (core.result.Result.Ok
          (try_from_and_try_into.EvenNumber.Build_t
            ((Integer.of_Z 8) : i32.t))) in
    let* α4 :
        M.Val
          ((ref (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))
          *
          (ref
            (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))) :=
      M.alloc (borrow α2, borrow α3) in
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
            let* α0 :
                (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  M bool.t :=
              ltac:(M.get_method (fun ℐ =>
                core.cmp.PartialEq.eq
                  (Self :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Rhs :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Trait := ℐ))) in
            let* α1 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read left_val in
            let* α2 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read right_val in
            let* α3 : bool.t := M.call (α0 α1 α2) in
            let* α4 : M.Val bool.t := M.alloc (UnOp.not α3) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read left_val in
              let* α2 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* _ : M.Val unit :=
    let* α0 :
        i32.t ->
          M (core.result.Result.t try_from_and_try_into.EvenNumber.t _) :=
      ltac:(M.get_method (fun ℐ =>
        core.convert.TryFrom.try_from
          (Self := try_from_and_try_into.EvenNumber.t)
          (T := i32.t)
          (Trait := ℐ))) in
    let* α1 : core.result.Result.t try_from_and_try_into.EvenNumber.t unit :=
      M.call (α0 ((Integer.of_Z 5) : i32.t)) in
    let* α2 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc α1 in
    let* α3 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc (core.result.Result.Err tt) in
    let* α4 :
        M.Val
          ((ref (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))
          *
          (ref
            (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))) :=
      M.alloc (borrow α2, borrow α3) in
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
            let* α0 :
                (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  M bool.t :=
              ltac:(M.get_method (fun ℐ =>
                core.cmp.PartialEq.eq
                  (Self :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Rhs :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Trait := ℐ))) in
            let* α1 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read left_val in
            let* α2 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read right_val in
            let* α3 : bool.t := M.call (α0 α1 α2) in
            let* α4 : M.Val bool.t := M.alloc (UnOp.not α3) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read left_val in
              let* α2 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* result :
      M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
    let* α0 :
        i32.t ->
          M (core.result.Result.t try_from_and_try_into.EvenNumber.t _) :=
      ltac:(M.get_method (fun ℐ =>
        core.convert.TryInto.try_into
          (Self := i32.t)
          (T := try_from_and_try_into.EvenNumber.t)
          (Trait := ℐ))) in
    let* α1 : core.result.Result.t try_from_and_try_into.EvenNumber.t unit :=
      M.call (α0 ((Integer.of_Z 8) : i32.t)) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc
        (core.result.Result.Ok
          (try_from_and_try_into.EvenNumber.Build_t
            ((Integer.of_Z 8) : i32.t))) in
    let* α1 :
        M.Val
          ((ref (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))
          *
          (ref
            (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))) :=
      M.alloc (borrow result, borrow α0) in
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
            let* α0 :
                (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  M bool.t :=
              ltac:(M.get_method (fun ℐ =>
                core.cmp.PartialEq.eq
                  (Self :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Rhs :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Trait := ℐ))) in
            let* α1 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read left_val in
            let* α2 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read right_val in
            let* α3 : bool.t := M.call (α0 α1 α2) in
            let* α4 : M.Val bool.t := M.alloc (UnOp.not α3) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read left_val in
              let* α2 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* result :
      M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
    let* α0 :
        i32.t ->
          M (core.result.Result.t try_from_and_try_into.EvenNumber.t _) :=
      ltac:(M.get_method (fun ℐ =>
        core.convert.TryInto.try_into
          (Self := i32.t)
          (T := try_from_and_try_into.EvenNumber.t)
          (Trait := ℐ))) in
    let* α1 : core.result.Result.t try_from_and_try_into.EvenNumber.t unit :=
      M.call (α0 ((Integer.of_Z 5) : i32.t)) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* α0 :
        M.Val (core.result.Result.t try_from_and_try_into.EvenNumber.t unit) :=
      M.alloc (core.result.Result.Err tt) in
    let* α1 :
        M.Val
          ((ref (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))
          *
          (ref
            (core.result.Result.t try_from_and_try_into.EvenNumber.t unit))) :=
      M.alloc (borrow result, borrow α0) in
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
            let* α0 :
                (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  (ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit))
                  ->
                  M bool.t :=
              ltac:(M.get_method (fun ℐ =>
                core.cmp.PartialEq.eq
                  (Self :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Rhs :=
                    core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit)
                  (Trait := ℐ))) in
            let* α1 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read left_val in
            let* α2 :
                ref
                  (core.result.Result.t
                    try_from_and_try_into.EvenNumber.t
                    unit) :=
              M.read right_val in
            let* α3 : bool.t := M.call (α0 α1 α2) in
            let* α4 : M.Val bool.t := M.alloc (UnOp.not α3) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read left_val in
              let* α2 :
                  ref
                    (core.result.Result.t
                      try_from_and_try_into.EvenNumber.t
                      unit) :=
                M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
