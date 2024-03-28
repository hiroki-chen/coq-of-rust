(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Choice";
    ty_params := [];
    fields := [ Ty.path "u8" ];
  } *)

Module Impl_core_marker_Copy_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_subtle_Choice.

Module Impl_core_clone_Clone_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_subtle_Choice.

Module Impl_core_fmt_Debug_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_subtle_Choice.

Module Impl_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter unwrap_u8 : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_unwrap_u8 :
    M.IsAssociatedFunction Self "unwrap_u8" unwrap_u8.
End Impl_subtle_Choice.

Module Impl_core_convert_From_subtle_Choice_for_bool.
  Definition Self : Ty.t := Ty.path "bool".
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "subtle::Choice" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_subtle_Choice_for_bool.

Module Impl_core_ops_bit_BitAnd_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Definition _Output : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitand : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitAnd"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("Output", InstanceField.Ty _Output);
          ("bitand", InstanceField.Method bitand)
        ].
End Impl_core_ops_bit_BitAnd_for_subtle_Choice.

Module Impl_core_ops_bit_BitAndAssign_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitand_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitAndAssign"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("bitand_assign", InstanceField.Method bitand_assign) ].
End Impl_core_ops_bit_BitAndAssign_for_subtle_Choice.

Module Impl_core_ops_bit_BitOr_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Definition _Output : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitor : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitOr"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("Output", InstanceField.Ty _Output);
          ("bitor", InstanceField.Method bitor)
        ].
End Impl_core_ops_bit_BitOr_for_subtle_Choice.

Module Impl_core_ops_bit_BitOrAssign_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitor_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitOrAssign"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("bitor_assign", InstanceField.Method bitor_assign) ].
End Impl_core_ops_bit_BitOrAssign_for_subtle_Choice.

Module Impl_core_ops_bit_BitXor_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Definition _Output : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitxor : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitXor"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("Output", InstanceField.Ty _Output);
          ("bitxor", InstanceField.Method bitxor)
        ].
End Impl_core_ops_bit_BitXor_for_subtle_Choice.

Module Impl_core_ops_bit_BitXorAssign_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter bitxor_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::BitXorAssign"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("bitxor_assign", InstanceField.Method bitxor_assign) ].
End Impl_core_ops_bit_BitXorAssign_for_subtle_Choice.

Module Impl_core_ops_bit_Not_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Definition _Output : Ty.t := Ty.path "subtle::Choice".
  
  Parameter not : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::bit::Not"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("Output", InstanceField.Ty _Output);
          ("not", InstanceField.Method not)
        ].
End Impl_core_ops_bit_Not_for_subtle_Choice.

Parameter black_box : (list Ty.t) -> (list Value.t) -> M.

Module Impl_core_convert_From_u8_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "u8" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_u8_for_subtle_Choice.

(* Trait *)
Module ConstantTimeEq.
  Parameter ct_ne : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_ct_ne :
    M.IsProvidedMethod "subtle::ConstantTimeEq" "ct_ne" ct_ne.
End ConstantTimeEq.

Module Impl_subtle_ConstantTimeEq_for_slice_T.
  Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "slice") [ T ].
  
  Parameter ct_eq : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method (ct_eq T)) ].
End Impl_subtle_ConstantTimeEq_for_slice_T.

Module Impl_subtle_ConstantTimeEq_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_subtle_Choice.

Module Impl_subtle_ConstantTimeEq_for_u8.
  Definition Self : Ty.t := Ty.path "u8".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_u8.

Module Impl_subtle_ConstantTimeEq_for_i8.
  Definition Self : Ty.t := Ty.path "i8".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_i8.

Module Impl_subtle_ConstantTimeEq_for_u16.
  Definition Self : Ty.t := Ty.path "u16".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_u16.

Module Impl_subtle_ConstantTimeEq_for_i16.
  Definition Self : Ty.t := Ty.path "i16".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_i16.

Module Impl_subtle_ConstantTimeEq_for_u32.
  Definition Self : Ty.t := Ty.path "u32".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_u32.

Module Impl_subtle_ConstantTimeEq_for_i32.
  Definition Self : Ty.t := Ty.path "i32".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_i32.

Module Impl_subtle_ConstantTimeEq_for_u64.
  Definition Self : Ty.t := Ty.path "u64".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_u64.

Module Impl_subtle_ConstantTimeEq_for_i64.
  Definition Self : Ty.t := Ty.path "i64".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_i64.

Module Impl_subtle_ConstantTimeEq_for_usize.
  Definition Self : Ty.t := Ty.path "usize".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_usize.

Module Impl_subtle_ConstantTimeEq_for_isize.
  Definition Self : Ty.t := Ty.path "isize".
  
  Parameter ct_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method ct_eq) ].
End Impl_subtle_ConstantTimeEq_for_isize.

(* Trait *)
Module ConditionallySelectable.
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_conditional_assign :
    M.IsProvidedMethod
      "subtle::ConditionallySelectable"
      "conditional_assign"
      conditional_assign.
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_conditional_swap :
    M.IsProvidedMethod
      "subtle::ConditionallySelectable"
      "conditional_swap"
      conditional_swap.
End ConditionallySelectable.

Module Impl_subtle_ConditionallySelectable_for_u8.
  Definition Self : Ty.t := Ty.path "u8".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_u8.

Module Impl_subtle_ConditionallySelectable_for_i8.
  Definition Self : Ty.t := Ty.path "i8".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_i8.

Module Impl_subtle_ConditionallySelectable_for_u16.
  Definition Self : Ty.t := Ty.path "u16".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_u16.

Module Impl_subtle_ConditionallySelectable_for_i16.
  Definition Self : Ty.t := Ty.path "i16".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_i16.

Module Impl_subtle_ConditionallySelectable_for_u32.
  Definition Self : Ty.t := Ty.path "u32".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_u32.

Module Impl_subtle_ConditionallySelectable_for_i32.
  Definition Self : Ty.t := Ty.path "i32".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_i32.

Module Impl_subtle_ConditionallySelectable_for_u64.
  Definition Self : Ty.t := Ty.path "u64".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_u64.

Module Impl_subtle_ConditionallySelectable_for_i64.
  Definition Self : Ty.t := Ty.path "i64".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_assign : (list Ty.t) -> (list Value.t) -> M.
  
  Parameter conditional_swap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("conditional_select", InstanceField.Method conditional_select);
          ("conditional_assign", InstanceField.Method conditional_assign);
          ("conditional_swap", InstanceField.Method conditional_swap)
        ].
End Impl_subtle_ConditionallySelectable_for_i64.

Module Impl_subtle_ConditionallySelectable_for_subtle_Choice.
  Definition Self : Ty.t := Ty.path "subtle::Choice".
  
  Parameter conditional_select : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("conditional_select", InstanceField.Method conditional_select) ].
End Impl_subtle_ConditionallySelectable_for_subtle_Choice.

(* Trait *)
Module ConditionallyNegatable.
  
End ConditionallyNegatable.

Module Impl_subtle_ConditionallyNegatable_for_T.
  Definition Self (T : Ty.t) : Ty.t := T.
  
  Parameter conditional_negate :
      forall (T : Ty.t),
      (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "subtle::ConditionallyNegatable"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("conditional_negate", InstanceField.Method (conditional_negate T)) ].
End Impl_subtle_ConditionallyNegatable_for_T.

(* StructRecord
  {
    name := "CtOption";
    ty_params := [ "T" ];
    fields := [ ("value", T); ("is_some", Ty.path "subtle::Choice") ];
  } *)

Module Impl_core_clone_Clone_for_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Parameter clone : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::clone::Clone"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
End Impl_core_clone_Clone_for_subtle_CtOption_T.

Module Impl_core_marker_Copy_for_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::marker::Copy"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_subtle_CtOption_T.

Module Impl_core_fmt_Debug_for_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Parameter fmt : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt T)) ].
End Impl_core_fmt_Debug_for_subtle_CtOption_T.

Module Impl_core_convert_From_subtle_CtOption_T_for_core_option_Option_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "core::option::Option") [ T ].
  
  Parameter from : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::convert::From"
      (Self T)
      (* Trait polymorphic types *)
        [ (* T *) Ty.apply (Ty.path "subtle::CtOption") [ T ] ]
      (* Instance *) [ ("from", InstanceField.Method (from T)) ].
End Impl_core_convert_From_subtle_CtOption_T_for_core_option_Option_T.

Module Impl_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Parameter new : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "new" (new T).
  
  Parameter expect : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_expect :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "expect" (expect T).
  
  Parameter unwrap : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_unwrap :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "unwrap" (unwrap T).
  
  Parameter unwrap_or : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_unwrap_or :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "unwrap_or" (unwrap_or T).
  
  Parameter unwrap_or_else :
      forall (T : Ty.t),
      (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_unwrap_or_else :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "unwrap_or_else" (unwrap_or_else T).
  
  Parameter is_some : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_is_some :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "is_some" (is_some T).
  
  Parameter is_none : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_is_none :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "is_none" (is_none T).
  
  Parameter map : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_map :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "map" (map T).
  
  Parameter and_then : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_and_then :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "and_then" (and_then T).
  
  Parameter or_else : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_or_else :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "or_else" (or_else T).
End Impl_subtle_CtOption_T.

Module Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Parameter conditional_select :
      forall (T : Ty.t),
      (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "subtle::ConditionallySelectable"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("conditional_select", InstanceField.Method (conditional_select T)) ].
End Impl_subtle_ConditionallySelectable_for_subtle_CtOption_T.

Module Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "subtle::CtOption") [ T ].
  
  Parameter ct_eq : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "subtle::ConstantTimeEq"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_eq", InstanceField.Method (ct_eq T)) ].
End Impl_subtle_ConstantTimeEq_for_subtle_CtOption_T.

(* Trait *)
Module ConstantTimeGreater.
  
End ConstantTimeGreater.

Module Impl_subtle_ConstantTimeGreater_for_u8.
  Definition Self : Ty.t := Ty.path "u8".
  
  Parameter ct_gt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeGreater"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_gt", InstanceField.Method ct_gt) ].
End Impl_subtle_ConstantTimeGreater_for_u8.

Module Impl_subtle_ConstantTimeGreater_for_u16.
  Definition Self : Ty.t := Ty.path "u16".
  
  Parameter ct_gt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeGreater"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_gt", InstanceField.Method ct_gt) ].
End Impl_subtle_ConstantTimeGreater_for_u16.

Module Impl_subtle_ConstantTimeGreater_for_u32.
  Definition Self : Ty.t := Ty.path "u32".
  
  Parameter ct_gt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeGreater"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_gt", InstanceField.Method ct_gt) ].
End Impl_subtle_ConstantTimeGreater_for_u32.

Module Impl_subtle_ConstantTimeGreater_for_u64.
  Definition Self : Ty.t := Ty.path "u64".
  
  Parameter ct_gt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeGreater"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("ct_gt", InstanceField.Method ct_gt) ].
End Impl_subtle_ConstantTimeGreater_for_u64.

(* Trait *)
Module ConstantTimeLess.
  Parameter ct_lt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom ProvidedMethod_ct_lt :
    M.IsProvidedMethod "subtle::ConstantTimeLess" "ct_lt" ct_lt.
End ConstantTimeLess.

Module Impl_subtle_ConstantTimeLess_for_u8.
  Definition Self : Ty.t := Ty.path "u8".
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeLess"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_subtle_ConstantTimeLess_for_u8.

Module Impl_subtle_ConstantTimeLess_for_u16.
  Definition Self : Ty.t := Ty.path "u16".
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeLess"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_subtle_ConstantTimeLess_for_u16.

Module Impl_subtle_ConstantTimeLess_for_u32.
  Definition Self : Ty.t := Ty.path "u32".
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeLess"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_subtle_ConstantTimeLess_for_u32.

Module Impl_subtle_ConstantTimeLess_for_u64.
  Definition Self : Ty.t := Ty.path "u64".
  
  Axiom Implements :
    M.IsTraitInstance
      "subtle::ConstantTimeLess"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_subtle_ConstantTimeLess_for_u64.
