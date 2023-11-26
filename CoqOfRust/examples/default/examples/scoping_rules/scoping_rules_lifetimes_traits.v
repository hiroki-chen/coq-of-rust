(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Borrowed.
Section Borrowed.
  Record t : Set := {
    x : ref i32.t;
  }.
  
  Global Instance Get_x : Notations.Dot "x" := {
    Notations.dot := Ref.map (fun x' => x'.(x)) (fun v x' => x' <| x := v |>);
  }.
  Global Instance Get_AF_x : Notations.DoubleColon t "x" := {
    Notations.double_colon (x' : M.Val t) := x'.["x"];
  }.
End Borrowed.
End Borrowed.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_traits.Borrowed.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    M.function_body
      (let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
      let* α1 : ref str.t := M.read (mk_str "Borrowed") in
      let* α2 : ref str.t := M.read (mk_str "x") in
      let* α3 : ref scoping_rules_lifetimes_traits.Borrowed.t := M.read self in
      let* α4 : M.Val scoping_rules_lifetimes_traits.Borrowed.t := deref α3 in
      let* α5 : ref (ref i32.t) := borrow α4.["x"] in
      let* α6 : M.Val (ref (ref i32.t)) := M.alloc α5 in
      let* α7 : ref (ref (ref i32.t)) := borrow α6 in
      let* α8 : M.Val (ref (ref (ref i32.t))) := M.alloc α7 in
      let* α9 : M.Val (ref type not implemented) :=
        pointer_coercion "Unsize" α8 in
      let* α10 : ref type not implemented := M.read α9 in
      core.fmt.Formatter.t::["debug_struct_field1_finish"] α0 α1 α2 α10).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_traits_Borrowed_t.

Module  Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
Section Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_traits.Borrowed.t.
  
  (*
      fn default() -> Self {
          Self { x: &10 }
      }
  *)
  Definition default : M ltac:(Self) :=
    M.function_body
      (let* α0 : M.Val i32.t := M.alloc 10 in
      let* α1 : ref i32.t := borrow α0 in
      M.pure {| scoping_rules_lifetimes_traits.Borrowed.x := α1; |}).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.
End Impl_core_default_Default_for_scoping_rules_lifetimes_traits_Borrowed_t.

(*
fn main() {
    let b: Borrowed = Default::default();
    println!("b is {:?}", b);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* b : M.Val scoping_rules_lifetimes_traits.Borrowed.t :=
      let* α0 : scoping_rules_lifetimes_traits.Borrowed.t :=
        core.default.Default.default
          (Self := scoping_rules_lifetimes_traits.Borrowed.t)
          (Trait := ltac:(refine _)) in
      M.alloc α0 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "b is "; mk_str "
" ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref scoping_rules_lifetimes_traits.Borrowed.t := borrow b in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_debug"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
        let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
        let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
        let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α10 in
        let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
        let* α13 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α12 in
        let* α14 : unit := std.io.stdio._print α13 in
        M.alloc α14 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
