(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module UsernameWidget.
  Class Trait (Self : Set) : Set := {
    get `{H : State.Trait} : (ref Self) -> (M (H := H) alloc.string.String);
  }.
  
  Global Instance Method_get `{H : State.Trait} `(Trait)
    : Notation.Dot "get" := {
    Notation.dot := get;
  }.
End UsernameWidget.

Module AgeWidget.
  Class Trait (Self : Set) : Set := {
    get `{H : State.Trait} : (ref Self) -> (M (H := H) u8);
  }.
  
  Global Instance Method_get `{H : State.Trait} `(Trait)
    : Notation.Dot "get" := {
    Notation.dot := get;
  }.
End AgeWidget.

Module Form.
  Record t : Set := {
    username : alloc.string.String;
    age : u8;
  }.
  
  Global Instance Get_username : Notation.Dot "username" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_age : Notation.Dot "age" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Form.
Definition Form : Set := Form.t.

Module
  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self := disambiguating_overlapping_traits.Form.
  
  Definition get
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) alloc.string.String :=
    self.["username"].["clone"].
  
  Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
    Notation.dot := get;
  }.
  
  Global Instance I :
      disambiguating_overlapping_traits.UsernameWidget.Trait Self := {
    disambiguating_overlapping_traits.UsernameWidget.get
      `{H : State.Trait}
      :=
      get;
  }.
End
  Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.

Module
  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self := disambiguating_overlapping_traits.Form.
  
  Definition get `{H : State.Trait} (self : ref Self) : M (H := H) u8 :=
    Pure self.["age"].
  
  Global Instance Method_get `{H : State.Trait} : Notation.Dot "get" := {
    Notation.dot := get;
  }.
  
  Global Instance I :
      disambiguating_overlapping_traits.AgeWidget.Trait Self := {
    disambiguating_overlapping_traits.AgeWidget.get `{H : State.Trait} := get;
  }.
End
  Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* form :=
    let* α0 := "rustacean".["to_owned"] in
    Pure
      {|
        disambiguating_overlapping_traits.Form.username := α0;
        disambiguating_overlapping_traits.Form.age := 28;
      |} in
  let* username :=
    disambiguating_overlapping_traits.UsernameWidget.get (addr_of form) in
  let* _ :=
    let* α0 := "rustacean".["to_owned"] in
    match (addr_of α0, addr_of username) with
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
  let* age := disambiguating_overlapping_traits.AgeWidget.get (addr_of form) in
  let* _ :=
    match (addr_of 28, addr_of age) with
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
