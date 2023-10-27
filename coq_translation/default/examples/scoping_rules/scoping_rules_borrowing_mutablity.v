(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - struct was ignored by the compiler *)
Module Book.
  Section Book.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      author : ref str;
      title : ref str;
      year : u32;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_author : Notation.Dot "author" := {
      Notation.dot x := let* x := M.read x in Pure x.(author) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_author :
      Notation.DoubleColon t "author" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(author) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_title : Notation.Dot "title" := {
      Notation.dot x := let* x := M.read x in Pure x.(title) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_title : Notation.DoubleColon t "title" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(title) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_year : Notation.Dot "year" := {
      Notation.dot x := let* x := M.read x in Pure x.(year) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_year : Notation.DoubleColon t "year" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(year) : M _;
    }.
    Admitted.
  End Book.
End Book.
Definition Book `{ℋ : State.Trait} : Set := M.val Book.t.

Module Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
  Section Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := scoping_rules_borrowing_mutablity.Book.
    
    (* #[allow(dead_code)] - function was ignored by the compiler *)
    Definition clone
        (self : ref Self)
        : M scoping_rules_borrowing_mutablity.Book :=
      let* _ := M.alloc tt in
      let* _ := M.alloc tt in
      let* _ := M.alloc tt in
      deref self scoping_rules_borrowing_mutablity.Book.
    
    Global Instance AssociatedFunction_clone :
      Notation.DoubleColon Self "clone" := {
      Notation.double_colon := clone;
    }.
    
    #[refine] Global Instance ℐ : core.clone.Clone.Trait Self := {
      core.clone.Clone.clone := clone;
    }.
    Admitted.
  End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.
  Global Hint Resolve ℐ : core.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book.

Module Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
  Section Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := scoping_rules_borrowing_mutablity.Book.
    
    #[refine] Global Instance ℐ : core.marker.Copy.Trait Self := {
    }.
    Admitted.
  End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.
  Global Hint Resolve ℐ : core.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book.

Definition borrow_book
    `{ℋ : State.Trait}
    (book : ref scoping_rules_borrowing_mutablity.Book)
    : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "I immutably borrowed "; mk_str " - "; mk_str " edition
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref book scoping_rules_borrowing_mutablity.Book in
      let* α5 := α4.["title"] in
      let* α6 := borrow α5 (ref str) in
      let* α7 := deref α6 (ref str) in
      let* α8 := borrow α7 (ref str) in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := deref book scoping_rules_borrowing_mutablity.Book in
      let* α11 := α10.["year"] in
      let* α12 := borrow α11 u32 in
      let* α13 := deref α12 u32 in
      let* α14 := borrow α13 u32 in
      let* α15 := core.fmt.rt.Argument::["new_display"] α14 in
      let* α16 := borrow [ α9; α15 ] (list core.fmt.rt.Argument) in
      let* α17 := deref α16 (list core.fmt.rt.Argument) in
      let* α18 := borrow α17 (list core.fmt.rt.Argument) in
      let* α19 := pointer_coercion "Unsize" α18 in
      let* α20 := core.fmt.Arguments::["new_v1"] α3 α19 in
      std.io.stdio._print α20 in
    M.alloc tt in
  M.alloc tt.

Definition new_edition
    `{ℋ : State.Trait}
    (book : mut_ref scoping_rules_borrowing_mutablity.Book)
    : M unit :=
  let* _ :=
    let* α0 := deref book scoping_rules_borrowing_mutablity.Book in
    let* α1 := α0.["year"] in
    let* α2 := M.alloc 2014 in
    assign α1 α2 in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow
          [ mk_str "I mutably borrowed "; mk_str " - "; mk_str " edition
" ]
          (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := deref book scoping_rules_borrowing_mutablity.Book in
      let* α5 := α4.["title"] in
      let* α6 := borrow α5 (ref str) in
      let* α7 := deref α6 (ref str) in
      let* α8 := borrow α7 (ref str) in
      let* α9 := core.fmt.rt.Argument::["new_display"] α8 in
      let* α10 := deref book scoping_rules_borrowing_mutablity.Book in
      let* α11 := α10.["year"] in
      let* α12 := borrow α11 u32 in
      let* α13 := deref α12 u32 in
      let* α14 := borrow α13 u32 in
      let* α15 := core.fmt.rt.Argument::["new_display"] α14 in
      let* α16 := borrow [ α9; α15 ] (list core.fmt.rt.Argument) in
      let* α17 := deref α16 (list core.fmt.rt.Argument) in
      let* α18 := borrow α17 (list core.fmt.rt.Argument) in
      let* α19 := pointer_coercion "Unsize" α18 in
      let* α20 := core.fmt.Arguments::["new_v1"] α3 α19 in
      std.io.stdio._print α20 in
    M.alloc tt in
  M.alloc tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* immutabook :=
    let* α0 := M.alloc 1979 in
    M.alloc
      {|
        scoping_rules_borrowing_mutablity.Book.author :=
          mk_str "Douglas Hofstadter";
        scoping_rules_borrowing_mutablity.Book.title :=
          mk_str ("G" ++ String.String "246" "del, Escher, Bach");
        scoping_rules_borrowing_mutablity.Book.year := α0;
      |} in
  let mutabook := immutabook in
  let* _ :=
    let* α0 := borrow immutabook scoping_rules_borrowing_mutablity.Book in
    let* α1 := deref α0 scoping_rules_borrowing_mutablity.Book in
    let* α2 := borrow α1 scoping_rules_borrowing_mutablity.Book in
    scoping_rules_borrowing_mutablity.borrow_book α2 in
  let* _ :=
    let* α0 := borrow mutabook scoping_rules_borrowing_mutablity.Book in
    let* α1 := deref α0 scoping_rules_borrowing_mutablity.Book in
    let* α2 := borrow α1 scoping_rules_borrowing_mutablity.Book in
    scoping_rules_borrowing_mutablity.borrow_book α2 in
  let* _ :=
    let* α0 := borrow_mut mutabook scoping_rules_borrowing_mutablity.Book in
    let* α1 := deref α0 scoping_rules_borrowing_mutablity.Book in
    let* α2 := borrow_mut α1 scoping_rules_borrowing_mutablity.Book in
    scoping_rules_borrowing_mutablity.new_edition α2 in
  M.alloc tt.
