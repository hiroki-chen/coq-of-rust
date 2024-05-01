(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module proof.
  (*
  pub fn decode_proof_instruction_context<T: Pod + ZkProofData<U>, U: Pod>(
      expected: ProofInstruction,
      instruction: &Instruction,
  ) -> Result<&U, ProgramError> {
      if instruction.program_id != zk_token_proof_program::id()
          || ProofInstruction::instruction_type(&instruction.data) != Some(expected)
      {
          msg!("Unexpected proof instruction");
          return Err(ProgramError::InvalidInstructionData);
      }
  
      ProofInstruction::proof_data::<T, U>(&instruction.data)
          .map(ZkProofData::context_data)
          .ok_or(ProgramError::InvalidInstructionData)
  }
  *)
  Definition decode_proof_instruction_context (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ T; U ], [ expected; instruction ] =>
      ltac:(M.monadic
        (let expected := M.alloc (| expected |) in
        let instruction := M.alloc (| instruction |) in
        M.catch_return (|
          ltac:(M.monadic
            (M.read (|
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              LogicalOp.or (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::cmp::PartialEq",
                                    Ty.path "solana_program::pubkey::Pubkey",
                                    [ Ty.path "solana_program::pubkey::Pubkey" ],
                                    "ne",
                                    []
                                  |),
                                  [
                                    M.get_struct_record_field
                                      (M.read (| instruction |))
                                      "solana_program::instruction::Instruction"
                                      "program_id";
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_function (|
                                          "solana_zk_token_sdk::zk_token_proof_program::id",
                                          []
                                        |),
                                        []
                                      |)
                                    |)
                                  ]
                                |),
                                ltac:(M.monadic
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "core::option::Option")
                                        [
                                          Ty.path
                                            "solana_zk_token_sdk::zk_token_proof_instruction::ProofInstruction"
                                        ],
                                      [
                                        Ty.apply
                                          (Ty.path "core::option::Option")
                                          [
                                            Ty.path
                                              "solana_zk_token_sdk::zk_token_proof_instruction::ProofInstruction"
                                          ]
                                      ],
                                      "ne",
                                      []
                                    |),
                                    [
                                      M.alloc (|
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path
                                              "solana_zk_token_sdk::zk_token_proof_instruction::ProofInstruction",
                                            "instruction_type",
                                            []
                                          |),
                                          [
                                            M.call_closure (|
                                              M.get_trait_method (|
                                                "core::ops::deref::Deref",
                                                Ty.apply
                                                  (Ty.path "alloc::vec::Vec")
                                                  [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ],
                                                [],
                                                "deref",
                                                []
                                              |),
                                              [
                                                M.get_struct_record_field
                                                  (M.read (| instruction |))
                                                  "solana_program::instruction::Instruction"
                                                  "data"
                                              ]
                                            |)
                                          ]
                                        |)
                                      |);
                                      M.alloc (|
                                        Value.StructTuple
                                          "core::option::Option::Some"
                                          [ M.read (| expected |) ]
                                      |)
                                    ]
                                  |)))
                              |)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              let _ :=
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (| "solana_program::log::sol_log", [] |),
                                    [ M.read (| Value.String "Unexpected proof instruction" |) ]
                                  |)
                                |) in
                              M.return_ (|
                                Value.StructTuple
                                  "core::result::Result::Err"
                                  [
                                    Value.StructTuple
                                      "solana_program::program_error::ProgramError::InvalidInstructionData"
                                      []
                                  ]
                              |)
                            |)
                          |)
                        |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "core::option::Option") [ Ty.apply (Ty.path "&") [ U ] ],
                    "ok_or",
                    [ Ty.path "solana_program::program_error::ProgramError" ]
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "core::option::Option") [ Ty.apply (Ty.path "&") [ T ] ],
                        "map",
                        [
                          Ty.apply (Ty.path "&") [ U ];
                          Ty.function
                            [ Ty.apply (Ty.path "&") [ T ] ]
                            (Ty.apply (Ty.path "&") [ U ])
                        ]
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path
                              "solana_zk_token_sdk::zk_token_proof_instruction::ProofInstruction",
                            "proof_data",
                            [ T; U ]
                          |),
                          [
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::deref::Deref",
                                Ty.apply
                                  (Ty.path "alloc::vec::Vec")
                                  [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ],
                                [],
                                "deref",
                                []
                              |),
                              [
                                M.get_struct_record_field
                                  (M.read (| instruction |))
                                  "solana_program::instruction::Instruction"
                                  "data"
                              ]
                            |)
                          ]
                        |);
                        M.get_trait_method (|
                          "solana_zk_token_sdk::instruction::ZkProofData",
                          T,
                          [ U ],
                          "context_data",
                          []
                        |)
                      ]
                    |);
                    Value.StructTuple
                      "solana_program::program_error::ProgramError::InvalidInstructionData"
                      []
                  ]
                |)
              |)
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  (*
  Enum ProofLocation
  {
    ty_params := [ "T" ];
    variants :=
      [
        {
          name := "InstructionOffset";
          item :=
            StructTuple [ Ty.path "core::num::nonzero::NonZeroI8"; Ty.apply (Ty.path "&") [ T ] ];
          discriminant := None;
        };
        {
          name := "ContextStateAccount";
          item :=
            StructTuple [ Ty.apply (Ty.path "&") [ Ty.path "solana_program::pubkey::Pubkey" ] ];
          discriminant := None;
        }
      ];
  }
  *)
  
  Module Impl_core_clone_Clone_where_core_clone_Clone_T_for_spl_token_2022_proof_ProofLocation_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "spl_token_2022::proof::ProofLocation") [ T ].
    
    (* Clone *)
    Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "spl_token_2022::proof::ProofLocation::InstructionOffset",
                        0
                      |) in
                    let γ1_1 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "spl_token_2022::proof::ProofLocation::InstructionOffset",
                        1
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    let __self_1 := M.alloc (| γ1_1 |) in
                    M.alloc (|
                      Value.StructTuple
                        "spl_token_2022::proof::ProofLocation::InstructionOffset"
                        [
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::clone::Clone",
                              Ty.path "core::num::nonzero::NonZeroI8",
                              [],
                              "clone",
                              []
                            |),
                            [ M.read (| __self_0 |) ]
                          |);
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::clone::Clone",
                              Ty.apply (Ty.path "&") [ T ],
                              [],
                              "clone",
                              []
                            |),
                            [ M.read (| __self_1 |) ]
                          |)
                        ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "spl_token_2022::proof::ProofLocation::ContextStateAccount",
                        0
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      Value.StructTuple
                        "spl_token_2022::proof::ProofLocation::ContextStateAccount"
                        [
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::clone::Clone",
                              Ty.apply (Ty.path "&") [ Ty.path "solana_program::pubkey::Pubkey" ],
                              [],
                              "clone",
                              []
                            |),
                            [ M.read (| __self_0 |) ]
                          |)
                        ]
                    |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::clone::Clone"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
  End Impl_core_clone_Clone_where_core_clone_Clone_T_for_spl_token_2022_proof_ProofLocation_T.
  
  Module Impl_core_marker_Copy_where_core_marker_Copy_T_for_spl_token_2022_proof_ProofLocation_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "spl_token_2022::proof::ProofLocation") [ T ].
    
    Axiom Implements :
      forall (T : Ty.t),
      M.IsTraitInstance
        "core::marker::Copy"
        (Self T)
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_Copy_where_core_marker_Copy_T_for_spl_token_2022_proof_ProofLocation_T.
  
  (* StructRecord
    {
      name := "SplitContextStateAccountsConfig";
      ty_params := [];
      fields :=
        [
          ("no_op_on_uninitialized_split_context_state", Ty.path "bool");
          ("close_split_context_state_on_execution", Ty.path "bool")
        ];
    } *)
  
  Module Impl_core_clone_Clone_for_spl_token_2022_proof_SplitContextStateAccountsConfig.
    Definition Self : Ty.t := Ty.path "spl_token_2022::proof::SplitContextStateAccountsConfig".
    
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
  End Impl_core_clone_Clone_for_spl_token_2022_proof_SplitContextStateAccountsConfig.
  
  Module Impl_core_marker_Copy_for_spl_token_2022_proof_SplitContextStateAccountsConfig.
    Definition Self : Ty.t := Ty.path "spl_token_2022::proof::SplitContextStateAccountsConfig".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::Copy"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_Copy_for_spl_token_2022_proof_SplitContextStateAccountsConfig.
End proof.
