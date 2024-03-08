(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Flipper *)

(* Struct FlipperError *)

Module Impl_core_fmt_Debug_for_integration_flipper_FlipperError.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "FlipperError") in
      M.call (Ty.path "core::fmt::Formatter")::["write_str"] [ α0; α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "integration_flipper::FlipperError")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError.

Module Impl_integration_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "integration_flipper::Flipper".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ init_value ] =>
      let* init_value := M.alloc init_value in
      let* α0 := M.read init_value in
      M.pure
        (Value.StructRecord "integration_flipper::Flipper" [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "bool" ] in
      let* α1 := M.call α0 [] in
      M.call (Ty.path "integration_flipper::Flipper")::["new"] [ α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default :
    M.IsAssociatedFunction Self "new_default" new_default [].
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Definition try_new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ succeed ] =>
      let* succeed := M.alloc succeed in
      let* α0 := M.read (use succeed) in
      let* α1 :=
        if α0 then
          let* α0 :=
            M.call (Ty.path "integration_flipper::Flipper")::["new"] [ true ] in
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ α0 ])
        else
          M.alloc
            (Value.StructTuple
              "core::result::Result::Err"
              [ integration_flipper.FlipperError.Build ]) in
      M.read α1
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_new :
    M.IsAssociatedFunction Self "try_new" try_new [].
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.var "integration_flipper::Flipper::Get_value" in
        let* α1 := M.read self in
        let* α2 := M.var "UnOp::not" in
        let* α3 := M.var "integration_flipper::Flipper::Get_value" in
        let* α4 := M.read self in
        let* α5 := M.read (α3 α4) in
        assign (α0 α1) (α2 α5) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip [].
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "integration_flipper::Flipper::Get_value" in
      let* α1 := M.read self in
      M.read (α0 α1)
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get [].
  
  (*
      pub fn err_flip(&mut self) -> Result<(), ()> {
          self.flip();
          Err(())
      }
  *)
  Definition err_flip (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 :=
          M.call (Ty.path "integration_flipper::Flipper")::["flip"] [ α0 ] in
        M.alloc α1 in
      let* α0 :=
        M.alloc (Value.StructTuple "core::result::Result::Err" [ tt ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_err_flip :
    M.IsAssociatedFunction Self "err_flip" err_flip [].
End Impl_integration_flipper_Flipper.
