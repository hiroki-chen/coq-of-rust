(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum List *)

Module Impl_enums_testcase_linked_list_List.
  Definition Self : Ty.t := Ty.path "enums_testcase_linked_list::List".
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  Parameter prepend : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_prepend :
    M.IsAssociatedFunction Self "prepend" prepend [].
  
  Parameter len : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_len : M.IsAssociatedFunction Self "len" len [].
  
  Parameter stringify : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_stringify :
    M.IsAssociatedFunction Self "stringify" stringify [].
End Impl_enums_testcase_linked_list_List.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
