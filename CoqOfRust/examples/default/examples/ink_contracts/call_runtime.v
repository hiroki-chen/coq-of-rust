(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

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

Module  Impl_core_default_Default_for_call_runtime_AccountId_t.
Section Impl_core_default_Default_for_call_runtime_AccountId_t.
  Definition Self : Set := call_runtime.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M call_runtime.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (call_runtime.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_call_runtime_AccountId_t.
End Impl_core_default_Default_for_call_runtime_AccountId_t.

Module  Impl_core_clone_Clone_for_call_runtime_AccountId_t.
Section Impl_core_clone_Clone_for_call_runtime_AccountId_t.
  Definition Self : Set := call_runtime.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M call_runtime.AccountId.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let _ : unit := tt in
    let* α0 : ref call_runtime.AccountId.t := M.read self in
    M.read (deref α0).
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_call_runtime_AccountId_t.
End Impl_core_clone_Clone_for_call_runtime_AccountId_t.

Module  Impl_core_marker_Copy_for_call_runtime_AccountId_t.
Section Impl_core_marker_Copy_for_call_runtime_AccountId_t.
  Definition Self : Set := call_runtime.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_call_runtime_AccountId_t.
End Impl_core_marker_Copy_for_call_runtime_AccountId_t.

Ltac Balance := exact u128.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : call_runtime.AccountId.t;
  }.
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map (fun x => x.(caller)) (fun v x => x <| caller := v |>);
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (x : M.Val t) := x.["caller"];
  }.
End Env.
End Env.

Module MultiAddress.
  Inductive t (AccountId : Set) (AccountIndex : Set) : Set :=
  .
End MultiAddress.

Module  Impl_core_convert_From_call_runtime_AccountId_t_for_call_runtime_MultiAddress_t_call_runtime_AccountId_t_Tuple_.
Section Impl_core_convert_From_call_runtime_AccountId_t_for_call_runtime_MultiAddress_t_call_runtime_AccountId_t_Tuple_.
  Definition Self : Set :=
    call_runtime.MultiAddress.t call_runtime.AccountId.t unit.
  
  (*
      fn from(_value: AccountId) -> Self {
          unimplemented!()
      }
  *)
  Definition from (_value : call_runtime.AccountId.t) : M Self :=
    let* _value : M.Val call_runtime.AccountId.t := M.alloc _value in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ :
    core.convert.From.Trait Self (T := call_runtime.AccountId.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_call_runtime_AccountId_t_for_call_runtime_MultiAddress_t_call_runtime_AccountId_t_Tuple_.
End Impl_core_convert_From_call_runtime_AccountId_t_for_call_runtime_MultiAddress_t_call_runtime_AccountId_t_Tuple_.

Module BalancesCall.
  Module Transfer.
    Unset Primitive Projections.
    Record t : Set := {
      dest : call_runtime.MultiAddress.t call_runtime.AccountId.t unit;
      value : u128.t;
    }.
    Global Set Primitive Projections.
  End Transfer.
  
  Inductive t : Set :=
  | Transfer (_ : Transfer.t).
End BalancesCall.

Module RuntimeCall.
  Inductive t : Set :=
  | Balances (_ : call_runtime.BalancesCall.t).
End RuntimeCall.

Module  RuntimeCaller.
Section RuntimeCaller.
  Inductive t : Set := Build.
End RuntimeCaller.
End RuntimeCaller.

Module  Impl_core_default_Default_for_call_runtime_RuntimeCaller_t.
Section Impl_core_default_Default_for_call_runtime_RuntimeCaller_t.
  Definition Self : Set := call_runtime.RuntimeCaller.t.
  
  (*
  Default
  *)
  Definition default : M call_runtime.RuntimeCaller.t :=
    M.pure call_runtime.RuntimeCaller.Build.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_call_runtime_RuntimeCaller_t.
End Impl_core_default_Default_for_call_runtime_RuntimeCaller_t.

Module RuntimeError.
  Inductive t : Set :=
  | CallRuntimeFailed.
End RuntimeError.

Module  Impl_core_fmt_Debug_for_call_runtime_RuntimeError_t.
Section Impl_core_fmt_Debug_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "CallRuntimeFailed") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_call_runtime_RuntimeError_t.
End Impl_core_fmt_Debug_for_call_runtime_RuntimeError_t.

Module  Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError_t.
Section Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError_t.
End Impl_core_marker_StructuralPartialEq_for_call_runtime_RuntimeError_t.

Module  Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError_t.
Section Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref Self)
      (other : ref call_runtime.RuntimeError.t)
      : M bool.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* other : M.Val (ref call_runtime.RuntimeError.t) := M.alloc other in
    M.pure true.
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError_t.
End Impl_core_cmp_PartialEq_for_call_runtime_RuntimeError_t.

Module  Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError_t.
Section Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError_t.
End Impl_core_marker_StructuralEq_for_call_runtime_RuntimeError_t.

Module  Impl_core_cmp_Eq_for_call_runtime_RuntimeError_t.
Section Impl_core_cmp_Eq_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq (self : ref Self) : M unit :=
    let* self : M.Val (ref Self) := M.alloc self in
    M.pure tt.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError_t.
End Impl_core_cmp_Eq_for_call_runtime_RuntimeError_t.

Module EnvError.
  Inductive t : Set :=
  | CallRuntimeFailed
  | AnotherKindOfError.
End EnvError.

Module  Impl_core_convert_From_call_runtime_EnvError_t_for_call_runtime_RuntimeError_t.
Section Impl_core_convert_From_call_runtime_EnvError_t_for_call_runtime_RuntimeError_t.
  Definition Self : Set := call_runtime.RuntimeError.t.
  
  (*
      fn from(e: EnvError) -> Self {
          match e {
              EnvError::CallRuntimeFailed => RuntimeError::CallRuntimeFailed,
              _ => panic!("Unexpected error from `pallet-contracts`."),
          }
      }
  *)
  Definition from (e : call_runtime.EnvError.t) : M Self :=
    let* e : M.Val call_runtime.EnvError.t := M.alloc e in
    let* α0 : call_runtime.EnvError.t := M.read e in
    let* α1 : M.Val call_runtime.RuntimeError.t :=
      match α0 with
      | call_runtime.EnvError.CallRuntimeFailed  =>
        M.alloc call_runtime.RuntimeError.CallRuntimeFailed
      | _ =>
        let* α0 : ref str.t :=
          M.read (mk_str "Unexpected error from `pallet-contracts`.") in
        let* α1 : never.t := M.call (std.panicking.begin_panic α0) in
        let* α2 : call_runtime.RuntimeError.t := never_to_any α1 in
        M.alloc α2
      end in
    M.read α1.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ :
    core.convert.From.Trait Self (T := call_runtime.EnvError.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_call_runtime_EnvError_t_for_call_runtime_RuntimeError_t.
End Impl_core_convert_From_call_runtime_EnvError_t_for_call_runtime_RuntimeError_t.

Module  Impl_call_runtime_Env_t.
Section Impl_call_runtime_Env_t.
  Definition Self : Set := call_runtime.Env.t.
  
  (*
      fn call_runtime<Call>(&self, _call: &Call) -> Result<(), EnvError> {
          unimplemented!()
      }
  *)
  Definition call_runtime
      {Call : Set}
      (self : ref Self)
      (_call : ref Call)
      : M (core.result.Result.t unit call_runtime.EnvError.t) :=
    let* self : M.Val (ref Self) := M.alloc self in
    let* _call : M.Val (ref Call) := M.alloc _call in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_call_runtime {Call : Set} :
    Notations.DoubleColon Self "call_runtime" := {
    Notations.double_colon := call_runtime (Call := Call);
  }.
End Impl_call_runtime_Env_t.
End Impl_call_runtime_Env_t.

Module  Impl_call_runtime_RuntimeCaller_t.
Section Impl_call_runtime_RuntimeCaller_t.
  Definition Self : Set := call_runtime.RuntimeCaller.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M call_runtime.Env.t :=
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (self : ref Self) : M call_runtime.Env.t :=
    let* self : M.Val (ref Self) := M.alloc self in
    M.call call_runtime.RuntimeCaller.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new : M Self :=
    M.call
      (core.default.Default.default
        (Self := call_runtime.RuntimeCaller.t)
        (Trait := ltac:(refine _))).
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn transfer_through_runtime(
          &mut self,
          receiver: AccountId,
          value: Balance,
      ) -> Result<(), RuntimeError> {
          self.env()
              .call_runtime(&RuntimeCall::Balances(BalancesCall::Transfer {
                  dest: receiver.into(),
                  value,
              }))
              .map_err(Into::into)
      }
  *)
  Definition transfer_through_runtime
      (self : mut_ref Self)
      (receiver : call_runtime.AccountId.t)
      (value : ltac:(call_runtime.Balance))
      : M (core.result.Result.t unit call_runtime.RuntimeError.t) :=
    let* self : M.Val (mut_ref Self) := M.alloc self in
    let* receiver : M.Val call_runtime.AccountId.t := M.alloc receiver in
    let* value : M.Val ltac:(call_runtime.Balance) := M.alloc value in
    let* α0 : mut_ref call_runtime.RuntimeCaller.t := M.read self in
    let* α1 : call_runtime.Env.t :=
      M.call (call_runtime.RuntimeCaller.t::["env"] (borrow (deref α0))) in
    let* α2 : M.Val call_runtime.Env.t := M.alloc α1 in
    let* α3 : call_runtime.AccountId.t := M.read receiver in
    let* α4 : call_runtime.MultiAddress.t call_runtime.AccountId.t unit :=
      M.call
        ((core.convert.Into.into
            (Self := call_runtime.AccountId.t)
            (Trait := ltac:(refine _)))
          α3) in
    let* α5 : u128.t := M.read value in
    let* α6 : M.Val call_runtime.RuntimeCall.t :=
      M.alloc
        (call_runtime.RuntimeCall.Balances
          (call_runtime.BalancesCall.Transfer
            {|
            call_runtime.BalancesCall.Transfer.dest := α4;
            call_runtime.BalancesCall.Transfer.value := α5;
          |})) in
    let* α7 : core.result.Result.t unit call_runtime.EnvError.t :=
      M.call (call_runtime.Env.t::["call_runtime"] (borrow α2) (borrow α6)) in
    M.call
      ((core.result.Result.t unit call_runtime.EnvError.t)::["map_err"]
        α7
        (core.convert.Into.into
          (Self := call_runtime.EnvError.t)
          (Trait := ltac:(refine _)))).
  
  Global Instance AssociatedFunction_transfer_through_runtime :
    Notations.DoubleColon Self "transfer_through_runtime" := {
    Notations.double_colon := transfer_through_runtime;
  }.
  
  (*
      pub fn call_nonexistent_extrinsic(&mut self) -> Result<(), RuntimeError> {
          self.env().call_runtime(&()).map_err(Into::into)
      }
  *)
  Definition call_nonexistent_extrinsic
      (self : mut_ref Self)
      : M (core.result.Result.t unit call_runtime.RuntimeError.t) :=
    let* self : M.Val (mut_ref Self) := M.alloc self in
    let* α0 : mut_ref call_runtime.RuntimeCaller.t := M.read self in
    let* α1 : call_runtime.Env.t :=
      M.call (call_runtime.RuntimeCaller.t::["env"] (borrow (deref α0))) in
    let* α2 : M.Val call_runtime.Env.t := M.alloc α1 in
    let* α3 : M.Val unit := M.alloc tt in
    let* α4 : core.result.Result.t unit call_runtime.EnvError.t :=
      M.call (call_runtime.Env.t::["call_runtime"] (borrow α2) (borrow α3)) in
    M.call
      ((core.result.Result.t unit call_runtime.EnvError.t)::["map_err"]
        α4
        (core.convert.Into.into
          (Self := call_runtime.EnvError.t)
          (Trait := ltac:(refine _)))).
  
  Global Instance AssociatedFunction_call_nonexistent_extrinsic :
    Notations.DoubleColon Self "call_nonexistent_extrinsic" := {
    Notations.double_colon := call_nonexistent_extrinsic;
  }.
End Impl_call_runtime_RuntimeCaller_t.
End Impl_call_runtime_RuntimeCaller_t.
