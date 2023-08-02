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
End Person.
Definition Person : Set := @Person.t.

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
End Job.
Definition Job : Set := @Job.t.

Module Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) unpacking_options_via_question_mark.Job :=
    let
        _: core.clone.AssertParamIsClone
          (core.option.Option
            unpacking_options_via_question_mark.PhoneNumber) :=
      tt in
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_Job.

Module Impl_core_marker_Copy_for_unpacking_options_via_question_mark_Job.
  Definition Self := unpacking_options_via_question_mark.Job.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
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
  Global Instance Get_number : Notation.Dot "number" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := @PhoneNumber.t.

Module
  Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) unpacking_options_via_question_mark.PhoneNumber :=
    let _: core.clone.AssertParamIsClone (core.option.Option u8) := tt in
    let _: core.clone.AssertParamIsClone u32 := tt in
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_unpacking_options_via_question_mark_PhoneNumber.

Module
  Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.
  Definition Self := unpacking_options_via_question_mark.PhoneNumber.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_unpacking_options_via_question_mark_PhoneNumber.

Module Impl_unpacking_options_via_question_mark_Person.
  Definition Self := unpacking_options_via_question_mark.Person.
  
  Definition work_phone_area_code
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) (core.option.Option u8) :=
    let* α0 := self.["job"].["branch"] in
    let* α1 :=
      match α0 with
      | LanguageItem.Break residual =>
        let* α0 := residual.["from_residual"] in
        Return α0
      | LanguageItem.Continue val => Pure val
      end in
    let* α2 := α1.["phone_number"].["branch"] in
    let* α3 :=
      match α2 with
      | LanguageItem.Break residual =>
        let* α0 := residual.["from_residual"] in
        Return α0
      | LanguageItem.Continue val => Pure val
      end in
    Pure α3.["area_code"].
  
  Global Instance Method_work_phone_area_code `{H : State.Trait} :
    Notation.Dot "work_phone_area_code" := {
    Notation.dot := work_phone_area_code;
  }.
End Impl_unpacking_options_via_question_mark_Person.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
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
    let* α0 := p.["work_phone_area_code"] in
    match (addr_of α0, addr_of (core.option.Option.Some 61)) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := core.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          core.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            core.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  Pure tt.
