Require Import CoqOfRust.CoqOfRust.
Require CoqOfRust.examples.default.examples.ink_contracts.erc721.
Require CoqOfRust.core.simulations.default.
Require Import CoqOfRust.core.simulations.option.
Require Import CoqOfRust.core.simulations.integer.
Require Import CoqOfRust.core.simulations.bool.
Require CoqOfRust.examples.default.examples.ink_contracts.simulations.lib.
Require Import CoqOfRust.simulations.M.

Import simulations.M.Notations.
Import simulations.bool.Notations.

(** ** Primitives *)

Module Balance.
  Inductive t : Set :=
  | Make (balance : Z).

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Balance";
    φ '(Make x) := Value.Integer Integer.U128 x;
  }.
End Balance.

Module Impl_Default_for_Balance.
  Global Instance I : core.simulations.default.Default.Trait Balance.t := {
    default := Balance.Make 0;
  }.
End Impl_Default_for_Balance.

Module AccountId.
  Inductive t : Set :=
  | Make (account_id : Z).

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::AccountId";
    φ '(Make x) :=
      Value.StructTuple "erc721::AccountId" [Value.Integer Integer.U128 x];
  }.

  Parameter eq : t -> t -> bool.
  Parameter neq : t -> t -> bool.
  Parameter option_eq : option t -> option t -> bool.
  Parameter option_neq : option t -> option t -> bool.
  Parameter from : list U8.t -> t.
  Parameter from_zero : t.
End AccountId.

Module TokenId.
  Inductive t : Set :=
  | Make (account_id : Z).

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::AccountId";
    φ '(Make x) :=
      Value.StructTuple "erc721::TokenId" [Value.Integer Integer.U32 x];
  }.
End TokenId.

Module Transfer.
  Record t : Set := {
    from : option AccountId.t;
    to : option AccountId.t;
    id : TokenId.t;
  }.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Transfer";
    φ x :=
      Value.StructRecord "erc721::Transfer" [
        ("from", φ x.(from));
        ("to", φ x.(to));
        ("value", φ x.(id))
      ];
  }.
End Transfer.

Module Approval.
  Record t : Set := {
    from : AccountId.t;
    to : AccountId.t;
    id : TokenId.t;
  }.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Approval";
    φ x :=
      Value.StructRecord "erc721::Approval" [
        ("from", φ x.(from));
        ("to", φ x.(to));
        ("value", φ x.(id))
      ];
  }.
End Approval.

Module ApprovalForAll.
  Record t : Set := {
    owner : AccountId.t;
    operator : AccountId.t;
    approved : bool;
  }.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::ApprovalForAll";
    φ x :=
      Value.StructRecord "erc721::ApprovalForAll" [
        ("from", φ x.(owner));
        ("to", φ x.(operator));
        ("approved", Value.Bool x.(approved))
      ];
  }.
End ApprovalForAll.

Module Event.
  Inductive t : Set :=
  | Transfer : erc721.Transfer.t -> t
  | Approval : erc721.Approval.t -> t
  | ApprovalForAll : erc721.ApprovalForAll.t -> t.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Event";
    φ x :=
      match x with
      | Transfer x => φ x
      | Approval x => φ x
      | ApprovalForAll x => φ x
      end;
  }.
End Event.

Module Env.
  Record t : Set := {
    caller : AccountId.t;
  }.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Env";
    φ x :=
      Value.StructRecord "erc721::Env" [
        ("caller", φ x.(caller))
      ];
  }.

  Definition emit_event
      (events : list erc721.Event.t)
      (event : erc721.Event.t) :
      list erc721.Event.t :=
    event :: events.
End Env.

Module Error.
  Inductive t : Set :=
  | NotOwner
  | NotApproved
  | TokenExists
  | TokenNotFound
  | CannotInsert
  | CannotFetchValue
  | NotAllowed.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Error";
    φ x :=
      match x with
      | NotOwner => Value.StructTuple "erc721::Error" []
      | NotApproved => Value.StructTuple "erc721::Error" []
      | TokenExists => Value.StructTuple "erc721::Error" []
      | TokenNotFound => Value.StructTuple "erc721::Error" []
      | CannotInsert => Value.StructTuple "erc721::Error" []
      | CannotFetchValue => Value.StructTuple "erc721::Error" []
      | NotAllowed => Value.StructTuple "erc721::Error" []
      end;
  }.
End Error.

Definition init_env (env : erc721.Env.t) : erc721.Env.t :=
  env.

Definition env (env : erc721.Env.t) : erc721.Env.t :=
  env.

Module Erc721.
  Record t : Set := {
    token_owner : simulations.lib.Mapping.t TokenId.t AccountId.t;
    token_approvals : simulations.lib.Mapping.t TokenId.t AccountId.t;
    owned_tokens_count : simulations.lib.Mapping.t AccountId.t integer.U32.t;
    operator_approvals : simulations.lib.Mapping.t (AccountId.t * AccountId.t) unit;
  }.

  Global Instance IsToValue : ToValue t := {
    Φ := Ty.path "erc721::Erc721";
    φ x :=
      Value.StructRecord "erc721::Erc721" [
        ("token_owner", φ x.(token_owner));
        ("token_approvals", φ x.(token_approvals));
        ("owned_token_count", φ x.(owned_tokens_count));
        ("operator_approvals", φ x.(operator_approvals))
      ];
  }.
End Erc721.

(** ** Simulations that only read the state. *)

Definition balance_of_or_zero
    (storage : erc721.Erc721.t)
    (owner : erc721.AccountId.t) :
    U32.t :=
  match simulations.lib.Mapping.get owner storage.(erc721.Erc721.owned_tokens_count) with
  | Some count => count
  | None => U32.Make 0
  end.

Definition approved_for_all
    (storage : erc721.Erc721.t)
    (owner : erc721.AccountId.t)
    (operator : erc721.AccountId.t) :
    bool :=
  simulations.lib.Mapping.contains (owner, operator) storage.(erc721.Erc721.operator_approvals).

Definition owner_of
    (storage : erc721.Erc721.t)
    (token_id : erc721.TokenId.t) :
    option erc721.AccountId.t :=
  simulations.lib.Mapping.get token_id storage.(erc721.Erc721.token_owner).

Definition exists_
    (storage : erc721.Erc721.t)
    (token_id : erc721.TokenId.t) :
    bool :=
  simulations.lib.Mapping.contains token_id storage.(erc721.Erc721.token_owner).

Definition balance_of
    (storage : erc721.Erc721.t)
    (owner : erc721.AccountId.t) :
    U32.t :=
  balance_of_or_zero storage owner.

Definition get_approved 
    (storage : erc721.Erc721.t)
    (token_id : erc721.TokenId.t) :
    option erc721.AccountId.t :=
  simulations.lib.Mapping.get token_id storage.(erc721.Erc721.token_approvals).

Definition is_approved_for_all
    (storage : erc721.Erc721.t)
    (owner : erc721.AccountId.t)
    (operator : erc721.AccountId.t) :
    bool :=
  approved_for_all storage owner operator.

(** ** Simulations modifying the state. *)

Module State.
  Definition t : Set := erc721.Erc721.t * list erc721.Event.t.
End State.

Definition approved_or_owner
    (from : option erc721.AccountId.t)
    (token_id : erc721.TokenId.t) :
    MS? State.t string bool :=
  letS? '(storage, events) := readS? in
  let owner := owner_of storage token_id in
  (returnS? (AccountId.option_neq from (Some AccountId.from_zero))
    &&S? (returnS? (AccountId.option_eq from owner)
          ||S? returnS? (AccountId.option_eq from
                          (simulations.lib.Mapping.get token_id storage.(erc721.Erc721.token_approvals)))
          ||S? (letS? owner := Impl_Option_T.expect owner "Error with AccountId" in
                letS? from := Impl_Option_T.expect from "Error with AccountId" in
                returnS? (approved_for_all storage owner from))))%bool.

Definition clear_approval
    (token_id : erc721.TokenId.t) :
    MS? State.t string unit :=
  letS? '(storage, events) := readS? in
  let storage' :=
    storage <|
      erc721.Erc721.token_approvals :=
        simulations.lib.Mapping.remove token_id storage.(erc721.Erc721.token_approvals)
    |> in
  letS? _ := writeS? (storage', events) in
  returnS? tt.

Definition approve_for_all
    (env : erc721.Env.t)
    (to : erc721.AccountId.t)
    (approved : bool) :
    MS? State.t string (erc721.Error.t + unit) :=
  let caller := Env.caller env in
  if AccountId.eq to caller
  then
    letS? '(storage, events) := readS? in
    let event := erc721.Event.ApprovalForAll ({|
      erc721.ApprovalForAll.owner := caller;
      erc721.ApprovalForAll.operator := to;
      erc721.ApprovalForAll.approved := approved
    |}) in
    letS? _ := writeS? (
      storage <| erc721.Erc721.operator_approvals :=
        if approved
        then
          simulations.lib.Mapping.insert (caller, to) tt storage.(erc721.Erc721.operator_approvals)
        else
          simulations.lib.Mapping.remove (caller, to) storage.(erc721.Erc721.operator_approvals)
      |>,
      event :: events
    ) in
    returnS? (inr tt)
  else
    returnS? (inl erc721.Error.NotApproved). 

Definition set_approval_for_all
    (env : erc721.Env.t)
    (to : erc721.AccountId.t)
    (approved : bool) :
    MS? State.t string (erc721.Error.t + unit) :=
  approve_for_all env to approved.

Definition approve_for
  (env : erc721.Env.t)
  (to : erc721.AccountId.t)
  (token_id : erc721.TokenId.t) :
  MS? State.t string (erc721.Error.t + unit) :=
  letS? '(storage, events) := readS? in
  let caller := Env.caller env in
  let owner := owner_of storage token_id in
  ifS?
    notS?
      (returnS? (AccountId.option_eq owner (Some caller))
        ||S? (letS? owner := Impl_Option_T.expect owner "Error with AccountId" in
              returnS? (approved_for_all storage owner caller)))%bool
  then
    returnS? (inl erc721.Error.NotAllowed)
  else
    if AccountId.eq to AccountId.from_zero
    then
      returnS? (inl erc721.Error.NotAllowed)
    else
      if simulations.lib.Mapping.contains token_id storage.(erc721.Erc721.token_approvals)
      then
        returnS? (inl erc721.Error.CannotInsert)
      else
        let event := erc721.Event.Approval {|
          erc721.Approval.from := caller;
          erc721.Approval.to := to;
          erc721.Approval.id := token_id
        |} in
        letS? _ := writeS? (
          storage <|
            erc721.Erc721.token_approvals :=
              simulations.lib.Mapping.insert token_id to storage.(erc721.Erc721.token_approvals)
          |>,
          event :: events
        ) in
        returnS? (inr tt).

Definition approve
    (env : erc721.Env.t)
    (to : erc721.AccountId.t)
    (token_id : erc721.TokenId.t) :
    MS? State.t string (erc721.Error.t + unit) :=
  letS? _ := approve_for env to token_id in
  returnS? (inr tt).

(* TODO: *)
(* remove_token_from *)
(* add_token_to *)
(* transfer_token_from *)
(* transfer *)
(* transfer_from *)
(* mint *)
(* burn *)
