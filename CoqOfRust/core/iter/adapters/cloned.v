(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module iter.
  Module adapters.
    Module cloned.
      (* StructRecord
        {
          name := "Cloned";
          ty_params := [ "I" ];
          fields := [ ("it", I) ];
        } *)
      
      Module Impl_core_clone_Clone_where_core_clone_Clone_I_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (* Clone *)
        Definition clone (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructRecord
                "core::iter::adapters::cloned::Cloned"
                [
                  ("it",
                    M.call_closure (|
                      M.get_trait_method (| "core::clone::Clone", I, [], "clone", [] |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::cloned::Cloned",
                          "it"
                        |)
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
      End Impl_core_clone_Clone_where_core_clone_Clone_I_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
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
                  M.read (| Value.String "Cloned" |);
                  M.read (| Value.String "it" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.alloc (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::iter::adapters::cloned::Cloned",
                        "it"
                      |)
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
      End Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*
            pub(in crate::iter) fn new(it: I) -> Cloned<I> {
                Cloned { it }
            }
        *)
        Definition new (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I in
          match τ, α with
          | [], [ it ] =>
            ltac:(M.monadic
              (let it := M.alloc (| it |) in
              Value.StructRecord
                "core::iter::adapters::cloned::Cloned"
                [ ("it", M.read (| it |)) ]))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_new :
          forall (I : Ty.t),
          M.IsAssociatedFunction (Self I) "new" (new I).
      End Impl_core_iter_adapters_cloned_Cloned_I.
      
      (*
      fn clone_try_fold<T: Clone, Acc, R>(mut f: impl FnMut(Acc, T) -> R) -> impl FnMut(Acc, &T) -> R {
          move |acc, elt| f(acc, elt.clone())
      }
      *)
      Definition clone_try_fold (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [ T; Acc; R; impl_FnMut_Acc__T__arrow_R ], [ f ] =>
          ltac:(M.monadic
            (let f := M.alloc (| f |) in
            M.closure
              (fun γ =>
                ltac:(M.monadic
                  match γ with
                  | [ α0; α1 ] =>
                    M.match_operator (|
                      M.alloc (| α0 |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let acc := M.copy (| γ |) in
                            M.match_operator (|
                              M.alloc (| α1 |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let elt := M.copy (| γ |) in
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::function::FnMut",
                                        impl_FnMut_Acc__T__arrow_R,
                                        [ Ty.tuple [ Acc; T ] ],
                                        "call_mut",
                                        []
                                      |),
                                      [
                                        f;
                                        Value.Tuple
                                          [
                                            M.read (| acc |);
                                            M.call_closure (|
                                              M.get_trait_method (|
                                                "core::clone::Clone",
                                                T,
                                                [],
                                                "clone",
                                                []
                                              |),
                                              [ M.read (| elt |) ]
                                            |)
                                          ]
                                      ]
                                    |)))
                              ]
                            |)))
                      ]
                    |)
                  | _ => M.impossible (||)
                  end))))
        | _, _ => M.impossible
        end.
      
      Module clone_try_fold.
        (* Error OpaqueTy *)
      End clone_try_fold.
      
      Module Impl_core_iter_traits_iterator_Iterator_where_core_iter_traits_iterator_Iterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*     type Item = T; *)
        Definition _Item (I T : Ty.t) : Ty.t := T.
        
        (*
            fn next(&mut self) -> Option<T> {
                self.it.next().cloned()
            }
        *)
        Definition next (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::option::Option") [ Ty.apply (Ty.path "&") [ T ] ],
                  "cloned",
                  []
                |),
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
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::iter::adapters::cloned::Cloned",
                        "it"
                      |)
                    ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn size_hint(&self) -> (usize, Option<usize>) {
                self.it.size_hint()
            }
        *)
        Definition size_hint (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
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
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::cloned::Cloned",
                    "it"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn try_fold<B, F, R>(&mut self, init: B, f: F) -> R
            where
                Self: Sized,
                F: FnMut(B, Self::Item) -> R,
                R: Try<Output = B>,
            {
                self.it.try_fold(init, clone_try_fold(f))
            }
        *)
        Definition try_fold (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [ B; F; R ], [ self; init; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::iterator::Iterator",
                  I,
                  [],
                  "try_fold",
                  [ B; Ty.associated; R ]
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::cloned::Cloned",
                    "it"
                  |);
                  M.read (| init |);
                  M.call_closure (|
                    M.get_function (|
                      "core::iter::adapters::cloned::clone_try_fold",
                      [ T; B; R; F ]
                    |),
                    [ M.read (| f |) ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn fold<Acc, F>(self, init: Acc, f: F) -> Acc
            where
                F: FnMut(Acc, Self::Item) -> Acc,
            {
                self.it.map(T::clone).fold(init, f)
            }
        *)
        Definition fold (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [ Acc; F ], [ self; init; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::iterator::Iterator",
                  Ty.apply
                    (Ty.path "core::iter::adapters::map::Map")
                    [ I; Ty.function [ Ty.apply (Ty.path "&") [ T ] ] T ],
                  [],
                  "fold",
                  [ Acc; F ]
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::iterator::Iterator",
                      I,
                      [],
                      "map",
                      [ T; Ty.function [ Ty.apply (Ty.path "&") [ T ] ] T ]
                    |),
                    [
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          self,
                          "core::iter::adapters::cloned::Cloned",
                          "it"
                        |)
                      |);
                      M.get_trait_method (| "core::clone::Clone", T, [], "clone", [] |)
                    ]
                  |);
                  M.read (| init |);
                  M.read (| f |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            unsafe fn __iterator_get_unchecked(&mut self, idx: usize) -> T
            where
                Self: TrustedRandomAccessNoCoerce,
            {
                // SAFETY: the caller must uphold the contract for
                // `Iterator::__iterator_get_unchecked`.
                unsafe { try_get_unchecked(&mut self.it, idx).clone() }
            }
        *)
        Definition __iterator_get_unchecked (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self; idx ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let idx := M.alloc (| idx |) in
              M.call_closure (|
                M.get_trait_method (| "core::clone::Clone", T, [], "clone", [] |),
                [
                  M.call_closure (|
                    M.get_function (| "core::iter::adapters::zip::try_get_unchecked", [ I ] |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::iter::adapters::cloned::Cloned",
                        "it"
                      |);
                      M.read (| idx |)
                    ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::iterator::Iterator"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("Item", InstanceField.Ty (_Item I T));
              ("next", InstanceField.Method (next I T));
              ("size_hint", InstanceField.Method (size_hint I T));
              ("try_fold", InstanceField.Method (try_fold I T));
              ("fold", InstanceField.Method (fold I T));
              ("__iterator_get_unchecked", InstanceField.Method (__iterator_get_unchecked I T))
            ].
      End Impl_core_iter_traits_iterator_Iterator_where_core_iter_traits_iterator_Iterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_traits_double_ended_DoubleEndedIterator_where_core_iter_traits_double_ended_DoubleEndedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*
            fn next_back(&mut self) -> Option<T> {
                self.it.next_back().cloned()
            }
        *)
        Definition next_back (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::option::Option") [ Ty.apply (Ty.path "&") [ T ] ],
                  "cloned",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::double_ended::DoubleEndedIterator",
                      I,
                      [],
                      "next_back",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "core::iter::adapters::cloned::Cloned",
                        "it"
                      |)
                    ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn try_rfold<B, F, R>(&mut self, init: B, f: F) -> R
            where
                Self: Sized,
                F: FnMut(B, Self::Item) -> R,
                R: Try<Output = B>,
            {
                self.it.try_rfold(init, clone_try_fold(f))
            }
        *)
        Definition try_rfold (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [ B; F; R ], [ self; init; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::double_ended::DoubleEndedIterator",
                  I,
                  [],
                  "try_rfold",
                  [ B; Ty.associated; R ]
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::cloned::Cloned",
                    "it"
                  |);
                  M.read (| init |);
                  M.call_closure (|
                    M.get_function (|
                      "core::iter::adapters::cloned::clone_try_fold",
                      [ T; B; R; F ]
                    |),
                    [ M.read (| f |) ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn rfold<Acc, F>(self, init: Acc, f: F) -> Acc
            where
                F: FnMut(Acc, Self::Item) -> Acc,
            {
                self.it.map(T::clone).rfold(init, f)
            }
        *)
        Definition rfold (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [ Acc; F ], [ self; init; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::double_ended::DoubleEndedIterator",
                  Ty.apply
                    (Ty.path "core::iter::adapters::map::Map")
                    [ I; Ty.function [ Ty.apply (Ty.path "&") [ T ] ] T ],
                  [],
                  "rfold",
                  [ Acc; F ]
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::iterator::Iterator",
                      I,
                      [],
                      "map",
                      [ T; Ty.function [ Ty.apply (Ty.path "&") [ T ] ] T ]
                    |),
                    [
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          self,
                          "core::iter::adapters::cloned::Cloned",
                          "it"
                        |)
                      |);
                      M.get_trait_method (| "core::clone::Clone", T, [], "clone", [] |)
                    ]
                  |);
                  M.read (| init |);
                  M.read (| f |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::double_ended::DoubleEndedIterator"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("next_back", InstanceField.Method (next_back I T));
              ("try_rfold", InstanceField.Method (try_rfold I T));
              ("rfold", InstanceField.Method (rfold I T))
            ].
      End Impl_core_iter_traits_double_ended_DoubleEndedIterator_where_core_iter_traits_double_ended_DoubleEndedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_traits_exact_size_ExactSizeIterator_where_core_iter_traits_exact_size_ExactSizeIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*
            fn len(&self) -> usize {
                self.it.len()
            }
        *)
        Definition len (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::exact_size::ExactSizeIterator",
                  I,
                  [],
                  "len",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::cloned::Cloned",
                    "it"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn is_empty(&self) -> bool {
                self.it.is_empty()
            }
        *)
        Definition is_empty (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::exact_size::ExactSizeIterator",
                  I,
                  [],
                  "is_empty",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::cloned::Cloned",
                    "it"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::exact_size::ExactSizeIterator"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("len", InstanceField.Method (len I T));
              ("is_empty", InstanceField.Method (is_empty I T))
            ].
      End Impl_core_iter_traits_exact_size_ExactSizeIterator_where_core_iter_traits_exact_size_ExactSizeIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_traits_marker_FusedIterator_where_core_iter_traits_marker_FusedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::FusedIterator"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_traits_marker_FusedIterator_where_core_iter_traits_marker_FusedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_adapters_zip_TrustedRandomAccess_where_core_iter_adapters_zip_TrustedRandomAccess_I_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        Axiom Implements :
          forall (I : Ty.t),
          M.IsTraitInstance
            "core::iter::adapters::zip::TrustedRandomAccess"
            (Self I)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_adapters_zip_TrustedRandomAccess_where_core_iter_adapters_zip_TrustedRandomAccess_I_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_adapters_zip_TrustedRandomAccessNoCoerce_where_core_iter_adapters_zip_TrustedRandomAccessNoCoerce_I_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*     const MAY_HAVE_SIDE_EFFECT: bool = true; *)
        (* Ty.path "bool" *)
        Definition value_MAY_HAVE_SIDE_EFFECT (I : Ty.t) : Value.t :=
          let Self : Ty.t := Self I in
          M.run ltac:(M.monadic (M.alloc (| Value.Bool true |))).
        
        Axiom Implements :
          forall (I : Ty.t),
          M.IsTraitInstance
            "core::iter::adapters::zip::TrustedRandomAccessNoCoerce"
            (Self I)
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("value_MAY_HAVE_SIDE_EFFECT", InstanceField.Constant (value_MAY_HAVE_SIDE_EFFECT I))
            ].
      End Impl_core_iter_adapters_zip_TrustedRandomAccessNoCoerce_where_core_iter_adapters_zip_TrustedRandomAccessNoCoerce_I_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_traits_marker_TrustedLen_where_core_iter_traits_marker_TrustedLen_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::TrustedLen"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_traits_marker_TrustedLen_where_core_iter_traits_marker_TrustedLen_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_iter_traits_unchecked_iterator_UncheckedIterator_where_core_iter_traits_unchecked_iterator_UncheckedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I T : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*
            unsafe fn next_unchecked(&mut self) -> T {
                // SAFETY: `Cloned` is 1:1 with the inner iterator, so if the caller promised
                // that there's an element left, the inner iterator has one too.
                let item = unsafe { self.it.next_unchecked() };
                item.clone()
            }
        *)
        Definition next_unchecked (I T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I T in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                let item :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::unchecked_iterator::UncheckedIterator",
                        I,
                        [],
                        "next_unchecked",
                        []
                      |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::cloned::Cloned",
                          "it"
                        |)
                      ]
                    |)
                  |) in
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (| "core::clone::Clone", T, [], "clone", [] |),
                    [ M.read (| item |) ]
                  |)
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I T : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::unchecked_iterator::UncheckedIterator"
            (Self I T)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("next_unchecked", InstanceField.Method (next_unchecked I T)) ].
      End Impl_core_iter_traits_unchecked_iterator_UncheckedIterator_where_core_iter_traits_unchecked_iterator_UncheckedIterator_I_where_core_clone_Clone_T_for_core_iter_adapters_cloned_Cloned_I.
      
      Module Impl_core_default_Default_where_core_default_Default_I_for_core_iter_adapters_cloned_Cloned_I.
        Definition Self (I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ].
        
        (*
            fn default() -> Self {
                Self::new(Default::default())
            }
        *)
        Definition default (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I in
          match τ, α with
          | [], [] =>
            ltac:(M.monadic
              (M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "core::iter::adapters::cloned::Cloned") [ I ],
                  "new",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (| "core::default::Default", I, [], "default", [] |),
                    []
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I : Ty.t),
          M.IsTraitInstance
            "core::default::Default"
            (Self I)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("default", InstanceField.Method (default I)) ].
      End Impl_core_default_Default_where_core_default_Default_I_for_core_iter_adapters_cloned_Cloned_I.
    End cloned.
  End adapters.
End iter.
