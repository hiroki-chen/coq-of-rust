(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Centimeters.
Section Centimeters.
  Record t : Set := {
    x0 : f64.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Centimeters.
End Centimeters.

Module  Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
Section Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait ltac:(Self) := {
  }.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters_t.

Module  Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
Section Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref ltac:(Self)) -> (ref derive.Centimeters.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq :
    Notations.DoubleColon ltac:(Self) "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait ltac:(Self)
      (Rhs := core.cmp.PartialEq.Default.Rhs ltac:(Self)) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_derive_Centimeters_t.
End Impl_core_cmp_PartialEq_for_derive_Centimeters_t.

Module  Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
Section Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
  Ltac Self := exact derive.Centimeters.t.
  
  (*
  PartialOrd
  *)
  Parameter partial_cmp :
      (ref ltac:(Self)) ->
        (ref derive.Centimeters.t) ->
        M (core.option.Option.t core.cmp.Ordering.t).
  
  Global Instance AssociatedFunction_partial_cmp :
    Notations.DoubleColon ltac:(Self) "partial_cmp" := {
    Notations.double_colon := partial_cmp;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialOrd.Required.Trait ltac:(Self)
      (Rhs := core.cmp.PartialOrd.Default.Rhs ltac:(Self)) := {
    core.cmp.PartialOrd.partial_cmp := partial_cmp;
    core.cmp.PartialOrd.lt := Datatypes.None;
    core.cmp.PartialOrd.le := Datatypes.None;
    core.cmp.PartialOrd.gt := Datatypes.None;
    core.cmp.PartialOrd.ge := Datatypes.None;
  }.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.
End Impl_core_cmp_PartialOrd_for_derive_Centimeters_t.

Module  Inches.
Section Inches.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Inches.
End Inches.

Module  Impl_core_fmt_Debug_for_derive_Inches_t.
Section Impl_core_fmt_Debug_for_derive_Inches_t.
  Ltac Self := exact derive.Inches.t.
  
  (*
  Debug
  *)
  Parameter fmt :
      (ref ltac:(Self)) ->
        (mut_ref core.fmt.Formatter.t) ->
        M ltac:(core.fmt.Result).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_derive_Inches_t.
End Impl_core_fmt_Debug_for_derive_Inches_t.

Module  Impl_derive_Inches_t.
Section Impl_derive_Inches_t.
  Ltac Self := exact derive.Inches.t.
  
  (*
      fn to_centimeters(&self) -> Centimeters {
          let &Inches(inches) = self;
  
          Centimeters(inches as f64 * 2.54)
      }
  *)
  Parameter to_centimeters : (ref ltac:(Self)) -> M derive.Centimeters.t.
  
  Global Instance AssociatedFunction_to_centimeters :
    Notations.DoubleColon ltac:(Self) "to_centimeters" := {
    Notations.double_colon := to_centimeters;
  }.
End Impl_derive_Inches_t.
End Impl_derive_Inches_t.

Module  Seconds.
Section Seconds.
  Record t : Set := {
    x0 : i32.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Seconds.
End Seconds.

(*
fn main() {
    let _one_second = Seconds(1);

    // Error: `Seconds` can't be printed; it doesn't implement the `Debug` trait
    //println!("One second looks like: {:?}", _one_second);
    // TODO ^ Try uncommenting this line

    // Error: `Seconds` can't be compared; it doesn't implement the `PartialEq` trait
    //let _this_is_true = (_one_second == _one_second);
    // TODO ^ Try uncommenting this line

    let foot = Inches(12);

    println!("One foot equals {:?}", foot);

    let meter = Centimeters(100.0);

    let cmp = if foot.to_centimeters() < meter {
        "smaller"
    } else {
        "bigger"
    };

    println!("One foot is {} than one meter.", cmp);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M unit.
