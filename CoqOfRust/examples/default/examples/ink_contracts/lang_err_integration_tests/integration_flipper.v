(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Flipper.
Section Flipper.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun x => x.(value)) (fun v x => x <| value := v |>);
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (x : M.Val t) := x.["value"];
  }.
End Flipper.
End Flipper.

Module  FlipperError.
Section FlipperError.
  Inductive t : Set := Build.
End FlipperError.
End FlipperError.

Module  Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
Section Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
  Ltac Self := exact integration_flipper.FlipperError.t.
  
  (*
  Debug
  *)
  Definition fmt
      (self : ref ltac:(Self))
      (f : mut_ref core.fmt.Formatter.t)
      : M ltac:(core.fmt.Result) :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* f : M.Val (mut_ref core.fmt.Formatter.t) := M.alloc f in
    let* α0 : mut_ref core.fmt.Formatter.t := M.read f in
    let* α1 : ref str.t := M.read (mk_str "FlipperError") in
    M.call (core.fmt.Formatter.t::["write_str"] α0 α1).
  
  Global Instance AssociatedFunction_fmt :
    Notations.DoubleColon ltac:(Self) "fmt" := {
    Notations.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError_t.

Module  Impl_integration_flipper_Flipper_t.
Section Impl_integration_flipper_Flipper_t.
  Ltac Self := exact integration_flipper.Flipper.t.
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (init_value : bool.t) : M ltac:(Self) :=
    let* init_value : M.Val bool.t := M.alloc init_value in
    let* α0 : bool.t := M.read init_value in
    M.pure {| integration_flipper.Flipper.value := α0; |}.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default : M ltac:(Self) :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.call (integration_flipper.Flipper.t::["new"] α0).
  
  Global Instance AssociatedFunction_new_default :
    Notations.DoubleColon ltac:(Self) "new_default" := {
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
      :
        M
          (core.result.Result.t
            ltac:(Self)
            integration_flipper.FlipperError.t) :=
    let* succeed : M.Val bool.t := M.alloc succeed in
    let* α0 : bool.t := M.read succeed in
    let* α1 :
        M.Val
          (core.result.Result.t
            integration_flipper.Flipper.t
            integration_flipper.FlipperError.t) :=
      if (use α0 : bool) then
        let* α0 : integration_flipper.Flipper.t :=
          M.call (integration_flipper.Flipper.t::["new"] true) in
        M.alloc (core.result.Result.Ok α0)
      else
        M.alloc
          (core.result.Result.Err integration_flipper.FlipperError.Build) in
    M.read α1.
  
  Global Instance AssociatedFunction_try_new :
    Notations.DoubleColon ltac:(Self) "try_new" := {
    Notations.double_colon := try_new;
  }.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref integration_flipper.Flipper.t := M.read self in
      let* α1 : mut_ref integration_flipper.Flipper.t := M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon ltac:(Self) "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref ltac:(Self)) : M bool.t :=
    let* self : M.Val (ref ltac:(Self)) := M.alloc self in
    let* α0 : ref integration_flipper.Flipper.t := M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get :
    Notations.DoubleColon ltac:(Self) "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      pub fn err_flip(&mut self) -> Result<(), ()> {
          self.flip();
          Err(())
      }
  *)
  Definition err_flip
      (self : mut_ref ltac:(Self))
      : M (core.result.Result.t unit unit) :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref integration_flipper.Flipper.t := M.read self in
      let* α1 : unit := M.call (integration_flipper.Flipper.t::["flip"] α0) in
      M.alloc α1 in
    let* α0 : M.Val (core.result.Result.t unit unit) :=
      M.alloc (core.result.Result.Err tt) in
    M.read α0.
  
  Global Instance AssociatedFunction_err_flip :
    Notations.DoubleColon ltac:(Self) "err_flip" := {
    Notations.double_colon := err_flip;
  }.
End Impl_integration_flipper_Flipper_t.
End Impl_integration_flipper_Flipper_t.
