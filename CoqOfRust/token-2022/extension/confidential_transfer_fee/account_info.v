(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module extension.
  Module confidential_transfer_fee.
    Module account_info.
      (* StructRecord
        {
          name := "WithheldTokensInfo";
          ty_params := [];
          fields :=
            [
              ("withheld_amount",
                Ty.path "solana_zk_token_sdk::zk_token_elgamal::pod::elgamal::ElGamalCiphertext")
            ];
        } *)
      
      Module Impl_core_clone_Clone_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
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
      End Impl_core_clone_Clone_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_core_marker_Copy_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::Copy"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_Copy_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_core_fmt_Debug_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        (* Debug *)
        Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::Formatter",
                  "debug_struct_field1_finish",
                  []
                |),
                [
                  M.read (| f |);
                  M.read (| Value.String "WithheldTokensInfo" |);
                  M.read (| Value.String "withheld_amount" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.alloc (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo",
                        "withheld_amount"
                      |)
                    |))
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::fmt::Debug"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
      End Impl_core_fmt_Debug_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_core_default_Default_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        (* Default *)
        Definition default (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [] =>
            ltac:(M.monadic
              (Value.StructRecord
                "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo"
                [
                  ("withheld_amount",
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::default::Default",
                        Ty.path
                          "solana_zk_token_sdk::zk_token_elgamal::pod::elgamal::ElGamalCiphertext",
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
      End Impl_core_default_Default_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralPartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_core_cmp_PartialEq_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        (* PartialEq *)
        Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; other ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let other := M.alloc (| other |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::cmp::PartialEq",
                  Ty.path "solana_zk_token_sdk::zk_token_elgamal::pod::elgamal::ElGamalCiphertext",
                  [ Ty.path "solana_zk_token_sdk::zk_token_elgamal::pod::elgamal::ElGamalCiphertext"
                  ],
                  "eq",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo",
                    "withheld_amount"
                  |);
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo",
                    "withheld_amount"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::PartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("eq", InstanceField.Method eq) ].
      End Impl_core_cmp_PartialEq_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        Axiom Implements :
          M.IsTraitInstance
            "bytemuck::pod::Pod"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        Axiom Implements :
          M.IsTraitInstance
            "bytemuck::zeroable::Zeroable"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
      
      Module Impl_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
        Definition Self : Ty.t :=
          Ty.path
            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo".
        
        (*
            pub fn new(withheld_amount: &EncryptedWithheldAmount) -> Self {
                Self {
                    withheld_amount: *withheld_amount,
                }
            }
        *)
        Definition new (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ withheld_amount ] =>
            ltac:(M.monadic
              (let withheld_amount := M.alloc (| withheld_amount |) in
              Value.StructRecord
                "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo"
                [ ("withheld_amount", M.read (| M.read (| withheld_amount |) |)) ]))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
        
        (*
            pub fn generate_proof_data(
                &self,
                withdraw_withheld_authority_elgamal_keypair: &ElGamalKeypair,
                destination_elgamal_pubkey: &ElGamalPubkey,
            ) -> Result<CiphertextCiphertextEqualityProofData, TokenError> {
                let withheld_amount_in_mint: ElGamalCiphertext = self
                    .withheld_amount
                    .try_into()
                    .map_err(|_| TokenError::AccountDecryption)?;
        
                let decrypted_withheld_amount_in_mint = withheld_amount_in_mint
                    .decrypt_u32(withdraw_withheld_authority_elgamal_keypair.secret())
                    .ok_or(TokenError::AccountDecryption)?;
        
                let destination_opening = PedersenOpening::new_rand();
        
                let destination_ciphertext = destination_elgamal_pubkey
                    .encrypt_with(decrypted_withheld_amount_in_mint, &destination_opening);
        
                CiphertextCiphertextEqualityProofData::new(
                    withdraw_withheld_authority_elgamal_keypair,
                    destination_elgamal_pubkey,
                    &withheld_amount_in_mint,
                    &destination_ciphertext,
                    &destination_opening,
                    decrypted_withheld_amount_in_mint,
                )
                .map_err(|_| TokenError::ProofGeneration)
            }
        *)
        Definition generate_proof_data (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; withdraw_withheld_authority_elgamal_keypair; destination_elgamal_pubkey ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let withdraw_withheld_authority_elgamal_keypair :=
                M.alloc (| withdraw_withheld_authority_elgamal_keypair |) in
              let destination_elgamal_pubkey := M.alloc (| destination_elgamal_pubkey |) in
              M.catch_return (|
                ltac:(M.monadic
                  (M.read (|
                    let withheld_amount_in_mint :=
                      M.copy (|
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::try_trait::Try",
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.path
                                      "solana_zk_token_sdk::encryption::elgamal::ElGamalCiphertext";
                                    Ty.path "spl_token_2022::error::TokenError"
                                  ],
                                [],
                                "branch",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [
                                        Ty.path
                                          "solana_zk_token_sdk::encryption::elgamal::ElGamalCiphertext";
                                        Ty.path
                                          "solana_zk_token_sdk::encryption::elgamal::ElGamalError"
                                      ],
                                    "map_err",
                                    [
                                      Ty.path "spl_token_2022::error::TokenError";
                                      Ty.function
                                        [
                                          Ty.tuple
                                            [
                                              Ty.path
                                                "solana_zk_token_sdk::encryption::elgamal::ElGamalError"
                                            ]
                                        ]
                                        (Ty.path "spl_token_2022::error::TokenError")
                                    ]
                                  |),
                                  [
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::convert::TryInto",
                                        Ty.path
                                          "solana_zk_token_sdk::zk_token_elgamal::pod::elgamal::ElGamalCiphertext",
                                        [
                                          Ty.path
                                            "solana_zk_token_sdk::encryption::elgamal::ElGamalCiphertext"
                                        ],
                                        "try_into",
                                        []
                                      |),
                                      [
                                        M.read (|
                                          M.SubPointer.get_struct_record_field (|
                                            M.read (| self |),
                                            "spl_token_2022::extension::confidential_transfer_fee::account_info::WithheldTokensInfo",
                                            "withheld_amount"
                                          |)
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
                                                    (Value.StructTuple
                                                      "spl_token_2022::error::TokenError::AccountDecryption"
                                                      []))
                                              ]
                                            |)
                                          | _ => M.impossible (||)
                                          end))
                                  ]
                                |)
                              ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Break",
                                    0
                                  |) in
                                let residual := M.copy (| γ0_0 |) in
                                M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      M.return_ (|
                                        M.call_closure (|
                                          M.get_trait_method (|
                                            "core::ops::try_trait::FromResidual",
                                            Ty.apply
                                              (Ty.path "core::result::Result")
                                              [
                                                Ty.path
                                                  "solana_zk_token_sdk::instruction::ciphertext_ciphertext_equality::CiphertextCiphertextEqualityProofData";
                                                Ty.path "spl_token_2022::error::TokenError"
                                              ],
                                            [
                                              Ty.apply
                                                (Ty.path "core::result::Result")
                                                [
                                                  Ty.path "core::convert::Infallible";
                                                  Ty.path "spl_token_2022::error::TokenError"
                                                ]
                                            ],
                                            "from_residual",
                                            []
                                          |),
                                          [ M.read (| residual |) ]
                                        |)
                                      |)
                                    |)
                                  |)
                                |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Continue",
                                    0
                                  |) in
                                let val := M.copy (| γ0_0 |) in
                                val))
                          ]
                        |)
                      |) in
                    let decrypted_withheld_amount_in_mint :=
                      M.copy (|
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::try_trait::Try",
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [ Ty.path "u64"; Ty.path "spl_token_2022::error::TokenError" ],
                                [],
                                "branch",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply (Ty.path "core::option::Option") [ Ty.path "u64" ],
                                    "ok_or",
                                    [ Ty.path "spl_token_2022::error::TokenError" ]
                                  |),
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path
                                          "solana_zk_token_sdk::encryption::elgamal::ElGamalCiphertext",
                                        "decrypt_u32",
                                        []
                                      |),
                                      [
                                        withheld_amount_in_mint;
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path
                                              "solana_zk_token_sdk::encryption::elgamal::ElGamalKeypair",
                                            "secret",
                                            []
                                          |),
                                          [ M.read (| withdraw_withheld_authority_elgamal_keypair |)
                                          ]
                                        |)
                                      ]
                                    |);
                                    Value.StructTuple
                                      "spl_token_2022::error::TokenError::AccountDecryption"
                                      []
                                  ]
                                |)
                              ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Break",
                                    0
                                  |) in
                                let residual := M.copy (| γ0_0 |) in
                                M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      M.return_ (|
                                        M.call_closure (|
                                          M.get_trait_method (|
                                            "core::ops::try_trait::FromResidual",
                                            Ty.apply
                                              (Ty.path "core::result::Result")
                                              [
                                                Ty.path
                                                  "solana_zk_token_sdk::instruction::ciphertext_ciphertext_equality::CiphertextCiphertextEqualityProofData";
                                                Ty.path "spl_token_2022::error::TokenError"
                                              ],
                                            [
                                              Ty.apply
                                                (Ty.path "core::result::Result")
                                                [
                                                  Ty.path "core::convert::Infallible";
                                                  Ty.path "spl_token_2022::error::TokenError"
                                                ]
                                            ],
                                            "from_residual",
                                            []
                                          |),
                                          [ M.read (| residual |) ]
                                        |)
                                      |)
                                    |)
                                  |)
                                |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Continue",
                                    0
                                  |) in
                                let val := M.copy (| γ0_0 |) in
                                val))
                          ]
                        |)
                      |) in
                    let destination_opening :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "solana_zk_token_sdk::encryption::pedersen::PedersenOpening",
                            "new_rand",
                            []
                          |),
                          []
                        |)
                      |) in
                    let destination_ciphertext :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "solana_zk_token_sdk::encryption::elgamal::ElGamalPubkey",
                            "encrypt_with",
                            [ Ty.path "u64" ]
                          |),
                          [
                            M.read (| destination_elgamal_pubkey |);
                            M.read (| decrypted_withheld_amount_in_mint |);
                            destination_opening
                          ]
                        |)
                      |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path
                                "solana_zk_token_sdk::instruction::ciphertext_ciphertext_equality::CiphertextCiphertextEqualityProofData";
                              Ty.path "solana_zk_token_sdk::errors::ProofGenerationError"
                            ],
                          "map_err",
                          [
                            Ty.path "spl_token_2022::error::TokenError";
                            Ty.function
                              [
                                Ty.tuple
                                  [ Ty.path "solana_zk_token_sdk::errors::ProofGenerationError" ]
                              ]
                              (Ty.path "spl_token_2022::error::TokenError")
                          ]
                        |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path
                                "solana_zk_token_sdk::instruction::ciphertext_ciphertext_equality::CiphertextCiphertextEqualityProofData",
                              "new",
                              []
                            |),
                            [
                              M.read (| withdraw_withheld_authority_elgamal_keypair |);
                              M.read (| destination_elgamal_pubkey |);
                              withheld_amount_in_mint;
                              destination_ciphertext;
                              destination_opening;
                              M.read (| decrypted_withheld_amount_in_mint |)
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
                                          (Value.StructTuple
                                            "spl_token_2022::error::TokenError::ProofGeneration"
                                            []))
                                    ]
                                  |)
                                | _ => M.impossible (||)
                                end))
                        ]
                      |)
                    |)
                  |)))
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_generate_proof_data :
          M.IsAssociatedFunction Self "generate_proof_data" generate_proof_data.
      End Impl_spl_token_2022_extension_confidential_transfer_fee_account_info_WithheldTokensInfo.
    End account_info.
  End confidential_transfer_fee.
End extension.
