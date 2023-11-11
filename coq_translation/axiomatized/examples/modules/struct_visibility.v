(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  Module  OpenBox.
  Section OpenBox.
    Context (T : Set).
    
    Record t : Set := {
      contents : T;
    }.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot x := let* x := M.read x in M.alloc x.(contents) : M _;
    }.
    Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
      Notation.double_colon x :=
        let* x := M.read x in M.alloc x.(contents) : M _;
    }.
  End OpenBox.
  End OpenBox.
  
  Module  ClosedBox.
  Section ClosedBox.
    Context (T : Set).
    
    Record t : Set := {
      contents : T;
    }.
    
    Global Instance Get_contents : Notation.Dot "contents" := {
      Notation.dot x := let* x := M.read x in M.alloc x.(contents) : M _;
    }.
    Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
      Notation.double_colon x :=
        let* x := M.read x in M.alloc x.(contents) : M _;
    }.
  End ClosedBox.
  End ClosedBox.
  
  Module  Impl_struct_visibility_my_ClosedBox_t_T.
  Section Impl_struct_visibility_my_ClosedBox_t_T.
    Context {T : Set}.
    
    Ltac Self := exact (struct_visibility.my.ClosedBox.t T).
    
    Parameter new : (M.Val T) -> M (M.Val (struct_visibility.my.ClosedBox.t T)).
    
    Global Instance AssociatedFunction_new :
      Notation.DoubleColon ltac:(Self) "new" := {
      Notation.double_colon := new;
    }.
  End Impl_struct_visibility_my_ClosedBox_t_T.
  End Impl_struct_visibility_my_ClosedBox_t_T.
End my.

Module  OpenBox.
Section OpenBox.
  Context (T : Set).
  
  Record t : Set := {
    contents : T;
  }.
  
  Global Instance Get_contents : Notation.Dot "contents" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(contents) : M _;
  }.
  Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(contents) : M _;
  }.
End OpenBox.
End OpenBox.

Module  ClosedBox.
Section ClosedBox.
  Context (T : Set).
  
  Record t : Set := {
    contents : T;
  }.
  
  Global Instance Get_contents : Notation.Dot "contents" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(contents) : M _;
  }.
  Global Instance Get_AF_contents : Notation.DoubleColon t "contents" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(contents) : M _;
  }.
End ClosedBox.
End ClosedBox.

Module  Impl_struct_visibility_my_ClosedBox_t_T_2.
Section Impl_struct_visibility_my_ClosedBox_t_T_2.
  Context {T : Set}.
  
  Ltac Self := exact (struct_visibility.my.ClosedBox.t T).
  
  Parameter new : (M.Val T) -> M (M.Val (struct_visibility.my.ClosedBox.t T)).
  
  Global Instance AssociatedFunction_new :
    Notation.DoubleColon ltac:(Self) "new" := {
    Notation.double_colon := new;
  }.
End Impl_struct_visibility_my_ClosedBox_t_T_2.
End Impl_struct_visibility_my_ClosedBox_t_T_2.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).
