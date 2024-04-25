(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module iter.
  Module sources.
    Module successors.
      (*
      pub fn successors<T, F>(first: Option<T>, succ: F) -> Successors<T, F>
      where
          F: FnMut(&T) -> Option<T>,
      {
          // If this function returned `impl Iterator<Item=T>`
          // it could be based on `from_fn` and not need a dedicated type.
          // However having a named `Successors<T, F>` type allows it to be `Clone` when `T` and `F` are.
          Successors { next: first, succ }
      }
      *)
      Definition successors (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [ T; F ], [ first; succ ] =>
          ltac:(M.monadic
            (let first := M.alloc (| first |) in
            let succ := M.alloc (| succ |) in
            Value.StructRecord
              "core::iter::sources::successors::Successors"
              [ ("next", M.read (| first |)); ("succ", M.read (| succ |)) ]))
        | _, _ => M.impossible
        end.
      
      (* StructRecord
        {
          name := "Successors";
          ty_params := [ "T"; "F" ];
          fields := [ ("next", Ty.apply (Ty.path "core::option::Option") [ T ]); ("succ", F) ];
        } *)
      
      Module Impl_core_clone_Clone_where_core_clone_Clone_T_where_core_clone_Clone_F_for_core_iter_sources_successors_Successors_T_F.
        Definition Self (T F : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::successors::Successors") [ T; F ].
        
        (* Clone *)
        Definition clone (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T F in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructRecord
                "core::iter::sources::successors::Successors"
                [
                  ("next",
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::clone::Clone",
                        Ty.apply (Ty.path "core::option::Option") [ T ],
                        [],
                        "clone",
                        []
                      |),
                      [
                        M.get_struct_record_field
                          (M.read (| self |))
                          "core::iter::sources::successors::Successors"
                          "next"
                      ]
                    |));
                  ("succ",
                    M.call_closure (|
                      M.get_trait_method (| "core::clone::Clone", F, [], "clone", [] |),
                      [
                        M.get_struct_record_field
                          (M.read (| self |))
                          "core::iter::sources::successors::Successors"
                          "succ"
                      ]
                    |))
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (T F : Ty.t),
          M.IsTraitInstance
            "core::clone::Clone"
            (Self T F)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("clone", InstanceField.Method (clone T F)) ].
      End Impl_core_clone_Clone_where_core_clone_Clone_T_where_core_clone_Clone_F_for_core_iter_sources_successors_Successors_T_F.
      
      Module Impl_core_iter_traits_iterator_Iterator_where_core_ops_function_FnMut_F_Tuple_ref__T__for_core_iter_sources_successors_Successors_T_F.
        Definition Self (T F : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::successors::Successors") [ T; F ].
        
        (*     type Item = T; *)
        Definition _Item (T F : Ty.t) : Ty.t := T.
        
        (*
            fn next(&mut self) -> Option<Self::Item> {
                let item = self.next.take()?;
                self.next = (self.succ)(&item);
                Some(item)
            }
        *)
        Definition next (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T F in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.catch_return (|
                ltac:(M.monadic
                  (M.read (|
                    let item :=
                      M.copy (|
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::try_trait::Try",
                                Ty.apply (Ty.path "core::option::Option") [ T ],
                                [],
                                "branch",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.apply (Ty.path "core::option::Option") [ T ],
                                    "take",
                                    []
                                  |),
                                  [
                                    M.get_struct_record_field
                                      (M.read (| self |))
                                      "core::iter::sources::successors::Successors"
                                      "next"
                                  ]
                                |)
                              ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.get_struct_tuple_field_or_break_match (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Break",
                                    0
                                  |) in
                                let residual := M.copy (| γ0_0 |) in
                                M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      M.return_ (|
                                        M.call_closure (|
                                          M.get_trait_method (|
                                            "core::ops::try_trait::FromResidual",
                                            Ty.apply (Ty.path "core::option::Option") [ T ],
                                            [
                                              Ty.apply
                                                (Ty.path "core::option::Option")
                                                [ Ty.path "core::convert::Infallible" ]
                                            ],
                                            "from_residual",
                                            []
                                          |),
                                          [ M.read (| residual |) ]
                                        |)
                                      |)
                                    |)
                                  |)
                                |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.get_struct_tuple_field_or_break_match (|
                                    γ,
                                    "core::ops::control_flow::ControlFlow::Continue",
                                    0
                                  |) in
                                let val := M.copy (| γ0_0 |) in
                                val))
                          ]
                        |)
                      |) in
                    let _ :=
                      M.write (|
                        M.get_struct_record_field
                          (M.read (| self |))
                          "core::iter::sources::successors::Successors"
                          "next",
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::function::FnMut",
                            F,
                            [ Ty.tuple [ Ty.apply (Ty.path "&") [ T ] ] ],
                            "call_mut",
                            []
                          |),
                          [
                            M.get_struct_record_field
                              (M.read (| self |))
                              "core::iter::sources::successors::Successors"
                              "succ";
                            Value.Tuple [ item ]
                          ]
                        |)
                      |) in
                    M.alloc (|
                      Value.StructTuple "core::option::Option::Some" [ M.read (| item |) ]
                    |)
                  |)))
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn size_hint(&self) -> (usize, Option<usize>) {
                if self.next.is_some() { (1, None) } else { (0, Some(0)) }
            }
        *)
        Definition size_hint (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T F in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.apply (Ty.path "core::option::Option") [ T ],
                                  "is_some",
                                  []
                                |),
                                [
                                  M.get_struct_record_field
                                    (M.read (| self |))
                                    "core::iter::sources::successors::Successors"
                                    "next"
                                ]
                              |)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          Value.Tuple
                            [
                              Value.Integer Integer.Usize 1;
                              Value.StructTuple "core::option::Option::None" []
                            ]
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (M.alloc (|
                          Value.Tuple
                            [
                              Value.Integer Integer.Usize 0;
                              Value.StructTuple
                                "core::option::Option::Some"
                                [ Value.Integer Integer.Usize 0 ]
                            ]
                        |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (T F : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::iterator::Iterator"
            (Self T F)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("Item", InstanceField.Ty (_Item T F));
              ("next", InstanceField.Method (next T F));
              ("size_hint", InstanceField.Method (size_hint T F))
            ].
      End Impl_core_iter_traits_iterator_Iterator_where_core_ops_function_FnMut_F_Tuple_ref__T__for_core_iter_sources_successors_Successors_T_F.
      
      Module Impl_core_iter_traits_marker_FusedIterator_where_core_ops_function_FnMut_F_Tuple_ref__T__for_core_iter_sources_successors_Successors_T_F.
        Definition Self (T F : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::successors::Successors") [ T; F ].
        
        Axiom Implements :
          forall (T F : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::FusedIterator"
            (Self T F)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_traits_marker_FusedIterator_where_core_ops_function_FnMut_F_Tuple_ref__T__for_core_iter_sources_successors_Successors_T_F.
      
      Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_iter_sources_successors_Successors_T_F.
        Definition Self (T F : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::sources::successors::Successors") [ T; F ].
        
        (*
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.debug_struct("Successors").field("next", &self.next).finish()
            }
        *)
        Definition fmt (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self T F in
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
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::builders::DebugStruct",
                      "field",
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
                          [ M.read (| f |); M.read (| Value.String "Successors" |) ]
                        |)
                      |);
                      M.read (| Value.String "next" |);
                      (* Unsize *)
                      M.pointer_coercion
                        (M.get_struct_record_field
                          (M.read (| self |))
                          "core::iter::sources::successors::Successors"
                          "next")
                    ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (T F : Ty.t),
          M.IsTraitInstance
            "core::fmt::Debug"
            (Self T F)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method (fmt T F)) ].
      End Impl_core_fmt_Debug_where_core_fmt_Debug_T_for_core_iter_sources_successors_Successors_T_F.
    End successors.
  End sources.
End iter.
