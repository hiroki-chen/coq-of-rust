(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module iter.
  Module sources.
    Module from_coroutine.
      (*
      pub fn from_coroutine<G: Coroutine<Return = ()> + Unpin>(coroutine: G) -> FromCoroutine<G> {
          FromCoroutine(coroutine)
      }
      *)
      Definition from_coroutine (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [ G ], [ coroutine ] =>
          ltac:(M.monadic
            (let coroutine := M.alloc (| coroutine |) in
            Value.StructTuple
              "core::iter::sources::from_coroutine::FromCoroutine"
              [ M.read (| coroutine |) ]))
        | _, _ => M.impossible
        end.
      
      Axiom Function_from_coroutine :
        M.IsFunction "core::iter::sources::from_coroutine::from_coroutine" from_coroutine.
      
      (* StructTuple
        {
          name := "FromCoroutine";
          ty_params := [ "G" ];
          fields := [ G ];
        } *)
      
      Module Impl_core_clone_Clone_where_core_clone_Clone_G_for_core_iter_sources_from_coroutine_FromCoroutine_G.
        Definition Self (G : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::from_coroutine::FromCoroutine") [ G ].
        
        (* Clone *)
        Definition clone (G : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self G in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructTuple
                "core::iter::sources::from_coroutine::FromCoroutine"
                [
                  M.call_closure (|
                    M.get_trait_method (| "core::clone::Clone", G, [], "clone", [] |),
                    [
                      M.SubPointer.get_struct_tuple_field (|
                        M.read (| self |),
                        "core::iter::sources::from_coroutine::FromCoroutine",
                        0
                      |)
                    ]
                  |)
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (G : Ty.t),
          M.IsTraitInstance
            "core::clone::Clone"
            (Self G)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("clone", InstanceField.Method (clone G)) ].
      End Impl_core_clone_Clone_where_core_clone_Clone_G_for_core_iter_sources_from_coroutine_FromCoroutine_G.
      
      Module Impl_core_iter_traits_iterator_Iterator_where_core_ops_coroutine_Coroutine_G_where_core_marker_Unpin_G_for_core_iter_sources_from_coroutine_FromCoroutine_G.
        Definition Self (G : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::from_coroutine::FromCoroutine") [ G ].
        
        (*     type Item = G::Yield; *)
        Definition _Item (G : Ty.t) : Ty.t := Ty.associated.
        
        (*
            fn next(&mut self) -> Option<Self::Item> {
                match Pin::new(&mut self.0).resume(()) {
                    CoroutineState::Yielded(n) => Some(n),
                    CoroutineState::Complete(()) => None,
                }
            }
        *)
        Definition next (G : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self G in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::coroutine::Coroutine",
                        G,
                        [ Ty.tuple [] ],
                        "resume",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "core::pin::Pin") [ Ty.apply (Ty.path "&mut") [ G ] ],
                            "new",
                            []
                          |),
                          [
                            M.SubPointer.get_struct_tuple_field (|
                              M.read (| self |),
                              "core::iter::sources::from_coroutine::FromCoroutine",
                              0
                            |)
                          ]
                        |);
                        Value.Tuple []
                      ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::coroutine::CoroutineState::Yielded",
                            0
                          |) in
                        let n := M.copy (| γ0_0 |) in
                        M.alloc (|
                          Value.StructTuple "core::option::Option::Some" [ M.read (| n |) ]
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::coroutine::CoroutineState::Complete",
                            0
                          |) in
                        M.alloc (| Value.StructTuple "core::option::Option::None" [] |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (G : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::iterator::Iterator"
            (Self G)
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("Item", InstanceField.Ty (_Item G)); ("next", InstanceField.Method (next G)) ].
      End Impl_core_iter_traits_iterator_Iterator_where_core_ops_coroutine_Coroutine_G_where_core_marker_Unpin_G_for_core_iter_sources_from_coroutine_FromCoroutine_G.
      
      Module Impl_core_fmt_Debug_for_core_iter_sources_from_coroutine_FromCoroutine_G.
        Definition Self (G : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::from_coroutine::FromCoroutine") [ G ].
        
        (*
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.debug_struct("FromCoroutine").finish()
            }
        *)
        Definition fmt (G : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self G in
          match τ, α with
          | [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::builders::DebugStruct",
                  "finish",
                  []
                |),
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "debug_struct",
                        []
                      |),
                      [ M.read (| f |); M.read (| Value.String "FromCoroutine" |) ]
                    |)
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (G : Ty.t),
          M.IsTraitInstance
            "core::fmt::Debug"
            (Self G)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method (fmt G)) ].
      End Impl_core_fmt_Debug_for_core_iter_sources_from_coroutine_FromCoroutine_G.
    End from_coroutine.
  End sources.
End iter.
