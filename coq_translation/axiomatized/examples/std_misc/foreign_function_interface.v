(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

Parameter cos :
    (M.Val foreign_function_interface.Complex.t) ->
      M (M.Val foreign_function_interface.Complex.t).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : M (M.Val unit).

Module  Complex.
Section Complex.
  Record t : Set := {
    re : f32.t;
    im : f32.t;
  }.
  
  Global Instance Get_re : Notation.Dot "re" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(re) : M _;
  }.
  Global Instance Get_AF_re : Notation.DoubleColon t "re" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(re) : M _;
  }.
  Global Instance Get_im : Notation.Dot "im" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(im) : M _;
  }.
  Global Instance Get_AF_im : Notation.DoubleColon t "im" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(im) : M _;
  }.
End Complex.
End Complex.

Module  Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
Section Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
  Parameter clone :
      (M.Val (ref ltac:(Self))) ->
        M (M.Val foreign_function_interface.Complex.t).
  
  Global Instance AssociatedFunction_clone :
    Notation.DoubleColon ltac:(Self) "clone" := {
    Notation.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex_t.

Module  Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
Section Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex_t.

Module  Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
Section Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
  Ltac Self := exact foreign_function_interface.Complex.t.
  
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
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex_t.
