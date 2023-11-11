(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Mapping.
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Global Instance Get__key : Notation.Dot "_key" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(_key) : M _;
  }.
  Global Instance Get_AF__key : Notation.DoubleColon t "_key" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(_key) : M _;
  }.
  Global Instance Get__value : Notation.Dot "_value" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(_value) : M _;
  }.
  Global Instance Get_AF__value : Notation.DoubleColon t "_value" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(_value) : M _;
  }.
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_lib_Mapping_t_K_V.
Section Impl_core_default_Default_for_lib_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Ltac Self := exact (lib.Mapping.t K V).
  
  Parameter default : M (M.Val (lib.Mapping.t K V)).
  
  Global Instance AssociatedFunction_default :
    Notation.DoubleColon ltac:(Self) "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_lib_Mapping_t_K_V.
End Impl_core_default_Default_for_lib_Mapping_t_K_V.

Module  Impl_lib_Mapping_t_K_V.
Section Impl_lib_Mapping_t_K_V.
  Context {K V : Set}.
  
  Ltac Self := exact (lib.Mapping.t K V).
  
  Parameter get :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (ref K)) ->
        M (M.Val (core.option.Option.t V)).
  
  Global Instance AssociatedFunction_get :
    Notation.DoubleColon ltac:(Self) "get" := {
    Notation.double_colon := get;
  }.
  
  Parameter insert :
      (M.Val (mut_ref ltac:(Self))) -> (M.Val K) -> (M.Val V) -> M (M.Val unit).
  
  Global Instance AssociatedFunction_insert :
    Notation.DoubleColon ltac:(Self) "insert" := {
    Notation.double_colon := insert;
  }.
End Impl_lib_Mapping_t_K_V.
End Impl_lib_Mapping_t_K_V.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : alloc.string.String.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_lib_AccountId_t.
Section Impl_core_default_Default_for_lib_AccountId_t.
  Ltac Self := exact lib.AccountId.t.
  
  Parameter default : M (M.Val lib.AccountId.t).
  
  Global Instance AssociatedFunction_default :
    Notation.DoubleColon ltac:(Self) "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_lib_AccountId_t.
End Impl_core_default_Default_for_lib_AccountId_t.

Ltac Balance := exact u128.t.

Module  Environment.
Section Environment.
  Record t : Set := {
    x0 : alloc.string.String.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End Environment.
End Environment.

Module  Event.
Section Event.
  Record t : Set := {
    x0 : alloc.string.String.t;
  }.
  
  Global Instance Get_0 : Notation.Dot "0" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(x0) : M _;
  }.
End Event.
End Event.

Module  Erc20.
Section Erc20.
  Record t : Set := {
    total_supply : ltac:(lib.Balance);
    balances : lib.Mapping.t lib.AccountId.t ltac:(lib.Balance);
    allowances :
      lib.Mapping.t (lib.AccountId.t * lib.AccountId.t) ltac:(lib.Balance);
  }.
  
  Global Instance Get_total_supply : Notation.Dot "total_supply" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(total_supply) : M _;
  }.
  Global Instance Get_AF_total_supply :
    Notation.DoubleColon t "total_supply" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(total_supply) : M _;
  }.
  Global Instance Get_balances : Notation.Dot "balances" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(balances) : M _;
  }.
  Global Instance Get_AF_balances : Notation.DoubleColon t "balances" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(balances) : M _;
  }.
  Global Instance Get_allowances : Notation.Dot "allowances" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(allowances) : M _;
  }.
  Global Instance Get_AF_allowances : Notation.DoubleColon t "allowances" := {
    Notation.double_colon x :=
      let* x := M.read x in M.alloc x.(allowances) : M _;
  }.
End Erc20.
End Erc20.

Module  Impl_core_default_Default_for_lib_Erc20_t.
Section Impl_core_default_Default_for_lib_Erc20_t.
  Ltac Self := exact lib.Erc20.t.
  
  Parameter default : M (M.Val lib.Erc20.t).
  
  Global Instance AssociatedFunction_default :
    Notation.DoubleColon ltac:(Self) "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_lib_Erc20_t.
End Impl_core_default_Default_for_lib_Erc20_t.

Module  Transfer.
Section Transfer.
  Record t : Set := {
    from : core.option.Option.t lib.AccountId.t;
    to : core.option.Option.t lib.AccountId.t;
    value : ltac:(lib.Balance);
  }.
  
  Global Instance Get_from : Notation.Dot "from" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(from) : M _;
  }.
  Global Instance Get_AF_from : Notation.DoubleColon t "from" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(from) : M _;
  }.
  Global Instance Get_to : Notation.Dot "to" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(to) : M _;
  }.
  Global Instance Get_AF_to : Notation.DoubleColon t "to" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(to) : M _;
  }.
  Global Instance Get_value : Notation.Dot "value" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
  Global Instance Get_AF_value : Notation.DoubleColon t "value" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
End Transfer.
End Transfer.

Module  Impl_core_convert_Into_lib_Event_t_for_lib_Transfer_t.
Section Impl_core_convert_Into_lib_Event_t_for_lib_Transfer_t.
  Ltac Self := exact lib.Transfer.t.
  
  Parameter into : (M.Val ltac:(Self)) -> M (M.Val lib.Event.t).
  
  Global Instance AssociatedFunction_into :
    Notation.DoubleColon ltac:(Self) "into" := {
    Notation.double_colon := into;
  }.
  
  Global Instance ℐ :
    core.convert.Into.Trait ltac:(Self) (T := lib.Event.t) := {
    core.convert.Into.into := into;
  }.
End Impl_core_convert_Into_lib_Event_t_for_lib_Transfer_t.
End Impl_core_convert_Into_lib_Event_t_for_lib_Transfer_t.

Module  Approval.
Section Approval.
  Record t : Set := {
    owner : lib.AccountId.t;
    spender : lib.AccountId.t;
    value : ltac:(lib.Balance);
  }.
  
  Global Instance Get_owner : Notation.Dot "owner" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(owner) : M _;
  }.
  Global Instance Get_AF_owner : Notation.DoubleColon t "owner" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(owner) : M _;
  }.
  Global Instance Get_spender : Notation.Dot "spender" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(spender) : M _;
  }.
  Global Instance Get_AF_spender : Notation.DoubleColon t "spender" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(spender) : M _;
  }.
  Global Instance Get_value : Notation.Dot "value" := {
    Notation.dot x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
  Global Instance Get_AF_value : Notation.DoubleColon t "value" := {
    Notation.double_colon x := let* x := M.read x in M.alloc x.(value) : M _;
  }.
End Approval.
End Approval.

Module  Impl_core_convert_Into_lib_Event_t_for_lib_Approval_t.
Section Impl_core_convert_Into_lib_Event_t_for_lib_Approval_t.
  Ltac Self := exact lib.Approval.t.
  
  Parameter into : (M.Val ltac:(Self)) -> M (M.Val lib.Event.t).
  
  Global Instance AssociatedFunction_into :
    Notation.DoubleColon ltac:(Self) "into" := {
    Notation.double_colon := into;
  }.
  
  Global Instance ℐ :
    core.convert.Into.Trait ltac:(Self) (T := lib.Event.t) := {
    core.convert.Into.into := into;
  }.
End Impl_core_convert_Into_lib_Event_t_for_lib_Approval_t.
End Impl_core_convert_Into_lib_Event_t_for_lib_Approval_t.

Module Error.
  Inductive t : Set :=
  | InsufficientBalance
  | InsufficientAllowance.
End Error.

Ltac Result T := exact (core.result.Result.t T lib.Error.t).

Module  Impl_lib_Environment_t.
Section Impl_lib_Environment_t.
  Ltac Self := exact lib.Environment.t.
  
  Parameter caller : (M.Val (ref ltac:(Self))) -> M (M.Val lib.AccountId.t).
  
  Global Instance AssociatedFunction_caller :
    Notation.DoubleColon ltac:(Self) "caller" := {
    Notation.double_colon := caller;
  }.
  
  Parameter emit_event :
      forall {E : Set} {ℋ_0 : core.convert.Into.Trait E (T := lib.Event.t)},
      (M.Val (ref ltac:(Self))) -> (M.Val E) -> M (M.Val unit).
  
  Global Instance AssociatedFunction_emit_event
      {E : Set}
      {ℋ_0 : core.convert.Into.Trait E (T := lib.Event.t)} :
    Notation.DoubleColon ltac:(Self) "emit_event" := {
    Notation.double_colon := emit_event (E := E);
  }.
End Impl_lib_Environment_t.
End Impl_lib_Environment_t.

Module  Impl_lib_Erc20_t.
Section Impl_lib_Erc20_t.
  Ltac Self := exact lib.Erc20.t.
  
  Parameter init_env : M (M.Val lib.Environment.t).
  
  Global Instance AssociatedFunction_init_env :
    Notation.DoubleColon ltac:(Self) "init_env" := {
    Notation.double_colon := init_env;
  }.
  
  Parameter env : (M.Val (ref ltac:(Self))) -> M (M.Val lib.Environment.t).
  
  Global Instance AssociatedFunction_env :
    Notation.DoubleColon ltac:(Self) "env" := {
    Notation.double_colon := env;
  }.
End Impl_lib_Erc20_t.
End Impl_lib_Erc20_t.

Module  Impl_lib_Erc20_t_2.
Section Impl_lib_Erc20_t_2.
  Ltac Self := exact lib.Erc20.t.
  
  Parameter new : (M.Val ltac:(lib.Balance)) -> M (M.Val ltac:(Self)).
  
  Global Instance AssociatedFunction_new :
    Notation.DoubleColon ltac:(Self) "new" := {
    Notation.double_colon := new;
  }.
  
  Parameter total_supply :
      (M.Val (ref ltac:(Self))) -> M (M.Val ltac:(lib.Balance)).
  
  Global Instance AssociatedFunction_total_supply :
    Notation.DoubleColon ltac:(Self) "total_supply" := {
    Notation.double_colon := total_supply;
  }.
  
  Parameter balance_of_impl :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (ref lib.AccountId.t)) ->
        M (M.Val ltac:(lib.Balance)).
  
  Global Instance AssociatedFunction_balance_of_impl :
    Notation.DoubleColon ltac:(Self) "balance_of_impl" := {
    Notation.double_colon := balance_of_impl;
  }.
  
  Parameter balance_of :
      (M.Val (ref ltac:(Self))) ->
        (M.Val lib.AccountId.t) ->
        M (M.Val ltac:(lib.Balance)).
  
  Global Instance AssociatedFunction_balance_of :
    Notation.DoubleColon ltac:(Self) "balance_of" := {
    Notation.double_colon := balance_of;
  }.
  
  Parameter allowance_impl :
      (M.Val (ref ltac:(Self))) ->
        (M.Val (ref lib.AccountId.t)) ->
        (M.Val (ref lib.AccountId.t)) ->
        M (M.Val ltac:(lib.Balance)).
  
  Global Instance AssociatedFunction_allowance_impl :
    Notation.DoubleColon ltac:(Self) "allowance_impl" := {
    Notation.double_colon := allowance_impl;
  }.
  
  Parameter allowance :
      (M.Val (ref ltac:(Self))) ->
        (M.Val lib.AccountId.t) ->
        (M.Val lib.AccountId.t) ->
        M (M.Val ltac:(lib.Balance)).
  
  Global Instance AssociatedFunction_allowance :
    Notation.DoubleColon ltac:(Self) "allowance" := {
    Notation.double_colon := allowance;
  }.
  
  Parameter transfer_from_to :
      (M.Val (mut_ref ltac:(Self))) ->
        (M.Val (ref lib.AccountId.t)) ->
        (M.Val (ref lib.AccountId.t)) ->
        (M.Val ltac:(lib.Balance)) ->
        M (M.Val ltac:(lib.Result unit)).
  
  Global Instance AssociatedFunction_transfer_from_to :
    Notation.DoubleColon ltac:(Self) "transfer_from_to" := {
    Notation.double_colon := transfer_from_to;
  }.
  
  Parameter transfer :
      (M.Val (mut_ref ltac:(Self))) ->
        (M.Val lib.AccountId.t) ->
        (M.Val ltac:(lib.Balance)) ->
        M (M.Val ltac:(lib.Result unit)).
  
  Global Instance AssociatedFunction_transfer :
    Notation.DoubleColon ltac:(Self) "transfer" := {
    Notation.double_colon := transfer;
  }.
  
  Parameter approve :
      (M.Val (mut_ref ltac:(Self))) ->
        (M.Val lib.AccountId.t) ->
        (M.Val ltac:(lib.Balance)) ->
        M (M.Val ltac:(lib.Result unit)).
  
  Global Instance AssociatedFunction_approve :
    Notation.DoubleColon ltac:(Self) "approve" := {
    Notation.double_colon := approve;
  }.
  
  Parameter transfer_from :
      (M.Val (mut_ref ltac:(Self))) ->
        (M.Val lib.AccountId.t) ->
        (M.Val lib.AccountId.t) ->
        (M.Val ltac:(lib.Balance)) ->
        M (M.Val ltac:(lib.Result unit)).
  
  Global Instance AssociatedFunction_transfer_from :
    Notation.DoubleColon ltac:(Self) "transfer_from" := {
    Notation.double_colon := transfer_from;
  }.
End Impl_lib_Erc20_t_2.
End Impl_lib_Erc20_t_2.
