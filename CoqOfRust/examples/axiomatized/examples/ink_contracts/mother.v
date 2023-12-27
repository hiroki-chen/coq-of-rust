(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Mapping.
Section Mapping.
  Context (K V : Set).
  
  Record t : Set := {
    _key : core.marker.PhantomData.t K;
    _value : core.marker.PhantomData.t V;
  }.
  
  Global Instance Get__key : Notations.Dot "_key" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(_key)) (fun β α => Some (α <| _key := β |>));
  }.
  Global Instance Get_AF__key : Notations.DoubleColon t "_key" := {
    Notations.double_colon (α : M.Val t) := α.["_key"];
  }.
  Global Instance Get__value : Notations.Dot "_value" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(_value))
        (fun β α => Some (α <| _value := β |>));
  }.
  Global Instance Get_AF__value : Notations.DoubleColon t "_value" := {
    Notations.double_colon (α : M.Val t) := α.["_value"];
  }.
End Mapping.
End Mapping.

Module  Impl_core_default_Default_for_mother_Mapping_t_K_V.
Section Impl_core_default_Default_for_mother_Mapping_t_K_V.
  Context {K V : Set}.
  
  Context
    {ℋ_0 : core.default.Default.Trait K}
    {ℋ_1 : core.default.Default.Trait V}.
  
  Definition Self : Set := mother.Mapping.t K V.
  
  (*
  Default
  *)
  Parameter default : M (mother.Mapping.t K V).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mother_Mapping_t_K_V.
End Impl_core_default_Default_for_mother_Mapping_t_K_V.

Module  Impl_mother_Mapping_t_K_V.
Section Impl_mother_Mapping_t_K_V.
  Context {K V : Set}.
  
  Definition Self : Set := mother.Mapping.t K V.
  
  (*
      fn get(&self, _key: &K) -> Option<V> {
          unimplemented!()
      }
  *)
  Parameter get : (ref Self) -> (ref K) -> M (core.option.Option.t V).
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn insert(&mut self, _key: K, _value: V) {
          unimplemented!()
      }
  *)
  Parameter insert : (mut_ref Self) -> K -> V -> M unit.
  
  Global Instance AssociatedFunction_insert :
    Notations.DoubleColon Self "insert" := {
    Notations.double_colon := insert;
  }.
End Impl_mother_Mapping_t_K_V.
End Impl_mother_Mapping_t_K_V.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>));
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_mother_AccountId_t.
Section Impl_core_default_Default_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  (*
  Default
  *)
  Parameter default : M mother.AccountId.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mother_AccountId_t.
End Impl_core_default_Default_for_mother_AccountId_t.

Module  Impl_core_clone_Clone_for_mother_AccountId_t.
Section Impl_core_clone_Clone_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mother.AccountId.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mother_AccountId_t.
End Impl_core_clone_Clone_for_mother_AccountId_t.

Module  Impl_core_marker_Copy_for_mother_AccountId_t.
Section Impl_core_marker_Copy_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_mother_AccountId_t.
End Impl_core_marker_Copy_for_mother_AccountId_t.

Module  Impl_core_marker_StructuralPartialEq_for_mother_AccountId_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_AccountId_t.
End Impl_core_marker_StructuralPartialEq_for_mother_AccountId_t.

Module  Impl_core_cmp_PartialEq_for_mother_AccountId_t.
Section Impl_core_cmp_PartialEq_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.AccountId.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_AccountId_t.
End Impl_core_cmp_PartialEq_for_mother_AccountId_t.

Module  Impl_core_marker_StructuralEq_for_mother_AccountId_t.
Section Impl_core_marker_StructuralEq_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_AccountId_t.
End Impl_core_marker_StructuralEq_for_mother_AccountId_t.

Module  Impl_core_cmp_Eq_for_mother_AccountId_t.
Section Impl_core_cmp_Eq_for_mother_AccountId_t.
  Definition Self : Set := mother.AccountId.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_AccountId_t.
End Impl_core_cmp_Eq_for_mother_AccountId_t.

Ltac Balance := exact u128.t.

Ltac BlockNumber := exact u32.t.

Ltac Hash := exact (array u8.t).

Module  Env.
Section Env.
  Record t : Set := {
    caller : mother.AccountId.t;
  }.
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(caller))
        (fun β α => Some (α <| caller := β |>));
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (α : M.Val t) := α.["caller"];
  }.
End Env.
End Env.

Module  Bids.
Section Bids.
  Record t : Set := {
    x0 :
      alloc.vec.Vec.t
        (alloc.vec.Vec.t
          (core.option.Option.t (mother.AccountId.t * ltac:(mother.Balance)))
          alloc.vec.Vec.Default.A)
        alloc.vec.Vec.Default.A;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>));
  }.
End Bids.
End Bids.

Module  Impl_core_default_Default_for_mother_Bids_t.
Section Impl_core_default_Default_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  (*
  Default
  *)
  Parameter default : M mother.Bids.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mother_Bids_t.
End Impl_core_default_Default_for_mother_Bids_t.

Module  Impl_core_marker_StructuralPartialEq_for_mother_Bids_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_Bids_t.
End Impl_core_marker_StructuralPartialEq_for_mother_Bids_t.

Module  Impl_core_cmp_PartialEq_for_mother_Bids_t.
Section Impl_core_cmp_PartialEq_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.Bids.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_Bids_t.
End Impl_core_cmp_PartialEq_for_mother_Bids_t.

Module  Impl_core_marker_StructuralEq_for_mother_Bids_t.
Section Impl_core_marker_StructuralEq_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_Bids_t.
End Impl_core_marker_StructuralEq_for_mother_Bids_t.

Module  Impl_core_cmp_Eq_for_mother_Bids_t.
Section Impl_core_cmp_Eq_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_Bids_t.
End Impl_core_cmp_Eq_for_mother_Bids_t.

Module  Impl_core_clone_Clone_for_mother_Bids_t.
Section Impl_core_clone_Clone_for_mother_Bids_t.
  Definition Self : Set := mother.Bids.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mother.Bids.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mother_Bids_t.
End Impl_core_clone_Clone_for_mother_Bids_t.

Module Outline.
  Inductive t : Set :=
  | NoWinner
  | WinnerDetected
  | PayoutCompleted.
End Outline.

Module  Impl_core_marker_StructuralPartialEq_for_mother_Outline_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_Outline_t.
  Definition Self : Set := mother.Outline.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_Outline_t.
End Impl_core_marker_StructuralPartialEq_for_mother_Outline_t.

Module  Impl_core_cmp_PartialEq_for_mother_Outline_t.
Section Impl_core_cmp_PartialEq_for_mother_Outline_t.
  Definition Self : Set := mother.Outline.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.Outline.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_Outline_t.
End Impl_core_cmp_PartialEq_for_mother_Outline_t.

Module  Impl_core_marker_StructuralEq_for_mother_Outline_t.
Section Impl_core_marker_StructuralEq_for_mother_Outline_t.
  Definition Self : Set := mother.Outline.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_Outline_t.
End Impl_core_marker_StructuralEq_for_mother_Outline_t.

Module  Impl_core_cmp_Eq_for_mother_Outline_t.
Section Impl_core_cmp_Eq_for_mother_Outline_t.
  Definition Self : Set := mother.Outline.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_Outline_t.
End Impl_core_cmp_Eq_for_mother_Outline_t.

Module  Impl_core_clone_Clone_for_mother_Outline_t.
Section Impl_core_clone_Clone_for_mother_Outline_t.
  Definition Self : Set := mother.Outline.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mother.Outline.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mother_Outline_t.
End Impl_core_clone_Clone_for_mother_Outline_t.

Module Status.
  Inductive t : Set :=
  | NotStarted
  | OpeningPeriod
  | EndingPeriod (_ : ltac:(mother.BlockNumber))
  | Ended (_ : mother.Outline.t)
  | RfDelay (_ : ltac:(mother.BlockNumber)).
  
  Global Instance Get_EndingPeriod_0 : Notations.Dot "EndingPeriod.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | EndingPeriod α0 => Some α0 | _ => None end)
        (fun β α =>
          match α with
          | EndingPeriod _ => Some (EndingPeriod β)
          | _ => None
          end);
  }.
  
  Global Instance Get_Ended_0 : Notations.Dot "Ended.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | Ended α0 => Some α0 | _ => None end)
        (fun β α => match α with | Ended _ => Some (Ended β) | _ => None end);
  }.
  
  Global Instance Get_RfDelay_0 : Notations.Dot "RfDelay.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | RfDelay α0 => Some α0 | _ => None end)
        (fun β α =>
          match α with | RfDelay _ => Some (RfDelay β) | _ => None end);
  }.
End Status.

Module  Impl_core_marker_StructuralPartialEq_for_mother_Status_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_Status_t.
  Definition Self : Set := mother.Status.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_Status_t.
End Impl_core_marker_StructuralPartialEq_for_mother_Status_t.

Module  Impl_core_cmp_PartialEq_for_mother_Status_t.
Section Impl_core_cmp_PartialEq_for_mother_Status_t.
  Definition Self : Set := mother.Status.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.Status.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_Status_t.
End Impl_core_cmp_PartialEq_for_mother_Status_t.

Module  Impl_core_marker_StructuralEq_for_mother_Status_t.
Section Impl_core_marker_StructuralEq_for_mother_Status_t.
  Definition Self : Set := mother.Status.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_Status_t.
End Impl_core_marker_StructuralEq_for_mother_Status_t.

Module  Impl_core_cmp_Eq_for_mother_Status_t.
Section Impl_core_cmp_Eq_for_mother_Status_t.
  Definition Self : Set := mother.Status.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_Status_t.
End Impl_core_cmp_Eq_for_mother_Status_t.

Module  Impl_core_clone_Clone_for_mother_Status_t.
Section Impl_core_clone_Clone_for_mother_Status_t.
  Definition Self : Set := mother.Status.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mother.Status.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mother_Status_t.
End Impl_core_clone_Clone_for_mother_Status_t.

Module  Auction.
Section Auction.
  Record t : Set := {
    name : alloc.string.String.t;
    subject : ltac:(mother.Hash);
    bids : mother.Bids.t;
    terms : array ltac:(mother.BlockNumber);
    status : mother.Status.t;
    finalized : bool.t;
    vector : alloc.vec.Vec.t u8.t alloc.vec.Vec.Default.A;
  }.
  
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(name)) (fun β α => Some (α <| name := β |>));
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (α : M.Val t) := α.["name"];
  }.
  Global Instance Get_subject : Notations.Dot "subject" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(subject))
        (fun β α => Some (α <| subject := β |>));
  }.
  Global Instance Get_AF_subject : Notations.DoubleColon t "subject" := {
    Notations.double_colon (α : M.Val t) := α.["subject"];
  }.
  Global Instance Get_bids : Notations.Dot "bids" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(bids)) (fun β α => Some (α <| bids := β |>));
  }.
  Global Instance Get_AF_bids : Notations.DoubleColon t "bids" := {
    Notations.double_colon (α : M.Val t) := α.["bids"];
  }.
  Global Instance Get_terms : Notations.Dot "terms" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(terms)) (fun β α => Some (α <| terms := β |>));
  }.
  Global Instance Get_AF_terms : Notations.DoubleColon t "terms" := {
    Notations.double_colon (α : M.Val t) := α.["terms"];
  }.
  Global Instance Get_status : Notations.Dot "status" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(status))
        (fun β α => Some (α <| status := β |>));
  }.
  Global Instance Get_AF_status : Notations.DoubleColon t "status" := {
    Notations.double_colon (α : M.Val t) := α.["status"];
  }.
  Global Instance Get_finalized : Notations.Dot "finalized" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(finalized))
        (fun β α => Some (α <| finalized := β |>));
  }.
  Global Instance Get_AF_finalized : Notations.DoubleColon t "finalized" := {
    Notations.double_colon (α : M.Val t) := α.["finalized"];
  }.
  Global Instance Get_vector : Notations.Dot "vector" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(vector))
        (fun β α => Some (α <| vector := β |>));
  }.
  Global Instance Get_AF_vector : Notations.DoubleColon t "vector" := {
    Notations.double_colon (α : M.Val t) := α.["vector"];
  }.
End Auction.
End Auction.

Module  Impl_core_marker_StructuralPartialEq_for_mother_Auction_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_Auction_t.
End Impl_core_marker_StructuralPartialEq_for_mother_Auction_t.

Module  Impl_core_cmp_PartialEq_for_mother_Auction_t.
Section Impl_core_cmp_PartialEq_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.Auction.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_Auction_t.
End Impl_core_cmp_PartialEq_for_mother_Auction_t.

Module  Impl_core_marker_StructuralEq_for_mother_Auction_t.
Section Impl_core_marker_StructuralEq_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_Auction_t.
End Impl_core_marker_StructuralEq_for_mother_Auction_t.

Module  Impl_core_cmp_Eq_for_mother_Auction_t.
Section Impl_core_cmp_Eq_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_Auction_t.
End Impl_core_cmp_Eq_for_mother_Auction_t.

Module  Impl_core_clone_Clone_for_mother_Auction_t.
Section Impl_core_clone_Clone_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  (*
  Clone
  *)
  Parameter clone : (ref Self) -> M mother.Auction.t.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_mother_Auction_t.
End Impl_core_clone_Clone_for_mother_Auction_t.

Module  Impl_core_default_Default_for_mother_Auction_t.
Section Impl_core_default_Default_for_mother_Auction_t.
  Definition Self : Set := mother.Auction.t.
  
  (*
      fn default() -> Auction {
          Auction {
              name: String::default(),
              subject: Hash::default(),
              bids: Bids::default(),
              terms: <[BlockNumber; 3]>::default(),
              status: Status::OpeningPeriod,
              finalized: false,
              vector: <Vec<u8>>::default(),
          }
      }
  *)
  Parameter default : M mother.Auction.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mother_Auction_t.
End Impl_core_default_Default_for_mother_Auction_t.

Module Failure.
  Inductive t : Set :=
  | Revert (_ : alloc.string.String.t)
  | Panic.
  
  Global Instance Get_Revert_0 : Notations.Dot "Revert.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | Revert α0 => Some α0 | _ => None end)
        (fun β α => match α with | Revert _ => Some (Revert β) | _ => None end);
  }.
End Failure.

Module  Impl_core_marker_StructuralPartialEq_for_mother_Failure_t.
Section Impl_core_marker_StructuralPartialEq_for_mother_Failure_t.
  Definition Self : Set := mother.Failure.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_mother_Failure_t.
End Impl_core_marker_StructuralPartialEq_for_mother_Failure_t.

Module  Impl_core_cmp_PartialEq_for_mother_Failure_t.
Section Impl_core_cmp_PartialEq_for_mother_Failure_t.
  Definition Self : Set := mother.Failure.t.
  
  (*
  PartialEq
  *)
  Parameter eq : (ref Self) -> (ref mother.Failure.t) -> M bool.t.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_mother_Failure_t.
End Impl_core_cmp_PartialEq_for_mother_Failure_t.

Module  Impl_core_marker_StructuralEq_for_mother_Failure_t.
Section Impl_core_marker_StructuralEq_for_mother_Failure_t.
  Definition Self : Set := mother.Failure.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_mother_Failure_t.
End Impl_core_marker_StructuralEq_for_mother_Failure_t.

Module  Impl_core_cmp_Eq_for_mother_Failure_t.
Section Impl_core_cmp_Eq_for_mother_Failure_t.
  Definition Self : Set := mother.Failure.t.
  
  (*
  Eq
  *)
  Parameter assert_receiver_is_total_eq : (ref Self) -> M unit.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_mother_Failure_t.
End Impl_core_cmp_Eq_for_mother_Failure_t.

Module  AuctionEchoed.
Section AuctionEchoed.
  Record t : Set := {
    auction : mother.Auction.t;
  }.
  
  Global Instance Get_auction : Notations.Dot "auction" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(auction))
        (fun β α => Some (α <| auction := β |>));
  }.
  Global Instance Get_AF_auction : Notations.DoubleColon t "auction" := {
    Notations.double_colon (α : M.Val t) := α.["auction"];
  }.
End AuctionEchoed.
End AuctionEchoed.

Module Event.
  Inductive t : Set :=
  | AuctionEchoed (_ : mother.AuctionEchoed.t).
  
  Global Instance Get_AuctionEchoed_0 : Notations.Dot "AuctionEchoed.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | AuctionEchoed α0 => Some α0 end)
        (fun β α =>
          match α with | AuctionEchoed _ => Some (AuctionEchoed β) end);
  }.
End Event.

Module  Impl_mother_Env_t.
Section Impl_mother_Env_t.
  Definition Self : Set := mother.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Parameter caller : (ref Self) -> M mother.AccountId.t.
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (ref Self) -> mother.Event.t -> M unit.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
End Impl_mother_Env_t.
End Impl_mother_Env_t.

Module  Mother.
Section Mother.
  Record t : Set := {
    auction : mother.Auction.t;
    balances : mother.Mapping.t mother.AccountId.t ltac:(mother.Balance);
  }.
  
  Global Instance Get_auction : Notations.Dot "auction" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(auction))
        (fun β α => Some (α <| auction := β |>));
  }.
  Global Instance Get_AF_auction : Notations.DoubleColon t "auction" := {
    Notations.double_colon (α : M.Val t) := α.["auction"];
  }.
  Global Instance Get_balances : Notations.Dot "balances" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(balances))
        (fun β α => Some (α <| balances := β |>));
  }.
  Global Instance Get_AF_balances : Notations.DoubleColon t "balances" := {
    Notations.double_colon (α : M.Val t) := α.["balances"];
  }.
End Mother.
End Mother.

Module  Impl_core_default_Default_for_mother_Mother_t.
Section Impl_core_default_Default_for_mother_Mother_t.
  Definition Self : Set := mother.Mother.t.
  
  (*
  Default
  *)
  Parameter default : M mother.Mother.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_mother_Mother_t.
End Impl_core_default_Default_for_mother_Mother_t.

Module  Impl_mother_Mother_t.
Section Impl_mother_Mother_t.
  Definition Self : Set := mother.Mother.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : M mother.Env.t.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Parameter env : (ref Self) -> M mother.Env.t.
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new(auction: Auction) -> Self {
          Self {
              balances: Default::default(),
              auction,
          }
      }
  *)
  Parameter new : mother.Auction.t -> M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_default() -> Self {
          Default::default()
      }
  *)
  Parameter new_default : M Self.
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon Self "new_default" := {
    Notations.double_colon := new_default;
  }.
  
  (*
      pub fn failed_new(fail: bool) -> Result<Self, Failure> {
          if fail {
              Err(Failure::Revert("Reverting instantiation".to_string()))
          } else {
              Ok(Default::default())
          }
      }
  *)
  Parameter failed_new :
      bool.t -> M (core.result.Result.t Self mother.Failure.t).
  
  Global Instance AssociatedFunction_failed_new :
    Notations.DoubleColon Self "failed_new" := {
    Notations.double_colon := failed_new;
  }.
  
  (*
      pub fn echo_auction(&mut self, auction: Auction) -> Auction {
          self.env().emit_event(Event::AuctionEchoed(AuctionEchoed {
              auction: auction.clone(),
          }));
          auction
      }
  *)
  Parameter echo_auction :
      (mut_ref Self) -> mother.Auction.t -> M mother.Auction.t.
  
  Global Instance AssociatedFunction_echo_auction :
    Notations.DoubleColon Self "echo_auction" := {
    Notations.double_colon := echo_auction;
  }.
  
  (*
      pub fn revert_or_trap(&mut self, fail: Option<Failure>) -> Result<(), Failure> {
          match fail {
              Some(Failure::Revert(_)) => {
                  Err(Failure::Revert("Reverting on user demand!".to_string()))
              }
              Some(Failure::Panic) => {
                  panic!("Trapping on user demand!")
              }
              None => Ok(()),
          }
      }
  *)
  Parameter revert_or_trap :
      (mut_ref Self) ->
        (core.option.Option.t mother.Failure.t) ->
        M (core.result.Result.t unit mother.Failure.t).
  
  Global Instance AssociatedFunction_revert_or_trap :
    Notations.DoubleColon Self "revert_or_trap" := {
    Notations.double_colon := revert_or_trap;
  }.
  
  (*
      pub fn debug_log(&mut self, _message: String) {
          println!("debug_log: {}", _message);
      }
  *)
  Parameter debug_log : (mut_ref Self) -> alloc.string.String.t -> M unit.
  
  Global Instance AssociatedFunction_debug_log :
    Notations.DoubleColon Self "debug_log" := {
    Notations.double_colon := debug_log;
  }.
End Impl_mother_Mother_t.
End Impl_mother_Mother_t.
