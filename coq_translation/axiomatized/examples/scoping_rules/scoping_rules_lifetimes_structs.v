(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Borrowed.
Section Borrowed.
  Record t : Set := {
    x0 : ref i32.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End Borrowed.
End Borrowed.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed_t.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_structs.Borrowed.t.
  
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed_t.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed_t.

Module  NamedBorrowed.
Section NamedBorrowed.
  Record t : Set := {
    x : ref i32.t;
    y : ref i32.t;
  }.
  
  Global Instance Get_x : Notation.Dot "x" := {
    Notation.dot x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
    Notation.double_colon x' := let* x' := M.read x' in M.alloc x'.(x) : M _;
  }.
  Global Instance Get_y : Notation.Dot "y" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
  Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(y) : M _;
  }.
End NamedBorrowed.
End NamedBorrowed.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed_t.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed_t.
  Ltac Self := exact scoping_rules_lifetimes_structs.NamedBorrowed.t.
  
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed_t.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed_t.

Module Either.
  Inductive t : Set :=
  | Num (_ : i32.t)
  | Ref (_ : ref i32.t).
End Either.

Module  Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either_t.
Section Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either_t.
  Ltac Self := exact scoping_rules_lifetimes_structs.Either.t.
  
  Parameter fmt :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (mut_ref core.fmt.Formatter.t)) ->
        M (M.Val ltac:(core.fmt.Result)).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either_t.
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
