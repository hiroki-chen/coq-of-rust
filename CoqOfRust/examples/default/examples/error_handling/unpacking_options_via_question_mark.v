(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Person.
Section Person.
  Record t : Set := {
    job : core.option.Option.t unpacking_options_via_question_mark.Job.t;
  }.
  
  Definition Get_job :=
    Ref.map (fun α => Some α.(job)) (fun β α => Some (α <| job := β |>)).
End Person.
End Person.

Module  Job.
Section Job.
  Record t : Set := {
    phone_number :
      core.option.Option.t unpacking_options_via_question_mark.PhoneNumber.t;
  }.
  
  Definition Get_phone_number :=
    Ref.map
      (fun α => Some α.(phone_number))
      (fun β α => Some (α <| phone_number := β |>)).
End Job.
End Job.

Module  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
Section Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
  Definition Self : Set := unpacking_options_via_question_mark.Job.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M unpacking_options_via_question_mark.Job.t :=
    let* self := M.alloc self in
    let* α0 : M.Val unpacking_options_via_question_mark.Job.t :=
      match_operator
        (DeclaredButUndefinedVariable
          (A :=
            core.clone.AssertParamIsClone.t
              (core.option.Option.t
                unpacking_options_via_question_mark.PhoneNumber.t)))
        [
          fun γ =>
            (let* α0 : ref unpacking_options_via_question_mark.Job.t :=
              M.read self in
            M.pure (deref α0)) :
            M (M.Val unpacking_options_via_question_mark.Job.t)
        ] in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.

Module  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
Section Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
  Definition Self : Set := unpacking_options_via_question_mark.Job.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.

Module  PhoneNumber.
Section PhoneNumber.
  Record t : Set := {
    area_code : core.option.Option.t u8.t;
    number : u32.t;
  }.
  
  Definition Get_area_code :=
    Ref.map
      (fun α => Some α.(area_code))
      (fun β α => Some (α <| area_code := β |>)).
  Definition Get_number :=
    Ref.map (fun α => Some α.(number)) (fun β α => Some (α <| number := β |>)).
End PhoneNumber.
End PhoneNumber.

Module  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
Section Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
  Definition Self : Set := unpacking_options_via_question_mark.PhoneNumber.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M unpacking_options_via_question_mark.PhoneNumber.t :=
    let* self := M.alloc self in
    let* α0 : M.Val unpacking_options_via_question_mark.PhoneNumber.t :=
      match_operator
        (DeclaredButUndefinedVariable
          (A := core.clone.AssertParamIsClone.t (core.option.Option.t u8.t)))
        [
          fun γ =>
            (match_operator
              (DeclaredButUndefinedVariable
                (A := core.clone.AssertParamIsClone.t u32.t))
              [
                fun γ =>
                  (let* α0 :
                      ref unpacking_options_via_question_mark.PhoneNumber.t :=
                    M.read self in
                  M.pure (deref α0)) :
                  M (M.Val unpacking_options_via_question_mark.PhoneNumber.t)
              ]) :
            M (M.Val unpacking_options_via_question_mark.PhoneNumber.t)
        ] in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.

Module  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
Section Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
  Definition Self : Set := unpacking_options_via_question_mark.PhoneNumber.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.

Module  Impl_unpacking_options_via_question_mark_Person_t.
Section Impl_unpacking_options_via_question_mark_Person_t.
  Definition Self : Set := unpacking_options_via_question_mark.Person.t.
  
  (*
      fn work_phone_area_code(&self) -> Option<u8> {
          // This would need many nested `match` statements without the `?` operator.
          // It would take a lot more code - try writing it yourself and see which
          // is easier.
          self.job?.phone_number?.area_code
      }
  *)
  Definition work_phone_area_code
      (self : ref Self)
      : M (core.option.Option.t u8.t) :=
    let* self := M.alloc self in
    let return_ := M.return_ (R := core.option.Option.t u8.t) in
    M.catch_return
      (let* α0 :
          (core.option.Option.t
              unpacking_options_via_question_mark.PhoneNumber.t)
            ->
            M (core.ops.control_flow.ControlFlow.t _ _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.try_trait.Try.branch
            (Self :=
              core.option.Option.t
                unpacking_options_via_question_mark.PhoneNumber.t)
            (Trait := ℐ))) in
      let* α1 :
          (core.option.Option.t unpacking_options_via_question_mark.Job.t) ->
            M (core.ops.control_flow.ControlFlow.t _ _) :=
        ltac:(M.get_method (fun ℐ =>
          core.ops.try_trait.Try.branch
            (Self :=
              core.option.Option.t unpacking_options_via_question_mark.Job.t)
            (Trait := ℐ))) in
      let* α2 : ref unpacking_options_via_question_mark.Person.t :=
        M.read self in
      let* α3 :
          core.option.Option.t unpacking_options_via_question_mark.Job.t :=
        M.read
          (unpacking_options_via_question_mark.Person.Get_job (deref α2)) in
      let* α4 :
          core.ops.control_flow.ControlFlow.t
            (core.option.Option.t core.convert.Infallible.t)
            unpacking_options_via_question_mark.Job.t :=
        M.call (α1 α3) in
      let* α5 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.option.Option.t core.convert.Infallible.t)
              unpacking_options_via_question_mark.Job.t) :=
        M.alloc α4 in
      let* α6 : M.Val unpacking_options_via_question_mark.Job.t :=
        match_operator
          α5
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Break _ =>
                let γ0_0 := core.ops.control_flow.ControlFlow.Get_Break_0 γ in
                let* residual := M.copy γ0_0 in
                let* α0 :
                    (core.option.Option.t core.convert.Infallible.t) ->
                      M (core.option.Option.t u8.t) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.ops.try_trait.FromResidual.from_residual
                      (Self := core.option.Option.t u8.t)
                      (R := core.option.Option.t core.convert.Infallible.t)
                      (Trait := ℐ))) in
                let* α1 : core.option.Option.t core.convert.Infallible.t :=
                  M.read residual in
                let* α2 : core.option.Option.t u8.t := M.call (α0 α1) in
                let* α3 : M.Val never.t := return_ α2 in
                let* α4 := M.read α3 in
                let* α5 : unpacking_options_via_question_mark.Job.t :=
                  never_to_any α4 in
                M.alloc α5
              | _ => M.break_match
              end) :
              M (M.Val unpacking_options_via_question_mark.Job.t);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Continue _ =>
                let γ0_0 :=
                  core.ops.control_flow.ControlFlow.Get_Continue_0 γ in
                let* val := M.copy γ0_0 in
                M.pure val
              | _ => M.break_match
              end) :
              M (M.Val unpacking_options_via_question_mark.Job.t)
          ] in
      let* α7 :
          core.option.Option.t
            unpacking_options_via_question_mark.PhoneNumber.t :=
        M.read (unpacking_options_via_question_mark.Job.Get_phone_number α6) in
      let* α8 :
          core.ops.control_flow.ControlFlow.t
            (core.option.Option.t core.convert.Infallible.t)
            unpacking_options_via_question_mark.PhoneNumber.t :=
        M.call (α0 α7) in
      let* α9 :
          M.Val
            (core.ops.control_flow.ControlFlow.t
              (core.option.Option.t core.convert.Infallible.t)
              unpacking_options_via_question_mark.PhoneNumber.t) :=
        M.alloc α8 in
      let* α10 : M.Val unpacking_options_via_question_mark.PhoneNumber.t :=
        match_operator
          α9
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Break _ =>
                let γ0_0 := core.ops.control_flow.ControlFlow.Get_Break_0 γ in
                let* residual := M.copy γ0_0 in
                let* α0 :
                    (core.option.Option.t core.convert.Infallible.t) ->
                      M (core.option.Option.t u8.t) :=
                  ltac:(M.get_method (fun ℐ =>
                    core.ops.try_trait.FromResidual.from_residual
                      (Self := core.option.Option.t u8.t)
                      (R := core.option.Option.t core.convert.Infallible.t)
                      (Trait := ℐ))) in
                let* α1 : core.option.Option.t core.convert.Infallible.t :=
                  M.read residual in
                let* α2 : core.option.Option.t u8.t := M.call (α0 α1) in
                let* α3 : M.Val never.t := return_ α2 in
                let* α4 := M.read α3 in
                let* α5 : unpacking_options_via_question_mark.PhoneNumber.t :=
                  never_to_any α4 in
                M.alloc α5
              | _ => M.break_match
              end) :
              M (M.Val unpacking_options_via_question_mark.PhoneNumber.t);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.ops.control_flow.ControlFlow.Continue _ =>
                let γ0_0 :=
                  core.ops.control_flow.ControlFlow.Get_Continue_0 γ in
                let* val := M.copy γ0_0 in
                M.pure val
              | _ => M.break_match
              end) :
              M (M.Val unpacking_options_via_question_mark.PhoneNumber.t)
          ] in
      M.read
        (unpacking_options_via_question_mark.PhoneNumber.Get_area_code α10)).
  
  Global Instance AssociatedFunction_work_phone_area_code :
    Notations.DoubleColon Self "work_phone_area_code" := {
    Notations.double_colon := work_phone_area_code;
  }.
End Impl_unpacking_options_via_question_mark_Person_t.
End Impl_unpacking_options_via_question_mark_Person_t.

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
Definition main : M unit :=
  let* p : M.Val unpacking_options_via_question_mark.Person.t :=
    M.alloc
      {|
        unpacking_options_via_question_mark.Person.job :=
          core.option.Option.Some
            {|
              unpacking_options_via_question_mark.Job.phone_number :=
                core.option.Option.Some
                  {|
                    unpacking_options_via_question_mark.PhoneNumber.area_code :=
                      core.option.Option.Some ((Integer.of_Z 61) : u8.t);
                    unpacking_options_via_question_mark.PhoneNumber.number :=
                      (Integer.of_Z 439222222) : u32.t;
                  |};
            |};
      |} in
  let* _ : M.Val unit :=
    let* α0 : core.option.Option.t u8.t :=
      M.call
        (unpacking_options_via_question_mark.Person.t::["work_phone_area_code"]
          (borrow p)) in
    let* α1 : M.Val (core.option.Option.t u8.t) := M.alloc α0 in
    let* α2 : M.Val (core.option.Option.t u8.t) :=
      M.alloc (core.option.Option.Some ((Integer.of_Z 61) : u8.t)) in
    let* α3 :
        M.Val
          ((ref (core.option.Option.t u8.t))
          *
          (ref (core.option.Option.t u8.t))) :=
      M.alloc (borrow α1, borrow α2) in
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
            let* α0 :
                (ref (core.option.Option.t u8.t)) ->
                  (ref (core.option.Option.t u8.t)) ->
                  M bool.t :=
              ltac:(M.get_method (fun ℐ =>
                core.cmp.PartialEq.eq
                  (Self := core.option.Option.t u8.t)
                  (Rhs := core.option.Option.t u8.t)
                  (Trait := ℐ))) in
            let* α1 : ref (core.option.Option.t u8.t) := M.read left_val in
            let* α2 : ref (core.option.Option.t u8.t) := M.read right_val in
            let* α3 : bool.t := M.call (α0 α1 α2) in
            let* α4 : M.Val bool.t := M.alloc (UnOp.not α3) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 : ref (core.option.Option.t u8.t) := M.read left_val in
              let* α2 : ref (core.option.Option.t u8.t) := M.read right_val in
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
