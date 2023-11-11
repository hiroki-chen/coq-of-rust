(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Val.
Section Val.
  Record t : Set := {
    val : f64.t;
  }.
  
  Global Instance Get_val : Notation.Dot "val" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(val) : M _;
  }.
  Global Instance Get_AF_val : Notation.DoubleColon t "val" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(val) : M _;
  }.
End Val.
End Val.
Definition Val : Set := M.Val Val.t.

Module  GenVal.
Section GenVal.
  Context (T : Set).
  
  Record t : Set := {
    gen_val : T;
  }.
  
  Global Instance Get_gen_val : Notation.Dot "gen_val" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(gen_val) : M _;
  }.
  Global Instance Get_AF_gen_val : Notation.DoubleColon t "gen_val" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(gen_val) : M _;
  }.
End GenVal.
End GenVal.
Definition GenVal (T : Set) : Set := M.Val (GenVal.t T).

Module  Impl_generics_implementation_Val_t.
Section Impl_generics_implementation_Val_t.
  Ltac Self := exact generics_implementation.Val.t.
  
  Parameter value : (M.Val (ref ltac:(Self))) -> M (M.Val (ref f64.t)).
  
  Global Instance AssociatedFunction_value :
    Notation.DoubleColon ltac:(Self) "value" := {
    Notation.double_colon := value;
  }.
End Impl_generics_implementation_Val_t.
End Impl_generics_implementation_Val_t.

Module  Impl_generics_implementation_GenVal_t_T.
Section Impl_generics_implementation_GenVal_t_T.
  Context {T : Set}.
  
  Ltac Self := exact (generics_implementation.GenVal.t T).
  
  Parameter value : (M.Val (ref ltac:(Self))) -> M (M.Val (ref T)).
  
  Global Instance AssociatedFunction_value :
    Notation.DoubleColon ltac:(Self) "value" := {
    Notation.double_colon := value;
  }.
End Impl_generics_implementation_GenVal_t_T.
End Impl_generics_implementation_GenVal_t_T.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
