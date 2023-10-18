(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

Parameter cos :
    forall `{State.Trait},
    foreign_function_interface.Complex -> M foreign_function_interface.Complex.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{State.Trait}, M unit.

Module Complex.
  Unset Primitive Projections.
  Record t `{State.Trait} : Set := {
    re : f32;
    im : f32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_re `{State.Trait} : Notation.Dot "re" := {
    Notation.dot x := let* x := M.read x in Pure x.(re) : M _;
  }.
  Global Instance Get_AF_re `{State.Trait} : Notation.DoubleColon t "re" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(re) : M _;
  }.
  Global Instance Get_im `{State.Trait} : Notation.Dot "im" := {
    Notation.dot x := let* x := M.read x in Pure x.(im) : M _;
  }.
  Global Instance Get_AF_im `{State.Trait} : Notation.DoubleColon t "im" := {
    Notation.double_colon x := let* x := M.read x in Pure x.(im) : M _;
  }.
End Complex.
Definition Complex `{State.Trait} : Set := M.val (Complex.t).

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  Definition Self `{State.Trait} := foreign_function_interface.Complex.
  
  Parameter clone :
      forall `{State.Trait},
      (ref Self) -> M foreign_function_interface.Complex.
  
  Global Instance Method_clone `{State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I `{State.Trait} : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone := clone;
  }.
  Global Hint Resolve I : core.
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Definition Self `{State.Trait} := foreign_function_interface.Complex.
  
  Global Instance I `{State.Trait} : core.marker.Copy.Trait Self := {
  }.
  Global Hint Resolve I : core.
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  Definition Self `{State.Trait} := foreign_function_interface.Complex.
  
  Parameter fmt :
      forall `{State.Trait},
      (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
  
  Global Instance Method_fmt `{State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I `{State.Trait} : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
  Global Hint Resolve I : core.
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
