(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module iter.
  Module adapters.
    Module take_while.
      (* StructRecord
        {
          name := "TakeWhile";
          ty_params := [ "I"; "P" ];
          fields := [ ("iter", I); ("flag", Ty.path "bool"); ("predicate", P) ];
        } *)
      
      Module Impl_core_clone_Clone_where_core_clone_Clone_I_where_core_clone_Clone_P_for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        (* Clone *)
        Definition clone (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructRecord
                "core::iter::adapters::take_while::TakeWhile"
                [
                  ("iter",
                    M.call_closure (|
                      M.get_trait_method (| "core::clone::Clone", I, [], "clone", [] |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::take_while::TakeWhile",
                          "iter"
                        |)
                      ]
                    |));
                  ("flag",
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::clone::Clone",
                        Ty.path "bool",
                        [],
                        "clone",
                        []
                      |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::take_while::TakeWhile",
                          "flag"
                        |)
                      ]
                    |));
                  ("predicate",
                    M.call_closure (|
                      M.get_trait_method (| "core::clone::Clone", P, [], "clone", [] |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::take_while::TakeWhile",
                          "predicate"
                        |)
                      ]
                    |))
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I P : Ty.t),
          M.IsTraitInstance
            "core::clone::Clone"
            (Self I P)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("clone", InstanceField.Method (clone I P)) ].
      End Impl_core_clone_Clone_where_core_clone_Clone_I_where_core_clone_Clone_P_for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        (*
            pub(in crate::iter) fn new(iter: I, predicate: P) -> TakeWhile<I, P> {
                TakeWhile { iter, flag: false, predicate }
            }
        *)
        Definition new (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
          match τ, α with
          | [], [ iter; predicate ] =>
            ltac:(M.monadic
              (let iter := M.alloc (| iter |) in
              let predicate := M.alloc (| predicate |) in
              Value.StructRecord
                "core::iter::adapters::take_while::TakeWhile"
                [
                  ("iter", M.read (| iter |));
                  ("flag", Value.Bool false);
                  ("predicate", M.read (| predicate |))
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_new :
          forall (I P : Ty.t),
          M.IsAssociatedFunction (Self I P) "new" (new I P).
      End Impl_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        (*
            fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                f.debug_struct("TakeWhile").field("iter", &self.iter).field("flag", &self.flag).finish()
            }
        *)
        Definition fmt (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
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
                              [ M.read (| f |); M.read (| Value.String "TakeWhile" |) ]
                            |)
                          |);
                          M.read (| Value.String "iter" |);
                          (* Unsize *)
                          M.pointer_coercion
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::iter::adapters::take_while::TakeWhile",
                              "iter"
                            |))
                        ]
                      |);
                      M.read (| Value.String "flag" |);
                      (* Unsize *)
                      M.pointer_coercion
                        (M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "core::iter::adapters::take_while::TakeWhile",
                          "flag"
                        |))
                    ]
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I P : Ty.t),
          M.IsTraitInstance
            "core::fmt::Debug"
            (Self I P)
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method (fmt I P)) ].
      End Impl_core_fmt_Debug_where_core_fmt_Debug_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_traits_iterator_Iterator_where_core_iter_traits_iterator_Iterator_I_where_core_ops_function_FnMut_P_Tuple_ref__associated_type__for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        (*     type Item = I::Item; *)
        Definition _Item (I P : Ty.t) : Ty.t := Ty.associated.
        
        (*
            fn next(&mut self) -> Option<I::Item> {
                if self.flag {
                    None
                } else {
                    let x = self.iter.next()?;
                    if (self.predicate)(&x) {
                        Some(x)
                    } else {
                        self.flag = true;
                        None
                    }
                }
            }
        *)
        Definition next (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.catch_return (|
                ltac:(M.monadic
                  (M.read (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.SubPointer.get_struct_record_field (|
                                  M.read (| self |),
                                  "core::iter::adapters::take_while::TakeWhile",
                                  "flag"
                                |)) in
                            let _ :=
                              M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                            M.alloc (| Value.StructTuple "core::option::Option::None" [] |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let~ x :=
                              M.copy (|
                                M.match_operator (|
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::try_trait::Try",
                                        Ty.apply (Ty.path "core::option::Option") [ Ty.associated ],
                                        [],
                                        "branch",
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
                                              "core::iter::adapters::take_while::TakeWhile",
                                              "iter"
                                            |)
                                          ]
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
                                                    Ty.apply
                                                      (Ty.path "core::option::Option")
                                                      [ Ty.associated ],
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
                                          M.SubPointer.get_struct_tuple_field (|
                                            γ,
                                            "core::ops::control_flow::ControlFlow::Continue",
                                            0
                                          |) in
                                        let val := M.copy (| γ0_0 |) in
                                        val))
                                  ]
                                |)
                              |) in
                            M.match_operator (|
                              M.alloc (| Value.Tuple [] |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ :=
                                      M.use
                                        (M.alloc (|
                                          M.call_closure (|
                                            M.get_trait_method (|
                                              "core::ops::function::FnMut",
                                              P,
                                              [
                                                Ty.tuple
                                                  [ Ty.apply (Ty.path "&") [ Ty.associated ] ]
                                              ],
                                              "call_mut",
                                              []
                                            |),
                                            [
                                              M.SubPointer.get_struct_record_field (|
                                                M.read (| self |),
                                                "core::iter::adapters::take_while::TakeWhile",
                                                "predicate"
                                              |);
                                              Value.Tuple [ x ]
                                            ]
                                          |)
                                        |)) in
                                    let _ :=
                                      M.is_constant_or_break_match (|
                                        M.read (| γ |),
                                        Value.Bool true
                                      |) in
                                    M.alloc (|
                                      Value.StructTuple
                                        "core::option::Option::Some"
                                        [ M.read (| x |) ]
                                    |)));
                                fun γ =>
                                  ltac:(M.monadic
                                    (let~ _ :=
                                      M.write (|
                                        M.SubPointer.get_struct_record_field (|
                                          M.read (| self |),
                                          "core::iter::adapters::take_while::TakeWhile",
                                          "flag"
                                        |),
                                        Value.Bool true
                                      |) in
                                    M.alloc (|
                                      Value.StructTuple "core::option::Option::None" []
                                    |)))
                              ]
                            |)))
                      ]
                    |)
                  |)))
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn size_hint(&self) -> (usize, Option<usize>) {
                if self.flag {
                    (0, Some(0))
                } else {
                    let (_, upper) = self.iter.size_hint();
                    (0, upper) // can't know a lower bound, due to the predicate
                }
            }
        *)
        Definition size_hint (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
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
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::iter::adapters::take_while::TakeWhile",
                              "flag"
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          Value.Tuple
                            [
                              Value.Integer 0;
                              Value.StructTuple "core::option::Option::Some" [ Value.Integer 0 ]
                            ]
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (M.match_operator (|
                          M.alloc (|
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
                                  "core::iter::adapters::take_while::TakeWhile",
                                  "iter"
                                |)
                              ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                                let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                                let upper := M.copy (| γ0_1 |) in
                                M.alloc (| Value.Tuple [ Value.Integer 0; M.read (| upper |) ] |)))
                          ]
                        |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn try_fold<Acc, Fold, R>(&mut self, init: Acc, fold: Fold) -> R
            where
                Self: Sized,
                Fold: FnMut(Acc, Self::Item) -> R,
                R: Try<Output = Acc>,
            {
                fn check<'a, T, Acc, R: Try<Output = Acc>>(
                    flag: &'a mut bool,
                    p: &'a mut impl FnMut(&T) -> bool,
                    mut fold: impl FnMut(Acc, T) -> R + 'a,
                ) -> impl FnMut(Acc, T) -> ControlFlow<R, Acc> + 'a {
                    move |acc, x| {
                        if p(&x) {
                            ControlFlow::from_try(fold(acc, x))
                        } else {
                            *flag = true;
                            ControlFlow::Break(try { acc })
                        }
                    }
                }
        
                if self.flag {
                    try { init }
                } else {
                    let flag = &mut self.flag;
                    let p = &mut self.predicate;
                    self.iter.try_fold(init, check(flag, p, fold)).into_try()
                }
            }
        *)
        Definition try_fold (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
          match τ, α with
          | [ Acc; Fold; R ], [ self; init; fold ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let fold := M.alloc (| fold |) in
              M.read (|
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::iter::adapters::take_while::TakeWhile",
                              "flag"
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::ops::try_trait::Try",
                              R,
                              [],
                              "from_output",
                              []
                            |),
                            [ M.read (| init |) ]
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let~ flag :=
                          M.alloc (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::iter::adapters::take_while::TakeWhile",
                              "flag"
                            |)
                          |) in
                        let~ p :=
                          M.alloc (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "core::iter::adapters::take_while::TakeWhile",
                              "predicate"
                            |)
                          |) in
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "core::ops::control_flow::ControlFlow")
                                [ R; Ty.associated ],
                              "into_try",
                              []
                            |),
                            [
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::iter::traits::iterator::Iterator",
                                  I,
                                  [],
                                  "try_fold",
                                  [
                                    Acc;
                                    Ty.associated;
                                    Ty.apply
                                      (Ty.path "core::ops::control_flow::ControlFlow")
                                      [ R; Acc ]
                                  ]
                                |),
                                [
                                  M.SubPointer.get_struct_record_field (|
                                    M.read (| self |),
                                    "core::iter::adapters::take_while::TakeWhile",
                                    "iter"
                                  |);
                                  M.read (| init |);
                                  M.call_closure (|
                                    M.get_associated_function (| Self, "check.try_fold", [] |),
                                    [ M.read (| flag |); M.read (| p |); M.read (| fold |) ]
                                  |)
                                ]
                              |)
                            ]
                          |)
                        |)))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
                fn $fold<AAA, FFF>(mut self, init: AAA, fold: FFF) -> AAA
                where
                    FFF: FnMut(AAA, Self::Item) -> AAA,
                {
                    use crate::ops::NeverShortCircuit;
        
                    self.$try_fold(init, NeverShortCircuit::wrap_mut_2(fold)).0
                }
        *)
        Definition fold (I P : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I P in
          match τ, α with
          | [ AAA; FFF ], [ self; init; fold ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let init := M.alloc (| init |) in
              let fold := M.alloc (| fold |) in
              M.read (|
                M.SubPointer.get_struct_tuple_field (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::iterator::Iterator",
                        Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ],
                        [],
                        "try_fold",
                        [
                          AAA;
                          Ty.associated;
                          Ty.apply (Ty.path "core::ops::try_trait::NeverShortCircuit") [ AAA ]
                        ]
                      |),
                      [
                        self;
                        M.read (| init |);
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "core::ops::try_trait::NeverShortCircuit") [ AAA ],
                            "wrap_mut_2",
                            [ AAA; Ty.associated; FFF ]
                          |),
                          [ M.read (| fold |) ]
                        |)
                      ]
                    |)
                  |),
                  "core::ops::try_trait::NeverShortCircuit",
                  0
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I P : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::iterator::Iterator"
            (Self I P)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("Item", InstanceField.Ty (_Item I P));
              ("next", InstanceField.Method (next I P));
              ("size_hint", InstanceField.Method (size_hint I P));
              ("try_fold", InstanceField.Method (try_fold I P));
              ("fold", InstanceField.Method (fold I P))
            ].
      End Impl_core_iter_traits_iterator_Iterator_where_core_iter_traits_iterator_Iterator_I_where_core_ops_function_FnMut_P_Tuple_ref__associated_type__for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_traits_marker_FusedIterator_where_core_iter_traits_marker_FusedIterator_I_where_core_ops_function_FnMut_P_Tuple_ref__associated_type__for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        Axiom Implements :
          forall (I P : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::FusedIterator"
            (Self I P)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_traits_marker_FusedIterator_where_core_iter_traits_marker_FusedIterator_I_where_core_ops_function_FnMut_P_Tuple_ref__associated_type__for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_traits_marker_TrustedFused_where_core_iter_traits_marker_TrustedFused_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (I P : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        Axiom Implements :
          forall (I P : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::TrustedFused"
            (Self I P)
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_iter_traits_marker_TrustedFused_where_core_iter_traits_marker_TrustedFused_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_adapters_SourceIter_where_core_iter_adapters_SourceIter_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
        Definition Self (P I : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; P ].
        
        (*     type Source = I::Source; *)
        Definition _Source (P I : Ty.t) : Ty.t := Ty.associated.
        
        (*
            unsafe fn as_inner(&mut self) -> &mut I::Source {
                // SAFETY: unsafe function forwarding to unsafe function with the same requirements
                unsafe { SourceIter::as_inner(&mut self.iter) }
            }
        *)
        Definition as_inner (P I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self P I in
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_trait_method (| "core::iter::adapters::SourceIter", I, [], "as_inner", [] |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::iter::adapters::take_while::TakeWhile",
                    "iter"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (P I : Ty.t),
          M.IsTraitInstance
            "core::iter::adapters::SourceIter"
            (Self P I)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("Source", InstanceField.Ty (_Source P I));
              ("as_inner", InstanceField.Method (as_inner P I))
            ].
      End Impl_core_iter_adapters_SourceIter_where_core_iter_adapters_SourceIter_I_for_core_iter_adapters_take_while_TakeWhile_I_P.
      
      Module Impl_core_iter_traits_marker_InPlaceIterable_where_core_iter_traits_marker_InPlaceIterable_I_for_core_iter_adapters_take_while_TakeWhile_I_F.
        Definition Self (I F : Ty.t) : Ty.t :=
          Ty.apply (Ty.path "core::iter::adapters::take_while::TakeWhile") [ I; F ].
        
        (*     const EXPAND_BY: Option<NonZeroUsize> = I::EXPAND_BY; *)
        (* Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "core::num::nonzero::NonZeroUsize" ] *)
        Definition value_EXPAND_BY (I F : Ty.t) : Value.t :=
          let Self : Ty.t := Self I F in
          M.run
            ltac:(M.monadic
              (M.get_constant (| "core::iter::traits::marker::InPlaceIterable::EXPAND_BY" |))).
        
        (*     const MERGE_BY: Option<NonZeroUsize> = I::MERGE_BY; *)
        (* Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "core::num::nonzero::NonZeroUsize" ] *)
        Definition value_MERGE_BY (I F : Ty.t) : Value.t :=
          let Self : Ty.t := Self I F in
          M.run
            ltac:(M.monadic
              (M.get_constant (| "core::iter::traits::marker::InPlaceIterable::MERGE_BY" |))).
        
        Axiom Implements :
          forall (I F : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::marker::InPlaceIterable"
            (Self I F)
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("value_EXPAND_BY", InstanceField.Constant (value_EXPAND_BY I F));
              ("value_MERGE_BY", InstanceField.Constant (value_MERGE_BY I F))
            ].
      End Impl_core_iter_traits_marker_InPlaceIterable_where_core_iter_traits_marker_InPlaceIterable_I_for_core_iter_adapters_take_while_TakeWhile_I_F.
    End take_while.
  End adapters.
End iter.
