(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  (* Enum MathError *)
  (* {
    ty_params := [];
    variants :=
      [
        {
          name := "DivisionByZero";
          item := StructTuple [];
          discriminant := None;
        };
        {
          name := "NonPositiveLogarithm";
          item := StructTuple [];
          discriminant := None;
        };
        {
          name := "NegativeSquareRoot";
          item := StructTuple [];
          discriminant := None;
        }
      ];
  } *)
  
  Module Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
    Definition Self : Ty.t := Ty.path "result_chaining_with_question_mark::checked::MathError".
    
    Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Axiom MathResult :
    (Ty.path "result_chaining_with_question_mark::checked::MathResult") =
      (Ty.apply
        (Ty.path "core::result::Result")
        [ Ty.path "f64"; Ty.path "result_chaining_with_question_mark::checked::MathError" ]).
  
  Parameter div : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter sqrt : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter ln : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter op_ : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter op : (list Ty.t) -> (list Value.t) -> M.
End checked.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
