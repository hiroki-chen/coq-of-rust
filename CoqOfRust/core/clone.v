(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module clone.
  (* Trait *)
  Module Clone.
    Definition clone_from (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; source ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let source := M.alloc (| source |) in
          M.read (|
            M.write (|
              M.read (| self |),
              M.call_closure (|
                M.get_trait_method (| "core::clone::Clone", Self, [], "clone", [] |),
                [ M.read (| source |) ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom ProvidedMethod_clone_from :
      M.IsProvidedMethod "core::clone::Clone" "clone_from" clone_from.
  End Clone.
  
  (* StructRecord
    {
      name := "AssertParamIsClone";
      ty_params := [ "T" ];
      fields := [ ("_field", Ty.apply (Ty.path "core::marker::PhantomData") [ T ]) ];
    } *)
  
  (* StructRecord
    {
      name := "AssertParamIsCopy";
      ty_params := [ "T" ];
      fields := [ ("_field", Ty.apply (Ty.path "core::marker::PhantomData") [ T ]) ];
    } *)
  
  Module impls.
    Module Impl_core_clone_Clone_for_usize.
      Definition Self : Ty.t := Ty.path "usize".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_usize.
    
    Module Impl_core_clone_Clone_for_u8.
      Definition Self : Ty.t := Ty.path "u8".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_u8.
    
    Module Impl_core_clone_Clone_for_u16.
      Definition Self : Ty.t := Ty.path "u16".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_u16.
    
    Module Impl_core_clone_Clone_for_u32.
      Definition Self : Ty.t := Ty.path "u32".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_u32.
    
    Module Impl_core_clone_Clone_for_u64.
      Definition Self : Ty.t := Ty.path "u64".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_u64.
    
    Module Impl_core_clone_Clone_for_u128.
      Definition Self : Ty.t := Ty.path "u128".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_u128.
    
    Module Impl_core_clone_Clone_for_isize.
      Definition Self : Ty.t := Ty.path "isize".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_isize.
    
    Module Impl_core_clone_Clone_for_i8.
      Definition Self : Ty.t := Ty.path "i8".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_i8.
    
    Module Impl_core_clone_Clone_for_i16.
      Definition Self : Ty.t := Ty.path "i16".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_i16.
    
    Module Impl_core_clone_Clone_for_i32.
      Definition Self : Ty.t := Ty.path "i32".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_i32.
    
    Module Impl_core_clone_Clone_for_i64.
      Definition Self : Ty.t := Ty.path "i64".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_i64.
    
    Module Impl_core_clone_Clone_for_i128.
      Definition Self : Ty.t := Ty.path "i128".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_i128.
    
    Module Impl_core_clone_Clone_for_f32.
      Definition Self : Ty.t := Ty.path "f32".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_f32.
    
    Module Impl_core_clone_Clone_for_f64.
      Definition Self : Ty.t := Ty.path "f64".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_f64.
    
    Module Impl_core_clone_Clone_for_bool.
      Definition Self : Ty.t := Ty.path "bool".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_bool.
    
    Module Impl_core_clone_Clone_for_char.
      Definition Self : Ty.t := Ty.path "char".
      
      (*
                          fn clone(&self) -> Self {
                              *self
                          }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_char.
    
    Module Impl_core_clone_Clone_for_never.
      Definition Self : Ty.t := Ty.path "never".
      
      (*
              fn clone(&self) -> Self {
                  *self
              }
      *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_never.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_T_for_pointer_const_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "*const") [ T ].
      
      (*
              fn clone(&self) -> Self {
                  *self
              }
      *)
      Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
    End Impl_core_clone_Clone_where_core_marker_Sized_T_for_pointer_const_T.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_T_for_pointer_mut_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "*mut") [ T ].
      
      (*
              fn clone(&self) -> Self {
                  *self
              }
      *)
      Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
    End Impl_core_clone_Clone_where_core_marker_Sized_T_for_pointer_mut_T.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_T_for_ref__T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "&") [ T ].
      
      (*
              fn clone(&self) -> Self {
                  *self
              }
      *)
      Definition clone (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone T)) ].
    End Impl_core_clone_Clone_where_core_marker_Sized_T_for_ref__T.
    
    Module Impl_core_clone_Clone_where_core_marker_Sized_T_for_ref_mut_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "&mut") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_clone_Clone_where_core_marker_Sized_T_for_ref_mut_T.
  End impls.
End clone.
