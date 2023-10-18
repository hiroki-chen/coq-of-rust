(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Val.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    val : f64;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_val `{State.Trait} : Notation.Dot "val" := {
    Notation.dot x := let* x := M.read x in Pure x.(val) : M _;
  }.
  Global Instance Get_AF_val `{State.Trait} : Notation.DoubleColon t "val" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(val) : M _;
  }.
End Val.
Definition Val `{State.Trait} : Set := M.val (Val.t).

Module GenVal.
  Section GenVal.
    Context {T : Set}.
    Unset Primitive Projections.
    Record t `{State.Trait} : Set := {
      gen_val : T;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_gen_val `{State.Trait} : Notation.Dot "gen_val" := {
      Notation.dot x := let* x := M.read x in Pure x.(gen_val) : M _;
    }.
    Global Instance Get_AF_gen_val `{State.Trait}
      : Notation.DoubleColon t "gen_val" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(gen_val) : M _;
    }.
  End GenVal.
End GenVal.
Definition GenVal (T : Set) `{State.Trait} : Set := M.val (GenVal.t (T := T)).

Module Impl_generics_implementation_Val.
  Definition Self := generics_implementation.Val.
  
  Parameter value : forall `{State.Trait}, (ref Self) -> M (ref f64).
  
  Global Instance Method_value `{State.Trait} : Notation.Dot "value" := {
    Notation.dot := value;
  }.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Definition Self := generics_implementation.GenVal T.
  
  Parameter value : forall `{State.Trait}, (ref Self) -> M (ref T).
  
  Global Instance Method_value `{State.Trait} : Notation.Dot "value" := {
    Notation.dot := value;
  }.
End Impl_generics_implementation_GenVal_T.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
