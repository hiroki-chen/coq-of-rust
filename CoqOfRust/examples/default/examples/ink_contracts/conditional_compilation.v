(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_conditional_compilation_AccountId.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α1 := M.call α0 [] in
      M.pure (Value.StructTuple "conditional_compilation::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => (M.read self) ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "conditional_compilation::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : (Ty.path "conditional_compilation::Balance") = (Ty.path "u128").

Axiom BlockNumber :
  (Ty.path "conditional_compilation::BlockNumber") = (Ty.path "u32").

(* Struct Env *)

(* Trait *)
Module Flip.
  
End Flip.

(* Struct Changes *)

(* Struct ChangesDated *)

(* Enum Event *)

Module Impl_conditional_compilation_Env.
  Definition Self : Ty.t := Ty.path "conditional_compilation::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record α0 "caller")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller :
    M.IsAssociatedFunction Self "caller" caller [].
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; _event ] =>
      let* self := M.alloc self in
      let* _event := M.alloc _event in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
  
  (*
      fn block_number(&self) -> BlockNumber {
          unimplemented!()
      }
  *)
  Definition block_number (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_block_number :
    M.IsAssociatedFunction Self "block_number" block_number [].
End Impl_conditional_compilation_Env.

(* Struct ConditionalCompilation *)

Module Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t :=
    Ty.path "conditional_compilation::ConditionalCompilation".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 := M.var "core::panicking::panic" in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_init_env :
    M.IsAssociatedFunction Self "init_env" init_env [].
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      M.call
        (Ty.path
            "conditional_compilation::ConditionalCompilation")::["init_env"]
        []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "bool" ] in
      let* α1 := M.call α0 [] in
      M.pure
        (Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn new_foo(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure
        (Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_foo :
    M.IsAssociatedFunction Self "new_foo" new_foo [].
  
  (*
      pub fn new_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure
        (Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_bar :
    M.IsAssociatedFunction Self "new_bar" new_bar [].
  
  (*
      pub fn new_foo_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ value ] =>
      let* value := M.alloc value in
      let* α0 := M.read value in
      M.pure
        (Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", α0) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_foo_bar :
    M.IsAssociatedFunction Self "new_foo_bar" new_foo_bar [].
  
  (*
      pub fn inherent_flip_foo(&mut self) {
          self.value = !self.value;
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: self.value,
              by: caller,
          }));
      }
  *)
  Definition inherent_flip_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 := M.read (M.get_struct_record α1 "value") in
        M.assign (M.get_struct_record α0 "value") (UnOp.not α2) in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call (Ty.path "conditional_compilation::Env")::["caller"] [ α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read self in
        let* α3 := M.read (M.get_struct_record α2 "value") in
        let* α4 := M.read caller in
        let* α5 :=
          M.call
            (Ty.path "conditional_compilation::Env")::["emit_event"]
            [
              α1;
              Value.StructTuple
                "conditional_compilation::Event::Changes"
                [
                  Value.StructRecord
                    "conditional_compilation::Changes"
                    [ ("new_value", α3); ("by_", α4) ]
                ]
            ] in
        M.alloc α5 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inherent_flip_foo :
    M.IsAssociatedFunction Self "inherent_flip_foo" inherent_flip_foo [].
  
  (*
      pub fn inherent_flip_bar(&mut self) {
          let caller = Self::init_env().caller();
          let block_number = Self::init_env().block_number();
          self.value = !self.value;
          Self::init_env().emit_event(Event::ChangesDated(ChangesDated {
              new_value: self.value,
              by: caller,
              when: block_number,
          }));
      }
  *)
  Definition inherent_flip_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call (Ty.path "conditional_compilation::Env")::["caller"] [ α1 ] in
        M.alloc α2 in
      let* block_number :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call
            (Ty.path "conditional_compilation::Env")::["block_number"]
            [ α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 := M.read (M.get_struct_record α1 "value") in
        M.assign (M.get_struct_record α0 "value") (UnOp.not α2) in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read self in
        let* α3 := M.read (M.get_struct_record α2 "value") in
        let* α4 := M.read caller in
        let* α5 := M.read block_number in
        let* α6 :=
          M.call
            (Ty.path "conditional_compilation::Env")::["emit_event"]
            [
              α1;
              Value.StructTuple
                "conditional_compilation::Event::ChangesDated"
                [
                  Value.StructRecord
                    "conditional_compilation::ChangesDated"
                    [ ("new_value", α3); ("by_", α4); ("when", α5) ]
                ]
            ] in
        M.alloc α6 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inherent_flip_bar :
    M.IsAssociatedFunction Self "inherent_flip_bar" inherent_flip_bar [].
End Impl_conditional_compilation_ConditionalCompilation.

Module Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  (*
      fn flip(&mut self) {
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
        M.assign (M.get_struct_record α0 "value") (UnOp.not α2) in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn get(&self) -> bool {
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
  
  (*
      fn push_foo(&mut self, value: bool) {
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: value,
              by: caller,
          }));
          self.value = value;
      }
  *)
  Definition push_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; value ] =>
      let* self := M.alloc self in
      let* value := M.alloc value in
      let* caller :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 :=
          M.call (Ty.path "conditional_compilation::Env")::["caller"] [ α1 ] in
        M.alloc α2 in
      let* _ :=
        let* α0 :=
          M.call
            (Ty.path
                "conditional_compilation::ConditionalCompilation")::["init_env"]
            [] in
        let* α1 := M.alloc α0 in
        let* α2 := M.read value in
        let* α3 := M.read caller in
        let* α4 :=
          M.call
            (Ty.path "conditional_compilation::Env")::["emit_event"]
            [
              α1;
              Value.StructTuple
                "conditional_compilation::Event::Changes"
                [
                  Value.StructRecord
                    "conditional_compilation::Changes"
                    [ ("new_value", α2); ("by_", α3) ]
                ]
            ] in
        M.alloc α4 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read value in
        M.assign (M.get_struct_record α0 "value") α1 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "conditional_compilation::Flip"
      (* Self *) (Ty.path "conditional_compilation::ConditionalCompilation")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("flip", InstanceField.Method flip);
          ("get", InstanceField.Method get);
          ("push_foo", InstanceField.Method push_foo)
        ]
      (* Instance polymorphic types *) [].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
