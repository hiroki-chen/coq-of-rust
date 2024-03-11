(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct AccountId *)

Module Impl_core_default_Default_for_custom_environment_AccountId.
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
      M.pure (Value.StructTuple "custom_environment::AccountId" [ α1 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_custom_environment_AccountId.

Module Impl_core_clone_Clone_for_custom_environment_AccountId.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator Value.DeclaredButUndefined [ fun γ => M.read self ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_custom_environment_AccountId.

Module Impl_core_marker_Copy_for_custom_environment_AccountId.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::Copy"
      (* Self *) (Ty.path "custom_environment::AccountId")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_Copy_for_custom_environment_AccountId.

Axiom Balance : (Ty.path "custom_environment::Balance") = (Ty.path "u128").

(* Struct Env *)

(* Struct Topics *)

Module Impl_core_default_Default_for_custom_environment_Topics.
  (*
  Default
  *)
  Definition default (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] => M.pure (Value.StructTuple "custom_environment::Topics" [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::Topics")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_custom_environment_Topics.

(* Struct EventWithTopics *)

Module Impl_core_default_Default_for_custom_environment_EventWithTopics.
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
      let* α2 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α3 := M.call α2 [] in
      let* α4 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α5 := M.call α4 [] in
      let* α6 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α7 := M.call α6 [] in
      let* α8 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "u128" ] in
      let* α9 := M.call α8 [] in
      M.pure
        (Value.StructRecord
          "custom_environment::EventWithTopics"
          [
            ("first_topic", α1);
            ("second_topic", α3);
            ("third_topic", α5);
            ("fourth_topic", α7);
            ("fifth_topic", α9)
          ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      (* Self *) (Ty.path "custom_environment::EventWithTopics")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ]
      (* Instance polymorphic types *) [].
End Impl_core_default_Default_for_custom_environment_EventWithTopics.

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "EventWithTopics";
        item := Tuple [ Ty.path "custom_environment::EventWithTopics" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_custom_environment_Env.
  Definition Self : Ty.t := Ty.path "custom_environment::Env".
  
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
      let* α0 := M.get_function "core::panicking::panic" [] in
      let* α1 := M.read (mk_str "not implemented") in
      let* α2 := M.call α0 [ α1 ] in
      M.never_to_any α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_emit_event :
    M.IsAssociatedFunction Self "emit_event" emit_event [].
End Impl_custom_environment_Env.

Module Impl_custom_environment_Topics.
  Definition Self : Ty.t := Ty.path "custom_environment::Topics".
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 := M.get_function "core::panicking::panic" [] in
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
      let* α0 :=
        M.get_associated_function
          (Ty.path "custom_environment::Topics")
          "init_env" in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env [].
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          "default"
          [ (* Self *) Ty.path "custom_environment::Topics" ] in
      M.call α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new [].
  
  (*
      pub fn trigger(&mut self) {
          self.env()
              .emit_event(Event::EventWithTopics(EventWithTopics::default()));
      }
  *)
  Definition trigger (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.path "custom_environment::Env")
            "emit_event" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "custom_environment::Topics")
            "env" in
        let* α2 := M.read self in
        let* α3 := M.call α1 [ α2 ] in
        let* α4 := M.alloc α3 in
        let* α5 :=
          M.get_trait_method
            "core::default::Default"
            "default"
            [ (* Self *) Ty.path "custom_environment::EventWithTopics" ] in
        let* α6 := M.call α5 [] in
        let* α7 :=
          M.call
            α0
            [
              α4;
              Value.StructTuple
                "custom_environment::Event::EventWithTopics"
                [ α6 ]
            ] in
        M.alloc α7 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_trigger :
    M.IsAssociatedFunction Self "trigger" trigger [].
End Impl_custom_environment_Topics.
