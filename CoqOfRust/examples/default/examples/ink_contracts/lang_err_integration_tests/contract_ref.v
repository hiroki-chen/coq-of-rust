(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

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

Module  Impl_core_default_Default_for_contract_ref_AccountId_t.
Section Impl_core_default_Default_for_contract_ref_AccountId_t.
  Definition Self : Set := contract_ref.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M contract_ref.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (contract_ref.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_contract_ref_AccountId_t.
End Impl_core_default_Default_for_contract_ref_AccountId_t.

Module  Impl_core_clone_Clone_for_contract_ref_AccountId_t.
Section Impl_core_clone_Clone_for_contract_ref_AccountId_t.
  Definition Self : Set := contract_ref.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M contract_ref.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : M.Val contract_ref.AccountId.t :=
      match_operator
        tt
        [
          fun α =>
            match α with
            | _ =>
              let* α0 : ref contract_ref.AccountId.t := M.read self in
              M.pure (deref α0)
            end :
            M (M.Val contract_ref.AccountId.t)
        ] in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_contract_ref_AccountId_t.
End Impl_core_clone_Clone_for_contract_ref_AccountId_t.

Module  Impl_core_marker_Copy_for_contract_ref_AccountId_t.
Section Impl_core_marker_Copy_for_contract_ref_AccountId_t.
  Definition Self : Set := contract_ref.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_contract_ref_AccountId_t.
End Impl_core_marker_Copy_for_contract_ref_AccountId_t.

Ltac Balance := exact u128.t.

Ltac Hash := exact (array u8.t).

Module  Env.
Section Env.
  Record t : Set := {
    caller : contract_ref.AccountId.t;
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

Module  FlipperRef.
Section FlipperRef.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>));
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (α : M.Val t) := α.["value"];
  }.
End FlipperRef.
End FlipperRef.

Module  FlipperError.
Section FlipperError.
  Inductive t : Set := Build.
End FlipperError.
End FlipperError.

Module  Impl_core_fmt_Debug_for_contract_ref_FlipperError_t.
Section Impl_core_fmt_Debug_for_contract_ref_FlipperError_t.
  Definition Self : Set := contract_ref.FlipperError.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref Self)
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self := M.alloc self in
    let* f := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "FlipperError") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt : Notations.DoubleColon Self "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_contract_ref_FlipperError_t.
End Impl_core_fmt_Debug_for_contract_ref_FlipperError_t.

Module  Impl_contract_ref_FlipperRef_t.
Section Impl_contract_ref_FlipperRef_t.
  Definition Self : Set := contract_ref.FlipperRef.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M contract_ref.Env.t :=
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
  Definition env (self : ref Self) : M contract_ref.Env.t :=
    let* self := M.alloc self in
    M.call contract_ref.FlipperRef.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : bool.t) : M Self :=
    let* init_value := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    M.pure {| contract_ref.FlipperRef.value := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default : M Self :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.call (contract_ref.FlipperRef.t::["new"] α0).
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon Self "new_default" := {
    Notations.double_colon := new_default;
  }.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Definition try_new
      (succeed : bool.t)
      : M (core.result.Result.t Self contract_ref.FlipperError.t) :=
    let* succeed := M.alloc succeed in
    let* α0 : bool.t := M.read (use succeed) in
    let* α1 :
        M.Val
          (core.result.Result.t
            contract_ref.FlipperRef.t
            contract_ref.FlipperError.t) :=
      if α0 then
        let* α0 : contract_ref.FlipperRef.t :=
          M.call (contract_ref.FlipperRef.t::["new"] true) in
        M.alloc (core.result.Result.Ok α0)
      else
        M.alloc (core.result.Result.Err contract_ref.FlipperError.Build) in
    M.read α1.
  
  Global Instance AssociatedFunction_try_new :
    Notations.DoubleColon Self "try_new" := {
    Notations.double_colon := try_new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref contract_ref.FlipperRef.t := M.read self in
      let* α1 : mut_ref contract_ref.FlipperRef.t := M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : ref contract_ref.FlipperRef.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
End Impl_contract_ref_FlipperRef_t.
End Impl_contract_ref_FlipperRef_t.

Module  ContractRef.
Section ContractRef.
  Record t : Set := {
    flipper : contract_ref.FlipperRef.t;
  }.
  
  Global Instance Get_flipper : Notations.Dot "flipper" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(flipper))
        (fun β α => Some (α <| flipper := β |>));
  }.
  Global Instance Get_AF_flipper : Notations.DoubleColon t "flipper" := {
    Notations.double_colon (α : M.Val t) := α.["flipper"];
  }.
End ContractRef.
End ContractRef.

Module  Impl_contract_ref_ContractRef_t.
Section Impl_contract_ref_ContractRef_t.
  Definition Self : Set := contract_ref.ContractRef.t.
  
  (*
      pub fn new(version: u32, flipper_code_hash: Hash) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::new_default();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate();
  
          Self { flipper }
      }
  *)
  Definition new
      (version : u32.t)
      (flipper_code_hash : ltac:(contract_ref.Hash))
      : M Self :=
    let* version := M.alloc version in
    let* flipper_code_hash := M.alloc flipper_code_hash in
    let* salt : M.Val (array u8.t) :=
      let* α0 : u32.t := M.read version in
      let* α1 : array u8.t := M.call (u32.t::["to_le_bytes"] α0) in
      M.alloc α1 in
    let* flipper : M.Val contract_ref.FlipperRef.t :=
      let* α0 : contract_ref.FlipperRef.t :=
        M.call contract_ref.FlipperRef.t::["new_default"] in
      M.alloc α0 in
    let* α0 : contract_ref.FlipperRef.t := M.read flipper in
    let* α0 : M.Val contract_ref.ContractRef.t :=
      M.alloc {| contract_ref.ContractRef.flipper := α0; |} in
    M.read α0.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn try_new(version: u32, flipper_code_hash: Hash, succeed: bool) -> Self {
          let salt = version.to_le_bytes();
          let flipper = FlipperRef::try_new(succeed).unwrap();
          // .endowment(0)
          // .code_hash(flipper_code_hash)
          // .salt_bytes(salt)
          // .instantiate()
          // .unwrap_or_else(|error| {
          //     panic!(
          //         "Received an error from the Flipper constructor while instantiating \
          //              Flipper {error:?}"
          //     )
          // });
  
          Self { flipper }
      }
  *)
  Definition try_new
      (version : u32.t)
      (flipper_code_hash : ltac:(contract_ref.Hash))
      (succeed : bool.t)
      : M Self :=
    let* version := M.alloc version in
    let* flipper_code_hash := M.alloc flipper_code_hash in
    let* succeed := M.alloc succeed in
    let* salt : M.Val (array u8.t) :=
      let* α0 : u32.t := M.read version in
      let* α1 : array u8.t := M.call (u32.t::["to_le_bytes"] α0) in
      M.alloc α1 in
    let* flipper : M.Val contract_ref.FlipperRef.t :=
      let* α0 : bool.t := M.read succeed in
      let* α1 :
          core.result.Result.t
            contract_ref.FlipperRef.t
            contract_ref.FlipperError.t :=
        M.call (contract_ref.FlipperRef.t::["try_new"] α0) in
      let* α2 : contract_ref.FlipperRef.t :=
        M.call
          ((core.result.Result.t
                contract_ref.FlipperRef.t
                contract_ref.FlipperError.t)::["unwrap"]
            α1) in
      M.alloc α2 in
    let* α0 : contract_ref.FlipperRef.t := M.read flipper in
    let* α0 : M.Val contract_ref.ContractRef.t :=
      M.alloc {| contract_ref.ContractRef.flipper := α0; |} in
    M.read α0.
  
  Global Instance AssociatedFunction_try_new :
    Notations.DoubleColon Self "try_new" := {
    Notations.double_colon := try_new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.flipper.flip();
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref contract_ref.ContractRef.t := M.read self in
      let* α1 : unit :=
        M.call
          (contract_ref.FlipperRef.t::["flip"]
            (borrow_mut (deref α0).["flipper"])) in
      M.alloc α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&mut self) -> bool {
          self.flipper.get()
      }
  *)
  Definition get (self : mut_ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : mut_ref contract_ref.ContractRef.t := M.read self in
    M.call (contract_ref.FlipperRef.t::["get"] (borrow (deref α0).["flipper"])).
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
End Impl_contract_ref_ContractRef_t.
End Impl_contract_ref_ContractRef_t.
