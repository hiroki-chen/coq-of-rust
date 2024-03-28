(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_runtime_AccountId.

Module Impl_core_clone_Clone_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_call_runtime_AccountId.

Module Impl_core_marker_Copy_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_call_runtime_AccountId.

Axiom Balance : (Ty.path "call_runtime::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "call_runtime::AccountId") ];
  } *)

(* Enum MultiAddress *)
(* {
  ty_params := [ "AccountId"; "AccountIndex" ];
  variants := [];
} *)

Module Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.
  Definition Self : Ty.t :=
    Ty.apply
      (Ty.path "call_runtime::MultiAddress")
      [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ].
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *)
        [ (* T *) Ty.path "call_runtime::AccountId" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.

(* Enum BalancesCall *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Transfer";
        item :=
          StructRecord
            [
              ("dest",
                Ty.apply
                  (Ty.path "call_runtime::MultiAddress")
                  [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ]);
              ("value", Ty.path "u128")
            ];
        discriminant := None;
      }
    ];
} *)

(* Enum RuntimeCall *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Balances";
        item := StructTuple [ Ty.path "call_runtime::BalancesCall" ];
        discriminant := None;
      }
    ];
} *)

(* StructTuple
  {
    name := "RuntimeCaller";
    ty_params := [];
  } *)

Module Impl_core_default_Default_for_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_runtime_RuntimeCaller.

(* Enum RuntimeError *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CallRuntimeFailed";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError.

Module Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError.

Module Impl_core_cmp_Eq_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ].
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError.

(* Enum EnvError *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CallRuntimeFailed";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "AnotherKindOfError";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "call_runtime::EnvError" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.

Module Impl_call_runtime_Env.
  Definition Self : Ty.t := Ty.path "call_runtime::Env".
  
  Parameter call_runtime : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call_runtime :
    M.IsAssociatedFunction Self "call_runtime" call_runtime.
End Impl_call_runtime_Env.

Module Impl_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter transfer_through_runtime : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_transfer_through_runtime :
    M.IsAssociatedFunction
      Self
      "transfer_through_runtime"
      transfer_through_runtime.
  
  Parameter call_nonexistent_extrinsic : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call_nonexistent_extrinsic :
    M.IsAssociatedFunction
      Self
      "call_nonexistent_extrinsic"
      call_nonexistent_extrinsic.
End Impl_call_runtime_RuntimeCaller.
