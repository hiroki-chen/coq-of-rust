(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module Increment.
  
End Increment.

(* Trait *)
Module Reset.
  
End Reset.

(* Struct Incrementer *)

Module Impl_trait_incrementer_Incrementer.
  Definition Self : Ty.t := Ty.path "trait_incrementer::Incrementer".
  
  (*
      pub fn new(init_value: u64) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ init_value ] =>
      let* init_value := M.alloc init_value in
      let* α0 := M.read init_value in
      M.pure
        (Value.StructRecord "trait_incrementer::Incrementer" [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn inc_by(&mut self, delta: u64) {
          self.value += delta;
      }
  *)
  Definition inc_by (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; delta ] =>
      let* self := M.alloc self in
      let* delta := M.alloc delta in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure (M.get_struct_record α0 "value") in
        let* α0 := M.read β in
        let* α1 := M.read delta in
        let* α2 := BinOp.Panic.add α0 α1 in
        M.assign β α2 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inc_by :
    M.IsAssociatedFunction Self "inc_by" inc_by [].
End Impl_trait_incrementer_Incrementer.

Module Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer.
  (*
      fn inc(&mut self) {
          self.inc_by(1)
      }
  *)
  Definition inc (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.call
        (Ty.path "trait_incrementer::Incrementer")::["inc_by"]
        [ α0; Value.Integer Integer.U64 1 ]
    | _, _ => M.impossible
    end.
  
  (*
      fn get(&self) -> u64 {
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
  
  Axiom Implements :
    M.IsTraitInstance
      "trait_incrementer::Increment"
      (* Self *) (Ty.path "trait_incrementer::Incrementer")
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("inc", InstanceField.Method inc); ("get", InstanceField.Method get) ]
      (* Instance polymorphic types *) [].
End Impl_trait_incrementer_Increment_for_trait_incrementer_Incrementer.

Module Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer.
  (*
      fn reset(&mut self) {
          self.value = 0;
      }
  *)
  Definition reset (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        M.assign
          (M.get_struct_record α0 "value")
          (Value.Integer Integer.U64 0) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "trait_incrementer::Reset"
      (* Self *) (Ty.path "trait_incrementer::Incrementer")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("reset", InstanceField.Method reset) ]
      (* Instance polymorphic types *) [].
End Impl_trait_incrementer_Reset_for_trait_incrementer_Incrementer.
