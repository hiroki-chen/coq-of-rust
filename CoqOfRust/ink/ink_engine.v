(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ext.
  Module Error.
    Inductive t : Set :=
    | CalleeTrapped
    | CalleeReverted
    | KeyNotFound
    | _BelowSubsistenceThreshold
    | TransferFailed
    | _EndowmentTooLow
    | CodeNotFound
    | NotCallable
    | LoggingDisabled
    | EcdsaRecoveryFailed
    | Unknown.
  End Error.
  Definition Error := Error.t.
  
  Module ReturnCode.
    Unset Primitive Projections.
    Record t : Set := {
      _ : u32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ReturnCode.
  Definition ReturnCode := @ReturnCode.t.
  
  Module Engine.
    Unset Primitive Projections.
    Record t : Set := {
      database : ink_engine.database.Database;
      exec_context : ink_engine.exec_context.ExecContext;
      debug_info : ink_engine.test_api.DebugInfo;
      chain_spec : ink_engine.ext.ChainSpec;
      chain_extension_handler
        :
        ink_engine.chain_extension.ChainExtensionHandler;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_database : Notation.Dot "database" := {
      Notation.dot '(Build_t x0 _ _ _ _) := x0;
    }.
    Global Instance Get_exec_context : Notation.Dot "exec_context" := {
      Notation.dot '(Build_t _ x1 _ _ _) := x1;
    }.
    Global Instance Get_debug_info : Notation.Dot "debug_info" := {
      Notation.dot '(Build_t _ _ x2 _ _) := x2;
    }.
    Global Instance Get_chain_spec : Notation.Dot "chain_spec" := {
      Notation.dot '(Build_t _ _ _ x3 _) := x3;
    }.
    Global Instance Get_chain_extension_handler :
        Notation.Dot "chain_extension_handler" := {
      Notation.dot '(Build_t _ _ _ _ x4) := x4;
    }.
  End Engine.
  Definition Engine : Set := @Engine.t.
  
  Module ChainSpec.
    Unset Primitive Projections.
    Record t : Set := {
      gas_price : ink_engine.types.Balance;
      minimum_balance : ink_engine.types.Balance;
      block_time : ink_engine.types.BlockTimestamp;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_gas_price : Notation.Dot "gas_price" := {
      Notation.dot '(Build_t x0 _ _) := x0;
    }.
    Global Instance Get_minimum_balance : Notation.Dot "minimum_balance" := {
      Notation.dot '(Build_t _ x1 _) := x1;
    }.
    Global Instance Get_block_time : Notation.Dot "block_time" := {
      Notation.dot '(Build_t _ _ x2) := x2;
    }.
  End ChainSpec.
  Definition ChainSpec : Set := @ChainSpec.t.
End ext.

Module Error.
  Inductive t : Set :=
  | CalleeTrapped
  | CalleeReverted
  | KeyNotFound
  | _BelowSubsistenceThreshold
  | TransferFailed
  | _EndowmentTooLow
  | CodeNotFound
  | NotCallable
  | LoggingDisabled
  | EcdsaRecoveryFailed
  | Unknown.
End Error.
Definition Error := Error.t.

Module ReturnCode.
  Unset Primitive Projections.
  Record t : Set := {
    _ : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End ReturnCode.
Definition ReturnCode := @ReturnCode.t.

Module Engine.
  Unset Primitive Projections.
  Record t : Set := {
    database : ink_engine.database.Database;
    exec_context : ink_engine.exec_context.ExecContext;
    debug_info : ink_engine.test_api.DebugInfo;
    chain_spec : ink_engine.ext.ChainSpec;
    chain_extension_handler : ink_engine.chain_extension.ChainExtensionHandler;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_database : Notation.Dot "database" := {
    Notation.dot '(Build_t x0 _ _ _ _) := x0;
  }.
  Global Instance Get_exec_context : Notation.Dot "exec_context" := {
    Notation.dot '(Build_t _ x1 _ _ _) := x1;
  }.
  Global Instance Get_debug_info : Notation.Dot "debug_info" := {
    Notation.dot '(Build_t _ _ x2 _ _) := x2;
  }.
  Global Instance Get_chain_spec : Notation.Dot "chain_spec" := {
    Notation.dot '(Build_t _ _ _ x3 _) := x3;
  }.
  Global Instance Get_chain_extension_handler :
      Notation.Dot "chain_extension_handler" := {
    Notation.dot '(Build_t _ _ _ _ x4) := x4;
  }.
End Engine.
Definition Engine : Set := @Engine.t.

Module ChainSpec.
  Unset Primitive Projections.
  Record t : Set := {
    gas_price : ink_engine.types.Balance;
    minimum_balance : ink_engine.types.Balance;
    block_time : ink_engine.types.BlockTimestamp;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_gas_price : Notation.Dot "gas_price" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_minimum_balance : Notation.Dot "minimum_balance" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_block_time : Notation.Dot "block_time" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End ChainSpec.
Definition ChainSpec : Set := @ChainSpec.t.

Module test_api.
  Module EmittedEvent.
    Unset Primitive Projections.
    Record t : Set := {
      topics : alloc.vec.Vec (alloc.vec.Vec u8);
      data : alloc.vec.Vec u8;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_topics : Notation.Dot "topics" := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_data : Notation.Dot "data" := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End EmittedEvent.
  Definition EmittedEvent : Set := @EmittedEvent.t.
  
  Module RecordedDebugMessages.
    Unset Primitive Projections.
    Record t : Set := {
      debug_messages : alloc.vec.Vec alloc.string.String;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_debug_messages : Notation.Dot "debug_messages" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End RecordedDebugMessages.
  Definition RecordedDebugMessages : Set := @RecordedDebugMessages.t.
  
  Module DebugInfo.
    Unset Primitive Projections.
    Record t : Set := {
      emitted_events : alloc.vec.Vec ink_engine.test_api.EmittedEvent;
      emitted_debug_messages : ink_engine.test_api.RecordedDebugMessages;
      count_reads
        :
        std.collections.hash.map.HashMap ink_engine.types.AccountId usize;
      count_writes
        :
        std.collections.hash.map.HashMap ink_engine.types.AccountId usize;
      cells_per_account
        :
        std.collections.hash.map.HashMap
          ink_engine.types.AccountId
          (std.collections.hash.map.HashMap (alloc.vec.Vec u8) bool);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_emitted_events : Notation.Dot "emitted_events" := {
      Notation.dot '(Build_t x0 _ _ _ _) := x0;
    }.
    Global Instance Get_emitted_debug_messages :
        Notation.Dot "emitted_debug_messages" := {
      Notation.dot '(Build_t _ x1 _ _ _) := x1;
    }.
    Global Instance Get_count_reads : Notation.Dot "count_reads" := {
      Notation.dot '(Build_t _ _ x2 _ _) := x2;
    }.
    Global Instance Get_count_writes : Notation.Dot "count_writes" := {
      Notation.dot '(Build_t _ _ _ x3 _) := x3;
    }.
    Global Instance Get_cells_per_account :
        Notation.Dot "cells_per_account" := {
      Notation.dot '(Build_t _ _ _ _ x4) := x4;
    }.
  End DebugInfo.
  Definition DebugInfo : Set := @DebugInfo.t.
End test_api.

Module EmittedEvent.
  Unset Primitive Projections.
  Record t : Set := {
    topics : alloc.vec.Vec (alloc.vec.Vec u8);
    data : alloc.vec.Vec u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_topics : Notation.Dot "topics" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_data : Notation.Dot "data" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End EmittedEvent.
Definition EmittedEvent : Set := @EmittedEvent.t.

Module RecordedDebugMessages.
  Unset Primitive Projections.
  Record t : Set := {
    debug_messages : alloc.vec.Vec alloc.string.String;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_debug_messages : Notation.Dot "debug_messages" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End RecordedDebugMessages.
Definition RecordedDebugMessages : Set := @RecordedDebugMessages.t.

Module DebugInfo.
  Unset Primitive Projections.
  Record t : Set := {
    emitted_events : alloc.vec.Vec ink_engine.test_api.EmittedEvent;
    emitted_debug_messages : ink_engine.test_api.RecordedDebugMessages;
    count_reads
      :
      std.collections.hash.map.HashMap ink_engine.types.AccountId usize;
    count_writes
      :
      std.collections.hash.map.HashMap ink_engine.types.AccountId usize;
    cells_per_account
      :
      std.collections.hash.map.HashMap
        ink_engine.types.AccountId
        (std.collections.hash.map.HashMap (alloc.vec.Vec u8) bool);
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_emitted_events : Notation.Dot "emitted_events" := {
    Notation.dot '(Build_t x0 _ _ _ _) := x0;
  }.
  Global Instance Get_emitted_debug_messages :
      Notation.Dot "emitted_debug_messages" := {
    Notation.dot '(Build_t _ x1 _ _ _) := x1;
  }.
  Global Instance Get_count_reads : Notation.Dot "count_reads" := {
    Notation.dot '(Build_t _ _ x2 _ _) := x2;
  }.
  Global Instance Get_count_writes : Notation.Dot "count_writes" := {
    Notation.dot '(Build_t _ _ _ x3 _) := x3;
  }.
  Global Instance Get_cells_per_account : Notation.Dot "cells_per_account" := {
    Notation.dot '(Build_t _ _ _ _ x4) := x4;
  }.
End DebugInfo.
Definition DebugInfo : Set := @DebugInfo.t.

Module chain_extension.
  Module ChainExtensionHandler.
    Unset Primitive Projections.
    Record t : Set := {
      registered
        :
        std.collections.hash.map.HashMap
          ink_engine.chain_extension.ExtensionId
          (alloc.boxed.Box TraitObject);
      output : alloc.vec.Vec u8;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_registered : Notation.Dot "registered" := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_output : Notation.Dot "output" := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End ChainExtensionHandler.
  Definition ChainExtensionHandler : Set := @ChainExtensionHandler.t.
  
  Module ExtensionId.
    Unset Primitive Projections.
    Record t : Set := {
      _ : u32;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End ExtensionId.
  Definition ExtensionId := @ExtensionId.t.
  
  Module ChainExtension.
    Class Trait (Self : Set) : Set := {
      func_id `{H : State.Trait} : (ref Self) -> (M (H := H) u32);
      call
        `{H : State.Trait}
        :
        (mut_ref Self) ->
        (ref (Slice u8)) ->
        (mut_ref (alloc.vec.Vec u8)) ->
        (M (H := H) u32);
    }.
    
    Global Instance Method_func_id `{H : State.Trait} `(Trait)
      : Notation.Dot "func_id" := {
      Notation.dot := func_id;
    }.
    Global Instance Method_call `{H : State.Trait} `(Trait)
      : Notation.Dot "call" := {
      Notation.dot := call;
    }.
  End ChainExtension.
End chain_extension.

Module ChainExtensionHandler.
  Unset Primitive Projections.
  Record t : Set := {
    registered
      :
      std.collections.hash.map.HashMap
        ink_engine.chain_extension.ExtensionId
        (alloc.boxed.Box TraitObject);
    output : alloc.vec.Vec u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_registered : Notation.Dot "registered" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_output : Notation.Dot "output" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End ChainExtensionHandler.
Definition ChainExtensionHandler : Set := @ChainExtensionHandler.t.

Module ExtensionId.
  Unset Primitive Projections.
  Record t : Set := {
    _ : u32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End ExtensionId.
Definition ExtensionId := @ExtensionId.t.

Module ChainExtension.
  Class Trait (Self : Set) : Set := {
    func_id `{H : State.Trait} : (ref Self) -> (M (H := H) u32);
    call
      `{H : State.Trait}
      :
      (mut_ref Self) ->
      (ref (Slice u8)) ->
      (mut_ref (alloc.vec.Vec u8)) ->
      (M (H := H) u32);
  }.
  
  Global Instance Method_func_id `{H : State.Trait} `(Trait)
    : Notation.Dot "func_id" := {
    Notation.dot := func_id;
  }.
  Global Instance Method_call `{H : State.Trait} `(Trait)
    : Notation.Dot "call" := {
    Notation.dot := call;
  }.
End ChainExtension.

Module database.
  Parameter balance_of_key :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> M (H := H) (list u8).
  
  Parameter storage_of_contract_key :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> (ref (Slice u8)) -> M (H := H) (list u8).
  
  Module Database.
    Unset Primitive Projections.
    Record t : Set := {
      hmap
        :
        std.collections.hash.map.HashMap (alloc.vec.Vec u8) (alloc.vec.Vec u8);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_hmap : Notation.Dot "hmap" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Database.
  Definition Database : Set := @Database.t.
End database.

Parameter balance_of_key :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> M (H := H) (list u8).

Parameter storage_of_contract_key :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> (ref (Slice u8)) -> M (H := H) (list u8).

Module Database.
  Unset Primitive Projections.
  Record t : Set := {
    hmap
      :
      std.collections.hash.map.HashMap (alloc.vec.Vec u8) (alloc.vec.Vec u8);
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_hmap : Notation.Dot "hmap" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Database.
Definition Database : Set := @Database.t.

Module exec_context.
  Module ExecContext.
    Unset Primitive Projections.
    Record t : Set := {
      caller : core.option.Option ink_engine.types.AccountId;
      callee : core.option.Option ink_engine.types.AccountId;
      value_transferred : ink_engine.types.Balance;
      block_number : ink_engine.types.BlockNumber;
      block_timestamp : ink_engine.types.BlockTimestamp;
      contracts : alloc.vec.Vec (alloc.vec.Vec u8);
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_caller : Notation.Dot "caller" := {
      Notation.dot '(Build_t x0 _ _ _ _ _) := x0;
    }.
    Global Instance Get_callee : Notation.Dot "callee" := {
      Notation.dot '(Build_t _ x1 _ _ _ _) := x1;
    }.
    Global Instance Get_value_transferred :
        Notation.Dot "value_transferred" := {
      Notation.dot '(Build_t _ _ x2 _ _ _) := x2;
    }.
    Global Instance Get_block_number : Notation.Dot "block_number" := {
      Notation.dot '(Build_t _ _ _ x3 _ _) := x3;
    }.
    Global Instance Get_block_timestamp : Notation.Dot "block_timestamp" := {
      Notation.dot '(Build_t _ _ _ _ x4 _) := x4;
    }.
    Global Instance Get_contracts : Notation.Dot "contracts" := {
      Notation.dot '(Build_t _ _ _ _ _ x5) := x5;
    }.
  End ExecContext.
  Definition ExecContext : Set := @ExecContext.t.
End exec_context.

Module ExecContext.
  Unset Primitive Projections.
  Record t : Set := {
    caller : core.option.Option ink_engine.types.AccountId;
    callee : core.option.Option ink_engine.types.AccountId;
    value_transferred : ink_engine.types.Balance;
    block_number : ink_engine.types.BlockNumber;
    block_timestamp : ink_engine.types.BlockTimestamp;
    contracts : alloc.vec.Vec (alloc.vec.Vec u8);
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_caller : Notation.Dot "caller" := {
    Notation.dot '(Build_t x0 _ _ _ _ _) := x0;
  }.
  Global Instance Get_callee : Notation.Dot "callee" := {
    Notation.dot '(Build_t _ x1 _ _ _ _) := x1;
  }.
  Global Instance Get_value_transferred : Notation.Dot "value_transferred" := {
    Notation.dot '(Build_t _ _ x2 _ _ _) := x2;
  }.
  Global Instance Get_block_number : Notation.Dot "block_number" := {
    Notation.dot '(Build_t _ _ _ x3 _ _) := x3;
  }.
  Global Instance Get_block_timestamp : Notation.Dot "block_timestamp" := {
    Notation.dot '(Build_t _ _ _ _ x4 _) := x4;
  }.
  Global Instance Get_contracts : Notation.Dot "contracts" := {
    Notation.dot '(Build_t _ _ _ _ _ x5) := x5;
  }.
End ExecContext.
Definition ExecContext : Set := @ExecContext.t.

Module hashing.
  Parameter blake2b_256 :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.
  
  Parameter blake2b_128 :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.
  
  Parameter keccak_256 :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.
  
  Parameter sha2_256 :
      forall `{H : State.Trait},
      (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.
End hashing.

Parameter blake2b_256 :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.

Parameter blake2b_128 :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.

Parameter keccak_256 :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.

Parameter sha2_256 :
    forall `{H : State.Trait},
    (ref (Slice u8)) -> (mut_ref (list u8)) -> M (H := H) unit.

Module types.
  Definition BlockNumber : Set := u32.
  
  Definition BlockTimestamp : Set := u64.
  
  Definition Balance : Set := u128.
  
  Module AccountId.
    Unset Primitive Projections.
    Record t : Set := {
      _ : alloc.vec.Vec u8;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End AccountId.
  Definition AccountId := @AccountId.t.
  
  Module Key.
    Unset Primitive Projections.
    Record t : Set := {
      _ : alloc.vec.Vec u8;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_0 : Notation.Dot 0 := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End Key.
  Definition Key := @Key.t.
  
  Module AccountError.
    Inductive t : Set :=
    | Decoding (_ : parity_scale_codec.error.Error)
    | UnexpectedUserAccount
    | NoAccountForId (_ : alloc.vec.Vec u8).
  End AccountError.
  Definition AccountError := AccountError.t.
End types.

Definition BlockNumber : Set := u32.

Definition BlockTimestamp : Set := u64.

Definition Balance : Set := u128.

Module AccountId.
  Unset Primitive Projections.
  Record t : Set := {
    _ : alloc.vec.Vec u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End AccountId.
Definition AccountId := @AccountId.t.

Module Key.
  Unset Primitive Projections.
  Record t : Set := {
    _ : alloc.vec.Vec u8;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Key.
Definition Key := @Key.t.

Module AccountError.
  Inductive t : Set :=
  | Decoding (_ : parity_scale_codec.error.Error)
  | UnexpectedUserAccount
  | NoAccountForId (_ : alloc.vec.Vec u8).
End AccountError.
Definition AccountError := AccountError.t.

Module Error.
  Inductive t : Set :=
  | Account (_ : ink_engine.types.AccountError)
  | UninitializedBlocks
  | UninitializedExecutionContext
  | UnregisteredChainExtension.
End Error.
Definition Error := Error.t.
