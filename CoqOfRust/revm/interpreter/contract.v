(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module interpreter.
  Module contract.
    (* StructRecord
      {
        name := "Contract";
        ty_params := [];
        fields :=
          [
            ("input", Ty.path "alloy_primitives::bytes_::Bytes");
            ("bytecode", Ty.path "revm_primitives::bytecode::Bytecode");
            ("hash",
              Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.path "alloy_primitives::bits::fixed::FixedBytes" ]);
            ("target_address", Ty.path "alloy_primitives::bits::address::Address");
            ("caller", Ty.path "alloy_primitives::bits::address::Address");
            ("call_value", Ty.path "ruint::Uint")
          ];
      } *)
    
    Module Impl_core_clone_Clone_for_revm_interpreter_interpreter_contract_Contract.
      Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter::contract::Contract".
      
      (* Clone *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructRecord
              "revm_interpreter::interpreter::contract::Contract"
              [
                ("input",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "alloy_primitives::bytes_::Bytes",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "input"
                      |)
                    ]
                  |));
                ("bytecode",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "revm_primitives::bytecode::Bytecode",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "bytecode"
                      |)
                    ]
                  |));
                ("hash",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "alloy_primitives::bits::fixed::FixedBytes" ],
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "hash"
                      |)
                    ]
                  |));
                ("target_address",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "target_address"
                      |)
                    ]
                  |));
                ("caller",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "caller"
                      |)
                    ]
                  |));
                ("call_value",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "ruint::Uint",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter::contract::Contract",
                        "call_value"
                      |)
                    ]
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_revm_interpreter_interpreter_contract_Contract.
    
    Module Impl_core_fmt_Debug_for_revm_interpreter_interpreter_contract_Contract.
      Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter::contract::Contract".
      
      (* Debug *)
      Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.read (|
              let~ names :=
                M.alloc (|
                  M.alloc (|
                    Value.Array
                      [
                        M.read (| Value.String "input" |);
                        M.read (| Value.String "bytecode" |);
                        M.read (| Value.String "hash" |);
                        M.read (| Value.String "target_address" |);
                        M.read (| Value.String "caller" |);
                        M.read (| Value.String "call_value" |)
                      ]
                  |)
                |) in
              let~ values :=
                M.alloc (|
                  (* Unsize *)
                  M.pointer_coercion
                    (M.alloc (|
                      Value.Array
                        [
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm_interpreter::interpreter::contract::Contract",
                              "input"
                            |));
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm_interpreter::interpreter::contract::Contract",
                              "bytecode"
                            |));
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm_interpreter::interpreter::contract::Contract",
                              "hash"
                            |));
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm_interpreter::interpreter::contract::Contract",
                              "target_address"
                            |));
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm_interpreter::interpreter::contract::Contract",
                              "caller"
                            |));
                          (* Unsize *)
                          M.pointer_coercion
                            (M.alloc (|
                              M.SubPointer.get_struct_record_field (|
                                M.read (| self |),
                                "revm_interpreter::interpreter::contract::Contract",
                                "call_value"
                              |)
                            |))
                        ]
                    |))
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::fmt::Formatter",
                    "debug_struct_fields_finish",
                    []
                  |),
                  [
                    M.read (| f |);
                    M.read (| Value.String "Contract" |);
                    (* Unsize *) M.pointer_coercion (M.read (| names |));
                    M.read (| values |)
                  ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Debug"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
    End Impl_core_fmt_Debug_for_revm_interpreter_interpreter_contract_Contract.
    
    Module Impl_core_default_Default_for_revm_interpreter_interpreter_contract_Contract.
      Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter::contract::Contract".
      
      (* Default *)
      Definition default (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "revm_interpreter::interpreter::contract::Contract"
              [
                ("input",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "alloy_primitives::bytes_::Bytes",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("bytecode",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "revm_primitives::bytecode::Bytecode",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("hash",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "alloy_primitives::bits::fixed::FixedBytes" ],
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("target_address",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("caller",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("call_value",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "ruint::Uint",
                      [],
                      "default",
                      []
                    |),
                    []
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::default::Default"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("default", InstanceField.Method default) ].
    End Impl_core_default_Default_for_revm_interpreter_interpreter_contract_Contract.
    
    Module Impl_revm_interpreter_interpreter_contract_Contract.
      Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter::contract::Contract".
      
      (*
          pub fn new(
              input: Bytes,
              bytecode: Bytecode,
              hash: Option<B256>,
              target_address: Address,
              caller: Address,
              call_value: U256,
          ) -> Self {
              let bytecode = to_analysed(bytecode);
      
              Self {
                  input,
                  bytecode,
                  hash,
                  target_address,
                  caller,
                  call_value,
              }
          }
      *)
      Definition new (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ input; bytecode; hash; target_address; caller; call_value ] =>
          ltac:(M.monadic
            (let input := M.alloc (| input |) in
            let bytecode := M.alloc (| bytecode |) in
            let hash := M.alloc (| hash |) in
            let target_address := M.alloc (| target_address |) in
            let caller := M.alloc (| caller |) in
            let call_value := M.alloc (| call_value |) in
            M.read (|
              let~ bytecode :=
                M.alloc (|
                  M.call_closure (|
                    M.get_function (| "revm_interpreter::interpreter::analysis::to_analysed", [] |),
                    [ M.read (| bytecode |) ]
                  |)
                |) in
              M.alloc (|
                Value.StructRecord
                  "revm_interpreter::interpreter::contract::Contract"
                  [
                    ("input", M.read (| input |));
                    ("bytecode", M.read (| bytecode |));
                    ("hash", M.read (| hash |));
                    ("target_address", M.read (| target_address |));
                    ("caller", M.read (| caller |));
                    ("call_value", M.read (| call_value |))
                  ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub fn new_env(env: &Env, bytecode: Bytecode, hash: Option<B256>) -> Self {
              let contract_address = match env.tx.transact_to {
                  TransactTo::Call(caller) => caller,
                  TransactTo::Create => Address::ZERO,
              };
              Self::new(
                  env.tx.data.clone(),
                  bytecode,
                  hash,
                  contract_address,
                  env.tx.caller,
                  env.tx.value,
              )
          }
      *)
      Definition new_env (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ env; bytecode; hash ] =>
          ltac:(M.monadic
            (let env := M.alloc (| env |) in
            let bytecode := M.alloc (| bytecode |) in
            let hash := M.alloc (| hash |) in
            M.read (|
              let~ contract_address :=
                M.copy (|
                  M.match_operator (|
                    M.SubPointer.get_struct_record_field (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| env |),
                        "revm_primitives::env::Env",
                        "tx"
                      |),
                      "revm_primitives::env::TxEnv",
                      "transact_to"
                    |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.SubPointer.get_struct_tuple_field (|
                              γ,
                              "revm_primitives::env::TransactTo::Call",
                              0
                            |) in
                          let caller := M.copy (| γ0_0 |) in
                          caller));
                      fun γ =>
                        ltac:(M.monadic
                          (let _ :=
                            M.is_struct_tuple (| γ, "revm_primitives::env::TransactTo::Create" |) in
                          M.get_constant (| "alloy_primitives::bits::address::ZERO" |)))
                    ]
                  |)
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "revm_interpreter::interpreter::contract::Contract",
                    "new",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::clone::Clone",
                        Ty.path "alloy_primitives::bytes_::Bytes",
                        [],
                        "clone",
                        []
                      |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.SubPointer.get_struct_record_field (|
                            M.read (| env |),
                            "revm_primitives::env::Env",
                            "tx"
                          |),
                          "revm_primitives::env::TxEnv",
                          "data"
                        |)
                      ]
                    |);
                    M.read (| bytecode |);
                    M.read (| hash |);
                    M.read (| contract_address |);
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| env |),
                          "revm_primitives::env::Env",
                          "tx"
                        |),
                        "revm_primitives::env::TxEnv",
                        "caller"
                      |)
                    |);
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| env |),
                          "revm_primitives::env::Env",
                          "tx"
                        |),
                        "revm_primitives::env::TxEnv",
                        "value"
                      |)
                    |)
                  ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new_env : M.IsAssociatedFunction Self "new_env" new_env.
      
      (*
          pub fn new_with_context(
              input: Bytes,
              bytecode: Bytecode,
              hash: Option<B256>,
              call_context: &CallInputs,
          ) -> Self {
              Self::new(
                  input,
                  bytecode,
                  hash,
                  call_context.target_address,
                  call_context.caller,
                  call_context.call_value(),
              )
          }
      *)
      Definition new_with_context (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ input; bytecode; hash; call_context ] =>
          ltac:(M.monadic
            (let input := M.alloc (| input |) in
            let bytecode := M.alloc (| bytecode |) in
            let hash := M.alloc (| hash |) in
            let call_context := M.alloc (| call_context |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "revm_interpreter::interpreter::contract::Contract",
                "new",
                []
              |),
              [
                M.read (| input |);
                M.read (| bytecode |);
                M.read (| hash |);
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| call_context |),
                    "revm_interpreter::interpreter_action::call_inputs::CallInputs",
                    "target_address"
                  |)
                |);
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| call_context |),
                    "revm_interpreter::interpreter_action::call_inputs::CallInputs",
                    "caller"
                  |)
                |);
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "revm_interpreter::interpreter_action::call_inputs::CallInputs",
                    "call_value",
                    []
                  |),
                  [ M.read (| call_context |) ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new_with_context :
        M.IsAssociatedFunction Self "new_with_context" new_with_context.
      
      (*
          pub fn is_valid_jump(&self, pos: usize) -> bool {
              self.bytecode
                  .legacy_jump_table()
                  .map(|i| i.is_valid(pos))
                  .unwrap_or(false)
          }
      *)
      Definition is_valid_jump (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; pos ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let pos := M.alloc (| pos |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "core::option::Option") [ Ty.path "bool" ],
                "unwrap_or",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "core::option::Option")
                      [
                        Ty.apply
                          (Ty.path "&")
                          [ Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable" ]
                      ],
                    "map",
                    [
                      Ty.path "bool";
                      Ty.function
                        [
                          Ty.tuple
                            [
                              Ty.apply
                                (Ty.path "&")
                                [ Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable" ]
                            ]
                        ]
                        (Ty.path "bool")
                    ]
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "revm_primitives::bytecode::Bytecode",
                        "legacy_jump_table",
                        []
                      |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "revm_interpreter::interpreter::contract::Contract",
                          "bytecode"
                        |)
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
                                    (let i := M.copy (| γ |) in
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path
                                          "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                                        "is_valid",
                                        []
                                      |),
                                      [ M.read (| i |); M.read (| pos |) ]
                                    |)))
                              ]
                            |)
                          | _ => M.impossible (||)
                          end))
                  ]
                |);
                Value.Bool false
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_is_valid_jump :
        M.IsAssociatedFunction Self "is_valid_jump" is_valid_jump.
    End Impl_revm_interpreter_interpreter_contract_Contract.
  End contract.
End interpreter.
