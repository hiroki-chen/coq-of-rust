(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Unset Primitive Projections.
  Record t : Set := {
    job : core.option.Option unpacking_options_via_question_mark.Job;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_job : Notation.Dot "job" := {
    Notation.dot '(Build_t x0) := x0;
  }.
  Global Instance Get_AF_job : Notation.DoubleColon t "job" := {
    Notation.double_colon '(Build_t x0) := x0;
  }.
End Person.
Definition Person : Set := ⟅Person.t⟆.

Module Job.
  Unset Primitive Projections.
  Record t : Set := {
    phone_number
      :
      core.option.Option unpacking_options_via_question_mark.PhoneNumber;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_phone_number : Notation.Dot "phone_number" := {
    Notation.dot '(Build_t x0) := x0;
  }.
  Global Instance Get_AF_phone_number
    : Notation.DoubleColon t "phone_number" := {
    Notation.double_colon '(Build_t x0) := x0;
  }.
End Job.
Definition Job : Set := ⟅Job.t⟆.

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Definition clone
      `{H' : State.Trait}
      (self : ref Self)
      : M (H := H') unpacking_options_via_question_mark.Job :=
    let _ := tt in
    deref self unpacking_options_via_question_mark.Job.
  
  Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H' : State.Trait} := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Global Instance I : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.

Module PhoneNumber.
  Unset Primitive Projections.
  Record t : Set := {
    area_code : core.option.Option u8;
    number : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_area_code : Notation.Dot "area_code" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_AF_area_code : Notation.DoubleColon t "area_code" := {
    Notation.double_colon '(Build_t x0 _) := x0;
  }.
  Global Instance Get_number : Notation.Dot "number" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
  Global Instance Get_AF_number : Notation.DoubleColon t "number" := {
    Notation.double_colon '(Build_t _ x1) := x1;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := ⟅PhoneNumber.t⟆.

Module
  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Definition clone
      `{H' : State.Trait}
      (self : ref Self)
      : M (H := H') unpacking_options_via_question_mark.PhoneNumber :=
    let _ := tt in
    let _ := tt in
    deref self unpacking_options_via_question_mark.PhoneNumber.
  
  Global Instance Method_clone `{H' : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H' : State.Trait} := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module
  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Global Instance I : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self := unpacking_options_via_question_mark.Person.
  
  Definition work_phone_area_code
      `{H' : State.Trait}
      (self : ref Self)
      : M (H := H') (core.option.Option u8) :=
    let* α0 := deref self unpacking_options_via_question_mark.Person in
    let* α1 := core.ops.try_trait.Try.branch α0.["job"] in
    let* α2 :=
      match α1 with
      | core.ops.control_flow.ControlFlow residual =>
        let* α0 := core.ops.try_trait.FromResidual.from_residual residual in
        let* α1 := Return α0 in
        never_to_any α1
      | core.ops.control_flow.ControlFlow val => Pure val
      end in
    let* α3 := core.ops.try_trait.Try.branch α2.["phone_number"] in
    let* α4 :=
      match α3 with
      | core.ops.control_flow.ControlFlow residual =>
        let* α0 := core.ops.try_trait.FromResidual.from_residual residual in
        let* α1 := Return α0 in
        never_to_any α1
      | core.ops.control_flow.ControlFlow val => Pure val
      end in
    Pure α4.["area_code"].
  
  Global Instance Method_work_phone_area_code `{H' : State.Trait} :
    Notation.Dot "work_phone_area_code" := {
    Notation.dot := work_phone_area_code;
  }.
End Impl_unpacking_options_via_question_mark_Person.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let p :=
    {|
      unpacking_options_via_question_mark.Person.job :=
        core.option.Option.Some
          {|
            unpacking_options_via_question_mark.Job.phone_number :=
              core.option.Option.Some
                {|
                  unpacking_options_via_question_mark.PhoneNumber.area_code :=
                    core.option.Option.Some 61;
                  unpacking_options_via_question_mark.PhoneNumber.number :=
                    439222222;
                |};
          |};
    |} in
  let* _ :=
    let* α0 := borrow p unpacking_options_via_question_mark.Person in
    let* α1 :=
      unpacking_options_via_question_mark.Person::["work_phone_area_code"] α0 in
    let* α2 := borrow α1 (core.option.Option u8) in
    let* α3 := borrow (core.option.Option.Some 61) (core.option.Option u8) in
    match (α2, α3) with
    | (left_val, right_val) =>
      let* α0 := deref left_val (core.option.Option u8) in
      let* α1 := borrow α0 (core.option.Option u8) in
      let* α2 := deref right_val (core.option.Option u8) in
      let* α3 := borrow α2 (core.option.Option u8) in
      let* α4 := core.cmp.PartialEq.eq α1 α3 in
      let* α5 := not α4 in
      let* α6 := use α5 in
      if (α6 : bool) then
        let kind := core.panicking.AssertKind.Eq tt in
        let* _ :=
          let* α0 := deref left_val (core.option.Option u8) in
          let* α1 := borrow α0 (core.option.Option u8) in
          let* α2 := deref α1 (core.option.Option u8) in
          let* α3 := borrow α2 (core.option.Option u8) in
          let* α4 := deref right_val (core.option.Option u8) in
          let* α5 := borrow α4 (core.option.Option u8) in
          let* α6 := deref α5 (core.option.Option u8) in
          let* α7 := borrow α6 (core.option.Option u8) in
          core.panicking.assert_failed
            kind
            α3
            α7
            (core.option.Option.None tt) in
        never_to_any tt
      else
        Pure tt
    end in
  Pure tt.
