(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module  Book.
Section Book.
  Record t : Set := {
    author : ref str.t;
    title : ref str.t;
    year : u32.t;
  }.
  
  Global Instance Get_author : Notation.Dot "author" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(author) : M _;
  }.
  Global Instance Get_AF_author : Notation.DoubleColon t "author" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(author) : M _;
  }.
  Global Instance Get_title : Notation.Dot "title" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(title) : M _;
  }.
  Global Instance Get_AF_title : Notation.DoubleColon t "title" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(title) : M _;
  }.
  Global Instance Get_year : Notation.Dot "year" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(year) : M _;
  }.
  Global Instance Get_AF_year : Notation.DoubleColon t "year" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(year) : M _;
  }.
End Book.
End Book.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
  Ltac Self := exact scoping_rules_borrowing_mutablity.Book.t.
  
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val scoping_rules_borrowing_mutablity.Book.t) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
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
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
  Ltac Self := exact scoping_rules_borrowing_mutablity.Book.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.

Definition borrow_book
    (book : M.Val (ref scoping_rules_borrowing_mutablity.Book.t))
    : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "I immutably borrowed "; mk_str " - "; mk_str " edition
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
          deref book in
        let* α4 : ltac:(refine (M.Val (ref str))) := α3.["title"] in
        let* α5 : ltac:(refine (M.Val (ref (ref str)))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 :
            ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
          deref book in
        let* α8 : ltac:(refine (M.Val u32.t)) := α7.["year"] in
        let* α9 : ltac:(refine (M.Val (ref u32.t))) := borrow α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6; α10 ] in
        let* α12 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α11 in
        let* α13 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

Definition new_edition
    (book : M.Val (mut_ref scoping_rules_borrowing_mutablity.Book.t))
    : M (M.Val unit) :=
  M.function_body
    (let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
        deref book in
      let* α1 : ltac:(refine (M.Val u32.t)) := α0.["year"] in
      let* α2 : ltac:(refine (M.Val u32.t)) := M.alloc 2014 in
      assign α1 α2 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc
            [ mk_str "I mutably borrowed "; mk_str " - "; mk_str " edition
"
            ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
          deref book in
        let* α4 : ltac:(refine (M.Val (ref str))) := α3.["title"] in
        let* α5 : ltac:(refine (M.Val (ref (ref str)))) := borrow α4 in
        let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 :
            ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
          deref book in
        let* α8 : ltac:(refine (M.Val u32.t)) := α7.["year"] in
        let* α9 : ltac:(refine (M.Val (ref u32.t))) := borrow α8 in
        let* α10 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α9 in
        let* α11 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α6; α10 ] in
        let* α12 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α11 in
        let* α13 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* immutabook :
        ltac:(refine (M.Val scoping_rules_borrowing_mutablity.Book.t)) :=
      let* α0 := M.read (mk_str "Douglas Hofstadter") in
      let* α1 :=
        M.read (mk_str ("G" ++ String.String "246" "del, Escher, Bach")) in
      let* α2 : ltac:(refine (M.Val u32.t)) := M.alloc 1979 in
      let* α3 := M.read α2 in
      M.alloc
        {|
          scoping_rules_borrowing_mutablity.Book.author := α0;
          scoping_rules_borrowing_mutablity.Book.title := α1;
          scoping_rules_borrowing_mutablity.Book.year := α3;
        |} in
    let mutabook := immutabook in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val (ref scoping_rules_borrowing_mutablity.Book.t))) :=
        borrow immutabook in
      scoping_rules_borrowing_mutablity.borrow_book α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val (ref scoping_rules_borrowing_mutablity.Book.t))) :=
        borrow mutabook in
      scoping_rules_borrowing_mutablity.borrow_book α0 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val (mut_ref scoping_rules_borrowing_mutablity.Book.t))) :=
        borrow_mut mutabook in
      scoping_rules_borrowing_mutablity.new_edition α0 in
    M.alloc tt).
