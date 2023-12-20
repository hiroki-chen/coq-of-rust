(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Person.
Section Person.
  Class Trait (Self : Set) : Type := {
    name : (ref ltac:(Self)) -> M alloc.string.String.t;
  }.
  
End Person.
End Person.

Module  Student.
Section Student.
  Class Trait (Self : Set) : Type := {
    ℒ_0 :: supertraits.Person.Trait Self;
    university : (ref ltac:(Self)) -> M alloc.string.String.t;
  }.
  
End Student.
End Student.

Module  Programmer.
Section Programmer.
  Class Trait (Self : Set) : Type := {
    fav_language : (ref ltac:(Self)) -> M alloc.string.String.t;
  }.
  
End Programmer.
End Programmer.

Module  CompSciStudent.
Section CompSciStudent.
  Class Trait (Self : Set) : Type := {
    ℒ_0 :: supertraits.Programmer.Trait Self;
    ℒ_1 :: supertraits.Student.Trait Self;
    git_username : (ref ltac:(Self)) -> M alloc.string.String.t;
  }.
  
End CompSciStudent.
End CompSciStudent.

(*
fn comp_sci_student_greeting(student: &dyn CompSciStudent) -> String {
    format!(
        "My name is {} and I attend {}. My favorite language is {}. My Git username is {}",
        student.name(),
        student.university(),
        student.fav_language(),
        student.git_username()
    )
}
*)
Definition comp_sci_student_greeting
    {DynT : Set}
    {ℋ_0 : supertraits.CompSciStudent.Trait DynT}
    (student : ref DynT)
    : M alloc.string.String.t :=
  let* student : M.Val (ref _ (* dyn *)) := M.alloc student in
  let* res : M.Val alloc.string.String.t :=
    let* α0 : ref str.t := M.read (mk_str "My name is ") in
    let* α1 : ref str.t := M.read (mk_str " and I attend ") in
    let* α2 : ref str.t := M.read (mk_str ". My favorite language is ") in
    let* α3 : ref str.t := M.read (mk_str ". My Git username is ") in
    let* α4 : M.Val (array (ref str.t)) := M.alloc [ α0; α1; α2; α3 ] in
    let* α5 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α4) in
    let* α6 : ref (slice (ref str.t)) :=
      M.read (pointer_coercion "Unsize" α5) in
    let* α7 : ref type not implemented := M.read student in
    let* α8 : alloc.string.String.t :=
      M.call
        ((supertraits.Person.name
            (Self := type not implemented)
            (Trait := ltac:(refine _)))
          α7) in
    let* α9 : M.Val alloc.string.String.t := M.alloc α8 in
    let* α10 : core.fmt.rt.Argument.t :=
      M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α9)) in
    let* α11 : ref type not implemented := M.read student in
    let* α12 : alloc.string.String.t :=
      M.call
        ((supertraits.Student.university
            (Self := type not implemented)
            (Trait := ltac:(refine _)))
          α11) in
    let* α13 : M.Val alloc.string.String.t := M.alloc α12 in
    let* α14 : core.fmt.rt.Argument.t :=
      M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α13)) in
    let* α15 : ref type not implemented := M.read student in
    let* α16 : alloc.string.String.t :=
      M.call
        ((supertraits.Programmer.fav_language
            (Self := type not implemented)
            (Trait := ltac:(refine _)))
          α15) in
    let* α17 : M.Val alloc.string.String.t := M.alloc α16 in
    let* α18 : core.fmt.rt.Argument.t :=
      M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α17)) in
    let* α19 : ref type not implemented := M.read student in
    let* α20 : alloc.string.String.t :=
      M.call
        ((supertraits.CompSciStudent.git_username
            (Self := type not implemented)
            (Trait := ltac:(refine _)))
          α19) in
    let* α21 : M.Val alloc.string.String.t := M.alloc α20 in
    let* α22 : core.fmt.rt.Argument.t :=
      M.call (core.fmt.rt.Argument.t::["new_display"] (borrow α21)) in
    let* α23 : M.Val (array core.fmt.rt.Argument.t) :=
      M.alloc [ α10; α14; α18; α22 ] in
    let* α24 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
      M.alloc (borrow α23) in
    let* α25 : ref (slice core.fmt.rt.Argument.t) :=
      M.read (pointer_coercion "Unsize" α24) in
    let* α26 : core.fmt.Arguments.t :=
      M.call (core.fmt.Arguments.t::["new_v1"] α6 α25) in
    let* α27 : alloc.string.String.t := M.call (alloc.fmt.format α26) in
    M.alloc α27 in
  M.read res.

(*
fn main() {}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit := M.pure tt.
