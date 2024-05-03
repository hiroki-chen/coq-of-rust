(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module panic.
  Module location.
    (* StructRecord
      {
        name := "Location";
        ty_params := [];
        fields :=
          [
            ("file", Ty.apply (Ty.path "&") [ Ty.path "str" ]);
            ("line", Ty.path "u32");
            ("col", Ty.path "u32")
          ];
      } *)
    
    Module Impl_core_marker_Copy_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_core_panic_location_Location.
    
    Module Impl_core_clone_Clone_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (* Clone *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
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
                        [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
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
    End Impl_core_clone_Clone_for_core_panic_location_Location.
    
    Module Impl_core_fmt_Debug_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
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
                "debug_struct_field3_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "Location" |);
                M.read (| Value.String "file" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::location::Location",
                    "file"
                  |));
                M.read (| Value.String "line" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::location::Location",
                    "line"
                  |));
                M.read (| Value.String "col" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::panic::location::Location",
                      "col"
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
    End Impl_core_fmt_Debug_for_core_panic_location_Location.
    
    Module Impl_core_marker_StructuralEq_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralEq_for_core_panic_location_Location.
    
    Module Impl_core_cmp_Eq_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
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
    End Impl_core_cmp_Eq_for_core_panic_location_Location.
    
    Module Impl_core_hash_Hash_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (* Hash *)
      Definition hash (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [ __H ], [ self; state ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let state := M.alloc (| state |) in
            M.read (|
              let _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::hash::Hash",
                      Ty.apply (Ty.path "&") [ Ty.path "str" ],
                      [],
                      "hash",
                      [ __H ]
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::panic::location::Location",
                        "file"
                      |);
                      M.read (| state |)
                    ]
                  |)
                |) in
              let _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (| "core::hash::Hash", Ty.path "u32", [], "hash", [ __H ] |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::panic::location::Location",
                        "line"
                      |);
                      M.read (| state |)
                    ]
                  |)
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::hash::Hash", Ty.path "u32", [], "hash", [ __H ] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::panic::location::Location",
                      "col"
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
    End Impl_core_hash_Hash_for_core_panic_location_Location.
    
    Module Impl_core_cmp_Ord_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (* Ord *)
      Definition cmp (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::cmp::Ord",
                      Ty.apply (Ty.path "&") [ Ty.path "str" ],
                      [],
                      "cmp",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::panic::location::Location",
                        "file"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::panic::location::Location",
                        "file"
                      |)
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (M.match_operator (|
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (| "core::cmp::Ord", Ty.path "u32", [], "cmp", [] |),
                            [
                              M.SubPointer.get_struct_record_field (|
                                M.read (| self |),
                                "core::panic::location::Location",
                                "line"
                              |);
                              M.SubPointer.get_struct_record_field (|
                                M.read (| other |),
                                "core::panic::location::Location",
                                "line"
                              |)
                            ]
                          |)
                        |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (M.alloc (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::cmp::Ord",
                                    Ty.path "u32",
                                    [],
                                    "cmp",
                                    []
                                  |),
                                  [
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| self |),
                                      "core::panic::location::Location",
                                      "col"
                                    |);
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| other |),
                                      "core::panic::location::Location",
                                      "col"
                                    |)
                                  ]
                                |)
                              |)));
                          fun γ =>
                            ltac:(M.monadic
                              (let cmp := M.copy (| γ |) in
                              cmp))
                        ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let cmp := M.copy (| γ |) in
                      cmp))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::cmp::Ord"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("cmp", InstanceField.Method cmp) ].
    End Impl_core_cmp_Ord_for_core_panic_location_Location.
    
    Module Impl_core_marker_StructuralPartialEq_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_core_panic_location_Location.
    
    Module Impl_core_cmp_PartialEq_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (* PartialEq *)
      Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            LogicalOp.and (|
              LogicalOp.and (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.apply (Ty.path "&") [ Ty.path "str" ],
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::panic::location::Location",
                      "file"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "core::panic::location::Location",
                      "file"
                    |)
                  ]
                |),
                ltac:(M.monadic
                  (BinOp.Pure.eq
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::panic::location::Location",
                        "line"
                      |)
                    |))
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::panic::location::Location",
                        "line"
                      |)
                    |))))
              |),
              ltac:(M.monadic
                (BinOp.Pure.eq
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::panic::location::Location",
                      "col"
                    |)
                  |))
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "core::panic::location::Location",
                      "col"
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
    End Impl_core_cmp_PartialEq_for_core_panic_location_Location.
    
    Module Impl_core_cmp_PartialOrd_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (* PartialOrd *)
      Definition partial_cmp (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::cmp::PartialOrd",
                      Ty.apply (Ty.path "&") [ Ty.path "str" ],
                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                      "partial_cmp",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::panic::location::Location",
                        "file"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::panic::location::Location",
                        "file"
                      |)
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::option::Option::Some",
                          0
                        |) in
                      M.match_operator (|
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::cmp::PartialOrd",
                              Ty.path "u32",
                              [ Ty.path "u32" ],
                              "partial_cmp",
                              []
                            |),
                            [
                              M.SubPointer.get_struct_record_field (|
                                M.read (| self |),
                                "core::panic::location::Location",
                                "line"
                              |);
                              M.SubPointer.get_struct_record_field (|
                                M.read (| other |),
                                "core::panic::location::Location",
                                "line"
                              |)
                            ]
                          |)
                        |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (let γ0_0 :=
                                M.SubPointer.get_struct_tuple_field (|
                                  γ,
                                  "core::option::Option::Some",
                                  0
                                |) in
                              M.alloc (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::cmp::PartialOrd",
                                    Ty.path "u32",
                                    [ Ty.path "u32" ],
                                    "partial_cmp",
                                    []
                                  |),
                                  [
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| self |),
                                      "core::panic::location::Location",
                                      "col"
                                    |);
                                    M.SubPointer.get_struct_record_field (|
                                      M.read (| other |),
                                      "core::panic::location::Location",
                                      "col"
                                    |)
                                  ]
                                |)
                              |)));
                          fun γ =>
                            ltac:(M.monadic
                              (let cmp := M.copy (| γ |) in
                              cmp))
                        ]
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let cmp := M.copy (| γ |) in
                      cmp))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::cmp::PartialOrd"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("partial_cmp", InstanceField.Method partial_cmp) ].
    End Impl_core_cmp_PartialOrd_for_core_panic_location_Location.
    
    Module Impl_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (*
          pub const fn caller() -> &'static Location<'static> {
              crate::intrinsics::caller_location()
          }
      *)
      Definition caller (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::intrinsics::caller_location", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
      
      (*
          pub const fn file(&self) -> &str {
              self.file
          }
      *)
      Definition file (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "core::panic::location::Location",
                "file"
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_file : M.IsAssociatedFunction Self "file" file.
      
      (*
          pub const fn line(&self) -> u32 {
              self.line
          }
      *)
      Definition line (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "core::panic::location::Location",
                "line"
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_line : M.IsAssociatedFunction Self "line" line.
      
      (*
          pub const fn column(&self) -> u32 {
              self.col
          }
      *)
      Definition column (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "core::panic::location::Location",
                "col"
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_column : M.IsAssociatedFunction Self "column" column.
      (*
          pub const fn internal_constructor(file: &'a str, line: u32, col: u32) -> Self {
              Location { file, line, col }
          }
      *)
      Definition internal_constructor (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ file; line; col ] =>
          ltac:(M.monadic
            (let file := M.alloc (| file |) in
            let line := M.alloc (| line |) in
            let col := M.alloc (| col |) in
            Value.StructRecord
              "core::panic::location::Location"
              [ ("file", M.read (| file |)); ("line", M.read (| line |)); ("col", M.read (| col |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_internal_constructor :
        M.IsAssociatedFunction Self "internal_constructor" internal_constructor.
    End Impl_core_panic_location_Location.
    
    
    Module Impl_core_fmt_Display_for_core_panic_location_Location.
      Definition Self : Ty.t := Ty.path "core::panic::location::Location".
      
      (*
          fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
              write!(formatter, "{}:{}:{}", self.file, self.line, self.col)
          }
      *)
      Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; formatter ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let formatter := M.alloc (| formatter |) in
            M.call_closure (|
              M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_fmt", [] |),
              [
                M.read (| formatter |);
                M.call_closure (|
                  M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                  [
                    (* Unsize *)
                    M.pointer_coercion
                      (M.alloc (|
                        Value.Array
                          [
                            M.read (| Value.String "" |);
                            M.read (| Value.String ":" |);
                            M.read (| Value.String ":" |)
                          ]
                      |));
                    (* Unsize *)
                    M.pointer_coercion
                      (M.alloc (|
                        Value.Array
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                              |),
                              [
                                M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::panic::location::Location",
                                  "file"
                                |)
                              ]
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.path "u32" ]
                              |),
                              [
                                M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::panic::location::Location",
                                  "line"
                                |)
                              ]
                            |);
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::rt::Argument",
                                "new_display",
                                [ Ty.path "u32" ]
                              |),
                              [
                                M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::panic::location::Location",
                                  "col"
                                |)
                              ]
                            |)
                          ]
                      |))
                  ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Display"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
    End Impl_core_fmt_Display_for_core_panic_location_Location.
  End location.
End panic.
