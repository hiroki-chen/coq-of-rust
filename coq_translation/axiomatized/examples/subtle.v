(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Choice.
    Unset Primitive Projections.
    Record t : Set := {
      _ : u8;
    }.
    Global Set Primitive Projections.
  
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
End Choice.
Definition Choice := Choice.t.

Module Impl_core_marker_Copy_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_subtle_Choice.

Module Impl_core_clone_Clone_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_subtle_Choice.

Module Impl_core_fmt_Debug_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_subtle_Choice.

Module Impl_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter unwrap_u8 : forall `{H : State.Trait}, ref Self -> M (H := H) u8.
  
  Global Instance Method_unwrap_u8 `{H : State.Trait} :
    Notation.Dot "unwrap_u8" := {
    Notation.dot := unwrap_u8;
  }.
End Impl_subtle_Choice.

Module Impl_core_convert_From_for_bool.
  Definition Self := bool.
  
  Parameter from : forall `{H : State.Trait}, subtle.Choice -> M (H := H) bool.
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I : core.convert.From.Trait Self (T := subtle.Choice) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_bool.

Module Impl_core_ops_bit_BitAnd_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Definition Output : Set := subtle.Choice.
  
  Parameter bitand : forall `{H : State.Trait},
      Self ->
      subtle.Choice ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_bitand `{H : State.Trait} : Notation.Dot "bitand" := {
    Notation.dot := bitand;
  }.
  
  Global Instance I : core.ops.bit.BitAnd.Trait Self := {
    core.ops.bit.BitAnd.bitand `{H : State.Trait} := bitand;
  }.
End Impl_core_ops_bit_BitAnd_for_subtle_Choice.

Module Impl_core_ops_bit_BitAndAssign_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter bitand_assign : forall `{H : State.Trait},
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_bitand_assign `{H : State.Trait} :
    Notation.Dot "bitand_assign" := {
    Notation.dot := bitand_assign;
  }.
  
  Global Instance I : core.ops.bit.BitAndAssign.Trait Self := {
    core.ops.bit.BitAndAssign.bitand_assign `{H : State.Trait} := bitand_assign;
  }.
End Impl_core_ops_bit_BitAndAssign_for_subtle_Choice.

Module Impl_core_ops_bit_BitOr_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Definition Output : Set := subtle.Choice.
  
  Parameter bitor : forall `{H : State.Trait},
      Self ->
      subtle.Choice ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_bitor `{H : State.Trait} : Notation.Dot "bitor" := {
    Notation.dot := bitor;
  }.
  
  Global Instance I : core.ops.bit.BitOr.Trait Self := {
    core.ops.bit.BitOr.bitor `{H : State.Trait} := bitor;
  }.
End Impl_core_ops_bit_BitOr_for_subtle_Choice.

Module Impl_core_ops_bit_BitOrAssign_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter bitor_assign : forall `{H : State.Trait},
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_bitor_assign `{H : State.Trait} :
    Notation.Dot "bitor_assign" := {
    Notation.dot := bitor_assign;
  }.
  
  Global Instance I : core.ops.bit.BitOrAssign.Trait Self := {
    core.ops.bit.BitOrAssign.bitor_assign `{H : State.Trait} := bitor_assign;
  }.
End Impl_core_ops_bit_BitOrAssign_for_subtle_Choice.

Module Impl_core_ops_bit_BitXor_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Definition Output : Set := subtle.Choice.
  
  Parameter bitxor : forall `{H : State.Trait},
      Self ->
      subtle.Choice ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_bitxor `{H : State.Trait} : Notation.Dot "bitxor" := {
    Notation.dot := bitxor;
  }.
  
  Global Instance I : core.ops.bit.BitXor.Trait Self := {
    core.ops.bit.BitXor.bitxor `{H : State.Trait} := bitxor;
  }.
End Impl_core_ops_bit_BitXor_for_subtle_Choice.

Module Impl_core_ops_bit_BitXorAssign_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter bitxor_assign : forall `{H : State.Trait},
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_bitxor_assign `{H : State.Trait} :
    Notation.Dot "bitxor_assign" := {
    Notation.dot := bitxor_assign;
  }.
  
  Global Instance I : core.ops.bit.BitXorAssign.Trait Self := {
    core.ops.bit.BitXorAssign.bitxor_assign `{H : State.Trait} := bitxor_assign;
  }.
End Impl_core_ops_bit_BitXorAssign_for_subtle_Choice.

Module Impl_core_ops_bit_Not_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Definition Output : Set := subtle.Choice.
  
  Parameter not : forall `{H : State.Trait}, Self -> M (H := H) subtle.Choice.
  
  Global Instance Method_not `{H : State.Trait} : Notation.Dot "not" := {
    Notation.dot := not;
  }.
  
  Global Instance I : core.ops.bit.Not.Trait Self := {
    core.ops.bit.Not.not `{H : State.Trait} := not;
  }.
End Impl_core_ops_bit_Not_for_subtle_Choice.

Parameter black_box : forall `{H : State.Trait}, u8 -> M (H := H) u8.

Module Impl_core_convert_From_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter from : forall `{H : State.Trait}, u8 -> M (H := H) subtle.Choice.
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I : core.convert.From.Trait Self (T := u8) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_subtle_Choice.

Module ConstantTimeEq.
  Class Trait (Self : Set) : Set := {
    ct_eq
      `{H : State.Trait}
      :
      (ref Self) -> (ref Self) -> (M (H := H) subtle.Choice);
  }.
  
  Global Instance Method_ct_eq `{H : State.Trait} `(Trait)
    : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  Global Instance Method_ct_ne `{H : State.Trait} `(Trait)
    : Notation.Dot "ct_ne" := {
    Notation.dot (self : ref Self) (other : ref Self) :=
      (let* α0 := self.["ct_eq"] other in
      α0.["not"]
      : M (H := H) subtle.Choice);
  }.
End ConstantTimeEq.

Module Impl_subtle_ConstantTimeEq_for_Slice.
Section Impl_subtle_ConstantTimeEq_for_Slice.
  Context {T : Set}.
  
  Definition Self := Slice.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref Slice ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_Slice.
End Impl_subtle_ConstantTimeEq_for_Slice.

Module Impl_subtle_ConstantTimeEq_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref subtle.Choice ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_subtle_Choice.

Module Impl_subtle_ConstantTimeEq_for_u8.
  Definition Self := u8.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref u8 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_u8.

Module Impl_subtle_ConstantTimeEq_for_i8.
  Definition Self := i8.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref i8 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_i8.

Module Impl_subtle_ConstantTimeEq_for_u16.
  Definition Self := u16.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref u16 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_u16.

Module Impl_subtle_ConstantTimeEq_for_i16.
  Definition Self := i16.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref i16 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_i16.

Module Impl_subtle_ConstantTimeEq_for_u32.
  Definition Self := u32.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref u32 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_u32.

Module Impl_subtle_ConstantTimeEq_for_i32.
  Definition Self := i32.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref i32 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_i32.

Module Impl_subtle_ConstantTimeEq_for_u64.
  Definition Self := u64.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref u64 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_u64.

Module Impl_subtle_ConstantTimeEq_for_i64.
  Definition Self := i64.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref i64 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_i64.

Module Impl_subtle_ConstantTimeEq_for_usize.
  Definition Self := usize.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref usize ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_usize.

Module Impl_subtle_ConstantTimeEq_for_isize.
  Definition Self := isize.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref isize ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_isize.

Module ConditionallySelectable.
  Class Trait (Self : Set) : Set := {
    conditional_select
      `{H : State.Trait}
      :
      (ref Self) -> (ref Self) -> subtle.Choice -> (M (H := H) Self);
  }.
  
  Global Instance Method_conditional_select `{H : State.Trait} `(Trait)
    : Notation.Dot "conditional_select" := {
    Notation.dot := conditional_select;
  }.
  Global Instance Method_conditional_assign `{H : State.Trait} `(Trait)
    : Notation.Dot "conditional_assign" := {
    Notation.dot
        (self : mut_ref Self)
        (other : ref Self)
        (choice : subtle.Choice) :=
      (let* _ :=
        let* α0 := Self::["conditional_select"] self other choice in
        assign self.["deref"] α0 in
      Pure tt
      : M (H := H) unit);
  }.
  Global Instance Method_conditional_swap `{H : State.Trait} `(Trait)
    : Notation.Dot "conditional_swap" := {
    Notation.dot
        (a : mut_ref Self)
        (b : mut_ref Self)
        (choice : subtle.Choice) :=
      (let* t := a.["deref"] in
      let* _ := a.["conditional_assign"] (addr_of b) choice in
      let* _ := b.["conditional_assign"] (addr_of t) choice in
      Pure tt
      : M (H := H) unit);
  }.
End ConditionallySelectable.

Module Impl_subtle_ConditionallySelectable_for_u8.
  Definition Self := u8.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_u8.

Module Impl_subtle_ConditionallySelectable_for_i8.
  Definition Self := i8.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_i8.

Module Impl_subtle_ConditionallySelectable_for_u16.
  Definition Self := u16.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_u16.

Module Impl_subtle_ConditionallySelectable_for_i16.
  Definition Self := i16.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_i16.

Module Impl_subtle_ConditionallySelectable_for_u32.
  Definition Self := u32.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_u32.

Module Impl_subtle_ConditionallySelectable_for_i32.
  Definition Self := i32.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_i32.

Module Impl_subtle_ConditionallySelectable_for_u64.
  Definition Self := u64.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_u64.

Module Impl_subtle_ConditionallySelectable_for_i64.
  Definition Self := i64.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Parameter conditional_assign : forall `{H : State.Trait},
      mut_ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_assign `{H : State.Trait} :
    Notation.Dot "conditional_assign" := {
    Notation.dot := conditional_assign;
  }.
  
  Parameter conditional_swap : forall `{H : State.Trait},
      mut_ref Self ->
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance AssociatedFunction_conditional_swap `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_swap" := {
    Notation.double_colon := conditional_swap;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_i64.

Module Impl_subtle_ConditionallySelectable_for_subtle_Choice.
  Definition Self := subtle.Choice.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_subtle_Choice.

Module ConditionallyNegatable.
  Class Trait (Self : Set) : Set := {
    conditional_negate
      `{H : State.Trait}
      :
      (mut_ref Self) -> subtle.Choice -> (M (H := H) unit);
  }.
  
  Global Instance Method_conditional_negate `{H : State.Trait} `(Trait)
    : Notation.Dot "conditional_negate" := {
    Notation.dot := conditional_negate;
  }.
End ConditionallyNegatable.

Module Impl_subtle_ConditionallyNegatable_for_T.
Section Impl_subtle_ConditionallyNegatable_for_T.
  Context {T : Set}.
  
  Definition Self := T.
  
  Parameter conditional_negate : forall `{H : State.Trait},
      mut_ref Self ->
      subtle.Choice ->
      M (H := H) unit.
  
  Global Instance Method_conditional_negate `{H : State.Trait} :
    Notation.Dot "conditional_negate" := {
    Notation.dot := conditional_negate;
  }.
  
  Global Instance I : subtle.ConditionallyNegatable.Trait Self := {
    subtle.ConditionallyNegatable.conditional_negate
      `{H : State.Trait}
      :=
      conditional_negate;
  }.
End Impl_subtle_ConditionallyNegatable_for_T.
End Impl_subtle_ConditionallyNegatable_for_T.

Module CtOption.Section CtOption.
Context {T : Set}.

  Unset Primitive Projections.
  Record t : Set := {
    value : T;
    is_some : subtle.Choice;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_value : Notation.Dot "value" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_is_some : Notation.Dot "is_some" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.


End CtOption.
End CtOption.
Definition CtOption : Set := CtOption.t.

Module Impl_core_clone_Clone_for_subtle_CtOption_T.
Section Impl_core_clone_Clone_for_subtle_CtOption_T.
  Context {T : Set}.
  
  Definition Self := subtle.CtOption T.
  
  Parameter clone : forall `{H : State.Trait},
      ref Self ->
      M (H := H) (subtle.CtOption T).
  
  Global Instance Method_clone `{H : State.Trait} : Notation.Dot "clone" := {
    Notation.dot := clone;
  }.
  
  Global Instance I : core.clone.Clone.Trait Self := {
    core.clone.Clone.clone `{H : State.Trait} := clone;
  }.
End Impl_core_clone_Clone_for_subtle_CtOption_T.
End Impl_core_clone_Clone_for_subtle_CtOption_T.

Module Impl_core_marker_Copy_for_subtle_CtOption_T.
Section Impl_core_marker_Copy_for_subtle_CtOption_T.
  Context {T : Set}.
  
  Definition Self := subtle.CtOption T.
  
  Global Instance I : core.marker.Copy.Trait Self :=
    core.marker.Copy.Build_Trait _.
End Impl_core_marker_Copy_for_subtle_CtOption_T.
End Impl_core_marker_Copy_for_subtle_CtOption_T.

Module Impl_core_fmt_Debug_for_subtle_CtOption_T.
Section Impl_core_fmt_Debug_for_subtle_CtOption_T.
  Context {T : Set}.
  
  Definition Self := subtle.CtOption T.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_subtle_CtOption_T.
End Impl_core_fmt_Debug_for_subtle_CtOption_T.

Module Impl_core_convert_From_for_core_option_Option_T.
Section Impl_core_convert_From_for_core_option_Option_T.
  Context {T : Set}.
  
  Definition Self := core.option.Option T.
  
  Parameter from : forall `{H : State.Trait},
      subtle.CtOption T ->
      M (H := H) (core.option.Option T).
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I : core.convert.From.Trait Self (T := subtle.CtOption T) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_core_option_Option_T.
End Impl_core_convert_From_for_core_option_Option_T.

Module Impl_subtle_CtOption_T.
  Definition Self := subtle.CtOption T.
  
  Parameter new : forall `{H : State.Trait},
      T ->
      subtle.Choice ->
      M (H := H) (subtle.CtOption T).
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
  
  Parameter expect : forall `{H : State.Trait}, Self -> ref str -> M (H := H) T.
  
  Global Instance Method_expect `{H : State.Trait} : Notation.Dot "expect" := {
    Notation.dot := expect;
  }.
  
  Parameter unwrap : forall `{H : State.Trait}, Self -> M (H := H) T.
  
  Global Instance Method_unwrap `{H : State.Trait} : Notation.Dot "unwrap" := {
    Notation.dot := unwrap;
  }.
  
  Parameter unwrap_or : forall `{H : State.Trait}, Self -> T -> M (H := H) T.
  
  Global Instance Method_unwrap_or `{H : State.Trait} :
    Notation.Dot "unwrap_or" := {
    Notation.dot := unwrap_or;
  }.
  
  Parameter unwrap_or_else : forall `{H : State.Trait},
      Self ->
      F ->
      M (H := H) T.
  
  Global Instance Method_unwrap_or_else `{H : State.Trait} :
    Notation.Dot "unwrap_or_else" := {
    Notation.dot := unwrap_or_else;
  }.
  
  Parameter is_some : forall `{H : State.Trait},
      ref Self ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_is_some `{H : State.Trait} :
    Notation.Dot "is_some" := {
    Notation.dot := is_some;
  }.
  
  Parameter is_none : forall `{H : State.Trait},
      ref Self ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_is_none `{H : State.Trait} :
    Notation.Dot "is_none" := {
    Notation.dot := is_none;
  }.
  
  Parameter map : forall `{H : State.Trait},
      Self ->
      F ->
      M (H := H) (subtle.CtOption U).
  
  Global Instance Method_map `{H : State.Trait} : Notation.Dot "map" := {
    Notation.dot := map;
  }.
  
  Parameter and_then : forall `{H : State.Trait},
      Self ->
      F ->
      M (H := H) (subtle.CtOption U).
  
  Global Instance Method_and_then `{H : State.Trait} :
    Notation.Dot "and_then" := {
    Notation.dot := and_then;
  }.
  
  Parameter or_else : forall `{H : State.Trait},
      Self ->
      F ->
      M (H := H) (subtle.CtOption T).
  
  Global Instance Method_or_else `{H : State.Trait} :
    Notation.Dot "or_else" := {
    Notation.dot := or_else;
  }.
End Impl_subtle_CtOption_T.

Module Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.
Section Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.
  Context {T : Set}.
  
  Definition Self := subtle.CtOption T.
  
  Parameter conditional_select : forall `{H : State.Trait},
      ref Self ->
      ref Self ->
      subtle.Choice ->
      M (H := H) Self.
  
  Global Instance AssociatedFunction_conditional_select `{H : State.Trait} :
    Notation.DoubleColon Self "conditional_select" := {
    Notation.double_colon := conditional_select;
  }.
  
  Global Instance I : subtle.ConditionallySelectable.Trait Self := {
    subtle.ConditionallySelectable.conditional_select
      `{H : State.Trait}
      :=
      conditional_select;
  }.
End Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.
End Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.

Module Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.
Section Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.
  Context {T : Set}.
  
  Definition Self := subtle.CtOption T.
  
  Parameter ct_eq : forall `{H : State.Trait},
      ref Self ->
      ref (subtle.CtOption T) ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_eq `{H : State.Trait} : Notation.Dot "ct_eq" := {
    Notation.dot := ct_eq;
  }.
  
  Global Instance I : subtle.ConstantTimeEq.Trait Self := {
    subtle.ConstantTimeEq.ct_eq `{H : State.Trait} := ct_eq;
  }.
End Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.
End Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.

Module ConstantTimeGreater.
  Class Trait (Self : Set) : Set := {
    ct_gt
      `{H : State.Trait}
      :
      (ref Self) -> (ref Self) -> (M (H := H) subtle.Choice);
  }.
  
  Global Instance Method_ct_gt `{H : State.Trait} `(Trait)
    : Notation.Dot "ct_gt" := {
    Notation.dot := ct_gt;
  }.
End ConstantTimeGreater.

Module Impl_subtle_ConstantTimeGreater_for_u8.
  Definition Self := u8.
  
  Parameter ct_gt : forall `{H : State.Trait},
      ref Self ->
      ref u8 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_gt `{H : State.Trait} : Notation.Dot "ct_gt" := {
    Notation.dot := ct_gt;
  }.
  
  Global Instance I : subtle.ConstantTimeGreater.Trait Self := {
    subtle.ConstantTimeGreater.ct_gt `{H : State.Trait} := ct_gt;
  }.
End Impl_subtle_ConstantTimeGreater_for_u8.

Module Impl_subtle_ConstantTimeGreater_for_u16.
  Definition Self := u16.
  
  Parameter ct_gt : forall `{H : State.Trait},
      ref Self ->
      ref u16 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_gt `{H : State.Trait} : Notation.Dot "ct_gt" := {
    Notation.dot := ct_gt;
  }.
  
  Global Instance I : subtle.ConstantTimeGreater.Trait Self := {
    subtle.ConstantTimeGreater.ct_gt `{H : State.Trait} := ct_gt;
  }.
End Impl_subtle_ConstantTimeGreater_for_u16.

Module Impl_subtle_ConstantTimeGreater_for_u32.
  Definition Self := u32.
  
  Parameter ct_gt : forall `{H : State.Trait},
      ref Self ->
      ref u32 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_gt `{H : State.Trait} : Notation.Dot "ct_gt" := {
    Notation.dot := ct_gt;
  }.
  
  Global Instance I : subtle.ConstantTimeGreater.Trait Self := {
    subtle.ConstantTimeGreater.ct_gt `{H : State.Trait} := ct_gt;
  }.
End Impl_subtle_ConstantTimeGreater_for_u32.

Module Impl_subtle_ConstantTimeGreater_for_u64.
  Definition Self := u64.
  
  Parameter ct_gt : forall `{H : State.Trait},
      ref Self ->
      ref u64 ->
      M (H := H) subtle.Choice.
  
  Global Instance Method_ct_gt `{H : State.Trait} : Notation.Dot "ct_gt" := {
    Notation.dot := ct_gt;
  }.
  
  Global Instance I : subtle.ConstantTimeGreater.Trait Self := {
    subtle.ConstantTimeGreater.ct_gt `{H : State.Trait} := ct_gt;
  }.
End Impl_subtle_ConstantTimeGreater_for_u64.

Module ConstantTimeLess.
  Class Trait (Self : Set) : Set := {
  }.
  
  Global Instance Method_ct_lt `{H : State.Trait} `(Trait)
    : Notation.Dot "ct_lt" := {
    Notation.dot (self : ref Self) (other : ref Self) :=
      (let* α0 := self.["ct_gt"] other in
      let* α1 := α0.["not"] in
      let* α2 := self.["ct_eq"] other in
      let* α3 := α2.["not"] in
      α1.["bitand"] α3
      : M (H := H) subtle.Choice);
  }.
End ConstantTimeLess.

Module Impl_subtle_ConstantTimeLess_for_u8.
  Definition Self := u8.
  
  Global Instance I : subtle.ConstantTimeLess.Trait Self :=
    subtle.ConstantTimeLess.Build_Trait _.
End Impl_subtle_ConstantTimeLess_for_u8.

Module Impl_subtle_ConstantTimeLess_for_u16.
  Definition Self := u16.
  
  Global Instance I : subtle.ConstantTimeLess.Trait Self :=
    subtle.ConstantTimeLess.Build_Trait _.
End Impl_subtle_ConstantTimeLess_for_u16.

Module Impl_subtle_ConstantTimeLess_for_u32.
  Definition Self := u32.
  
  Global Instance I : subtle.ConstantTimeLess.Trait Self :=
    subtle.ConstantTimeLess.Build_Trait _.
End Impl_subtle_ConstantTimeLess_for_u32.

Module Impl_subtle_ConstantTimeLess_for_u64.
  Definition Self := u64.
  
  Global Instance I : subtle.ConstantTimeLess.Trait Self :=
    subtle.ConstantTimeLess.Build_Trait _.
End Impl_subtle_ConstantTimeLess_for_u64.
