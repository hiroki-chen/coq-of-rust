(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Incrementer";
    ty_params := [];
    fields := [ ("value", Ty.path "i32") ];
  } *)

Module Impl_incrementer_Incrementer.
  Definition Self : Ty.t := Ty.path "incrementer::Incrementer".
  
  (*
      pub fn new(init_value: i32) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord "incrementer::Incrementer" [ ("value", M.read (| init_value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.call_closure (|
          M.get_associated_function (| Ty.path "incrementer::Incrementer", "new", [] |),
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "i32", [], "default", [] |),
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default : M.IsAssociatedFunction Self "new_default" new_default.
  
  (*
      pub fn inc(&mut self, by: i32) {
          self.value += by;
      }
  *)
  Definition inc (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; by_ ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let by_ := M.alloc (| by_ |) in
        M.read (|
          let _ :=
            let β :=
              M.get_struct_record_field (M.read (| self |)) "incrementer::Incrementer" "value" in
            M.write (| β, BinOp.Panic.add (| M.read (| β |), M.read (| by_ |) |) |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc.
  
  (*
      pub fn get(&self) -> i32 {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field (M.read (| self |)) "incrementer::Incrementer" "value"
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_incrementer_Incrementer.
