(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Person.
Section Person.
  Record t : Set := {
    job : core.option.Option.t unpacking_options_via_question_mark.Job.t;
  }.
  
  Global Instance Get_job : Notation.Dot "job" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(job) : M _;
  }.
  Global Instance Get_AF_job : Notation.DoubleColon t "job" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(job) : M _;
  }.
End Person.
End Person.
Definition Person : Set := M.Val Person.t.

Module  Job.
Section Job.
  Record t : Set := {
    phone_number :
      core.option.Option.t unpacking_options_via_question_mark.PhoneNumber.t;
  }.
  
  Global Instance Get_phone_number : Notation.Dot "phone_number" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(phone_number) : M _;
  }.
  Global Instance Get_AF_phone_number :
    Notation.DoubleColon t "phone_number" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(phone_number) : M _;
  }.
End Job.
End Job.
Definition Job : Set := M.Val Job.t.

Module  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
Section Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
  Ltac Self := exact unpacking_options_via_question_mark.Job.t.
  
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val unpacking_options_via_question_mark.Job.t) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      deref self).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job_t.

Module  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
Section Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
  Ltac Self := exact unpacking_options_via_question_mark.Job.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job_t.

Module  PhoneNumber.
Section PhoneNumber.
  Record t : Set := {
    area_code : core.option.Option.t u8.t;
    number : u32.t;
  }.
  
  Global Instance Get_area_code : Notation.Dot "area_code" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(area_code) : M _;
  }.
  Global Instance Get_AF_area_code : Notation.DoubleColon t "area_code" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(area_code) : M _;
  }.
  Global Instance Get_number : Notation.Dot "number" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(number) : M _;
  }.
  Global Instance Get_AF_number : Notation.DoubleColon t "number" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(number) : M _;
  }.
End PhoneNumber.
End PhoneNumber.
Definition PhoneNumber : Set := M.Val PhoneNumber.t.

Module  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
Section Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
  Ltac Self := exact unpacking_options_via_question_mark.PhoneNumber.t.
  
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val unpacking_options_via_question_mark.PhoneNumber.t) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      deref self).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber_t.

Module  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
Section Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
  Ltac Self := exact unpacking_options_via_question_mark.PhoneNumber.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber_t.

Module  Impl_unpacking_options_via_question_mark_Person_t.
Section Impl_unpacking_options_via_question_mark_Person_t.
  Ltac Self := exact unpacking_options_via_question_mark.Person.t.
  
  Definition work_phone_area_code
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val (core.option.Option.t u8.t)) :=
    M.function_body
      (let* α0 :
          ltac:(refine (M.Val unpacking_options_via_question_mark.Person.t)) :=
        deref self in
      let* α1 :
          ltac:(refine
            (M.Val
              (core.option.Option.t
                unpacking_options_via_question_mark.Job.t))) :=
        α0.["job"] in
      let* α2 :
          ltac:(refine
            (M.Val
              (core.ops.control_flow.ControlFlow.t
                (core.option.Option.t core.convert.Infallible.t)
                unpacking_options_via_question_mark.Job.t))) :=
        (core.ops.try_trait.Try.branch
            (Self :=
              core.option.Option.t unpacking_options_via_question_mark.Job.t)
            (Trait := ltac:(refine _)))
          α1 in
      let* α3 := M.read α2 in
      let* α4 :
          ltac:(refine (M.Val unpacking_options_via_question_mark.Job.t)) :=
        match α3 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self := core.option.Option.t u8.t)
                (Trait := ltac:(refine _)))
              residual in
          let* α1 : ltac:(refine (M.Val never.t)) := M.return_ α0 in
          never_to_any α1
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      let* α5 :
          ltac:(refine
            (M.Val
              (core.option.Option.t
                unpacking_options_via_question_mark.PhoneNumber.t))) :=
        α4.["phone_number"] in
      let* α6 :
          ltac:(refine
            (M.Val
              (core.ops.control_flow.ControlFlow.t
                (core.option.Option.t core.convert.Infallible.t)
                unpacking_options_via_question_mark.PhoneNumber.t))) :=
        (core.ops.try_trait.Try.branch
            (Self :=
              core.option.Option.t
                unpacking_options_via_question_mark.PhoneNumber.t)
            (Trait := ltac:(refine _)))
          α5 in
      let* α7 := M.read α6 in
      let* α8 :
          ltac:(refine
            (M.Val unpacking_options_via_question_mark.PhoneNumber.t)) :=
        match α7 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self := core.option.Option.t u8.t)
                (Trait := ltac:(refine _)))
              residual in
          let* α1 : ltac:(refine (M.Val never.t)) := M.return_ α0 in
          never_to_any α1
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      α8.["area_code"]).
  
  Global Instance AssociatedFunction_work_phone_area_code :
    Notation.DoubleColon ltac:(Self) "work_phone_area_code" := {
    Notation.double_colon := work_phone_area_code;
  }.
End Impl_unpacking_options_via_question_mark_Person_t.
End Impl_unpacking_options_via_question_mark_Person_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* p :
        ltac:(refine (M.Val unpacking_options_via_question_mark.Person.t)) :=
      let* α0 : ltac:(refine (M.Val u8.t)) := M.alloc 61 in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
        M.alloc (core.option.Option.Some α1) in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val u32.t)) := M.alloc 439222222 in
      let* α5 := M.read α4 in
      let* α6 :
          ltac:(refine
            (M.Val unpacking_options_via_question_mark.PhoneNumber.t)) :=
        M.alloc
          {|
            unpacking_options_via_question_mark.PhoneNumber.area_code := α3;
            unpacking_options_via_question_mark.PhoneNumber.number := α5;
          |} in
      let* α7 := M.read α6 in
      let* α8 :
          ltac:(refine
            (M.Val
              (core.option.Option.t
                unpacking_options_via_question_mark.PhoneNumber.t))) :=
        M.alloc (core.option.Option.Some α7) in
      let* α9 := M.read α8 in
      let* α10 :
          ltac:(refine (M.Val unpacking_options_via_question_mark.Job.t)) :=
        M.alloc
          {| unpacking_options_via_question_mark.Job.phone_number := α9; |} in
      let* α11 := M.read α10 in
      let* α12 :
          ltac:(refine
            (M.Val
              (core.option.Option.t
                unpacking_options_via_question_mark.Job.t))) :=
        M.alloc (core.option.Option.Some α11) in
      let* α13 := M.read α12 in
      M.alloc {| unpacking_options_via_question_mark.Person.job := α13; |} in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val (ref unpacking_options_via_question_mark.Person.t))) :=
        borrow p in
      let* α1 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
        unpacking_options_via_question_mark.Person.t::["work_phone_area_code"]
          α0 in
      let* α2 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
        borrow α1 in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val u8.t)) := M.alloc 61 in
      let* α5 := M.read α4 in
      let* α6 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
        M.alloc (core.option.Option.Some α5) in
      let* α7 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
        borrow α6 in
      let* α8 := M.read α7 in
      let* α9 :
          ltac:(refine
            (M.Val
              ((ref (core.option.Option.t u8.t))
              *
              (ref (core.option.Option.t u8.t))))) :=
        M.alloc (α3, α8) in
      let* α10 := M.read α9 in
      match α10 with
      | (left_val, right_val) =>
        let* right_val := M.alloc right_val in
        let* left_val := M.alloc left_val in
        let* α0 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
          deref left_val in
        let* α1 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
          borrow α0 in
        let* α2 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
          deref right_val in
        let* α3 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
          borrow α2 in
        let* α4 : ltac:(refine (M.Val bool.t)) :=
          (core.cmp.PartialEq.eq
              (Self := core.option.Option.t u8.t)
              (Trait := ltac:(refine _)))
            α1
            α3 in
        let* α5 : ltac:(refine (M.Val bool.t)) := UnOp.not α4 in
        let* α6 : ltac:(refine (M.Val bool.t)) := use α5 in
        let* α7 := M.read α6 in
        if (α7 : bool) then
          let* kind : ltac:(refine (M.Val core.panicking.AssertKind.t)) :=
            M.alloc core.panicking.AssertKind.Eq in
          let* _ : ltac:(refine (M.Val never.t)) :=
            let* α0 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
              deref left_val in
            let* α1 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
              borrow α0 in
            let* α2 : ltac:(refine (M.Val (core.option.Option.t u8.t))) :=
              deref right_val in
            let* α3 : ltac:(refine (M.Val (ref (core.option.Option.t u8.t)))) :=
              borrow α2 in
            let* α4 :
                ltac:(refine
                  (M.Val (core.option.Option.t core.fmt.Arguments.t))) :=
              M.alloc core.option.Option.None in
            core.panicking.assert_failed kind α1 α3 α4 in
          let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt
      end in
    M.alloc tt).
