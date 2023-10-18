(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module List.
  Inductive t : Set :=
  |
    Cons
    (_ : u32)
    (_
      :
      alloc.boxed.Box enums_testcase_linked_list.List alloc.boxed.Box.Default.A)
  | Nil.
End List.
Definition List : Set := List.t.

Module Impl_enums_testcase_linked_list_List.
  Definition Self := enums_testcase_linked_list.List.
  
  Parameter new : forall `{State.Trait}, M enums_testcase_linked_list.List.
  
  Global Instance AssociatedFunction_new `{State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Parameter prepend :
      forall `{State.Trait},
      Self -> u32 -> M enums_testcase_linked_list.List.
  
  Global Instance Method_prepend `{State.Trait} : Notation.Dot "prepend" := {
    Notation.dot := prepend;
  }.
  
  Parameter len : forall `{State.Trait}, (ref Self) -> M u32.
  
  Global Instance Method_len `{State.Trait} : Notation.Dot "len" := {
    Notation.dot := len;
  }.
  
  Parameter stringify :
      forall `{State.Trait},
      (ref Self) -> M alloc.string.String.
  
  Global Instance Method_stringify `{State.Trait} :
    Notation.Dot "stringify" := {
    Notation.dot := stringify;
  }.
End Impl_enums_testcase_linked_list_List.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.
