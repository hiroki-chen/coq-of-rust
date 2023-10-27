(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Person.
  Section Person.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      name : alloc.string.String;
      age : u8;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_name : Notation.Dot "name" := {
      Notation.dot x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_name : Notation.DoubleColon t "name" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(name) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_age : Notation.Dot "age" := {
      Notation.dot x := let* x := M.read x in Pure x.(age) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_age : Notation.DoubleColon t "age" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(age) : M _;
    }.
    Admitted.
  End Person.
End Person.
Definition Person `{ℋ : State.Trait} : Set := M.val Person.t.

Module Impl_core_fmt_Debug_for_structures_Person.
  Section Impl_core_fmt_Debug_for_structures_Person.
    Context `{ℋ : State.Trait}.
    
    Definition Self : Set := structures.Person.
    
    Parameter fmt :
        (ref Self) -> (mut_ref core.fmt.Formatter) -> M core.fmt.Result.
    
    Global Instance AssociatedFunction_fmt :
      Notation.DoubleColon Self "fmt" := {
      Notation.double_colon := fmt;
    }.
    
    #[refine] Global Instance ℐ : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt := fmt;
    }.
    Admitted.
  End Impl_core_fmt_Debug_for_structures_Person.
  Global Hint Resolve ℐ : core.
End Impl_core_fmt_Debug_for_structures_Person.

Module Unit.
  Section Unit.
    Context `{ℋ : State.Trait}.
    
    Inductive t : Set := Build.
  End Unit.
End Unit.
Definition Unit := @Unit.t.

Module Pair.
  Section Pair.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x0 : i32;
      x1 : f32;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_0 : Notation.Dot "0" := {
      Notation.dot x := let* x := M.read x in Pure x.(x0) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_1 : Notation.Dot "1" := {
      Notation.dot x := let* x := M.read x in Pure x.(x1) : M _;
    }.
    Admitted.
  End Pair.
End Pair.
Definition Pair `{ℋ : State.Trait} : Set := M.val Pair.t.

Module Point.
  Section Point.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      x : f32;
      y : f32;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_x : Notation.Dot "x" := {
      Notation.dot x' := let* x' := M.read x' in Pure x'.(x) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_x : Notation.DoubleColon t "x" := {
      Notation.double_colon x' := let* x' := M.read x' in Pure x'.(x) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_y : Notation.Dot "y" := {
      Notation.dot x := let* x := M.read x in Pure x.(y) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_y : Notation.DoubleColon t "y" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(y) : M _;
    }.
    Admitted.
  End Point.
End Point.
Definition Point `{ℋ : State.Trait} : Set := M.val Point.t.

Module Rectangle.
  Section Rectangle.
    Context `{ℋ : State.Trait}.
    
    Unset Primitive Projections.
    Record t : Set := {
      top_left : structures.Point;
      bottom_right : structures.Point;
    }.
    Global Set Primitive Projections.
    
    #[refine] Global Instance Get_top_left : Notation.Dot "top_left" := {
      Notation.dot x := let* x := M.read x in Pure x.(top_left) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_top_left :
      Notation.DoubleColon t "top_left" := {
      Notation.double_colon x := let* x := M.read x in Pure x.(top_left) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_bottom_right :
      Notation.Dot "bottom_right" := {
      Notation.dot x := let* x := M.read x in Pure x.(bottom_right) : M _;
    }.
    Admitted.
    #[refine] Global Instance Get_AF_bottom_right :
      Notation.DoubleColon t "bottom_right" := {
      Notation.double_colon x :=
        let* x := M.read x in Pure x.(bottom_right) : M _;
    }.
    Admitted.
  End Rectangle.
End Rectangle.
Definition Rectangle `{ℋ : State.Trait} : Set := M.val Rectangle.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : forall `{ℋ : State.Trait}, M unit.
