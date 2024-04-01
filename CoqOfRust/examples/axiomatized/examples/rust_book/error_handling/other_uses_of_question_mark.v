(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "other_uses_of_question_mark::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [
        T;
        Ty.apply
          (Ty.path "alloc::boxed::Box")
          [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global" ]
      ]).

(* StructTuple
  {
    name := "EmptyVec";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
  Axiom Implements :
    M.IsTraitInstance "core::error::Error" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.

Parameter double_first : (list Ty.t) -> (list Value.t) -> M.

Parameter print : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
