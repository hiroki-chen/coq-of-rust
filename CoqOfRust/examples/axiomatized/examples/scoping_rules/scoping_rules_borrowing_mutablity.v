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
  
  Global Instance Get_author : Notations.Dot "author" := {
    Notations.dot :=
      Ref.map (fun x => x.(author)) (fun v x => x <| author := v |>);
  }.
  Global Instance Get_AF_author : Notations.DoubleColon t "author" := {
    Notations.double_colon (x : M.Val t) := x.["author"];
  }.
  Global Instance Get_title : Notations.Dot "title" := {
    Notations.dot :=
      Ref.map (fun x => x.(title)) (fun v x => x <| title := v |>);
  }.
  Global Instance Get_AF_title : Notations.DoubleColon t "title" := {
    Notations.double_colon (x : M.Val t) := x.["title"];
  }.
  Global Instance Get_year : Notations.Dot "year" := {
    Notations.dot := Ref.map (fun x => x.(year)) (fun v x => x <| year := v |>);
  }.
  Global Instance Get_AF_year : Notations.DoubleColon t "year" := {
    Notations.double_colon (x : M.Val t) := x.["year"];
  }.
End Book.
End Book.

Module  Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
  Definition Self : Set := scoping_rules_borrowing_mutablity.Book.t.
  
  (*
  Clone
  *)
  (* #[allow(dead_code)] - function was ignored by the compiler *)
  Parameter clone : (ref Self) -> M scoping_rules_borrowing_mutablity.Book.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_clone_Clone_for_scoping_rules_borrowing_mutablity_Book_t.

Module  Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
Section Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
  Definition Self : Set := scoping_rules_borrowing_mutablity.Book.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.
End Impl_core_marker_Copy_for_scoping_rules_borrowing_mutablity_Book_t.

(*
fn borrow_book(book: &Book) {
    println!(
        "I immutably borrowed {} - {} edition",
        book.title, book.year
    );
}
*)
Parameter borrow_book :
    (ref scoping_rules_borrowing_mutablity.Book.t) -> M unit.

(*
fn new_edition(book: &mut Book) {
    book.year = 2014;
    println!("I mutably borrowed {} - {} edition", book.title, book.year);
}
*)
Parameter new_edition :
    (mut_ref scoping_rules_borrowing_mutablity.Book.t) -> M unit.

(*
fn main() {
    // Create an immutable Book named `immutabook`
    let immutabook = Book {
        // string literals have type `&'static str`
        author: "Douglas Hofstadter",
        title: "Gödel, Escher, Bach",
        year: 1979,
    };

    // Create a mutable copy of `immutabook` and call it `mutabook`
    let mut mutabook = immutabook;

    // Immutably borrow an immutable object
    borrow_book(&immutabook);

    // Immutably borrow a mutable object
    borrow_book(&mutabook);

    // Borrow a mutable object as mutable
    new_edition(&mut mutabook);

    // Error! Cannot borrow an immutable object as mutable
    //new_edition(&mut immutabook);
    // FIXME ^ Comment out this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
