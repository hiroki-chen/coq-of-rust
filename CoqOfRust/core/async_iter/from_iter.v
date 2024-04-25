(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module async_iter.
  Module from_iter.
    (* StructRecord
      {
        name := "FromIter";
        ty_params := [ "I" ];
        fields := [ ("iter", I) ];
      } *)
    
    Module Impl_core_clone_Clone_where_core_clone_Clone_I_for_core_async_iter_from_iter_FromIter_I.
      Definition Self (I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::async_iter::from_iter::FromIter") [ I ].
      
      (* Clone *)
      Definition clone (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self I in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructRecord
              "core::async_iter::from_iter::FromIter"
              [
                ("iter",
                  M.call_closure (|
                    M.get_trait_method (| "core::clone::Clone", I, [], "clone", [] |),
                    [
                      M.get_struct_record_field
                        (M.read (| self |))
                        "core::async_iter::from_iter::FromIter"
                        "iter"
                    ]
                  |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (I : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self I)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone I)) ].
    End Impl_core_clone_Clone_where_core_clone_Clone_I_for_core_async_iter_from_iter_FromIter_I.
    
    Module Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_async_iter_from_iter_FromIter_I.
      Definition Self (I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::async_iter::from_iter::FromIter") [ I ].
      
      (* Debug *)
      Definition fmt (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self I in
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::Formatter",
                "debug_struct_field1_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "FromIter" |);
                M.read (| Value.String "iter" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "core::async_iter::from_iter::FromIter"
                      "iter"
                  |))
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (I : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self I)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt I)) ].
    End Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_async_iter_from_iter_FromIter_I.
    
    Module Impl_core_marker_Unpin_for_core_async_iter_from_iter_FromIter_I.
      Definition Self (I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::async_iter::from_iter::FromIter") [ I ].
      
      Axiom Implements :
        forall (I : Ty.t),
        M.IsTraitInstance
          "core::marker::Unpin"
          (Self I)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Unpin_for_core_async_iter_from_iter_FromIter_I.
    
    (*
    pub fn from_iter<I: IntoIterator>(iter: I) -> FromIter<I::IntoIter> {
        FromIter { iter: iter.into_iter() }
    }
    *)
    Definition from_iter (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ _ as I ], [ iter ] =>
        ltac:(M.monadic
          (let iter := M.alloc (| iter |) in
          Value.StructRecord
            "core::async_iter::from_iter::FromIter"
            [
              ("iter",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::collect::IntoIterator",
                    I,
                    [],
                    "into_iter",
                    []
                  |),
                  [ M.read (| iter |) ]
                |))
            ]))
      | _, _ => M.impossible
      end.
    
    Module Impl_core_async_iter_async_iter_AsyncIterator_where_core_iter_traits_iterator_Iterator_I_for_core_async_iter_from_iter_FromIter_I.
      Definition Self (I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::async_iter::from_iter::FromIter") [ I ].
      
      (*     type Item = I::Item; *)
      Definition _Item (I : Ty.t) : Ty.t := Ty.associated.
      
      (*
          fn poll_next(mut self: Pin<&mut Self>, _cx: &mut Context<'_>) -> Poll<Option<Self::Item>> {
              Poll::Ready(self.iter.next())
          }
      *)
      Definition poll_next (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self I in
        match τ, α with
        | [], [ self; _cx ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _cx := M.alloc (| _cx |) in
            Value.StructTuple
              "core::task::poll::Poll::Ready"
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::iterator::Iterator",
                    I,
                    [],
                    "next",
                    []
                  |),
                  [
                    M.get_struct_record_field
                      (M.call_closure (|
                        M.get_trait_method (|
                          "core::ops::deref::DerefMut",
                          Ty.apply
                            (Ty.path "core::pin::Pin")
                            [
                              Ty.apply
                                (Ty.path "&mut")
                                [ Ty.apply (Ty.path "core::async_iter::from_iter::FromIter") [ I ] ]
                            ],
                          [],
                          "deref_mut",
                          []
                        |),
                        [ self ]
                      |))
                      "core::async_iter::from_iter::FromIter"
                      "iter"
                  ]
                |)
              ]))
        | _, _ => M.impossible
        end.
      
      (*
          fn size_hint(&self) -> (usize, Option<usize>) {
              self.iter.size_hint()
          }
      *)
      Definition size_hint (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self I in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                I,
                [],
                "size_hint",
                []
              |),
              [
                M.get_struct_record_field
                  (M.read (| self |))
                  "core::async_iter::from_iter::FromIter"
                  "iter"
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (I : Ty.t),
        M.IsTraitInstance
          "core::async_iter::async_iter::AsyncIterator"
          (Self I)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Item", InstanceField.Ty (_Item I));
            ("poll_next", InstanceField.Method (poll_next I));
            ("size_hint", InstanceField.Method (size_hint I))
          ].
    End Impl_core_async_iter_async_iter_AsyncIterator_where_core_iter_traits_iterator_Iterator_I_for_core_async_iter_from_iter_FromIter_I.
  End from_iter.
End async_iter.
