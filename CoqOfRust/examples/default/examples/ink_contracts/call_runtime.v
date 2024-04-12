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
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "call_runtime::AccountId"
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "u128", [], "default", [] |),
              []
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_runtime_AccountId.

Module Impl_core_clone_Clone_for_call_runtime_AccountId.
  Definition Self : Ty.t := Ty.path "call_runtime::AccountId".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
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
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_call_runtime_AccountId.

Axiom Balance : (Ty.path "call_runtime::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "call_runtime::AccountId") ];
  } *)

(*
Enum MultiAddress
{
  ty_params := [ "AccountId"; "AccountIndex" ];
  variants := [];
}
*)

Module Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.
  Definition Self : Ty.t :=
    Ty.apply
      (Ty.path "call_runtime::MultiAddress")
      [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ].
  
  (*
      fn from(_value: AccountId) -> Self {
          unimplemented!()
      }
  *)
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "call_runtime::AccountId" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_call_runtime_AccountId_for_call_runtime_MultiAddress_call_runtime_AccountId_Tuple_.

(*
Enum BalancesCall
{
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
}
*)

(*
Enum RuntimeCall
{
  ty_params := [];
  variants :=
    [
      {
        name := "Balances";
        item := StructTuple [ Ty.path "call_runtime::BalancesCall" ];
        discriminant := None;
      }
    ];
}
*)

(* StructTuple
  {
    name := "RuntimeCaller";
    ty_params := [];
    fields := [];
  } *)

Module Impl_core_default_Default_for_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => ltac:(M.monadic (Value.StructTuple "call_runtime::RuntimeCaller" []))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_call_runtime_RuntimeCaller.

(*
Enum RuntimeError
{
  ty_params := [];
  variants :=
    [
      {
        name := "CallRuntimeFailed";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Module Impl_core_fmt_Debug_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [ M.read (| f |); M.read (| Value.String "CallRuntimeFailed" |) ]
        |)))
    | _, _ => M.impossible
    end.
  
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
  
  (* PartialEq *)
  Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        Value.Bool true))
    | _, _ => M.impossible
    end.
  
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
  
  (* Eq *)
  Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        Value.Tuple []))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError.

(*
Enum EnvError
{
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
}
*)

Module Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeError".
  
  (*
      fn from(e: EnvError) -> Self {
          match e {
              EnvError::CallRuntimeFailed => RuntimeError::CallRuntimeFailed,
              _ => panic!("Unexpected error from `pallet-contracts`."),
          }
      }
  *)
  Definition from (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ e ] =>
      ltac:(M.monadic
        (let e := M.alloc (| e |) in
        M.read (|
          M.match_operator (|
            e,
            [
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple "call_runtime::RuntimeError::CallRuntimeFailed" []
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    M.never_to_any (|
                      M.call_closure (|
                        M.get_function (|
                          "std::panicking::begin_panic",
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                        |),
                        [ M.read (| Value.String "Unexpected error from `pallet-contracts`." |) ]
                      |)
                    |)
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "call_runtime::EnvError" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_call_runtime_EnvError_for_call_runtime_RuntimeError.

Module Impl_call_runtime_Env.
  Definition Self : Ty.t := Ty.path "call_runtime::Env".
  
  (*
      fn call_runtime<Call>(&self, _call: &Call) -> Result<(), EnvError> {
          unimplemented!()
      }
  *)
  Parameter call_runtime : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_call_runtime : M.IsAssociatedFunction Self "call_runtime" call_runtime.
End Impl_call_runtime_Env.

Module Impl_call_runtime_RuntimeCaller.
  Definition Self : Ty.t := Ty.path "call_runtime::RuntimeCaller".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "call_runtime::RuntimeCaller", "init_env", [] |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.call_closure (|
          M.get_trait_method (|
            "core::default::Default",
            Ty.path "call_runtime::RuntimeCaller",
            [],
            "default",
            []
          |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn transfer_through_runtime(
          &mut self,
          receiver: AccountId,
          value: Balance,
      ) -> Result<(), RuntimeError> {
          self.env()
              .call_runtime(&RuntimeCall::Balances(BalancesCall::Transfer {
                  dest: receiver.into(),
                  value,
              }))
              .map_err(Into::into)
      }
  *)
  Definition transfer_through_runtime (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; receiver; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let receiver := M.alloc (| receiver |) in
        let value := M.alloc (| value |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "call_runtime::EnvError" ],
            "map_err",
            [
              Ty.path "call_runtime::RuntimeError";
              Ty.function
                [ Ty.path "call_runtime::EnvError" ]
                (Ty.path "call_runtime::RuntimeError")
            ]
          |),
          [
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "call_runtime::Env",
                "call_runtime",
                [ Ty.path "call_runtime::RuntimeCall" ]
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "call_runtime::RuntimeCaller",
                      "env",
                      []
                    |),
                    [ M.read (| self |) ]
                  |)
                |);
                M.alloc (|
                  Value.StructTuple
                    "call_runtime::RuntimeCall::Balances"
                    [
                      Value.StructRecord
                        "call_runtime::BalancesCall::Transfer"
                        [
                          ("dest",
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::convert::Into",
                                Ty.path "call_runtime::AccountId",
                                [
                                  Ty.apply
                                    (Ty.path "call_runtime::MultiAddress")
                                    [ Ty.path "call_runtime::AccountId"; Ty.tuple [] ]
                                ],
                                "into",
                                []
                              |),
                              [ M.read (| receiver |) ]
                            |));
                          ("value", M.read (| value |))
                        ]
                    ]
                |)
              ]
            |);
            M.get_trait_method (|
              "core::convert::Into",
              Ty.path "call_runtime::EnvError",
              [ Ty.path "call_runtime::RuntimeError" ],
              "into",
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_transfer_through_runtime :
    M.IsAssociatedFunction Self "transfer_through_runtime" transfer_through_runtime.
  
  (*
      pub fn call_nonexistent_extrinsic(&mut self) -> Result<(), RuntimeError> {
          self.env().call_runtime(&()).map_err(Into::into)
      }
  *)
  Definition call_nonexistent_extrinsic (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "call_runtime::EnvError" ],
            "map_err",
            [
              Ty.path "call_runtime::RuntimeError";
              Ty.function
                [ Ty.path "call_runtime::EnvError" ]
                (Ty.path "call_runtime::RuntimeError")
            ]
          |),
          [
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "call_runtime::Env",
                "call_runtime",
                [ Ty.tuple [] ]
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "call_runtime::RuntimeCaller",
                      "env",
                      []
                    |),
                    [ M.read (| self |) ]
                  |)
                |);
                M.alloc (| Value.Tuple [] |)
              ]
            |);
            M.get_trait_method (|
              "core::convert::Into",
              Ty.path "call_runtime::EnvError",
              [ Ty.path "call_runtime::RuntimeError" ],
              "into",
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_call_nonexistent_extrinsic :
    M.IsAssociatedFunction Self "call_nonexistent_extrinsic" call_nonexistent_extrinsic.
End Impl_call_runtime_RuntimeCaller.
