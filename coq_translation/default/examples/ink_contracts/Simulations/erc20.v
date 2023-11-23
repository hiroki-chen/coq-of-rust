Require Import CoqOfRust.CoqOfRust.
Require CoqOfRust.examples.ink_contracts.erc20.

Definition total_supply (storage : erc20.Erc20.t) : ltac:(erc20.Balance) :=
  storage.(erc20.Erc20.total_supply).

Definition balance_of_impl
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t) :
    ltac:(erc20.Balance) :=
  match Lib.Mapping.get owner storage.(erc20.Erc20.balances) with
  | option.Option.Some balance => balance
  | option.Option.None => 0
  end.

Definition balance_of
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t) :
    ltac:(erc20.Balance) :=
  balance_of_impl storage owner.

Definition allowance_impl
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    (spender : erc20.AccountId.t) :
    ltac:(erc20.Balance) :=
  match Lib.Mapping.get (owner, spender) storage.(erc20.Erc20.allowances) with
  | option.Option.Some allowance => allowance
  | option.Option.None => 0
  end.

Definition allowance
    (storage : erc20.Erc20.t)
    (owner : erc20.AccountId.t)
    (spender : erc20.AccountId.t) :
    ltac:(erc20.Balance) :=
  allowance_impl storage owner spender.

Definition transfer_from_to
    (storage : erc20.Erc20.t)
    (from : erc20.AccountId.t)
    (to : erc20.AccountId.t)
    (value : ltac:(erc20.Balance)) :
    ltac:(erc20.Result unit) * erc20.Erc20.t :=
  let from_balance := balance_of_impl storage from in
  if (from_balance <? value)%Z then
    (result.Result.Err erc20.Error.InsufficientBalance, storage)
  else
    let storage := storage <| erc20.Erc20.balances :=
      Lib.Mapping.insert from (from_balance - value) storage.(erc20.Erc20.balances)
    |> in
    let to_balance := balance_of_impl storage to in
    let storage := storage <| erc20.Erc20.balances :=
      Lib.Mapping.insert to (to_balance + value)%Z storage.(erc20.Erc20.balances)
    |> in
    (result.Result.Ok tt, storage).
