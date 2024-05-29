(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructTuple
          "custom_environment::AccountId"
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
End Impl_core_default_Default_for_custom_environment_AccountId.

Module Impl_core_clone_Clone_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  (* Clone *)
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
End Impl_core_clone_Clone_for_custom_environment_AccountId.

Module Impl_core_marker_Copy_for_custom_environment_AccountId.
  Definition Self : Ty.t := Ty.path "custom_environment::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_custom_environment_AccountId.

Axiom Balance : (Ty.path "custom_environment::Balance") = (Ty.path "u128").

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "custom_environment::AccountId") ];
  } *)

(* StructTuple
  {
    name := "Topics";
    ty_params := [];
    fields := [];
  } *)

Module Impl_core_default_Default_for_custom_environment_Topics.
  Definition Self : Ty.t := Ty.path "custom_environment::Topics".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => ltac:(M.monadic (Value.StructTuple "custom_environment::Topics" []))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_custom_environment_Topics.

(* StructRecord
  {
    name := "EventWithTopics";
    ty_params := [];
    fields :=
      [
        ("first_topic", Ty.path "u128");
        ("second_topic", Ty.path "u128");
        ("third_topic", Ty.path "u128");
        ("fourth_topic", Ty.path "u128");
        ("fifth_topic", Ty.path "u128")
      ];
  } *)

Module Impl_core_default_Default_for_custom_environment_EventWithTopics.
  Definition Self : Ty.t := Ty.path "custom_environment::EventWithTopics".
  
  (* Default *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (Value.StructRecord
          "custom_environment::EventWithTopics"
          [
            ("first_topic",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("second_topic",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("third_topic",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("fourth_topic",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |));
            ("fifth_topic",
              M.call_closure (|
                M.get_trait_method (|
                  "core::default::Default",
                  Ty.path "u128",
                  [],
                  "default",
                  []
                |),
                []
              |))
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_custom_environment_EventWithTopics.

(*
Enum Event
{
  ty_params := [];
  variants :=
    [
      {
        name := "EventWithTopics";
        item := StructTuple [ Ty.path "custom_environment::EventWithTopics" ];
        discriminant := None;
      }
    ];
}
*)

Module Impl_custom_environment_Env.
  Definition Self : Ty.t := Ty.path "custom_environment::Env".
  
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
          M.SubPointer.get_struct_record_field (|
            M.read (| self |),
            "custom_environment::Env",
            "caller"
          |)
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
End Impl_custom_environment_Env.

Module Impl_custom_environment_Topics.
  Definition Self : Ty.t := Ty.path "custom_environment::Topics".
  
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
          M.get_associated_function (| Ty.path "custom_environment::Topics", "init_env", [] |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.call_closure (|
          M.get_trait_method (|
            "core::default::Default",
            Ty.path "custom_environment::Topics",
            [],
            "default",
            []
          |),
          []
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn trigger(&mut self) {
          self.env()
              .emit_event(Event::EventWithTopics(EventWithTopics::default()));
      }
  *)
  Definition trigger (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "custom_environment::Env", "emit_event", [] |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "custom_environment::Topics",
                        "env",
                        []
                      |),
                      [ M.read (| self |) ]
                    |)
                  |);
                  Value.StructTuple
                    "custom_environment::Event::EventWithTopics"
                    [
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::default::Default",
                          Ty.path "custom_environment::EventWithTopics",
                          [],
                          "default",
                          []
                        |),
                        []
                      |)
                    ]
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_trigger : M.IsAssociatedFunction Self "trigger" trigger.
End Impl_custom_environment_Topics.
