(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Book.
  Record t : Set := {
    author : ref str;
    title : ref str;
    year : u32;
  }.
  
  Global Instance Get_author : Notation.Dot "author" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_title : Notation.Dot "title" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_year : Notation.Dot "year" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End Book.
Definition Book : Set := Book.t.

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
  Definition Self := scoping_rules_borrowing_mutablity.Book.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) scoping_rules_borrowing_mutablity.Book :=
    let _ := tt in
    let _ := tt in
    let _ := tt in
    self.["deref"].
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
  Definition Self := scoping_rules_borrowing_mutablity.Book.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.

Definition borrow_book
    `{H : State.Trait}
    (book : ref scoping_rules_borrowing_mutablity.Book)
    : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of book.["title"]) in
      let* α1 := format_argument::["new_display"] (addr_of book.["year"]) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "I immutably borrowed "; " - "; " edition
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.

Definition new_edition
    `{H : State.Trait}
    (book : mut_ref scoping_rules_borrowing_mutablity.Book)
    : M (H := H) unit :=
  let* _ := assign book.["year"] 2014 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of book.["title"]) in
      let* α1 := format_argument::["new_display"] (addr_of book.["year"]) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "I mutably borrowed "; " - "; " edition
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let immutabook :=
    {|
      scoping_rules_borrowing_mutablity.Book.author := "Douglas Hofstadter";
      scoping_rules_borrowing_mutablity.Book.title :=
        "G" ++ String.String "246" "del, Escher, Bach";
      scoping_rules_borrowing_mutablity.Book.year := 1979;
    |} in
  let mutabook := immutabook in
  let* _ :=
    scoping_rules_borrowing_mutablity.borrow_book (addr_of immutabook) in
  let* _ := scoping_rules_borrowing_mutablity.borrow_book (addr_of mutabook) in
  let* _ := scoping_rules_borrowing_mutablity.new_edition (addr_of mutabook) in
  Pure tt.
