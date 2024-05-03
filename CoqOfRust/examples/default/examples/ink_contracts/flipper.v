(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Flipper";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "flipper::Flipper".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord "flipper::Flipper" [ ("value", M.read (| init_value |)) ]))
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
          M.get_associated_function (| Ty.path "flipper::Flipper", "new", [] |),
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "bool", [], "default", [] |),
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default : M.IsAssociatedFunction Self "new_default" new_default.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.write (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "flipper::Flipper",
                "value"
              |),
              UnOp.Pure.not
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "flipper::Flipper",
                    "value"
                  |)
                |))
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_record_field (| M.read (| self |), "flipper::Flipper", "value" |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_flipper_Flipper.
