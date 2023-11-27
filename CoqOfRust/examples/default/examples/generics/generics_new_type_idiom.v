(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Years.
Section Years.
  Record t : Set := {
    x0 : i64.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Years.
End Years.

Module  Days.
Section Days.
  Record t : Set := {
    x0 : i64.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Days.
End Days.

Module  Impl_generics_new_type_idiom_Years_t.
Section Impl_generics_new_type_idiom_Years_t.
  Ltac Self := exact generics_new_type_idiom.Years.t.
  
  (*
      pub fn to_days(&self) -> Days {
          Days(self.0 * 365)
      }
  *)
  Definition to_days
      (self : ref ltac:(Self))
      : M generics_new_type_idiom.Days.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref generics_new_type_idiom.Years.t := M.read self in
    let* α1 : M.Val generics_new_type_idiom.Years.t := deref α0 in
    let* α2 : M.Val i64.t := M.alloc 365 in
    let* α3 : M.Val i64.t := BinOp.mul α1.["0"] α2 in
    let* α4 : i64.t := M.read α3 in
    M.pure (generics_new_type_idiom.Days.Build_t α4).
  
  Global Instance AssociatedFunction_to_days :
    Notations.DoubleColon ltac:(Self) "to_days" := {
    Notations.double_colon := to_days;
  }.
End Impl_generics_new_type_idiom_Years_t.
End Impl_generics_new_type_idiom_Years_t.

Module  Impl_generics_new_type_idiom_Days_t.
Section Impl_generics_new_type_idiom_Days_t.
  Ltac Self := exact generics_new_type_idiom.Days.t.
  
  (*
      pub fn to_years(&self) -> Years {
          Years(self.0 / 365)
      }
  *)
  Definition to_years
      (self : ref ltac:(Self))
      : M generics_new_type_idiom.Years.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref generics_new_type_idiom.Days.t := M.read self in
    let* α1 : M.Val generics_new_type_idiom.Days.t := deref α0 in
    let* α2 : M.Val i64.t := M.alloc 365 in
    let* α3 : M.Val i64.t := BinOp.div α1.["0"] α2 in
    let* α4 : i64.t := M.read α3 in
    M.pure (generics_new_type_idiom.Years.Build_t α4).
  
  Global Instance AssociatedFunction_to_years :
    Notations.DoubleColon ltac:(Self) "to_years" := {
    Notations.double_colon := to_years;
  }.
End Impl_generics_new_type_idiom_Days_t.
End Impl_generics_new_type_idiom_Days_t.

(*
fn old_enough(age: &Years) -> bool {
    age.0 >= 18
}
*)
Definition old_enough (age : ref generics_new_type_idiom.Years.t) : M bool.t :=
  let* age : M.Val (ref generics_new_type_idiom.Years.t) := M.alloc age in
  let* α0 : ref generics_new_type_idiom.Years.t := M.read age in
  let* α1 : M.Val generics_new_type_idiom.Years.t := deref α0 in
  let* α2 : M.Val i64.t := M.alloc 18 in
  let* α3 : M.Val bool.t := BinOp.ge α1.["0"] α2 in
  M.read α3.

(*
fn main() {
    let age = Years(5);
    let age_days = age.to_days();
    println!("Old enough {}", old_enough(&age));
    println!("Old enough {}", old_enough(&age_days.to_years()));
    // println!("Old enough {}", old_enough(&age_days));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* age : M.Val generics_new_type_idiom.Years.t :=
    let* α0 : M.Val i64.t := M.alloc 5 in
    let* α1 : i64.t := M.read α0 in
    M.alloc (generics_new_type_idiom.Years.Build_t α1) in
  let* age_days : M.Val generics_new_type_idiom.Days.t :=
    let* α0 : ref generics_new_type_idiom.Years.t := borrow age in
    let* α1 : generics_new_type_idiom.Days.t :=
      generics_new_type_idiom.Years.t::["to_days"] α0 in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "Old enough "; mk_str "
" ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : ref generics_new_type_idiom.Years.t := borrow age in
      let* α6 : bool.t := generics_new_type_idiom.old_enough α5 in
      let* α7 : M.Val bool.t := M.alloc α6 in
      let* α8 : ref bool.t := borrow α7 in
      let* α9 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] α8 in
      let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
      let* α11 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α10 ] in
      let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
      let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
      let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
        pointer_coercion "Unsize" α13 in
      let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
      let* α16 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α4 α15 in
      let* α17 : unit := std.io.stdio._print α16 in
      M.alloc α17 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : M.Val (array (ref str.t)) :=
        M.alloc [ mk_str "Old enough "; mk_str "
" ] in
      let* α1 : ref (array (ref str.t)) := borrow α0 in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
      let* α3 : M.Val (ref (slice (ref str.t))) :=
        pointer_coercion "Unsize" α2 in
      let* α4 : ref (slice (ref str.t)) := M.read α3 in
      let* α5 : ref generics_new_type_idiom.Days.t := borrow age_days in
      let* α6 : generics_new_type_idiom.Years.t :=
        generics_new_type_idiom.Days.t::["to_years"] α5 in
      let* α7 : M.Val generics_new_type_idiom.Years.t := M.alloc α6 in
      let* α8 : ref generics_new_type_idiom.Years.t := borrow α7 in
      let* α9 : bool.t := generics_new_type_idiom.old_enough α8 in
      let* α10 : M.Val bool.t := M.alloc α9 in
      let* α11 : ref bool.t := borrow α10 in
      let* α12 : core.fmt.rt.Argument.t :=
        core.fmt.rt.Argument.t::["new_display"] α11 in
      let* α13 : M.Val core.fmt.rt.Argument.t := M.alloc α12 in
      let* α14 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α13 ] in
      let* α15 : ref (array core.fmt.rt.Argument.t) := borrow α14 in
      let* α16 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α15 in
      let* α17 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
        pointer_coercion "Unsize" α16 in
      let* α18 : ref (slice core.fmt.rt.Argument.t) := M.read α17 in
      let* α19 : core.fmt.Arguments.t :=
        core.fmt.Arguments.t::["new_v1"] α4 α18 in
      let* α20 : unit := std.io.stdio._print α19 in
      M.alloc α20 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
