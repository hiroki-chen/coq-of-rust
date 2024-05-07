(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module extension.
  Module group_pointer.
    (* StructRecord
      {
        name := "GroupPointer";
        ty_params := [];
        fields :=
          [
            ("authority", Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey");
            ("group_address", Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey")
          ];
      } *)
    
    Module Impl_core_clone_Clone_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
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
    End Impl_core_clone_Clone_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_core_marker_Copy_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_core_fmt_Debug_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
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
                M.read (| Value.String "GroupPointer" |);
                M.read (| Value.String "authority" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.get_struct_record_field
                    (M.read (| self |))
                    "spl_token_2022::extension::group_pointer::GroupPointer"
                    "authority");
                M.read (| Value.String "group_address" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "spl_token_2022::extension::group_pointer::GroupPointer"
                      "group_address"
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
    End Impl_core_fmt_Debug_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_core_default_Default_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      (* Default *)
      Definition default (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "spl_token_2022::extension::group_pointer::GroupPointer"
              [
                ("authority",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("group_address",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey",
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
    End Impl_core_default_Default_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_core_cmp_PartialEq_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      (* PartialEq *)
      Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            LogicalOp.and (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::cmp::PartialEq",
                  Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey",
                  [ Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey" ],
                  "eq",
                  []
                |),
                [
                  M.get_struct_record_field
                    (M.read (| self |))
                    "spl_token_2022::extension::group_pointer::GroupPointer"
                    "authority";
                  M.get_struct_record_field
                    (M.read (| other |))
                    "spl_token_2022::extension::group_pointer::GroupPointer"
                    "authority"
                ]
              |),
              ltac:(M.monadic
                (M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey",
                    [ Ty.path "spl_pod::optional_keys::OptionalNonZeroPubkey" ],
                    "eq",
                    []
                  |),
                  [
                    M.get_struct_record_field
                      (M.read (| self |))
                      "spl_token_2022::extension::group_pointer::GroupPointer"
                      "group_address";
                    M.get_struct_record_field
                      (M.read (| other |))
                      "spl_token_2022::extension::group_pointer::GroupPointer"
                      "group_address"
                  ]
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::cmp::PartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("eq", InstanceField.Method eq) ].
    End Impl_core_cmp_PartialEq_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      Axiom Implements :
        M.IsTraitInstance
          "bytemuck::pod::Pod"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      Axiom Implements :
        M.IsTraitInstance
          "bytemuck::zeroable::Zeroable"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_group_pointer_GroupPointer.
    
    Module Impl_spl_token_2022_extension_Extension_for_spl_token_2022_extension_group_pointer_GroupPointer.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::group_pointer::GroupPointer".
      
      (*     const TYPE: ExtensionType = ExtensionType::GroupPointer; *)
      (* Ty.path "spl_token_2022::extension::ExtensionType" *)
      Definition value_TYPE : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              Value.StructTuple "spl_token_2022::extension::ExtensionType::GroupPointer" []
            |))).
      
      Axiom Implements :
        M.IsTraitInstance
          "spl_token_2022::extension::Extension"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("value_TYPE", InstanceField.Constant value_TYPE) ].
    End Impl_spl_token_2022_extension_Extension_for_spl_token_2022_extension_group_pointer_GroupPointer.
  End group_pointer.
End extension.
