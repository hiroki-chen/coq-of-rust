(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module iter.
  Module traits.
    Module exact_size.
      (* Trait *)
      Module ExactSizeIterator.
        Definition len (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::iterator::Iterator",
                        Self,
                        [],
                        "size_hint",
                        []
                      |),
                      [ M.read (| self |) ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                        let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                        let lower := M.copy (| γ0_0 |) in
                        let upper := M.copy (| γ0_1 |) in
                        let~ _ :=
                          M.match_operator (|
                            M.alloc (|
                              Value.Tuple
                                [
                                  upper;
                                  M.alloc (|
                                    Value.StructTuple
                                      "core::option::Option::Some"
                                      [ M.read (| lower |) ]
                                  |)
                                ]
                            |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                                  let left_val := M.copy (| γ0_0 |) in
                                  let right_val := M.copy (| γ0_1 |) in
                                  M.match_operator (|
                                    M.alloc (| Value.Tuple [] |),
                                    [
                                      fun γ =>
                                        ltac:(M.monadic
                                          (let γ :=
                                            M.use
                                              (M.alloc (|
                                                UnOp.Pure.not
                                                  (M.call_closure (|
                                                    M.get_trait_method (|
                                                      "core::cmp::PartialEq",
                                                      Ty.apply
                                                        (Ty.path "core::option::Option")
                                                        [ Ty.path "usize" ],
                                                      [
                                                        Ty.apply
                                                          (Ty.path "core::option::Option")
                                                          [ Ty.path "usize" ]
                                                      ],
                                                      "eq",
                                                      []
                                                    |),
                                                    [ M.read (| left_val |); M.read (| right_val |)
                                                    ]
                                                  |))
                                              |)) in
                                          let _ :=
                                            M.is_constant_or_break_match (|
                                              M.read (| γ |),
                                              Value.Bool true
                                            |) in
                                          M.alloc (|
                                            M.never_to_any (|
                                              M.read (|
                                                let~ kind :=
                                                  M.alloc (|
                                                    Value.StructTuple
                                                      "core::panicking::AssertKind::Eq"
                                                      []
                                                  |) in
                                                M.alloc (|
                                                  M.call_closure (|
                                                    M.get_function (|
                                                      "core::panicking::assert_failed",
                                                      [
                                                        Ty.apply
                                                          (Ty.path "core::option::Option")
                                                          [ Ty.path "usize" ];
                                                        Ty.apply
                                                          (Ty.path "core::option::Option")
                                                          [ Ty.path "usize" ]
                                                      ]
                                                    |),
                                                    [
                                                      M.read (| kind |);
                                                      M.read (| left_val |);
                                                      M.read (| right_val |);
                                                      Value.StructTuple
                                                        "core::option::Option::None"
                                                        []
                                                    ]
                                                  |)
                                                |)
                                              |)
                                            |)
                                          |)));
                                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                                    ]
                                  |)))
                            ]
                          |) in
                        lower))
                  ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom ProvidedMethod_len :
          M.IsProvidedMethod "core::iter::traits::exact_size::ExactSizeIterator" "len" len.
        Definition is_empty (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              BinOp.Pure.eq
                (M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::exact_size::ExactSizeIterator",
                    Self,
                    [],
                    "len",
                    []
                  |),
                  [ M.read (| self |) ]
                |))
                (Value.Integer 0)))
          | _, _ => M.impossible
          end.
        
        Axiom ProvidedMethod_is_empty :
          M.IsProvidedMethod
            "core::iter::traits::exact_size::ExactSizeIterator"
            "is_empty"
            is_empty.
      End ExactSizeIterator.
      
      Module Impl_core_iter_traits_exact_size_ExactSizeIterator_where_core_iter_traits_exact_size_ExactSizeIterator_I_where_core_marker_Sized_I_for_ref_mut_I.
        Definition Self (I : Ty.t) : Ty.t := Ty.apply (Ty.path "&mut") [ I ].
        
        (*
            fn len(&self) -> usize {
                ( **self).len()
            }
        *)
        Definition len (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I in
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
                [ M.read (| M.read (| self |) |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn is_empty(&self) -> bool {
                ( **self).is_empty()
            }
        *)
        Definition is_empty (I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self I in
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
                [ M.read (| M.read (| self |) |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (I : Ty.t),
          M.IsTraitInstance
            "core::iter::traits::exact_size::ExactSizeIterator"
            (Self I)
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("len", InstanceField.Method (len I)); ("is_empty", InstanceField.Method (is_empty I))
            ].
      End Impl_core_iter_traits_exact_size_ExactSizeIterator_where_core_iter_traits_exact_size_ExactSizeIterator_I_where_core_marker_Sized_I_for_ref_mut_I.
    End exact_size.
  End traits.
End iter.
