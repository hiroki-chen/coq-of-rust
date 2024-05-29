(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module host.
  (* Trait *)
  (* Empty module 'Host' *)
  
  (* StructRecord
    {
      name := "SStoreResult";
      ty_params := [];
      fields :=
        [
          ("original_value", Ty.path "ruint::Uint");
          ("present_value", Ty.path "ruint::Uint");
          ("new_value", Ty.path "ruint::Uint");
          ("is_cold", Ty.path "bool")
        ];
    } *)
  
  Module Impl_core_fmt_Debug_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    (* Debug *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::fmt::Formatter",
              "debug_struct_field4_finish",
              []
            |),
            [
              M.read (| f |);
              M.read (| Value.String "SStoreResult" |);
              M.read (| Value.String "original_value" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SStoreResult",
                  "original_value"
                |));
              M.read (| Value.String "present_value" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SStoreResult",
                  "present_value"
                |));
              M.read (| Value.String "new_value" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SStoreResult",
                  "new_value"
                |));
              M.read (| Value.String "is_cold" |);
              (* Unsize *)
              M.pointer_coercion
                (M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::SStoreResult",
                    "is_cold"
                  |)
                |))
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_revm_interpreter_host_SStoreResult.
  
  Module Impl_core_clone_Clone_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    (* Clone *)
    Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructRecord
            "revm_interpreter::host::SStoreResult"
            [
              ("original_value",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::clone::Clone",
                    Ty.path "ruint::Uint",
                    [],
                    "clone",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "original_value"
                    |)
                  ]
                |));
              ("present_value",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::clone::Clone",
                    Ty.path "ruint::Uint",
                    [],
                    "clone",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "present_value"
                    |)
                  ]
                |));
              ("new_value",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::clone::Clone",
                    Ty.path "ruint::Uint",
                    [],
                    "clone",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "new_value"
                    |)
                  ]
                |));
              ("is_cold",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "is_cold"
                    |)
                  ]
                |))
            ]))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_revm_interpreter_host_SStoreResult.
  
  Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralPartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_SStoreResult.
  
  Module Impl_core_cmp_PartialEq_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    (* PartialEq *)
    Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; other ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let other := M.alloc (| other |) in
          LogicalOp.and (|
            LogicalOp.and (|
              LogicalOp.and (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.path "ruint::Uint",
                    [ Ty.path "ruint::Uint" ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "original_value"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::host::SStoreResult",
                      "original_value"
                    |)
                  ]
                |),
                ltac:(M.monadic
                  (M.call_closure (|
                    M.get_trait_method (|
                      "core::cmp::PartialEq",
                      Ty.path "ruint::Uint",
                      [ Ty.path "ruint::Uint" ],
                      "eq",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::host::SStoreResult",
                        "present_value"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "revm_interpreter::host::SStoreResult",
                        "present_value"
                      |)
                    ]
                  |)))
              |),
              ltac:(M.monadic
                (M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.path "ruint::Uint",
                    [ Ty.path "ruint::Uint" ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SStoreResult",
                      "new_value"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::host::SStoreResult",
                      "new_value"
                    |)
                  ]
                |)))
            |),
            ltac:(M.monadic
              (BinOp.Pure.eq
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::SStoreResult",
                    "is_cold"
                  |)
                |))
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "revm_interpreter::host::SStoreResult",
                    "is_cold"
                  |)
                |))))
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::PartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("eq", InstanceField.Method eq) ].
  End Impl_core_cmp_PartialEq_for_revm_interpreter_host_SStoreResult.
  
  Module Impl_core_marker_StructuralEq_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralEq_for_revm_interpreter_host_SStoreResult.
  
  Module Impl_core_cmp_Eq_for_revm_interpreter_host_SStoreResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SStoreResult".
    
    (* Eq *)
    Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              Value.DeclaredButUndefined,
              [
                fun γ =>
                  ltac:(M.monadic
                    (M.match_operator (|
                      Value.DeclaredButUndefined,
                      [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                    |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::Eq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *)
        [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
  End Impl_core_cmp_Eq_for_revm_interpreter_host_SStoreResult.
  
  (* StructRecord
    {
      name := "LoadAccountResult";
      ty_params := [];
      fields := [ ("is_cold", Ty.path "bool"); ("is_empty", Ty.path "bool") ];
    } *)
  
  Module Impl_core_fmt_Debug_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    (* Debug *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::fmt::Formatter",
              "debug_struct_field2_finish",
              []
            |),
            [
              M.read (| f |);
              M.read (| Value.String "LoadAccountResult" |);
              M.read (| Value.String "is_cold" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::LoadAccountResult",
                  "is_cold"
                |));
              M.read (| Value.String "is_empty" |);
              (* Unsize *)
              M.pointer_coercion
                (M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::LoadAccountResult",
                    "is_empty"
                  |)
                |))
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_clone_Clone_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    (* Clone *)
    Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructRecord
            "revm_interpreter::host::LoadAccountResult"
            [
              ("is_cold",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::LoadAccountResult",
                      "is_cold"
                    |)
                  ]
                |));
              ("is_empty",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::LoadAccountResult",
                      "is_empty"
                    |)
                  ]
                |))
            ]))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_default_Default_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    (* Default *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (Value.StructRecord
            "revm_interpreter::host::LoadAccountResult"
            [
              ("is_cold",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.path "bool",
                    [],
                    "default",
                    []
                  |),
                  []
                |));
              ("is_empty",
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
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralPartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_cmp_PartialEq_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    (* PartialEq *)
    Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; other ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let other := M.alloc (| other |) in
          LogicalOp.and (|
            BinOp.Pure.eq
              (M.read (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::LoadAccountResult",
                  "is_cold"
                |)
              |))
              (M.read (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| other |),
                  "revm_interpreter::host::LoadAccountResult",
                  "is_cold"
                |)
              |)),
            ltac:(M.monadic
              (BinOp.Pure.eq
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::LoadAccountResult",
                    "is_empty"
                  |)
                |))
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "revm_interpreter::host::LoadAccountResult",
                    "is_empty"
                  |)
                |))))
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::PartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("eq", InstanceField.Method eq) ].
  End Impl_core_cmp_PartialEq_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_marker_StructuralEq_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralEq_for_revm_interpreter_host_LoadAccountResult.
  
  Module Impl_core_cmp_Eq_for_revm_interpreter_host_LoadAccountResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::LoadAccountResult".
    
    (* Eq *)
    Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              Value.DeclaredButUndefined,
              [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::Eq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *)
        [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
  End Impl_core_cmp_Eq_for_revm_interpreter_host_LoadAccountResult.
  
  (* StructRecord
    {
      name := "SelfDestructResult";
      ty_params := [];
      fields :=
        [
          ("had_value", Ty.path "bool");
          ("target_exists", Ty.path "bool");
          ("is_cold", Ty.path "bool");
          ("previously_destroyed", Ty.path "bool")
        ];
    } *)
  
  Module Impl_core_default_Default_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* Default *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (Value.StructRecord
            "revm_interpreter::host::SelfDestructResult"
            [
              ("had_value",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.path "bool",
                    [],
                    "default",
                    []
                  |),
                  []
                |));
              ("target_exists",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.path "bool",
                    [],
                    "default",
                    []
                  |),
                  []
                |));
              ("is_cold",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.path "bool",
                    [],
                    "default",
                    []
                  |),
                  []
                |));
              ("previously_destroyed",
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
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_clone_Clone_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* Clone *)
    Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructRecord
            "revm_interpreter::host::SelfDestructResult"
            [
              ("had_value",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "had_value"
                    |)
                  ]
                |));
              ("target_exists",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "target_exists"
                    |)
                  ]
                |));
              ("is_cold",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "is_cold"
                    |)
                  ]
                |));
              ("previously_destroyed",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "previously_destroyed"
                    |)
                  ]
                |))
            ]))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_fmt_Debug_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* Debug *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::fmt::Formatter",
              "debug_struct_field4_finish",
              []
            |),
            [
              M.read (| f |);
              M.read (| Value.String "SelfDestructResult" |);
              M.read (| Value.String "had_value" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SelfDestructResult",
                  "had_value"
                |));
              M.read (| Value.String "target_exists" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SelfDestructResult",
                  "target_exists"
                |));
              M.read (| Value.String "is_cold" |);
              (* Unsize *)
              M.pointer_coercion
                (M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::host::SelfDestructResult",
                  "is_cold"
                |));
              M.read (| Value.String "previously_destroyed" |);
              (* Unsize *)
              M.pointer_coercion
                (M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::SelfDestructResult",
                    "previously_destroyed"
                  |)
                |))
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralPartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_cmp_PartialEq_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* PartialEq *)
    Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; other ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let other := M.alloc (| other |) in
          LogicalOp.and (|
            LogicalOp.and (|
              LogicalOp.and (|
                BinOp.Pure.eq
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "had_value"
                    |)
                  |))
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::host::SelfDestructResult",
                      "had_value"
                    |)
                  |)),
                ltac:(M.monadic
                  (BinOp.Pure.eq
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::host::SelfDestructResult",
                        "target_exists"
                      |)
                    |))
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "revm_interpreter::host::SelfDestructResult",
                        "target_exists"
                      |)
                    |))))
              |),
              ltac:(M.monadic
                (BinOp.Pure.eq
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "is_cold"
                    |)
                  |))
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::host::SelfDestructResult",
                      "is_cold"
                    |)
                  |))))
            |),
            ltac:(M.monadic
              (BinOp.Pure.eq
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::SelfDestructResult",
                    "previously_destroyed"
                  |)
                |))
                (M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "revm_interpreter::host::SelfDestructResult",
                    "previously_destroyed"
                  |)
                |))))
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::PartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("eq", InstanceField.Method eq) ].
  End Impl_core_cmp_PartialEq_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_marker_StructuralEq_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralEq_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_cmp_Eq_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* Eq *)
    Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              Value.DeclaredButUndefined,
              [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::Eq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *)
        [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
  End Impl_core_cmp_Eq_for_revm_interpreter_host_SelfDestructResult.
  
  Module Impl_core_hash_Hash_for_revm_interpreter_host_SelfDestructResult.
    Definition Self : Ty.t := Ty.path "revm_interpreter::host::SelfDestructResult".
    
    (* Hash *)
    Definition hash (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ __H ], [ self; state ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let state := M.alloc (| state |) in
          M.read (|
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::hash::Hash", Ty.path "bool", [], "hash", [ __H ] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "had_value"
                    |);
                    M.read (| state |)
                  ]
                |)
              |) in
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::hash::Hash", Ty.path "bool", [], "hash", [ __H ] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "target_exists"
                    |);
                    M.read (| state |)
                  ]
                |)
              |) in
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::hash::Hash", Ty.path "bool", [], "hash", [ __H ] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::host::SelfDestructResult",
                      "is_cold"
                    |);
                    M.read (| state |)
                  ]
                |)
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (| "core::hash::Hash", Ty.path "bool", [], "hash", [ __H ] |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::host::SelfDestructResult",
                    "previously_destroyed"
                  |);
                  M.read (| state |)
                ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::hash::Hash"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("hash", InstanceField.Method hash) ].
  End Impl_core_hash_Hash_for_revm_interpreter_host_SelfDestructResult.
End host.
