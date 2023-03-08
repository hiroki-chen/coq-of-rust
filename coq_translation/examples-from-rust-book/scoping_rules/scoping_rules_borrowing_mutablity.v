(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Book.
  Record t : Set := {
    author : ref str;
    title : ref str;
    year : u32;
  }.
  
  Global Instance Get_author : NamedField.Class t "author" _ := {|
    NamedField.get '(Build_t x0 _ _) := x0;
  |}.
  Global Instance Get_title : NamedField.Class t "title" _ := {|
    NamedField.get '(Build_t _ x1 _) := x1;
  |}.
  Global Instance Get_year : NamedField.Class t "year" _ := {|
    NamedField.get '(Build_t _ _ x2) := x2;
  |}.
  Class AssociatedFunction (name : string) (T : Set) : Set := {
    associated_function : T;
  }.
  Arguments associated_function name {T AssociatedFunction}.
End Book.
Definition Book : Set := Book.t.

Module Impl__crate_clone_Clone_for_Book.
  Definition Self := Book.
  
  Definition clone (self : ref Self) : Book :=
    let _ := tt in
    let _ := tt in
    let _ := tt in
    deref self.
  
  Global Instance M_clone : Method "clone" _ := {|
    method := clone;
  |}.
  Global Instance AF_clone : Book.AssociatedFunction "clone" _ := {|
    Book.associated_function := clone;
  |}.
  Global Instance
    AFT_clone
    :
    _crate.clone.Clone.AssociatedFunction
    "clone"
    _
    :=
    {|
    _crate.clone.Clone.associated_function := clone;
  |}.
  
  Global Instance I : _crate.clone.Clone.Class Self := {|
    _crate.clone.Clone.clone := clone;
  |}.
End Impl__crate_clone_Clone_for_Book.

Module Impl__crate_marker_Copy_for_Book.
  Definition Self := Book.
  
  Global Instance I : _crate.marker.Copy.Class Self :=
    _crate.marker.Copy.Build_Class _.
End Impl__crate_marker_Copy_for_Book.

Definition borrow_book (book : ref Book) : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "I immutably borrowed "; " - "; " edition\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display
          (NamedField.get (name := "title") book);
        _crate.fmt.ImplArgumentV1.new_display
          (NamedField.get (name := "year") book)
      ]) ;;
  tt ;;
  tt.

Definition new_edition (book : mut_ref Book) : unit :=
  assign (NamedField.get (name := "year") book) 2014 ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "I mutably borrowed "; " - "; " edition\n" ]
      [
        _crate.fmt.ImplArgumentV1.new_display
          (NamedField.get (name := "title") book);
        _crate.fmt.ImplArgumentV1.new_display
          (NamedField.get (name := "year") book)
      ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let immutabook :=
    {|
      Book.author := "Douglas Hofstadter";
      Book.title := "Gödel, Escher, Bach";
      Book.year := 1979;
    |} in
  let mutabook := immutabook in
  borrow_book immutabook ;;
  borrow_book mutabook ;;
  new_edition mutabook ;;
  tt.
