(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Unit.
Section Unit.
  Inductive t : Set := Build.
End Unit.
End Unit.

Module  Impl_core_fmt_Debug_for_clone_Unit_t.
Section Impl_core_fmt_Debug_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Unit") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Unit_t.
End Impl_core_fmt_Debug_for_clone_Unit_t.

Module  Impl_core_clone_Clone_for_clone_Unit_t.
Section Impl_core_clone_Clone_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref ltac:(Self)) : M clone.Unit.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref clone.Unit.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_clone_Unit_t.
End Impl_core_clone_Clone_for_clone_Unit_t.

Module  Impl_core_marker_Copy_for_clone_Unit_t.
Section Impl_core_marker_Copy_for_clone_Unit_t.
  Ltac Self := exact clone.Unit.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_clone_Unit_t.
End Impl_core_marker_Copy_for_clone_Unit_t.

Module  Pair.
Section Pair.
  Record t : Set := {
    x0 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
    x1 : alloc.boxed.Box.t i32.t alloc.boxed.Box.Default.A;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
  Global Instance Get_1 : Notations.Dot "1" := {
    Notations.dot := Ref.map (fun x => x.(x1)) (fun v x => x <| x1 := v |>);
  }.
End Pair.
End Pair.

Module  Impl_core_clone_Clone_for_clone_Pair_t.
Section Impl_core_clone_Clone_for_clone_Pair_t.
  Ltac Self := exact clone.Pair.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref ltac:(Self)) : M clone.Pair.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref clone.Pair.t := M.read self in
    let* α1 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((core.clone.Clone.clone
            (Self := alloc.boxed.Box.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          (borrow (deref α0).["0"])) in
    let* α2 : ref clone.Pair.t := M.read self in
    let* α3 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((core.clone.Clone.clone
            (Self := alloc.boxed.Box.t i32.t alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          (borrow (deref α2).["1"])) in
    M.pure (clone.Pair.Build_t α1 α3).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_clone_Pair_t.
End Impl_core_clone_Clone_for_clone_Pair_t.

Module  Impl_core_fmt_Debug_for_clone_Pair_t.
Section Impl_core_fmt_Debug_for_clone_Pair_t.
  Ltac Self := exact clone.Pair.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Pair") in
    let* α2 : ref clone.Pair.t := M.read self in
    let* α3 : M.Val (ref (alloc.boxed.Box.t i32.t alloc.alloc.Global.t)) :=
      M.alloc (borrow (deref α2).["0"]) in
    let* α4 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α3) in
    let* α5 : ref clone.Pair.t := M.read self in
    let* α6 : M.Val (ref (alloc.boxed.Box.t i32.t alloc.alloc.Global.t)) :=
      M.alloc (borrow (deref α5).["1"]) in
    let* α7 :
        M.Val (ref (ref (alloc.boxed.Box.t i32.t alloc.alloc.Global.t))) :=
      M.alloc (borrow α6) in
    let* α8 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α7) in
    M.call (core.fmt.Formatter.t::["debug_tuple_field2_finish"] α0 α1 α4 α8).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_clone_Pair_t.
End Impl_core_fmt_Debug_for_clone_Pair_t.

(*
fn main() {
    // Instantiate `Unit`
    let unit = Unit;
    // Copy `Unit`, there are no resources to move
    let copied_unit = unit;

    // Both `Unit`s can be used independently
    println!("original: {:?}", unit);
    println!("copy: {:?}", copied_unit);

    // Instantiate `Pair`
    let pair = Pair(Box::new(1), Box::new(2));
    println!("original: {:?}", pair);

    // Move `pair` into `moved_pair`, moves resources
    let moved_pair = pair;
    println!("moved: {:?}", moved_pair);

    // Error! `pair` has lost its resources
    //println!("original: {:?}", pair);
    // TODO ^ Try uncommenting this line

    // Clone `moved_pair` into `cloned_pair` (resources are included)
    let cloned_pair = moved_pair.clone();
    // Drop the original pair using std::mem::drop
    drop(moved_pair);

    // Error! `moved_pair` has been dropped
    //println!("copy: {:?}", moved_pair);
    // TODO ^ Try uncommenting this line

    // The result from .clone() can still be used!
    println!("clone: {:?}", cloned_pair);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* unit : M.Val clone.Unit.t := M.alloc clone.Unit.Build in
  let* copied_unit : M.Val clone.Unit.t := M.copy unit in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "original: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow unit)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "copy: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow copied_unit)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* pair : M.Val clone.Pair.t :=
    let* α0 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 1)) in
    let* α1 : alloc.boxed.Box.t i32.t alloc.alloc.Global.t :=
      M.call
        ((alloc.boxed.Box.t i32.t alloc.alloc.Global.t)::["new"]
          (Integer.of_Z 2)) in
    M.alloc (clone.Pair.Build_t α0 α1) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "original: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow pair)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* moved_pair : M.Val clone.Pair.t := M.copy pair in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "moved: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow moved_pair)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* cloned_pair : M.Val clone.Pair.t :=
    let* α0 : clone.Pair.t :=
      M.call
        ((core.clone.Clone.clone
            (Self := clone.Pair.t)
            (Trait := ltac:(refine _)))
          (borrow moved_pair)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : clone.Pair.t := M.read moved_pair in
    let* α1 : unit := M.call (core.mem.drop α0) in
    M.alloc α1 in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "clone: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow cloned_pair)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
