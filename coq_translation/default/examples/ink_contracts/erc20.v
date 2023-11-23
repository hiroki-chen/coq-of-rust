(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Require Import CoqOfRust.examples.ink_contracts.Lib.

Module Mapping := Mapping.

(* Module  Mapping. (*
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Global Instance Get__key : Notations.Dot "_key" := {
    Notations.dot := Ref.map (fun x => x.(_key)) (fun v x => x <| _key := v |>);
  }.
  Global Instance Get_AF__key : Notations.DoubleColon t "_key" := {
    Notations.double_colon (x : M.Val t) := x.["_key"];
  }.
  Global Instance Get__value : Notations.Dot "_value" := {
    Notations.dot :=
      Ref.map (fun x => x.(_value)) (fun v x => x <| _value := v |>);
  }.
  Global Instance Get_AF__value : Notations.DoubleColon t "_value" := {
    Notations.double_colon (x : M.Val t) := x.["_value"];
  }.
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_erc20_Mapping_t_K_V.
Section Impl_core_default_Default_for_erc20_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Ltac Self := exact (erc20.Mapping.t K V).
  
  (*
  Default
  *)
  Definition default : M (M.Val (erc20.Mapping.t K V)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val (core.marker.PhantomData.t K))) :=
        core.default.Default.default
          (Self := core.marker.PhantomData.t K)
          (Trait := ltac:(refine _)) in
      let* α1 := M.read α0 in
      let* α2 : ltac:(refine (M.Val (core.marker.PhantomData.t V))) :=
        core.default.Default.default
          (Self := core.marker.PhantomData.t V)
          (Trait := ltac:(refine _)) in
      let* α3 := M.read α2 in
      M.alloc {| erc20.Mapping._key := α1; erc20.Mapping._value := α3; |}).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc20_Mapping_t_K_V.
End Impl_core_default_Default_for_erc20_Mapping_t_K_V.

Module  Impl_erc20_Mapping_t_K_V.
Section Impl_erc20_Mapping_t_K_V.
  Context {K V : Set}.
  
  Ltac Self := exact (erc20.Mapping.t K V).
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Definition get
      (self : M.Val (ref ltac:(Self)))
      (_key : M.Val (ref K))
      : M (M.Val (core.option.Option.t V)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val never.t)) :=
        core.panicking.panic (mk_str "not implemented") in
      never_to_any α0).
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn insert(&mut self, _key: K, _value: V) {
          unimplemented!()
      }
  *)
  Definition insert
      (self : M.Val (mut_ref ltac:(Self)))
      (_key : M.Val K)
      (_value : M.Val V)
      : M (M.Val unit) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val never.t)) :=
        core.panicking.panic (mk_str "not implemented") in
      never_to_any α0).
  
  Global Instance AssociatedFunction_insert :
    Notations.DoubleColon ltac:(Self) "insert" := {
    Notations.double_colon := insert;
  }.
End Impl_erc20_Mapping_t_K_V. *)
End Impl_erc20_Mapping_t_K_V. *)

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_erc20_AccountId_t.
Section Impl_core_default_Default_for_erc20_AccountId_t.
  Ltac Self := exact erc20.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M (M.Val erc20.AccountId.t) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val u128.t)) :=
        core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _)) in
      let* α1 := M.read α0 in
      M.alloc (erc20.AccountId.Build_t α1)).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc20_AccountId_t.
End Impl_core_default_Default_for_erc20_AccountId_t.

Module  Impl_core_clone_Clone_for_erc20_AccountId_t.
Section Impl_core_clone_Clone_for_erc20_AccountId_t.
  Ltac Self := exact erc20.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val erc20.AccountId.t) :=
    M.function_body
      (let* _ : ltac:(refine (M.Val unit)) := M.alloc tt in
      deref self).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon ltac:(Self) "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait ltac:(Self) := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_erc20_AccountId_t.
End Impl_core_clone_Clone_for_erc20_AccountId_t.

Module  Impl_core_marker_Copy_for_erc20_AccountId_t.
Section Impl_core_marker_Copy_for_erc20_AccountId_t.
  Ltac Self := exact erc20.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait ltac:(Self) := {
  }.
End Impl_core_marker_Copy_for_erc20_AccountId_t.
End Impl_core_marker_Copy_for_erc20_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := { }.
  
End Env.
End Env.

Module  Event.
Section Event.
  Record t : Set := {
    x0 : alloc.string.String.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot := Ref.map (fun x => x.(x0)) (fun v x => x <| x0 := v |>);
  }.
End Event.
End Event.

Module  Erc20.
Section Erc20.
  Record t : Set := {
    total_supply : ltac:(erc20.Balance);
    balances : erc20.Mapping.t erc20.AccountId.t ltac:(erc20.Balance);
    allowances :
      erc20.Mapping.t
        (erc20.AccountId.t * erc20.AccountId.t)
        ltac:(erc20.Balance);
  }.
  
  Global Instance Get_total_supply : Notations.Dot "total_supply" := {
    Notations.dot :=
      Ref.map
        (fun x => x.(total_supply))
        (fun v x => x <| total_supply := v |>);
  }.
  Global Instance Get_AF_total_supply :
    Notations.DoubleColon t "total_supply" := {
    Notations.double_colon (x : M.Val t) := x.["total_supply"];
  }.
  Global Instance Get_balances : Notations.Dot "balances" := {
    Notations.dot :=
      Ref.map (fun x => x.(balances)) (fun v x => x <| balances := v |>);
  }.
  Global Instance Get_AF_balances : Notations.DoubleColon t "balances" := {
    Notations.double_colon (x : M.Val t) := x.["balances"];
  }.
  Global Instance Get_allowances : Notations.Dot "allowances" := {
    Notations.dot :=
      Ref.map (fun x => x.(allowances)) (fun v x => x <| allowances := v |>);
  }.
  Global Instance Get_AF_allowances : Notations.DoubleColon t "allowances" := {
    Notations.double_colon (x : M.Val t) := x.["allowances"];
  }.
End Erc20.
End Erc20.

Module  Impl_core_default_Default_for_erc20_Erc20_t.
Section Impl_core_default_Default_for_erc20_Erc20_t.
  Ltac Self := exact erc20.Erc20.t.
  
  (*
  Default
  *)
  Definition default : M (M.Val erc20.Erc20.t) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val u128.t)) :=
        core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _)) in
      let* α1 := M.read α0 in
      let* α2 :
          ltac:(refine (M.Val (erc20.Mapping.t erc20.AccountId.t u128.t))) :=
        core.default.Default.default
          (Self := erc20.Mapping.t erc20.AccountId.t u128.t)
          (Trait := ltac:(refine _)) in
      let* α3 := M.read α2 in
      let* α4 :
          ltac:(refine
            (M.Val
              (erc20.Mapping.t
                (erc20.AccountId.t * erc20.AccountId.t)
                u128.t))) :=
        core.default.Default.default
          (Self :=
            erc20.Mapping.t (erc20.AccountId.t * erc20.AccountId.t) u128.t)
          (Trait := ltac:(refine _)) in
      let* α5 := M.read α4 in
      M.alloc
        {|
          erc20.Erc20.total_supply := α1;
          erc20.Erc20.balances := α3;
          erc20.Erc20.allowances := α5;
        |}).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon ltac:(Self) "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait ltac:(Self) := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_erc20_Erc20_t.
End Impl_core_default_Default_for_erc20_Erc20_t.

Module  Transfer.
Section Transfer.
  Record t : Set := {
    from : core.option.Option.t erc20.AccountId.t;
    to : core.option.Option.t erc20.AccountId.t;
    value : ltac:(erc20.Balance);
  }.
  
  Global Instance Get_from : Notations.Dot "from" := {
    Notations.dot := Ref.map (fun x => x.(from)) (fun v x => x <| from := v |>);
  }.
  Global Instance Get_AF_from : Notations.DoubleColon t "from" := {
    Notations.double_colon (x : M.Val t) := x.["from"];
  }.
  Global Instance Get_to : Notations.Dot "to" := {
    Notations.dot := Ref.map (fun x => x.(to)) (fun v x => x <| to := v |>);
  }.
  Global Instance Get_AF_to : Notations.DoubleColon t "to" := {
    Notations.double_colon (x : M.Val t) := x.["to"];
  }.
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Transfer.
End Transfer.

Module  Impl_core_convert_Into_erc20_Event_t_for_erc20_Transfer_t.
Section Impl_core_convert_Into_erc20_Event_t_for_erc20_Transfer_t.
  Ltac Self := exact erc20.Transfer.t.
  
  (*
      fn into(self) -> Event {
          unimplemented!()
      }
  *)
  Definition into (self : M.Val ltac:(Self)) : M (M.Val erc20.Event.t) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val never.t)) :=
        core.panicking.panic (mk_str "not implemented") in
      never_to_any α0).
  
  Global Instance AssociatedFunction_into :
    Notations.DoubleColon ltac:(Self) "into" := {
    Notations.double_colon := into;
  }.
  
  Global Instance ℐ :
    core.convert.Into.Trait ltac:(Self) (T := erc20.Event.t) := {
    core.convert.Into.into := into;
  }.
End Impl_core_convert_Into_erc20_Event_t_for_erc20_Transfer_t.
End Impl_core_convert_Into_erc20_Event_t_for_erc20_Transfer_t.

Module  Approval.
Section Approval.
  Record t : Set := {
    owner : erc20.AccountId.t;
    spender : erc20.AccountId.t;
    value : ltac:(erc20.Balance);
  }.
  
  Global Instance Get_owner : Notations.Dot "owner" := {
    Notations.dot :=
      Ref.map (fun x => x.(owner)) (fun v x => x <| owner := v |>);
  }.
  Global Instance Get_AF_owner : Notations.DoubleColon t "owner" := {
    Notations.double_colon (x : M.Val t) := x.["owner"];
  }.
  Global Instance Get_spender : Notations.Dot "spender" := {
    Notations.dot :=
      Ref.map (fun x => x.(spender)) (fun v x => x <| spender := v |>);
  }.
  Global Instance Get_AF_spender : Notations.DoubleColon t "spender" := {
    Notations.double_colon (x : M.Val t) := x.["spender"];
  }.
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Approval.
End Approval.

Module  Impl_core_convert_Into_erc20_Event_t_for_erc20_Approval_t.
Section Impl_core_convert_Into_erc20_Event_t_for_erc20_Approval_t.
  Ltac Self := exact erc20.Approval.t.
  
  (*
      fn into(self) -> Event {
          unimplemented!()
      }
  *)
  Definition into (self : M.Val ltac:(Self)) : M (M.Val erc20.Event.t) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val never.t)) :=
        core.panicking.panic (mk_str "not implemented") in
      never_to_any α0).
  
  Global Instance AssociatedFunction_into :
    Notations.DoubleColon ltac:(Self) "into" := {
    Notations.double_colon := into;
  }.
  
  Global Instance ℐ :
    core.convert.Into.Trait ltac:(Self) (T := erc20.Event.t) := {
    core.convert.Into.into := into;
  }.
End Impl_core_convert_Into_erc20_Event_t_for_erc20_Approval_t.
End Impl_core_convert_Into_erc20_Event_t_for_erc20_Approval_t.

Module Error.
  Inductive t : Set :=
  | InsufficientBalance
  | InsufficientAllowance.
End Error.

Ltac Result T := exact (core.result.Result.t T erc20.Error.t).

Module  Impl_erc20_Env_t.
Section Impl_erc20_Env_t.
  Ltac Self := exact erc20.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          unimplemented!()
      }
  *)
  Definition caller
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val erc20.AccountId.t) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val never.t)) :=
        core.panicking.panic (mk_str "not implemented") in
      never_to_any α0).
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon ltac:(Self) "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event<E: Into<Event>>(&self, _event: E) {}
  *)
  Definition emit_event
      {E : Set}
      {ℋ_0 : core.convert.Into.Trait E (T := erc20.Event.t)}
      (self : M.Val (ref ltac:(Self)))
      (_event : M.Val E)
      : M (M.Val unit) :=
    M.function_body (M.alloc tt).
  
  Global Instance AssociatedFunction_emit_event
      {E : Set}
      {ℋ_0 : core.convert.Into.Trait E (T := erc20.Event.t)} :
    Notations.DoubleColon ltac:(Self) "emit_event" := {
    Notations.double_colon := emit_event (E := E);
  }.
End Impl_erc20_Env_t.
End Impl_erc20_Env_t.

Module  Impl_erc20_Erc20_t.
Section Impl_erc20_Erc20_t.
  Ltac Self := exact erc20.Erc20.t.
  
  (*
      fn init_env() -> Env {
          Env()
      }
  *)
  Definition init_env : M (M.Val erc20.Env.t) :=
    M.function_body (M.alloc erc20.Env.Build_t).
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon ltac:(Self) "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Env()
      }
  *)
  Definition env (self : M.Val (ref ltac:(Self))) : M (M.Val erc20.Env.t) :=
    M.function_body (M.alloc erc20.Env.Build_t).
  
  Global Instance AssociatedFunction_env :
    Notations.DoubleColon ltac:(Self) "env" := {
    Notations.double_colon := env;
  }.
End Impl_erc20_Erc20_t.
End Impl_erc20_Erc20_t.

Module  Impl_erc20_Erc20_t_2.
Section Impl_erc20_Erc20_t_2.
  Ltac Self := exact erc20.Erc20.t.
  
  (*
      fn new(total_supply: Balance) -> Self {
          let mut balances = Mapping::default();
          let caller = Self::init_env().caller();
          balances.insert(caller, total_supply);
          Self::init_env().emit_event(Transfer {
              from: None,
              to: Some(caller),
              value: total_supply,
          });
          Self {
              total_supply,
              balances,
              allowances: Default::default(),
          }
      }
  *)
  Definition new
      (total_supply : M.Val ltac:(erc20.Balance))
      : M (M.Val ltac:(Self)) :=
    M.function_body
      (let* balances :
          ltac:(refine (M.Val (erc20.Mapping.t erc20.AccountId.t u128.t))) :=
        core.default.Default.default
          (Self := erc20.Mapping.t erc20.AccountId.t u128.t)
          (Trait := ltac:(refine _)) in
      let* caller : ltac:(refine (M.Val erc20.AccountId.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["init_env"] in
        let* α1 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α0 in
        erc20.Env.t::["caller"] α1 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 :
            ltac:(refine
              (M.Val (mut_ref (erc20.Mapping.t erc20.AccountId.t u128.t)))) :=
          borrow_mut balances in
        (erc20.Mapping.t erc20.AccountId.t u128.t)::["insert"]
          α0
          caller
          total_supply in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["init_env"] in
        let* α1 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α0 in
        let* α2 := M.read caller in
        let* α3 := M.read total_supply in
        let* α4 : ltac:(refine (M.Val erc20.Transfer.t)) :=
          M.alloc
            {|
              erc20.Transfer.from := core.option.Option.None;
              erc20.Transfer.to := core.option.Option.Some α2;
              erc20.Transfer.value := α3;
            |} in
        erc20.Env.t::["emit_event"] α1 α4 in
      let* α0 := M.read total_supply in
      let* α1 := M.read balances in
      let* α2 :
          ltac:(refine
            (M.Val
              (erc20.Mapping.t
                (erc20.AccountId.t * erc20.AccountId.t)
                u128.t))) :=
        core.default.Default.default
          (Self :=
            erc20.Mapping.t (erc20.AccountId.t * erc20.AccountId.t) u128.t)
          (Trait := ltac:(refine _)) in
      let* α3 := M.read α2 in
      M.alloc
        {|
          erc20.Erc20.total_supply := α0;
          erc20.Erc20.balances := α1;
          erc20.Erc20.allowances := α3;
        |}).
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      fn total_supply(&self) -> Balance {
          self.total_supply
      }
  *)
  Definition total_supply
      (self : M.Val (ref ltac:(Self)))
      : M (M.Val ltac:(erc20.Balance)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      M.pure α0.["total_supply"]).
  
  Global Instance AssociatedFunction_total_supply :
    Notations.DoubleColon ltac:(Self) "total_supply" := {
    Notations.double_colon := total_supply;
  }.
  
  (*
      fn balance_of_impl(&self, owner: &AccountId) -> Balance {
          self.balances.get(owner).unwrap_or_default()
      }
  *)
  Definition balance_of_impl
      (self : M.Val (ref ltac:(Self)))
      (owner : M.Val (ref erc20.AccountId.t))
      : M (M.Val ltac:(erc20.Balance)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      let* α1 :
          ltac:(refine
            (M.Val (ref (erc20.Mapping.t erc20.AccountId.t u128.t)))) :=
        borrow α0.["balances"] in
      let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref owner in
      let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow α2 in
      let* α4 : ltac:(refine (M.Val (core.option.Option.t u128.t))) :=
        (erc20.Mapping.t erc20.AccountId.t u128.t)::["get"] α1 α3 in
      (core.option.Option.t u128.t)::["unwrap_or_default"] α4).
  
  Global Instance AssociatedFunction_balance_of_impl :
    Notations.DoubleColon ltac:(Self) "balance_of_impl" := {
    Notations.double_colon := balance_of_impl;
  }.
  
  (*
      fn balance_of(&self, owner: AccountId) -> Balance {
          self.balance_of_impl(&owner)
      }
  *)
  Definition balance_of
      (self : M.Val (ref ltac:(Self)))
      (owner : M.Val erc20.AccountId.t)
      : M (M.Val ltac:(erc20.Balance)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow owner in
      erc20.Erc20.t::["balance_of_impl"] α1 α2).
  
  Global Instance AssociatedFunction_balance_of :
    Notations.DoubleColon ltac:(Self) "balance_of" := {
    Notations.double_colon := balance_of;
  }.
  
  (*
      fn allowance_impl(&self, owner: &AccountId, spender: &AccountId) -> Balance {
          self.allowances.get(&( *owner, *spender)).unwrap_or_default()
      }
  *)
  Definition allowance_impl
      (self : M.Val (ref ltac:(Self)))
      (owner : M.Val (ref erc20.AccountId.t))
      (spender : M.Val (ref erc20.AccountId.t))
      : M (M.Val ltac:(erc20.Balance)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      let* α1 :
          ltac:(refine
            (M.Val
              (ref
                (erc20.Mapping.t
                  (erc20.AccountId.t * erc20.AccountId.t)
                  u128.t)))) :=
        borrow α0.["allowances"] in
      let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref owner in
      let* α3 := M.read α2 in
      let* α4 : ltac:(refine (M.Val erc20.AccountId.t)) := deref spender in
      let* α5 := M.read α4 in
      let* α6 : ltac:(refine (M.Val (erc20.AccountId.t * erc20.AccountId.t))) :=
        M.alloc (α3, α5) in
      let* α7 :
          ltac:(refine (M.Val (ref (erc20.AccountId.t * erc20.AccountId.t)))) :=
        borrow α6 in
      let* α8 : ltac:(refine (M.Val (core.option.Option.t u128.t))) :=
        (erc20.Mapping.t
              (erc20.AccountId.t * erc20.AccountId.t)
              u128.t)::["get"]
          α1
          α7 in
      (core.option.Option.t u128.t)::["unwrap_or_default"] α8).
  
  Global Instance AssociatedFunction_allowance_impl :
    Notations.DoubleColon ltac:(Self) "allowance_impl" := {
    Notations.double_colon := allowance_impl;
  }.
  
  (*
      fn allowance(&self, owner: AccountId, spender: AccountId) -> Balance {
          self.allowance_impl(&owner, &spender)
      }
  *)
  Definition allowance
      (self : M.Val (ref ltac:(Self)))
      (owner : M.Val erc20.AccountId.t)
      (spender : M.Val erc20.AccountId.t)
      : M (M.Val ltac:(erc20.Balance)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
      let* α2 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow owner in
      let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) :=
        borrow spender in
      erc20.Erc20.t::["allowance_impl"] α1 α2 α3).
  
  Global Instance AssociatedFunction_allowance :
    Notations.DoubleColon ltac:(Self) "allowance" := {
    Notations.double_colon := allowance;
  }.
  
  (*
      fn transfer_from_to(&mut self, from: &AccountId, to: &AccountId, value: Balance) -> Result<()> {
          let from_balance = self.balance_of_impl(from);
          if from_balance < value {
              return Err(Error::InsufficientBalance);
          }
  
          self.balances.insert( *from, from_balance - value);
          let to_balance = self.balance_of_impl(to);
          self.balances.insert( *to, to_balance + value);
          self.env().emit_event(Transfer {
              from: Some( *from),
              to: Some( *to),
              value,
          });
          Ok(())
      }
  *)
  Definition transfer_from_to
      (self : M.Val (mut_ref ltac:(Self)))
      (from : M.Val (ref erc20.AccountId.t))
      (to : M.Val (ref erc20.AccountId.t))
      (value : M.Val ltac:(erc20.Balance))
      : M (M.Val ltac:(erc20.Result unit)) :=
    M.function_body
      (let* from_balance : ltac:(refine (M.Val u128.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref from in
        let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow α2 in
        erc20.Erc20.t::["balance_of_impl"] α1 α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val bool.t)) := BinOp.lt from_balance value in
        let* α1 : ltac:(refine (M.Val bool.t)) := use α0 in
        let* α2 := M.read α1 in
        if (α2 : bool) then
          let* _ : ltac:(refine (M.Val never.t)) :=
            let* α0 :
                ltac:(refine
                  (M.Val (core.result.Result.t unit erc20.Error.t))) :=
              M.alloc
                (core.result.Result.Err erc20.Error.InsufficientBalance) in
            M.return_ α0 in
          let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 :
            ltac:(refine
              (M.Val (mut_ref (erc20.Mapping.t erc20.AccountId.t u128.t)))) :=
          borrow_mut α0.["balances"] in
        let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref from in
        let* α3 : ltac:(refine (M.Val u128.t)) :=
          BinOp.sub from_balance value in
        (erc20.Mapping.t erc20.AccountId.t u128.t)::["insert"] α1 α2 α3 in
      let* to_balance : ltac:(refine (M.Val u128.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref to in
        let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow α2 in
        erc20.Erc20.t::["balance_of_impl"] α1 α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 :
            ltac:(refine
              (M.Val (mut_ref (erc20.Mapping.t erc20.AccountId.t u128.t)))) :=
          borrow_mut α0.["balances"] in
        let* α2 : ltac:(refine (M.Val erc20.AccountId.t)) := deref to in
        let* α3 : ltac:(refine (M.Val u128.t)) := BinOp.add to_balance value in
        (erc20.Mapping.t erc20.AccountId.t u128.t)::["insert"] α1 α2 α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["env"] α1 in
        let* α3 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α2 in
        let* α4 : ltac:(refine (M.Val erc20.AccountId.t)) := deref from in
        let* α5 := M.read α4 in
        let* α6 : ltac:(refine (M.Val erc20.AccountId.t)) := deref to in
        let* α7 := M.read α6 in
        let* α8 := M.read value in
        let* α9 : ltac:(refine (M.Val erc20.Transfer.t)) :=
          M.alloc
            {|
              erc20.Transfer.from := core.option.Option.Some α5;
              erc20.Transfer.to := core.option.Option.Some α7;
              erc20.Transfer.value := α8;
            |} in
        erc20.Env.t::["emit_event"] α3 α9 in
      M.alloc (core.result.Result.Ok tt)).
  
  Global Instance AssociatedFunction_transfer_from_to :
    Notations.DoubleColon ltac:(Self) "transfer_from_to" := {
    Notations.double_colon := transfer_from_to;
  }.
  
  (*
      fn transfer(&mut self, to: AccountId, value: Balance) -> Result<()> {
          let from = self.env().caller();
          self.transfer_from_to(&from, &to, value)
      }
  *)
  Definition transfer
      (self : M.Val (mut_ref ltac:(Self)))
      (to : M.Val erc20.AccountId.t)
      (value : M.Val ltac:(erc20.Balance))
      : M (M.Val ltac:(erc20.Result unit)) :=
    M.function_body
      (let* from : ltac:(refine (M.Val erc20.AccountId.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["env"] α1 in
        let* α3 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α2 in
        erc20.Env.t::["caller"] α3 in
      let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
      let* α1 : ltac:(refine (M.Val (mut_ref erc20.Erc20.t))) :=
        borrow_mut α0 in
      let* α2 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow from in
      let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow to in
      erc20.Erc20.t::["transfer_from_to"] α1 α2 α3 value).
  
  Global Instance AssociatedFunction_transfer :
    Notations.DoubleColon ltac:(Self) "transfer" := {
    Notations.double_colon := transfer;
  }.
  
  (*
      fn approve(&mut self, spender: AccountId, value: Balance) -> Result<()> {
          let owner = self.env().caller();
          self.allowances.insert((owner, spender), value);
          self.env().emit_event(Approval {
              owner,
              spender,
              value,
          });
          Ok(())
      }
  *)
  Definition approve
      (self : M.Val (mut_ref ltac:(Self)))
      (spender : M.Val erc20.AccountId.t)
      (value : M.Val ltac:(erc20.Balance))
      : M (M.Val ltac:(erc20.Result unit)) :=
    M.function_body
      (let* owner : ltac:(refine (M.Val erc20.AccountId.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["env"] α1 in
        let* α3 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α2 in
        erc20.Env.t::["caller"] α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 :
            ltac:(refine
              (M.Val
                (mut_ref
                  (erc20.Mapping.t
                    (erc20.AccountId.t * erc20.AccountId.t)
                    u128.t)))) :=
          borrow_mut α0.["allowances"] in
        let* α2 := M.read owner in
        let* α3 := M.read spender in
        let* α4 :
            ltac:(refine (M.Val (erc20.AccountId.t * erc20.AccountId.t))) :=
          M.alloc (α2, α3) in
        (erc20.Mapping.t
              (erc20.AccountId.t * erc20.AccountId.t)
              u128.t)::["insert"]
          α1
          α4
          value in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["env"] α1 in
        let* α3 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α2 in
        let* α4 := M.read owner in
        let* α5 := M.read spender in
        let* α6 := M.read value in
        let* α7 : ltac:(refine (M.Val erc20.Approval.t)) :=
          M.alloc
            {|
              erc20.Approval.owner := α4;
              erc20.Approval.spender := α5;
              erc20.Approval.value := α6;
            |} in
        erc20.Env.t::["emit_event"] α3 α7 in
      M.alloc (core.result.Result.Ok tt)).
  
  Global Instance AssociatedFunction_approve :
    Notations.DoubleColon ltac:(Self) "approve" := {
    Notations.double_colon := approve;
  }.
  
  (*
      fn transfer_from(&mut self, from: AccountId, to: AccountId, value: Balance) -> Result<()> {
          let caller = self.env().caller();
          let allowance = self.allowance_impl(&from, &caller);
          if allowance < value {
              return Err(Error::InsufficientAllowance);
          }
          self.transfer_from_to(&from, &to, value)?;
          self.allowances.insert((from, caller), allowance - value);
          Ok(())
      }
  *)
  Definition transfer_from
      (self : M.Val (mut_ref ltac:(Self)))
      (from : M.Val erc20.AccountId.t)
      (to : M.Val erc20.AccountId.t)
      (value : M.Val ltac:(erc20.Balance))
      : M (M.Val ltac:(erc20.Result unit)) :=
    M.function_body
      (let* caller : ltac:(refine (M.Val erc20.AccountId.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val erc20.Env.t)) :=
          erc20.Erc20.t::["env"] α1 in
        let* α3 : ltac:(refine (M.Val (ref erc20.Env.t))) := borrow α2 in
        erc20.Env.t::["caller"] α3 in
      let* allowance : ltac:(refine (M.Val u128.t)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (ref erc20.Erc20.t))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref erc20.AccountId.t))) :=
          borrow from in
        let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) :=
          borrow caller in
        erc20.Erc20.t::["allowance_impl"] α1 α2 α3 in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val bool.t)) := BinOp.lt allowance value in
        let* α1 : ltac:(refine (M.Val bool.t)) := use α0 in
        let* α2 := M.read α1 in
        if (α2 : bool) then
          let* _ : ltac:(refine (M.Val never.t)) :=
            let* α0 :
                ltac:(refine
                  (M.Val (core.result.Result.t unit erc20.Error.t))) :=
              M.alloc
                (core.result.Result.Err erc20.Error.InsufficientAllowance) in
            M.return_ α0 in
          let* α0 : ltac:(refine (M.Val unit)) := M.alloc tt in
          never_to_any α0
        else
          M.alloc tt in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 : ltac:(refine (M.Val (mut_ref erc20.Erc20.t))) :=
          borrow_mut α0 in
        let* α2 : ltac:(refine (M.Val (ref erc20.AccountId.t))) :=
          borrow from in
        let* α3 : ltac:(refine (M.Val (ref erc20.AccountId.t))) := borrow to in
        let* α4 :
            ltac:(refine (M.Val (core.result.Result.t unit erc20.Error.t))) :=
          erc20.Erc20.t::["transfer_from_to"] α1 α2 α3 value in
        let* α5 :
            ltac:(refine
              (M.Val
                (core.ops.control_flow.ControlFlow.t
                  (core.result.Result.t core.convert.Infallible.t erc20.Error.t)
                  unit))) :=
          (core.ops.try_trait.Try.branch
              (Self := core.result.Result.t unit erc20.Error.t)
              (Trait := ltac:(refine _)))
            α4 in
        let* α6 := M.read α5 in
        match α6 with
        | core.ops.control_flow.ControlFlow.Break residual =>
          let* residual := M.alloc residual in
          let* α0 :
              ltac:(refine (M.Val (core.result.Result.t unit erc20.Error.t))) :=
            (core.ops.try_trait.FromResidual.from_residual
                (Self := core.result.Result.t unit erc20.Error.t)
                (Trait := ltac:(refine _)))
              residual in
          let* α1 : ltac:(refine (M.Val never.t)) := M.return_ α0 in
          never_to_any α1
        | core.ops.control_flow.ControlFlow.Continue val =>
          let* val := M.alloc val in
          M.pure val
        end in
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val erc20.Erc20.t)) := deref self in
        let* α1 :
            ltac:(refine
              (M.Val
                (mut_ref
                  (erc20.Mapping.t
                    (erc20.AccountId.t * erc20.AccountId.t)
                    u128.t)))) :=
          borrow_mut α0.["allowances"] in
        let* α2 := M.read from in
        let* α3 := M.read caller in
        let* α4 :
            ltac:(refine (M.Val (erc20.AccountId.t * erc20.AccountId.t))) :=
          M.alloc (α2, α3) in
        let* α5 : ltac:(refine (M.Val u128.t)) := BinOp.sub allowance value in
        (erc20.Mapping.t
              (erc20.AccountId.t * erc20.AccountId.t)
              u128.t)::["insert"]
          α1
          α4
          α5 in
      M.alloc (core.result.Result.Ok tt)).
  
  Global Instance AssociatedFunction_transfer_from :
    Notations.DoubleColon ltac:(Self) "transfer_from" := {
    Notations.double_colon := transfer_from;
  }.
End Impl_erc20_Erc20_t_2.
End Impl_erc20_Erc20_t_2.
