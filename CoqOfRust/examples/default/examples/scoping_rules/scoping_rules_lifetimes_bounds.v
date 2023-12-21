(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Ref.
Section Ref.
  Context {T : Set}.
  
  Record t : Set := {
    x0 : ref T;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Ref.
End Ref.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_t_T.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_t_T.
  Context {T : Set}.
  
  Context {ℋ_0 : core.fmt.Debug.Trait T}.
  
  Definition Self : Set := scoping_rules_lifetimes_bounds.Ref.t T.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "Ref") in
    let* α2 : ref (scoping_rules_lifetimes_bounds.Ref.t T) := M.read self in
    let* α3 : M.Val (ref (ref T)) := M.alloc (borrow (deref α2).["0"]) in
    let* α4 : M.Val (ref (ref (ref T))) := M.alloc (borrow α3) in
    let* α5 : ref type not implemented :=
      M.read (pointer_coercion "Unsize" α4) in
    M.call (core.fmt.Formatter.t::["debug_tuple_field1_finish"] α0 α1 α5).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_t_T.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_t_T.

(*
fn print<T>(t: T)
where
    T: Debug,
{
    println!("`print`: t is {:?}", t);
}
*)
Definition print {T : Set} {ℋ_0 : core.fmt.Debug.Trait T} (t : T) : M unit :=
  let* t : M.Val T := M.alloc t in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "`print`: t is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow t)) in
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

(*
fn print_ref<'a, T>(t: &'a T)
where
    T: Debug + 'a,
{
    println!("`print_ref`: t is {:?}", t);
}
*)
Definition print_ref
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    (t : ref T)
    : M unit :=
  let* t : M.Val (ref T) := M.alloc t in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "`print_ref`: t is ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow t)) in
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

(*
fn main() {
    let x = 7;
    let ref_x = Ref(&x);

    print_ref(&ref_x);
    print(ref_x);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* x : M.Val i32.t := M.alloc (Integer.of_Z 7) in
  let* ref_x : M.Val (scoping_rules_lifetimes_bounds.Ref.t i32.t) :=
    M.alloc (scoping_rules_lifetimes_bounds.Ref.Build_t (borrow x)) in
  let* _ : M.Val unit :=
    let* α0 : unit :=
      M.call (scoping_rules_lifetimes_bounds.print_ref (borrow ref_x)) in
    M.alloc α0 in
  let* _ : M.Val unit :=
    let* α0 : scoping_rules_lifetimes_bounds.Ref.t i32.t := M.read ref_x in
    let* α1 : unit := M.call (scoping_rules_lifetimes_bounds.print α0) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
