(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Flipper *)

Module Impl_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "flipper::Flipper".
  
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
      M.pure (Value.StructRecord "flipper::Flipper" [ ("value", α0) ])
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
      let* α0 := M.get_associated_function (Ty.path "flipper::Flipper") "new" in
      let* α1 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "bool" ] in
      let* α2 := M.call α1 [] in
      M.call α0 [ α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default :
    M.IsAssociatedFunction Self "new_default" new_default [].
  
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
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 := M.read (M.get_struct_record α1 "value") in
        M.assign (M.get_struct_record α0 "value") (UnOp.Pure.not α2) in
      let* α0 := M.alloc (Value.Tuple []) in
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
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "value")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get [].
End Impl_flipper_Flipper.
