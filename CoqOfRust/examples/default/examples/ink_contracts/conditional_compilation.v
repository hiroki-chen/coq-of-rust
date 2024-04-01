(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "conditional_compilation::AccountId"
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "u128", [], "default", [] |),
              []
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_conditional_compilation_AccountId.

Module Impl_core_clone_Clone_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  (*
  Clone
  *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_conditional_compilation_AccountId.

Module Impl_core_marker_Copy_for_conditional_compilation_AccountId.
  Definition Self : Ty.t := Ty.path "conditional_compilation::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_conditional_compilation_AccountId.

Axiom Balance : (Ty.path "conditional_compilation::Balance") = (Ty.path "u128").

Axiom BlockNumber : (Ty.path "conditional_compilation::BlockNumber") = (Ty.path "u32").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "conditional_compilation::AccountId") ];
  } *)

(* Trait *)
(* Empty module 'Flip' *)

(* StructRecord
  {
    name := "Changes";
    ty_params := [];
    fields :=
      [ ("new_value", Ty.path "bool"); ("by_", Ty.path "conditional_compilation::AccountId") ];
  } *)

(* StructRecord
  {
    name := "ChangesDated";
    ty_params := [];
    fields :=
      [
        ("new_value", Ty.path "bool");
        ("by_", Ty.path "conditional_compilation::AccountId");
        ("when", Ty.path "u32")
      ];
  } *)

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Changes";
        item := StructTuple [ Ty.path "conditional_compilation::Changes" ];
        discriminant := None;
      };
      {
        name := "ChangesDated";
        item := StructTuple [ Ty.path "conditional_compilation::ChangesDated" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_conditional_compilation_Env.
  Definition Self : Ty.t := Ty.path "conditional_compilation::Env".
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field (M.read (| self |)) "conditional_compilation::Env" "caller"
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event : M.IsAssociatedFunction Self "emit_event" emit_event.
  
  (*
      fn block_number(&self) -> BlockNumber {
          unimplemented!()
      }
  *)
  Parameter block_number : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_block_number : M.IsAssociatedFunction Self "block_number" block_number.
End Impl_conditional_compilation_Env.

(* StructRecord
  {
    name := "ConditionalCompilation";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

Module Impl_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t := Ty.path "conditional_compilation::ConditionalCompilation".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "conditional_compilation::ConditionalCompilation",
            "init_env",
            []
          |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [
            ("value",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "bool",
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn new_foo(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ value ] =>
      ltac:(M.monadic
        (let value := M.alloc (| value |) in
        Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", M.read (| value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_foo : M.IsAssociatedFunction Self "new_foo" new_foo.
  
  (*
      pub fn new_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_bar (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ value ] =>
      ltac:(M.monadic
        (let value := M.alloc (| value |) in
        Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", M.read (| value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_bar : M.IsAssociatedFunction Self "new_bar" new_bar.
  
  (*
      pub fn new_foo_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo_bar (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ value ] =>
      ltac:(M.monadic
        (let value := M.alloc (| value |) in
        Value.StructRecord
          "conditional_compilation::ConditionalCompilation"
          [ ("value", M.read (| value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_foo_bar : M.IsAssociatedFunction Self "new_foo_bar" new_foo_bar.
  
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
  Definition inherent_flip_foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.assign (|
              M.get_struct_record_field
                (M.read (| self |))
                "conditional_compilation::ConditionalCompilation"
                "value",
              UnOp.Pure.not
                (M.read (|
                  M.get_struct_record_field
                    (M.read (| self |))
                    "conditional_compilation::ConditionalCompilation"
                    "value"
                |))
            |) in
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "emit_event",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |);
                  Value.StructTuple
                    "conditional_compilation::Event::Changes"
                    [
                      Value.StructRecord
                        "conditional_compilation::Changes"
                        [
                          ("new_value",
                            M.read (|
                              M.get_struct_record_field
                                (M.read (| self |))
                                "conditional_compilation::ConditionalCompilation"
                                "value"
                            |));
                          ("by_", M.read (| caller |))
                        ]
                    ]
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inherent_flip_foo :
    M.IsAssociatedFunction Self "inherent_flip_foo" inherent_flip_foo.
  
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
  Definition inherent_flip_bar (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let block_number :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "block_number",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.assign (|
              M.get_struct_record_field
                (M.read (| self |))
                "conditional_compilation::ConditionalCompilation"
                "value",
              UnOp.Pure.not
                (M.read (|
                  M.get_struct_record_field
                    (M.read (| self |))
                    "conditional_compilation::ConditionalCompilation"
                    "value"
                |))
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "emit_event",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |);
                  Value.StructTuple
                    "conditional_compilation::Event::ChangesDated"
                    [
                      Value.StructRecord
                        "conditional_compilation::ChangesDated"
                        [
                          ("new_value",
                            M.read (|
                              M.get_struct_record_field
                                (M.read (| self |))
                                "conditional_compilation::ConditionalCompilation"
                                "value"
                            |));
                          ("by_", M.read (| caller |));
                          ("when", M.read (| block_number |))
                        ]
                    ]
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inherent_flip_bar :
    M.IsAssociatedFunction Self "inherent_flip_bar" inherent_flip_bar.
End Impl_conditional_compilation_ConditionalCompilation.

Module Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
  Definition Self : Ty.t := Ty.path "conditional_compilation::ConditionalCompilation".
  
  (*
      fn flip(&mut self) {
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
            M.assign (|
              M.get_struct_record_field
                (M.read (| self |))
                "conditional_compilation::ConditionalCompilation"
                "value",
              UnOp.Pure.not
                (M.read (|
                  M.get_struct_record_field
                    (M.read (| self |))
                    "conditional_compilation::ConditionalCompilation"
                    "value"
                |))
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  (*
      fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field
            (M.read (| self |))
            "conditional_compilation::ConditionalCompilation"
            "value"
        |)))
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
  Definition push_foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; value ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let value := M.alloc (| value |) in
        M.read (|
          let caller :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "caller",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |)
                ]
              |)
            |) in
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "conditional_compilation::Env",
                  "emit_event",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "conditional_compilation::ConditionalCompilation",
                        "init_env",
                        []
                      |),
                      []
                    |)
                  |);
                  Value.StructTuple
                    "conditional_compilation::Event::Changes"
                    [
                      Value.StructRecord
                        "conditional_compilation::Changes"
                        [ ("new_value", M.read (| value |)); ("by_", M.read (| caller |)) ]
                    ]
                ]
              |)
            |) in
          let _ :=
            M.assign (|
              M.get_struct_record_field
                (M.read (| self |))
                "conditional_compilation::ConditionalCompilation"
                "value",
              M.read (| value |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "conditional_compilation::Flip"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [
        ("flip", InstanceField.Method flip);
        ("get", InstanceField.Method get);
        ("push_foo", InstanceField.Method push_foo)
      ].
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation.
