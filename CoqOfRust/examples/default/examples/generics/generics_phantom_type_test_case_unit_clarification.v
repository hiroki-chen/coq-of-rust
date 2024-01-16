(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Inch.
  Inductive t : Set :=
  .
End Inch.

Module  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
Section Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Inch.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : ref generics_phantom_type_test_case_unit_clarification.Inch.t :=
      M.read self in
    let* α1 : M.Val never.t := match_operator (deref α0) [ ] in
    let* α2 := M.read α1 in
    never_to_any α2.
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch_t.

Module  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
Section Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Inch.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M generics_phantom_type_test_case_unit_clarification.Inch.t :=
    let* self := M.alloc self in
    let* α0 : ref generics_phantom_type_test_case_unit_clarification.Inch.t :=
      M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch_t.

Module  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
Section Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Inch.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch_t.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch_t.

Module Mm.
  Inductive t : Set :=
  .
End Mm.

Module  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
Section Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Mm.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : ref generics_phantom_type_test_case_unit_clarification.Mm.t :=
      M.read self in
    let* α1 : M.Val never.t := match_operator (deref α0) [ ] in
    let* α2 := M.read α1 in
    never_to_any α2.
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm_t.

Module  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
Section Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Mm.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M generics_phantom_type_test_case_unit_clarification.Mm.t :=
    let* self := M.alloc self in
    let* α0 : ref generics_phantom_type_test_case_unit_clarification.Mm.t :=
      M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm_t.

Module  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
Section Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Mm.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm_t.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm_t.

Module  Length.
Section Length.
  Context {Unit : Set}.
  
  Record t : Set := {
    x0 : f64.t;
    x1 : core.marker.PhantomData.t Unit;
  }.
  
  Definition Get_0 :=
    Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>)).
  Definition Get_1 :=
    Ref.map (fun α => Some α.(x1)) (fun β α => Some (α <| x1 := β |>)).
End Length.
End Length.

Module  Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
Section Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
  Context {Unit : Set}.
  
  Context {ℋ_0 : core.fmt.Debug.Trait Unit}.
  
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Length.t Unit.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Length") in
    let* α2 :
        ref
          (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
      M.read self in
    let* α3 :
        ref
          (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
      M.read self in
    let* α4 : M.Val (ref (core.marker.PhantomData.t Unit)) :=
      M.alloc
        (borrow
          (generics_phantom_type_test_case_unit_clarification.Length.Get_1
            (deref α3))) in
    M.call
      (core.fmt.Formatter.t::["debug_tuple_field2_finish"]
        α0
        α1
        (pointer_coercion
          "Unsize"
          (borrow
            (generics_phantom_type_test_case_unit_clarification.Length.Get_0
              (deref α2))))
        (pointer_coercion "Unsize" (borrow α4))).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.

Module  Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
Section Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
  Context {Unit : Set}.
  
  Context {ℋ_0 : core.clone.Clone.Trait Unit}.
  
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Length.t Unit.
  
  (*
  Clone
  *)
  Definition clone
      (self : ref Self)
      : M (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
    let* self := M.alloc self in
    let* α0 : (ref f64.t) -> M f64.t :=
      ltac:(M.get_method (fun ℐ =>
        core.clone.Clone.clone (Self := f64.t) (Trait := ℐ))) in
    let* α1 :
        ref
          (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
      M.read self in
    let* α2 : f64.t :=
      M.call
        (α0
          (borrow
            (generics_phantom_type_test_case_unit_clarification.Length.Get_0
              (deref α1)))) in
    let* α3 :
        (ref (core.marker.PhantomData.t Unit)) ->
          M (core.marker.PhantomData.t Unit) :=
      ltac:(M.get_method (fun ℐ =>
        core.clone.Clone.clone
          (Self := core.marker.PhantomData.t Unit)
          (Trait := ℐ))) in
    let* α4 :
        ref
          (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
      M.read self in
    let* α5 : core.marker.PhantomData.t Unit :=
      M.call
        (α3
          (borrow
            (generics_phantom_type_test_case_unit_clarification.Length.Get_1
              (deref α4)))) in
    M.pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t α2 α5).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.

Module  Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
Section Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
  Context {Unit : Set}.
  
  Context {ℋ_0 : core.marker.Copy.Trait Unit}.
  
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Length.t Unit.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.

Module  Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
Section Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
  Context {Unit : Set}.
  
  Definition Self : Set :=
    generics_phantom_type_test_case_unit_clarification.Length.t Unit.
  
  (*
      type Output = Length<Unit>;
  *)
  Definition Output : Set :=
    generics_phantom_type_test_case_unit_clarification.Length.t Unit.
  
  (*
      fn add(self, rhs: Length<Unit>) -> Length<Unit> {
          // `+` calls the `Add` implementation for `f64`.
          Length(self.0 + rhs.0, PhantomData)
      }
  *)
  Definition add
      (self : Self)
      (rhs : generics_phantom_type_test_case_unit_clarification.Length.t Unit)
      : M (generics_phantom_type_test_case_unit_clarification.Length.t Unit) :=
    let* self := M.alloc self in
    let* rhs := M.alloc rhs in
    let* α0 : f64.t :=
      M.read
        (generics_phantom_type_test_case_unit_clarification.Length.Get_0
          self) in
    let* α1 : f64.t :=
      M.read
        (generics_phantom_type_test_case_unit_clarification.Length.Get_0 rhs) in
    let* α2 : f64.t := BinOp.Panic.add α0 α1 in
    M.pure
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α2
        core.marker.PhantomData.Build).
  
  Global Instance AssociatedFunction_add : Notations.DoubleColon Self "add" := {
    Notations.double_colon := add;
  }.
  
  Global Instance ℐ :
    core.ops.arith.Add.Trait Self
      (Rhs := core.ops.arith.Add.Default.Rhs Self) := {
    core.ops.arith.Add.Output := Output;
    core.ops.arith.Add.add := add;
  }.
End Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.
End Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_t_Unit.

(*
fn main() {
    // Specifies `one_foot` to have phantom type parameter `Inch`.
    let one_foot: Length<Inch> = Length(12.0, PhantomData);
    // `one_meter` has phantom type parameter `Mm`.
    let one_meter: Length<Mm> = Length(1000.0, PhantomData);

    // `+` calls the `add()` method we implemented for `Length<Unit>`.
    //
    // Since `Length` implements `Copy`, `add()` does not consume
    // `one_foot` and `one_meter` but copies them into `self` and `rhs`.
    let two_feet = one_foot + one_foot;
    let two_meters = one_meter + one_meter;

    // Addition works.
    println!("one foot + one_foot = {:?} in", two_feet.0);
    println!("one meter + one_meter = {:?} mm", two_meters.0);

    // Nonsensical operations fail as they should:
    // Compile-time Error: type mismatch.
    //let one_feter = one_foot + one_meter;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* one_foot :
      M.Val
        (generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Inch.t) :=
    let* α0 : f64.t := M.read (UnsupportedLiteral : M.Val f64.t) in
    M.alloc
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α0
        core.marker.PhantomData.Build) in
  let* one_meter :
      M.Val
        (generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Mm.t) :=
    let* α0 : f64.t := M.read (UnsupportedLiteral : M.Val f64.t) in
    M.alloc
      (generics_phantom_type_test_case_unit_clarification.Length.Build_t
        α0
        core.marker.PhantomData.Build) in
  let* two_feet :
      M.Val
        (generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Inch.t) :=
    let* α0 :
        (generics_phantom_type_test_case_unit_clarification.Length.t
            generics_phantom_type_test_case_unit_clarification.Inch.t)
          ->
          (generics_phantom_type_test_case_unit_clarification.Length.t
            generics_phantom_type_test_case_unit_clarification.Inch.t)
          ->
          M _ :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.arith.Add.add
          (Self :=
            generics_phantom_type_test_case_unit_clarification.Length.t
              generics_phantom_type_test_case_unit_clarification.Inch.t)
          (Rhs :=
            generics_phantom_type_test_case_unit_clarification.Length.t
              generics_phantom_type_test_case_unit_clarification.Inch.t)
          (Trait := ℐ))) in
    let* α1 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Inch.t :=
      M.read one_foot in
    let* α2 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Inch.t :=
      M.read one_foot in
    let* α3 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Inch.t :=
      M.call (α0 α1 α2) in
    M.alloc α3 in
  let* two_meters :
      M.Val
        (generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Mm.t) :=
    let* α0 :
        (generics_phantom_type_test_case_unit_clarification.Length.t
            generics_phantom_type_test_case_unit_clarification.Mm.t)
          ->
          (generics_phantom_type_test_case_unit_clarification.Length.t
            generics_phantom_type_test_case_unit_clarification.Mm.t)
          ->
          M _ :=
      ltac:(M.get_method (fun ℐ =>
        core.ops.arith.Add.add
          (Self :=
            generics_phantom_type_test_case_unit_clarification.Length.t
              generics_phantom_type_test_case_unit_clarification.Mm.t)
          (Rhs :=
            generics_phantom_type_test_case_unit_clarification.Length.t
              generics_phantom_type_test_case_unit_clarification.Mm.t)
          (Trait := ℐ))) in
    let* α1 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Mm.t :=
      M.read one_meter in
    let* α2 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Mm.t :=
      M.read one_meter in
    let* α3 :
        generics_phantom_type_test_case_unit_clarification.Length.t
          generics_phantom_type_test_case_unit_clarification.Mm.t :=
      M.call (α0 α1 α2) in
    M.alloc α3 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "one foot + one_foot = ") in
      let* α1 : ref str.t := M.read (mk_str " in
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_debug"]
            (borrow
              (generics_phantom_type_test_case_unit_clarification.Length.Get_0
                two_feet))) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "one meter + one_meter = ") in
      let* α1 : ref str.t := M.read (mk_str " mm
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : core.fmt.rt.Argument.t :=
        M.call
          (core.fmt.rt.Argument.t::["new_debug"]
            (borrow
              (generics_phantom_type_test_case_unit_clarification.Length.Get_0
                two_meters))) in
      let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
      let* α5 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_v1"]
            (pointer_coercion "Unsize" (borrow α2))
            (pointer_coercion "Unsize" (borrow α4))) in
      let* α6 : unit := M.call (std.io.stdio._print α5) in
      M.alloc α6 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
