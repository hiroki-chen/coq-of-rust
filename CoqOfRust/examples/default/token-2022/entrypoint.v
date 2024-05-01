(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module entrypoint.
  (*
  fn process_instruction(
      program_id: &Pubkey,
      accounts: &[AccountInfo],
      instruction_data: &[u8],
  ) -> ProgramResult {
      if let Err(error) = Processor::process(program_id, accounts, instruction_data) {
          // catch the error so we can print it
          error.print::<TokenError>();
          return Err(error);
      }
      Ok(())
  }
  *)
  Definition process_instruction (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ program_id; accounts; instruction_data ] =>
      ltac:(M.monadic
        (let program_id := M.alloc (| program_id |) in
        let accounts := M.alloc (| accounts |) in
        let instruction_data := M.alloc (| instruction_data |) in
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
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "spl_token_2022::processor::Processor",
                                "process",
                                []
                              |),
                              [
                                M.read (| program_id |);
                                M.read (| accounts |);
                                M.read (| instruction_data |)
                              ]
                            |)
                          |) in
                        let γ0_0 :=
                          M.get_struct_tuple_field_or_break_match (|
                            γ,
                            "core::result::Result::Err",
                            0
                          |) in
                        let error := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              let _ :=
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "solana_program::program_error::PrintProgramError",
                                      Ty.path "solana_program::program_error::ProgramError",
                                      [],
                                      "print",
                                      [ Ty.path "spl_token_2022::error::TokenError" ]
                                    |),
                                    [ error ]
                                  |)
                                |) in
                              M.return_ (|
                                Value.StructTuple "core::result::Result::Err" [ M.read (| error |) ]
                              |)
                            |)
                          |)
                        |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              M.alloc (| Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ] |)
            |)))
        |)))
    | _, _ => M.impossible
    end.
End entrypoint.
