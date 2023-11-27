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
    let* α0 : M.Val (array (ref str.t)) :=
      M.alloc
        [
          mk_str "My name is ";
          mk_str " and I attend ";
          mk_str ". My favorite language is ";
          mk_str ". My Git username is "
        ] in
    let* α1 : ref (array (ref str.t)) := borrow α0 in
    let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
    let* α3 : M.Val (ref (slice (ref str.t))) := pointer_coercion "Unsize" α2 in
    let* α4 : ref (slice (ref str.t)) := M.read α3 in
    let* α5 : ref type not implemented := M.read student in
    let* α6 : alloc.string.String.t :=
      (supertraits.Person.name
          (Self := type not implemented)
          (Trait := ltac:(refine _)))
        α5 in
    let* α7 : M.Val alloc.string.String.t := M.alloc α6 in
    let* α8 : ref alloc.string.String.t := borrow α7 in
    let* α9 : core.fmt.rt.Argument.t :=
      core.fmt.rt.Argument.t::["new_display"] α8 in
    let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
    let* α11 : ref type not implemented := M.read student in
    let* α12 : alloc.string.String.t :=
      (supertraits.Student.university
          (Self := type not implemented)
          (Trait := ltac:(refine _)))
        α11 in
    let* α13 : M.Val alloc.string.String.t := M.alloc α12 in
    let* α14 : ref alloc.string.String.t := borrow α13 in
    let* α15 : core.fmt.rt.Argument.t :=
      core.fmt.rt.Argument.t::["new_display"] α14 in
    let* α16 : M.Val core.fmt.rt.Argument.t := M.alloc α15 in
    let* α17 : ref type not implemented := M.read student in
    let* α18 : alloc.string.String.t :=
      (supertraits.Programmer.fav_language
          (Self := type not implemented)
          (Trait := ltac:(refine _)))
        α17 in
    let* α19 : M.Val alloc.string.String.t := M.alloc α18 in
    let* α20 : ref alloc.string.String.t := borrow α19 in
    let* α21 : core.fmt.rt.Argument.t :=
      core.fmt.rt.Argument.t::["new_display"] α20 in
    let* α22 : M.Val core.fmt.rt.Argument.t := M.alloc α21 in
    let* α23 : ref type not implemented := M.read student in
    let* α24 : alloc.string.String.t :=
      (supertraits.CompSciStudent.git_username
          (Self := type not implemented)
          (Trait := ltac:(refine _)))
        α23 in
    let* α25 : M.Val alloc.string.String.t := M.alloc α24 in
    let* α26 : ref alloc.string.String.t := borrow α25 in
    let* α27 : core.fmt.rt.Argument.t :=
      core.fmt.rt.Argument.t::["new_display"] α26 in
    let* α28 : M.Val core.fmt.rt.Argument.t := M.alloc α27 in
    let* α29 : M.Val (array core.fmt.rt.Argument.t) :=
      M.alloc [ α10; α16; α22; α28 ] in
    let* α30 : ref (array core.fmt.rt.Argument.t) := borrow α29 in
    let* α31 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α30 in
    let* α32 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
      pointer_coercion "Unsize" α31 in
    let* α33 : ref (slice core.fmt.rt.Argument.t) := M.read α32 in
    let* α34 : core.fmt.Arguments.t :=
      core.fmt.Arguments.t::["new_v1"] α4 α33 in
    let* α35 : alloc.string.String.t := alloc.fmt.format α34 in
    M.alloc α35 in
  M.read res.

(*
fn main() {}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit := M.pure tt.
