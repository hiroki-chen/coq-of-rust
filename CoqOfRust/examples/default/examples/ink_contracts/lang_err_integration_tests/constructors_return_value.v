(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_constructors_return_value_AccountId.
  Definition Self : Ty.t := Ty.path "constructors_return_value::AccountId".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "constructors_return_value::AccountId"
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
End Impl_core_default_Default_for_constructors_return_value_AccountId.

Module Impl_core_clone_Clone_for_constructors_return_value_AccountId.
  Definition Self : Ty.t := Ty.path "constructors_return_value::AccountId".
  
  (*
  Clone
  *)
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
End Impl_core_clone_Clone_for_constructors_return_value_AccountId.

Module Impl_core_marker_Copy_for_constructors_return_value_AccountId.
  Definition Self : Ty.t := Ty.path "constructors_return_value::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_constructors_return_value_AccountId.

Module Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.
  Definition Self : Ty.t := Ty.path "constructors_return_value::AccountId".
  
  (*
      fn from(_value: [u8; 32]) -> Self {
          unimplemented!()
      }
  *)
  Parameter from : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_array_u8_for_constructors_return_value_AccountId.

Axiom Balance : (Ty.path "constructors_return_value::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "ConstructorsReturnValue";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

(* Enum LangError *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "CouldNotReadInput";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Axiom ConstructorResult :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "constructors_return_value::ConstructorResult") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [ T; Ty.path "constructors_return_value::LangError" ]).

(* StructTuple
  {
    name := "ConstructorError";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.
  Definition Self : Ty.t := Ty.path "constructors_return_value::ConstructorError".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [ M.read (| f |); M.read (| mk_str "ConstructorError" |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_constructors_return_value_ConstructorError.

(* StructTuple
  {
    name := "ReturnFlags";
    ty_params := [];
  } *)

Module Impl_constructors_return_value_ReturnFlags.
  Definition Self : Ty.t := Ty.path "constructors_return_value::ReturnFlags".
  
  (*
      fn new_with_reverted(has_reverted: bool) -> Self {
          unimplemented!()
      }
  *)
  Parameter new_with_reverted : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_with_reverted :
    M.IsAssociatedFunction Self "new_with_reverted" new_with_reverted.
End Impl_constructors_return_value_ReturnFlags.

(*
fn return_value<R>(return_flags: ReturnFlags, return_value: &R) -> ! {
    unimplemented!()
}
*)
Definition return_value (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ R ], [ return_flags; return_value ] =>
    ltac:(M.monadic
      (let return_flags := M.alloc (| return_flags |) in
      let return_value := M.alloc (| return_value |) in
      M.call_closure (|
        M.get_function (| "core::panicking::panic", [] |),
        [ M.read (| mk_str "not implemented" |) ]
      |)))
  | _, _ => M.impossible
  end.

Module Impl_constructors_return_value_ConstructorsReturnValue.
  Definition Self : Ty.t := Ty.path "constructors_return_value::ConstructorsReturnValue".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord
          "constructors_return_value::ConstructorsReturnValue"
          [ ("value", M.read (| init_value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, ConstructorError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(ConstructorError)
          }
      }
  *)
  Definition try_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ succeed ] =>
      ltac:(M.monadic
        (let succeed := M.alloc (| succeed |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.use succeed in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "constructors_return_value::ConstructorsReturnValue",
                            "new",
                            []
                          |),
                          [ Value.Bool true ]
                        |)
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [ Value.StructTuple "constructors_return_value::ConstructorError" [] ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_new : M.IsAssociatedFunction Self "try_new" try_new.
  
  (*
      pub fn revert_new(_init_value: bool) -> Self {
          return_value::<ConstructorResult<AccountId>>(
              ReturnFlags::new_with_reverted(true),
              &Ok(AccountId::from([0u8; 32])),
          )
      }
  *)
  Definition revert_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ _init_value ] =>
      ltac:(M.monadic
        (let _init_value := M.alloc (| _init_value |) in
        M.never_to_any (|
          M.call_closure (|
            M.get_function (|
              "constructors_return_value::return_value",
              [
                Ty.apply
                  (Ty.path "core::result::Result")
                  [
                    Ty.path "constructors_return_value::AccountId";
                    Ty.path "constructors_return_value::LangError"
                  ]
              ]
            |),
            [
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "constructors_return_value::ReturnFlags",
                  "new_with_reverted",
                  []
                |),
                [ Value.Bool true ]
              |);
              M.alloc (|
                Value.StructTuple
                  "core::result::Result::Ok"
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::convert::From",
                        Ty.path "constructors_return_value::AccountId",
                        [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ],
                        "from",
                        []
                      |),
                      [ repeat (Value.Integer Integer.U8 0) 32 ]
                    |)
                  ]
              |)
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_revert_new : M.IsAssociatedFunction Self "revert_new" revert_new.
  
  (*
      pub fn try_revert_new(init_value: bool) -> Result<Self, ConstructorError> {
          let value = if init_value {
              Ok(Ok(AccountId::from([0u8; 32])))
          } else {
              Err(LangError::CouldNotReadInput)
          };
  
          return_value::<ConstructorResult<Result<AccountId, ConstructorError>>>(
              ReturnFlags::new_with_reverted(true),
              &value,
          )
      }
  *)
  Definition try_revert_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        M.read (|
          let value :=
            M.copy (|
              M.match_operator (|
                M.alloc (| Value.Tuple [] |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ := M.use init_value in
                      let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                      M.alloc (|
                        Value.StructTuple
                          "core::result::Result::Ok"
                          [
                            Value.StructTuple
                              "core::result::Result::Ok"
                              [
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::convert::From",
                                    Ty.path "constructors_return_value::AccountId",
                                    [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ],
                                    "from",
                                    []
                                  |),
                                  [ repeat (Value.Integer Integer.U8 0) 32 ]
                                |)
                              ]
                          ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (M.alloc (|
                        Value.StructTuple
                          "core::result::Result::Err"
                          [
                            Value.StructTuple
                              "constructors_return_value::LangError::CouldNotReadInput"
                              []
                          ]
                      |)))
                ]
              |)
            |) in
          M.alloc (|
            M.never_to_any (|
              M.call_closure (|
                M.get_function (|
                  "constructors_return_value::return_value",
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [
                        Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "constructors_return_value::AccountId";
                            Ty.path "constructors_return_value::ConstructorError"
                          ];
                        Ty.path "constructors_return_value::LangError"
                      ]
                  ]
                |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "constructors_return_value::ReturnFlags",
                      "new_with_reverted",
                      []
                    |),
                    [ Value.Bool true ]
                  |);
                  value
                ]
              |)
            |)
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_revert_new :
    M.IsAssociatedFunction Self "try_revert_new" try_revert_new.
  
  (*
      pub fn get_value(&self) -> bool {
          self.value
      }
  *)
  Definition get_value (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field
            (M.read (| self |))
            "constructors_return_value::ConstructorsReturnValue"
            "value"
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get_value : M.IsAssociatedFunction Self "get_value" get_value.
End Impl_constructors_return_value_ConstructorsReturnValue.
