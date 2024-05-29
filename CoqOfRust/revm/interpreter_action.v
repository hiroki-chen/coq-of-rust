(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module interpreter_action.
  (*
  Enum InterpreterAction
  {
    ty_params := [];
    variants :=
      [
        {
          name := "Call";
          item :=
            StructRecord
              [
                ("inputs",
                  Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [
                      Ty.path "revm_interpreter::interpreter_action::call_inputs::CallInputs";
                      Ty.path "alloc::alloc::Global"
                    ])
              ];
          discriminant := None;
        };
        {
          name := "Create";
          item :=
            StructRecord
              [
                ("inputs",
                  Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [
                      Ty.path "revm_interpreter::interpreter_action::create_inputs::CreateInputs";
                      Ty.path "alloc::alloc::Global"
                    ])
              ];
          discriminant := None;
        };
        {
          name := "EOFCreate";
          item :=
            StructRecord
              [
                ("inputs",
                  Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [
                      Ty.path
                        "revm_interpreter::interpreter_action::eof_create_inputs::EOFCreateInput";
                      Ty.path "alloc::alloc::Global"
                    ])
              ];
          discriminant := None;
        };
        {
          name := "Return";
          item :=
            StructRecord [ ("result", Ty.path "revm_interpreter::interpreter::InterpreterResult") ];
          discriminant := None;
        };
        {
          name := "None";
          item := StructTuple [];
          discriminant := None;
        }
      ];
  }
  *)
  
  Module Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    (* Clone *)
    Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Call",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      Value.StructRecord
                        "revm_interpreter::interpreter_action::InterpreterAction::Call"
                        [
                          ("inputs",
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::clone::Clone",
                                Ty.apply
                                  (Ty.path "alloc::boxed::Box")
                                  [
                                    Ty.path
                                      "revm_interpreter::interpreter_action::call_inputs::CallInputs";
                                    Ty.path "alloc::alloc::Global"
                                  ],
                                [],
                                "clone",
                                []
                              |),
                              [ M.read (| __self_0 |) ]
                            |))
                        ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Create",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      Value.StructRecord
                        "revm_interpreter::interpreter_action::InterpreterAction::Create"
                        [
                          ("inputs",
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::clone::Clone",
                                Ty.apply
                                  (Ty.path "alloc::boxed::Box")
                                  [
                                    Ty.path
                                      "revm_interpreter::interpreter_action::create_inputs::CreateInputs";
                                    Ty.path "alloc::alloc::Global"
                                  ],
                                [],
                                "clone",
                                []
                              |),
                              [ M.read (| __self_0 |) ]
                            |))
                        ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::EOFCreate",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      Value.StructRecord
                        "revm_interpreter::interpreter_action::InterpreterAction::EOFCreate"
                        [
                          ("inputs",
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::clone::Clone",
                                Ty.apply
                                  (Ty.path "alloc::boxed::Box")
                                  [
                                    Ty.path
                                      "revm_interpreter::interpreter_action::eof_create_inputs::EOFCreateInput";
                                    Ty.path "alloc::alloc::Global"
                                  ],
                                [],
                                "clone",
                                []
                              |),
                              [ M.read (| __self_0 |) ]
                            |))
                        ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Return",
                        "result"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      Value.StructRecord
                        "revm_interpreter::interpreter_action::InterpreterAction::Return"
                        [
                          ("result",
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::clone::Clone",
                                Ty.path "revm_interpreter::interpreter::InterpreterResult",
                                [],
                                "clone",
                                []
                              |),
                              [ M.read (| __self_0 |) ]
                            |))
                        ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::None"
                      |) in
                    M.alloc (|
                      Value.StructTuple
                        "revm_interpreter::interpreter_action::InterpreterAction::None"
                        []
                    |)))
              ]
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
  End Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    (* Debug *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Call",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_struct_field1_finish",
                          []
                        |),
                        [
                          M.read (| f |);
                          M.read (| Value.String "Call" |);
                          M.read (| Value.String "inputs" |);
                          (* Unsize *) M.pointer_coercion __self_0
                        ]
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Create",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_struct_field1_finish",
                          []
                        |),
                        [
                          M.read (| f |);
                          M.read (| Value.String "Create" |);
                          M.read (| Value.String "inputs" |);
                          (* Unsize *) M.pointer_coercion __self_0
                        ]
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::EOFCreate",
                        "inputs"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_struct_field1_finish",
                          []
                        |),
                        [
                          M.read (| f |);
                          M.read (| Value.String "EOFCreate" |);
                          M.read (| Value.String "inputs" |);
                          (* Unsize *) M.pointer_coercion __self_0
                        ]
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let γ1_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Return",
                        "result"
                      |) in
                    let __self_0 := M.alloc (| γ1_0 |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_struct_field1_finish",
                          []
                        |),
                        [
                          M.read (| f |);
                          M.read (| Value.String "Return" |);
                          M.read (| Value.String "result" |);
                          (* Unsize *) M.pointer_coercion __self_0
                        ]
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::None"
                      |) in
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "write_str",
                          []
                        |),
                        [ M.read (| f |); M.read (| Value.String "None" |) ]
                      |)
                    |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_default_Default_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    (* Default *)
    Definition default (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (Value.StructTuple "revm_interpreter::interpreter_action::InterpreterAction::None" []))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::default::Default"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("default", InstanceField.Method default) ].
  End Impl_core_default_Default_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralPartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    (* PartialEq *)
    Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; other ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let other := M.alloc (| other |) in
          M.read (|
            let~ __self_tag :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (|
                    "core::intrinsics::discriminant_value",
                    [ Ty.path "revm_interpreter::interpreter_action::InterpreterAction" ]
                  |),
                  [ M.read (| self |) ]
                |)
              |) in
            let~ __arg1_tag :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (|
                    "core::intrinsics::discriminant_value",
                    [ Ty.path "revm_interpreter::interpreter_action::InterpreterAction" ]
                  |),
                  [ M.read (| other |) ]
                |)
              |) in
            M.alloc (|
              LogicalOp.and (|
                BinOp.Pure.eq (M.read (| __self_tag |)) (M.read (| __arg1_tag |)),
                ltac:(M.monadic
                  (M.read (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [ M.read (| self |); M.read (| other |) ] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                            let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                            let γ0_0 := M.read (| γ0_0 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_0,
                                "revm_interpreter::interpreter_action::InterpreterAction::Call",
                                "inputs"
                              |) in
                            let __self_0 := M.alloc (| γ2_0 |) in
                            let γ0_1 := M.read (| γ0_1 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_1,
                                "revm_interpreter::interpreter_action::InterpreterAction::Call",
                                "inputs"
                              |) in
                            let __arg1_0 := M.alloc (| γ2_0 |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::cmp::PartialEq",
                                  Ty.apply
                                    (Ty.path "alloc::boxed::Box")
                                    [
                                      Ty.path
                                        "revm_interpreter::interpreter_action::call_inputs::CallInputs";
                                      Ty.path "alloc::alloc::Global"
                                    ],
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.path
                                          "revm_interpreter::interpreter_action::call_inputs::CallInputs";
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ],
                                  "eq",
                                  []
                                |),
                                [ M.read (| __self_0 |); M.read (| __arg1_0 |) ]
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                            let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                            let γ0_0 := M.read (| γ0_0 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_0,
                                "revm_interpreter::interpreter_action::InterpreterAction::Create",
                                "inputs"
                              |) in
                            let __self_0 := M.alloc (| γ2_0 |) in
                            let γ0_1 := M.read (| γ0_1 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_1,
                                "revm_interpreter::interpreter_action::InterpreterAction::Create",
                                "inputs"
                              |) in
                            let __arg1_0 := M.alloc (| γ2_0 |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::cmp::PartialEq",
                                  Ty.apply
                                    (Ty.path "alloc::boxed::Box")
                                    [
                                      Ty.path
                                        "revm_interpreter::interpreter_action::create_inputs::CreateInputs";
                                      Ty.path "alloc::alloc::Global"
                                    ],
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.path
                                          "revm_interpreter::interpreter_action::create_inputs::CreateInputs";
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ],
                                  "eq",
                                  []
                                |),
                                [ M.read (| __self_0 |); M.read (| __arg1_0 |) ]
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                            let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                            let γ0_0 := M.read (| γ0_0 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_0,
                                "revm_interpreter::interpreter_action::InterpreterAction::EOFCreate",
                                "inputs"
                              |) in
                            let __self_0 := M.alloc (| γ2_0 |) in
                            let γ0_1 := M.read (| γ0_1 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_1,
                                "revm_interpreter::interpreter_action::InterpreterAction::EOFCreate",
                                "inputs"
                              |) in
                            let __arg1_0 := M.alloc (| γ2_0 |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::cmp::PartialEq",
                                  Ty.apply
                                    (Ty.path "alloc::boxed::Box")
                                    [
                                      Ty.path
                                        "revm_interpreter::interpreter_action::eof_create_inputs::EOFCreateInput";
                                      Ty.path "alloc::alloc::Global"
                                    ],
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.path
                                          "revm_interpreter::interpreter_action::eof_create_inputs::EOFCreateInput";
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ],
                                  "eq",
                                  []
                                |),
                                [ M.read (| __self_0 |); M.read (| __arg1_0 |) ]
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                            let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                            let γ0_0 := M.read (| γ0_0 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_0,
                                "revm_interpreter::interpreter_action::InterpreterAction::Return",
                                "result"
                              |) in
                            let __self_0 := M.alloc (| γ2_0 |) in
                            let γ0_1 := M.read (| γ0_1 |) in
                            let γ2_0 :=
                              M.SubPointer.get_struct_record_field (|
                                γ0_1,
                                "revm_interpreter::interpreter_action::InterpreterAction::Return",
                                "result"
                              |) in
                            let __arg1_0 := M.alloc (| γ2_0 |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::cmp::PartialEq",
                                  Ty.path "revm_interpreter::interpreter::InterpreterResult",
                                  [ Ty.path "revm_interpreter::interpreter::InterpreterResult" ],
                                  "eq",
                                  []
                                |),
                                [ M.read (| __self_0 |); M.read (| __arg1_0 |) ]
                              |)
                            |)));
                        fun γ => ltac:(M.monadic (M.alloc (| Value.Bool true |)))
                      ]
                    |)
                  |)))
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::cmp::PartialEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("eq", InstanceField.Method eq) ].
  End Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_marker_StructuralEq_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::marker::StructuralEq"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_marker_StructuralEq_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
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
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (M.match_operator (|
                              Value.DeclaredButUndefined,
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (M.match_operator (|
                                      Value.DeclaredButUndefined,
                                      [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                                    |)))
                              ]
                            |)))
                      ]
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
  End Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_InterpreterAction.
  
  Module Impl_revm_interpreter_interpreter_action_InterpreterAction.
    Definition Self : Ty.t := Ty.path "revm_interpreter::interpreter_action::InterpreterAction".
    
    (*
        pub fn is_call(&self) -> bool {
            matches!(self, InterpreterAction::Call { .. })
        }
    *)
    Definition is_call (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Call"
                      |) in
                    M.alloc (| Value.Bool true |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Bool false |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_is_call : M.IsAssociatedFunction Self "is_call" is_call.
    
    (*
        pub fn is_create(&self) -> bool {
            matches!(self, InterpreterAction::Create { .. })
        }
    *)
    Definition is_create (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Create"
                      |) in
                    M.alloc (| Value.Bool true |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Bool false |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_is_create : M.IsAssociatedFunction Self "is_create" is_create.
    
    (*
        pub fn is_return(&self) -> bool {
            matches!(self, InterpreterAction::Return { .. })
        }
    *)
    Definition is_return (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Return"
                      |) in
                    M.alloc (| Value.Bool true |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Bool false |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_is_return : M.IsAssociatedFunction Self "is_return" is_return.
    
    (*
        pub fn is_none(&self) -> bool {
            matches!(self, InterpreterAction::None)
        }
    *)
    Definition is_none (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := M.read (| γ |) in
                    let _ :=
                      M.is_struct_tuple (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::None"
                      |) in
                    M.alloc (| Value.Bool true |)));
                fun γ => ltac:(M.monadic (M.alloc (| Value.Bool false |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_is_none : M.IsAssociatedFunction Self "is_none" is_none.
    
    (*
        pub fn is_some(&self) -> bool {
            !self.is_none()
        }
    *)
    Definition is_some (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          UnOp.Pure.not
            (M.call_closure (|
              M.get_associated_function (|
                Ty.path "revm_interpreter::interpreter_action::InterpreterAction",
                "is_none",
                []
              |),
              [ M.read (| self |) ]
            |))))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_is_some : M.IsAssociatedFunction Self "is_some" is_some.
    
    (*
        pub fn into_result_return(self) -> Option<InterpreterResult> {
            match self {
                InterpreterAction::Return { result } => Some(result),
                _ => None,
            }
        }
    *)
    Definition into_result_return (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            M.match_operator (|
              self,
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_record_field (|
                        γ,
                        "revm_interpreter::interpreter_action::InterpreterAction::Return",
                        "result"
                      |) in
                    let result := M.copy (| γ0_0 |) in
                    M.alloc (|
                      Value.StructTuple "core::option::Option::Some" [ M.read (| result |) ]
                    |)));
                fun γ =>
                  ltac:(M.monadic (M.alloc (| Value.StructTuple "core::option::Option::None" [] |)))
              ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_into_result_return :
      M.IsAssociatedFunction Self "into_result_return" into_result_return.
  End Impl_revm_interpreter_interpreter_action_InterpreterAction.
End interpreter_action.
