(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module mem.
  Module transmutability.
    (* Trait *)
    (* Empty module 'BikeshedIntrinsicFrom' *)
    
    (* StructRecord
      {
        name := "Assume";
        ty_params := [];
        fields :=
          [
            ("alignment", Ty.path "bool");
            ("lifetimes", Ty.path "bool");
            ("safety", Ty.path "bool");
            ("validity", Ty.path "bool")
          ];
      } *)
    
    Module Impl_core_marker_StructuralPartialEq_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_core_mem_transmutability_Assume.
    
    Module Impl_core_cmp_PartialEq_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
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
                        "core::mem::transmutability::Assume",
                        "alignment"
                      |)
                    |))
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::mem::transmutability::Assume",
                        "alignment"
                      |)
                    |)),
                  ltac:(M.monadic
                    (BinOp.Pure.eq
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::mem::transmutability::Assume",
                          "lifetimes"
                        |)
                      |))
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| other |),
                          "core::mem::transmutability::Assume",
                          "lifetimes"
                        |)
                      |))))
                |),
                ltac:(M.monadic
                  (BinOp.Pure.eq
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::mem::transmutability::Assume",
                        "safety"
                      |)
                    |))
                    (M.read (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "core::mem::transmutability::Assume",
                        "safety"
                      |)
                    |))))
              |),
              ltac:(M.monadic
                (BinOp.Pure.eq
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::mem::transmutability::Assume",
                      "validity"
                    |)
                  |))
                  (M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "core::mem::transmutability::Assume",
                      "validity"
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
    End Impl_core_cmp_PartialEq_for_core_mem_transmutability_Assume.
    
    Module Impl_core_marker_StructuralEq_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralEq_for_core_mem_transmutability_Assume.
    
    Module Impl_core_cmp_Eq_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
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
    End Impl_core_cmp_Eq_for_core_mem_transmutability_Assume.
    
    Module Impl_core_clone_Clone_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
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
    End Impl_core_clone_Clone_for_core_mem_transmutability_Assume.
    
    Module Impl_core_marker_Copy_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_core_mem_transmutability_Assume.
    
    Module Impl_core_fmt_Debug_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
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
                M.read (| Value.String "Assume" |);
                M.read (| Value.String "alignment" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::mem::transmutability::Assume",
                    "alignment"
                  |));
                M.read (| Value.String "lifetimes" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::mem::transmutability::Assume",
                    "lifetimes"
                  |));
                M.read (| Value.String "safety" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::mem::transmutability::Assume",
                    "safety"
                  |));
                M.read (| Value.String "validity" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::mem::transmutability::Assume",
                      "validity"
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
    End Impl_core_fmt_Debug_for_core_mem_transmutability_Assume.
    
    Module Impl_core_marker_ConstParamTy_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::ConstParamTy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_ConstParamTy_for_core_mem_transmutability_Assume.
    
    Module Impl_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      (*
          pub const NOTHING: Self =
              Self { alignment: false, lifetimes: false, safety: false, validity: false };
      *)
      (* Ty.path "core::mem::transmutability::Assume" *)
      Definition value_NOTHING : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              Value.StructRecord
                "core::mem::transmutability::Assume"
                [
                  ("alignment", Value.Bool false);
                  ("lifetimes", Value.Bool false);
                  ("safety", Value.Bool false);
                  ("validity", Value.Bool false)
                ]
            |))).
      
      Axiom AssociatedConstant_value_NOTHING :
        M.IsAssociatedConstant Self "value_NOTHING" value_NOTHING.
      
      (*     pub const ALIGNMENT: Self = Self { alignment: true, ..Self::NOTHING }; *)
      (* Ty.path "core::mem::transmutability::Assume" *)
      Definition value_ALIGNMENT : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              M.struct_record_update
                (M.read (| M.get_constant (| "core::mem::transmutability::NOTHING" |) |))
                [ ("alignment", Value.Bool true) ]
            |))).
      
      Axiom AssociatedConstant_value_ALIGNMENT :
        M.IsAssociatedConstant Self "value_ALIGNMENT" value_ALIGNMENT.
      
      (*     pub const LIFETIMES: Self = Self { lifetimes: true, ..Self::NOTHING }; *)
      (* Ty.path "core::mem::transmutability::Assume" *)
      Definition value_LIFETIMES : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              M.struct_record_update
                (M.read (| M.get_constant (| "core::mem::transmutability::NOTHING" |) |))
                [ ("lifetimes", Value.Bool true) ]
            |))).
      
      Axiom AssociatedConstant_value_LIFETIMES :
        M.IsAssociatedConstant Self "value_LIFETIMES" value_LIFETIMES.
      
      (*     pub const SAFETY: Self = Self { safety: true, ..Self::NOTHING }; *)
      (* Ty.path "core::mem::transmutability::Assume" *)
      Definition value_SAFETY : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              M.struct_record_update
                (M.read (| M.get_constant (| "core::mem::transmutability::NOTHING" |) |))
                [ ("safety", Value.Bool true) ]
            |))).
      
      Axiom AssociatedConstant_value_SAFETY :
        M.IsAssociatedConstant Self "value_SAFETY" value_SAFETY.
      
      (*     pub const VALIDITY: Self = Self { validity: true, ..Self::NOTHING }; *)
      (* Ty.path "core::mem::transmutability::Assume" *)
      Definition value_VALIDITY : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              M.struct_record_update
                (M.read (| M.get_constant (| "core::mem::transmutability::NOTHING" |) |))
                [ ("validity", Value.Bool true) ]
            |))).
      
      Axiom AssociatedConstant_value_VALIDITY :
        M.IsAssociatedConstant Self "value_VALIDITY" value_VALIDITY.
      
      (*
          pub const fn and(self, other_assumptions: Self) -> Self {
              Self {
                  alignment: self.alignment || other_assumptions.alignment,
                  lifetimes: self.lifetimes || other_assumptions.lifetimes,
                  safety: self.safety || other_assumptions.safety,
                  validity: self.validity || other_assumptions.validity,
              }
          }
      *)
      Definition and (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other_assumptions ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other_assumptions := M.alloc (| other_assumptions |) in
            Value.StructRecord
              "core::mem::transmutability::Assume"
              [
                ("alignment",
                  LogicalOp.or (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "alignment"
                      |)
                    |),
                    ltac:(M.monadic
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          other_assumptions,
                          "core::mem::transmutability::Assume",
                          "alignment"
                        |)
                      |)))
                  |));
                ("lifetimes",
                  LogicalOp.or (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "lifetimes"
                      |)
                    |),
                    ltac:(M.monadic
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          other_assumptions,
                          "core::mem::transmutability::Assume",
                          "lifetimes"
                        |)
                      |)))
                  |));
                ("safety",
                  LogicalOp.or (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "safety"
                      |)
                    |),
                    ltac:(M.monadic
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          other_assumptions,
                          "core::mem::transmutability::Assume",
                          "safety"
                        |)
                      |)))
                  |));
                ("validity",
                  LogicalOp.or (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "validity"
                      |)
                    |),
                    ltac:(M.monadic
                      (M.read (|
                        M.SubPointer.get_struct_record_field (|
                          other_assumptions,
                          "core::mem::transmutability::Assume",
                          "validity"
                        |)
                      |)))
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_and : M.IsAssociatedFunction Self "and" and.
      
      (*
          pub const fn but_not(self, other_assumptions: Self) -> Self {
              Self {
                  alignment: self.alignment && !other_assumptions.alignment,
                  lifetimes: self.lifetimes && !other_assumptions.lifetimes,
                  safety: self.safety && !other_assumptions.safety,
                  validity: self.validity && !other_assumptions.validity,
              }
          }
      *)
      Definition but_not (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other_assumptions ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other_assumptions := M.alloc (| other_assumptions |) in
            Value.StructRecord
              "core::mem::transmutability::Assume"
              [
                ("alignment",
                  LogicalOp.and (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "alignment"
                      |)
                    |),
                    ltac:(M.monadic
                      (UnOp.Pure.not
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            other_assumptions,
                            "core::mem::transmutability::Assume",
                            "alignment"
                          |)
                        |))))
                  |));
                ("lifetimes",
                  LogicalOp.and (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "lifetimes"
                      |)
                    |),
                    ltac:(M.monadic
                      (UnOp.Pure.not
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            other_assumptions,
                            "core::mem::transmutability::Assume",
                            "lifetimes"
                          |)
                        |))))
                  |));
                ("safety",
                  LogicalOp.and (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "safety"
                      |)
                    |),
                    ltac:(M.monadic
                      (UnOp.Pure.not
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            other_assumptions,
                            "core::mem::transmutability::Assume",
                            "safety"
                          |)
                        |))))
                  |));
                ("validity",
                  LogicalOp.and (|
                    M.read (|
                      M.SubPointer.get_struct_record_field (|
                        self,
                        "core::mem::transmutability::Assume",
                        "validity"
                      |)
                    |),
                    ltac:(M.monadic
                      (UnOp.Pure.not
                        (M.read (|
                          M.SubPointer.get_struct_record_field (|
                            other_assumptions,
                            "core::mem::transmutability::Assume",
                            "validity"
                          |)
                        |))))
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_but_not : M.IsAssociatedFunction Self "but_not" but_not.
    End Impl_core_mem_transmutability_Assume.
    
    Module Impl_core_ops_arith_Add_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      (*     type Output = Assume; *)
      Definition _Output : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      (*
          fn add(self, other_assumptions: Assume) -> Assume {
              self.and(other_assumptions)
          }
      *)
      Definition add (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other_assumptions ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other_assumptions := M.alloc (| other_assumptions |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::mem::transmutability::Assume",
                "and",
                []
              |),
              [ M.read (| self |); M.read (| other_assumptions |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::ops::arith::Add"
          Self
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Output", InstanceField.Ty _Output); ("add", InstanceField.Method add) ].
    End Impl_core_ops_arith_Add_for_core_mem_transmutability_Assume.
    
    Module Impl_core_ops_arith_Sub_for_core_mem_transmutability_Assume.
      Definition Self : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      (*     type Output = Assume; *)
      Definition _Output : Ty.t := Ty.path "core::mem::transmutability::Assume".
      
      (*
          fn sub(self, other_assumptions: Assume) -> Assume {
              self.but_not(other_assumptions)
          }
      *)
      Definition sub (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other_assumptions ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other_assumptions := M.alloc (| other_assumptions |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::mem::transmutability::Assume",
                "but_not",
                []
              |),
              [ M.read (| self |); M.read (| other_assumptions |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::ops::arith::Sub"
          Self
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Output", InstanceField.Ty _Output); ("sub", InstanceField.Method sub) ].
    End Impl_core_ops_arith_Sub_for_core_mem_transmutability_Assume.
  End transmutability.
End mem.
