(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_updated_incrementer_AccountId.

Module Impl_core_clone_Clone_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_updated_incrementer_AccountId.

Module Impl_core_marker_Copy_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_updated_incrementer_AccountId.

Axiom Hash : (Ty.path "updated_incrementer::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(*
Enum Error
{
  ty_params := [];
  variants := [];
}
*)

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "updated_incrementer::AccountId") ];
  } *)

Module Impl_updated_incrementer_Env.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Env".
  
  Parameter set_code_hash : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_set_code_hash :
    M.IsAssociatedFunction Self "set_code_hash" set_code_hash.
End Impl_updated_incrementer_Env.

(* StructRecord
  {
    name := "Incrementer";
    ty_params := [];
    fields := [ ("count", Ty.path "u32") ];
  } *)

Module Impl_updated_incrementer_Incrementer.
  Definition Self : Ty.t := Ty.path "updated_incrementer::Incrementer".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter inc : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc.
  
  Parameter get : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
  
  Parameter set_code : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_set_code : M.IsAssociatedFunction Self "set_code" set_code.
End Impl_updated_incrementer_Incrementer.
