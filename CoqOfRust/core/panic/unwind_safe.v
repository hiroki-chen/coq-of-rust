(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module panic.
  Module unwind_safe.
    (* Trait *)
    (* Empty module 'UnwindSafe' *)
    
    (* Trait *)
    (* Empty module 'RefUnwindSafe' *)
    
    (* StructTuple
      {
        name := "AssertUnwindSafe";
        ty_params := [ "T" ];
        fields := [ T ];
      } *)
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_marker_Sized_T_for_ref_mut_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "&mut") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_marker_Sized_T_for_ref_mut_T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_ref__T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "&") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_ref__T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_pointer_const_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "*const") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_pointer_const_T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_pointer_mut_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "*mut") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_pointer_mut_T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_UnwindSafe_T_where_core_marker_Sized_T_for_core_ptr_unique_Unique_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::ptr::unique::Unique") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_UnwindSafe_T_where_core_marker_Sized_T_for_core_ptr_unique_Unique_T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_core_ptr_non_null_NonNull_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::ptr::non_null::NonNull") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_where_core_panic_unwind_safe_RefUnwindSafe_T_where_core_marker_Sized_T_for_core_ptr_non_null_NonNull_T.
    
    Module Impl_core_panic_unwind_safe_UnwindSafe_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::UnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_UnwindSafe_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_where_core_marker_Sized_T_for_core_cell_UnsafeCell_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::cell::UnsafeCell") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_where_core_marker_Sized_T_for_core_cell_UnsafeCell_T.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicIsize.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicIsize".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicIsize.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI8.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicI8".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI8.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI16.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicI16".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI16.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI32.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicI32".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI32.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI64.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicI64".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicI64.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicUsize.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicUsize".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicUsize.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU8.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicU8".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU8.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU16.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicU16".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU16.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU32.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicU32".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU32.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU64.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicU64".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicU64.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicBool.
      Definition Self : Ty.t := Ty.path "core::sync::atomic::AtomicBool".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicBool.
    
    Module Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicPtr_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::sync::atomic::AtomicPtr") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::panic::unwind_safe::RefUnwindSafe"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_panic_unwind_safe_RefUnwindSafe_for_core_sync_atomic_AtomicPtr_T.
    
    Module Impl_core_ops_deref_Deref_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      (*     type Target = T; *)
      Definition _Target (T : Ty.t) : Ty.t := T.
      
      (*
          fn deref(&self) -> &T {
              &self.0
          }
      *)
      Definition deref (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_tuple_field (|
              M.read (| self |),
              "core::panic::unwind_safe::AssertUnwindSafe",
              0
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::ops::deref::Deref"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Target", InstanceField.Ty (_Target T)); ("deref", InstanceField.Method (deref T)) ].
    End Impl_core_ops_deref_Deref_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_ops_deref_DerefMut_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      (*
          fn deref_mut(&mut self) -> &mut T {
              &mut self.0
          }
      *)
      Definition deref_mut (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_tuple_field (|
              M.read (| self |),
              "core::panic::unwind_safe::AssertUnwindSafe",
              0
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::ops::deref::DerefMut"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("deref_mut", InstanceField.Method (deref_mut T)) ].
    End Impl_core_ops_deref_DerefMut_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_ops_function_FnOnce_where_core_ops_function_FnOnce_F_Tuple__Tuple__for_core_panic_unwind_safe_AssertUnwindSafe_F.
      Definition Self (R F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ F ].
      
      (*     type Output = R; *)
      Definition _Output (R F : Ty.t) : Ty.t := R.
      
      (*
          extern "rust-call" fn call_once(self, _args: ()) -> R {
              (self.0)()
          }
      *)
      Definition call_once (R F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self R F in
        match τ, α with
        | [], [ self; _args ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _args := M.alloc (| _args |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnOnce",
                F,
                [ Ty.tuple [] ],
                "call_once",
                []
              |),
              [
                M.read (|
                  M.SubPointer.get_struct_tuple_field (|
                    self,
                    "core::panic::unwind_safe::AssertUnwindSafe",
                    0
                  |)
                |);
                Value.Tuple []
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (R F : Ty.t),
        M.IsTraitInstance
          "core::ops::function::FnOnce"
          (Self R F)
          (* Trait polymorphic types *) [ (* Args *) Ty.tuple [] ]
          (* Instance *)
          [
            ("Output", InstanceField.Ty (_Output R F));
            ("call_once", InstanceField.Method (call_once R F))
          ].
    End Impl_core_ops_function_FnOnce_where_core_ops_function_FnOnce_F_Tuple__Tuple__for_core_panic_unwind_safe_AssertUnwindSafe_F.
    
    Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      (*
          fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
              f.debug_tuple("AssertUnwindSafe").field(&self.0).finish()
          }
      *)
      Definition fmt (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::builders::DebugTuple",
                "finish",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::fmt::builders::DebugTuple",
                    "field",
                    []
                  |),
                  [
                    M.alloc (|
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "core::fmt::Formatter",
                          "debug_tuple",
                          []
                        |),
                        [ M.read (| f |); M.read (| Value.String "AssertUnwindSafe" |) ]
                      |)
                    |);
                    (* Unsize *)
                    M.pointer_coercion
                      (M.SubPointer.get_struct_tuple_field (|
                        M.read (| self |),
                        "core::panic::unwind_safe::AssertUnwindSafe",
                        0
                      |))
                  ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt T)) ].
    End Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_default_Default_where_core_default_Default_T_for_core_panic_unwind_safe_AssertUnwindSafe_T.
      Definition Self (T : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ T ].
      
      (*
          fn default() -> Self {
              Self(Default::default())
          }
      *)
      Definition default (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (Value.StructTuple
              "core::panic::unwind_safe::AssertUnwindSafe"
              [
                M.call_closure (|
                  M.get_trait_method (| "core::default::Default", T, [], "default", [] |),
                  []
                |)
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::default::Default"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("default", InstanceField.Method (default T)) ].
    End Impl_core_default_Default_where_core_default_Default_T_for_core_panic_unwind_safe_AssertUnwindSafe_T.
    
    Module Impl_core_future_future_Future_where_core_future_future_Future_F_for_core_panic_unwind_safe_AssertUnwindSafe_F.
      Definition Self (F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ F ].
      
      (*     type Output = F::Output; *)
      Definition _Output (F : Ty.t) : Ty.t := Ty.associated.
      
      (*
          fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
              // SAFETY: pin projection. AssertUnwindSafe follows structural pinning.
              let pinned_field = unsafe { Pin::map_unchecked_mut(self, |x| &mut x.0) };
              F::poll(pinned_field, cx)
          }
      *)
      Definition poll (F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self F in
        match τ, α with
        | [], [ self; cx ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let cx := M.alloc (| cx |) in
            M.read (|
              let~ pinned_field :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::pin::Pin")
                        [
                          Ty.apply
                            (Ty.path "&mut")
                            [ Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ F ]
                            ]
                        ],
                      "map_unchecked_mut",
                      [
                        F;
                        Ty.function
                          [
                            Ty.tuple
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  [
                                    Ty.apply
                                      (Ty.path "core::panic::unwind_safe::AssertUnwindSafe")
                                      [ F ]
                                  ]
                              ]
                          ]
                          (Ty.apply (Ty.path "&mut") [ F ])
                      ]
                    |),
                    [
                      M.read (| self |);
                      M.closure
                        (fun γ =>
                          ltac:(M.monadic
                            match γ with
                            | [ α0 ] =>
                              M.match_operator (|
                                M.alloc (| α0 |),
                                [
                                  fun γ =>
                                    ltac:(M.monadic
                                      (let x := M.copy (| γ |) in
                                      M.SubPointer.get_struct_tuple_field (|
                                        M.read (| x |),
                                        "core::panic::unwind_safe::AssertUnwindSafe",
                                        0
                                      |)))
                                ]
                              |)
                            | _ => M.impossible (||)
                            end))
                    ]
                  |)
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "core::future::future::Future", F, [], "poll", [] |),
                  [ M.read (| pinned_field |); M.read (| cx |) ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (F : Ty.t),
        M.IsTraitInstance
          "core::future::future::Future"
          (Self F)
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Output", InstanceField.Ty (_Output F)); ("poll", InstanceField.Method (poll F)) ].
    End Impl_core_future_future_Future_where_core_future_future_Future_F_for_core_panic_unwind_safe_AssertUnwindSafe_F.
    
    Module Impl_core_async_iter_async_iter_AsyncIterator_where_core_async_iter_async_iter_AsyncIterator_S_for_core_panic_unwind_safe_AssertUnwindSafe_S.
      Definition Self (S : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ S ].
      
      (*     type Item = S::Item; *)
      Definition _Item (S : Ty.t) : Ty.t := Ty.associated.
      
      (*
          fn poll_next(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Option<S::Item>> {
              // SAFETY: pin projection. AssertUnwindSafe follows structural pinning.
              unsafe { self.map_unchecked_mut(|x| &mut x.0) }.poll_next(cx)
          }
      *)
      Definition poll_next (S : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self S in
        match τ, α with
        | [], [ self; cx ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let cx := M.alloc (| cx |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::async_iter::async_iter::AsyncIterator",
                S,
                [],
                "poll_next",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "core::pin::Pin")
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          [ Ty.apply (Ty.path "core::panic::unwind_safe::AssertUnwindSafe") [ S ] ]
                      ],
                    "map_unchecked_mut",
                    [
                      S;
                      Ty.function
                        [
                          Ty.tuple
                            [
                              Ty.apply
                                (Ty.path "&mut")
                                [
                                  Ty.apply
                                    (Ty.path "core::panic::unwind_safe::AssertUnwindSafe")
                                    [ S ]
                                ]
                            ]
                        ]
                        (Ty.apply (Ty.path "&mut") [ S ])
                    ]
                  |),
                  [
                    M.read (| self |);
                    M.closure
                      (fun γ =>
                        ltac:(M.monadic
                          match γ with
                          | [ α0 ] =>
                            M.match_operator (|
                              M.alloc (| α0 |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let x := M.copy (| γ |) in
                                    M.SubPointer.get_struct_tuple_field (|
                                      M.read (| x |),
                                      "core::panic::unwind_safe::AssertUnwindSafe",
                                      0
                                    |)))
                              ]
                            |)
                          | _ => M.impossible (||)
                          end))
                  ]
                |);
                M.read (| cx |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn size_hint(&self) -> (usize, Option<usize>) {
              self.0.size_hint()
          }
      *)
      Definition size_hint (S : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self S in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::async_iter::async_iter::AsyncIterator",
                S,
                [],
                "size_hint",
                []
              |),
              [
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "core::panic::unwind_safe::AssertUnwindSafe",
                  0
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (S : Ty.t),
        M.IsTraitInstance
          "core::async_iter::async_iter::AsyncIterator"
          (Self S)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Item", InstanceField.Ty (_Item S));
            ("poll_next", InstanceField.Method (poll_next S));
            ("size_hint", InstanceField.Method (size_hint S))
          ].
    End Impl_core_async_iter_async_iter_AsyncIterator_where_core_async_iter_async_iter_AsyncIterator_S_for_core_panic_unwind_safe_AssertUnwindSafe_S.
  End unwind_safe.
End panic.
