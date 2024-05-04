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
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "updated_incrementer::AccountId"
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
End Impl_core_default_Default_for_updated_incrementer_AccountId.

Module Impl_core_clone_Clone_for_updated_incrementer_AccountId.
  Definition Self : Ty.t := Ty.path "updated_incrementer::AccountId".
  
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
  
  (*
      fn set_code_hash<E>(&self, code_hash: &E) -> Result<(), Error> {
          unimplemented!()
      }
  *)
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
          M.get_associated_function (|
            Ty.path "updated_incrementer::Incrementer",
            "init_env",
            []
          |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          unreachable!("Constructors are not called when upgrading using `set_code_hash`.")
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.never_to_any (|
          M.call_closure (|
            M.get_function (|
              "core::panicking::unreachable_display",
              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            |),
            [ Value.String "Constructors are not called when upgrading using `set_code_hash`." ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn inc(&mut self) {
          self.count += 4;
          println!(
              "The new count is {}, it was modified using the updated `new_incrementer` code.",
              self.count
          );
      }
  *)
  Definition inc (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            let β :=
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "updated_incrementer::Incrementer",
                "count"
              |) in
            M.write (| β, BinOp.Panic.add (| Integer.U32, M.read (| β |), Value.Integer 4 |) |) in
          let _ :=
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.read (| Value.String "The new count is " |);
                                M.read (|
                                  Value.String
                                    ", it was modified using the updated `new_incrementer` code.
"
                                |)
                              ]
                          |));
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "core::fmt::rt::Argument",
                                    "new_display",
                                    [ Ty.path "u32" ]
                                  |),
                                  [
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| self |),
                                      "updated_incrementer::Incrementer",
                                      "count"
                                    |)
                                  ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc.
  
  (*
      pub fn get(&self) -> u32 {
          self.count
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_record_field (|
            M.read (| self |),
            "updated_incrementer::Incrementer",
            "count"
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
  
  (*
      pub fn set_code(&mut self, code_hash: Hash) {
          self.env().set_code_hash(&code_hash).unwrap_or_else(|err| {
              panic!("Failed to `set_code_hash` to {code_hash:?} due to {err:?}")
          });
          println!("Switched code hash to {:?}.", code_hash);
      }
  *)
  Definition set_code (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; code_hash ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let code_hash := M.alloc (| code_hash |) in
        M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.tuple []; Ty.path "updated_incrementer::Error" ],
                  "unwrap_or_else",
                  [ Ty.function [ Ty.tuple [ Ty.path "updated_incrementer::Error" ] ] (Ty.tuple [])
                  ]
                |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "updated_incrementer::Env",
                      "set_code_hash",
                      [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
                    |),
                    [
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "updated_incrementer::Incrementer",
                            "env",
                            []
                          |),
                          [ M.read (| self |) ]
                        |)
                      |);
                      code_hash
                    ]
                  |);
                  M.closure
                    (fun γ =>
                      ltac:(M.monadic
                        match γ with
                        | [ α0 ] =>
                          M.match_operator (|
                            M.alloc (| α0 |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (let err := M.copy (| γ |) in
                                  M.never_to_any (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "std::panicking::begin_panic",
                                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                      |),
                                      [
                                        M.read (|
                                          Value.String
                                            "Failed to `set_code_hash` to {code_hash:?} due to {err:?}"
                                        |)
                                      ]
                                    |)
                                  |)))
                            ]
                          |)
                        | _ => M.impossible (||)
                        end))
                ]
              |)
            |) in
          let _ :=
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.read (| Value.String "Switched code hash to " |);
                                M.read (| Value.String ".
" |)
                              ]
                          |));
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "core::fmt::rt::Argument",
                                    "new_debug",
                                    [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]
                                  |),
                                  [ code_hash ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_set_code : M.IsAssociatedFunction Self "set_code" set_code.
End Impl_updated_incrementer_Incrementer.
