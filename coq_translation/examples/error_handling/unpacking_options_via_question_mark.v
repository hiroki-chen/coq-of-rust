(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Person.
  Record t : Set := {
    job : Option Job;
  }.
  
  Global Instance Get_job : Notation.Dot "job" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Person.
Definition Person : Set := Person.t.

Module Job.
  Record t : Set := {
    phone_number : Option PhoneNumber;
  }.
  
  Global Instance Get_phone_number : Notation.Dot "phone_number" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Job.
Definition Job : Set := Job.t.

Module Impl__crate_clone_Clone_for_Job.
  Definition Self := Job.
  
  Definition clone (self : ref Self) : M Job :=
    let _ := tt in
    self.["deref"].
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_Job.

Module Impl__crate_marker_Copy_for_Job.
  Definition Self := Job.
  
  Global Instance I : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Job.

Module PhoneNumber.
  Record t : Set := {
    area_code : Option u8;
    number : u32;
  }.
  
  Global Instance Get_area_code : Notation.Dot "area_code" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_number : Notation.Dot "number" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End PhoneNumber.
Definition PhoneNumber : Set := PhoneNumber.t.

Module Impl__crate_clone_Clone_for_PhoneNumber.
  Definition Self := PhoneNumber.
  
  Definition clone (self : ref Self) : M PhoneNumber :=
    let _ := tt in
    let _ := tt in
    self.["deref"].
  
  Global Instance Method_clone : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : _crate.clone.Clone.Trait Self := {
    _crate.clone.Clone.clone := clone;
  }.
End Impl__crate_clone_Clone_for_PhoneNumber.

Module Impl__crate_marker_Copy_for_PhoneNumber.
  Definition Self := PhoneNumber.
  
  Global Instance I : _crate.marker.Copy.Trait Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_PhoneNumber.

Module ImplPerson.
  Definition Self := Person.
  
  Definition work_phone_area_code (self : ref Self) : M (Option u8) :=
    let* α0 := LangItem self.["job"] in
    let* α1 :=
      match α0 with
      | Break {| Break.0 := residual; |} =>
        let* α0 := LangItem residual in
        Return α0
      | Continue {| Continue.0 := val; |} => Pure val
      end in
    let* α2 := LangItem α1.["phone_number"] in
    let* α3 :=
      match α2 with
      | Break {| Break.0 := residual; |} =>
        let* α0 := LangItem residual in
        Return α0
      | Continue {| Continue.0 := val; |} => Pure val
      end in
    Pure α3.["area_code"].
  
  Global Instance Method_work_phone_area_code :
    Notation.Dot "work_phone_area_code" := {
    Notation.dot := work_phone_area_code;
  }.
End ImplPerson.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let p :=
    {|
      Person.job :=
        Some
          {|
            Job.phone_number :=
              Some
                {|
                  PhoneNumber.area_code := Some 61;
                  PhoneNumber.number := 439222222;
                |};
          |};
    |} in
  let* _ :=
    let* α0 := p.["work_phone_area_code"] in
    match (addr_of α0, addr_of (Some 61)) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := _crate.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          _crate.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            _crate.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  Pure tt.
