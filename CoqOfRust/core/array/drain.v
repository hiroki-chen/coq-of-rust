(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module array.
  Module drain.
    (*
    pub(crate) fn drain_array_with<T, R, const N: usize>(
        array: [T; N],
        func: impl for<'a> FnOnce(Drain<'a, T>) -> R,
    ) -> R {
        let mut array = ManuallyDrop::new(array);
        // SAFETY: Now that the local won't drop it, it's ok to construct the `Drain` which will.
        let drain = Drain(array.iter_mut());
        func(drain)
    }
    *)
    Definition drain_array_with (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T; R; impl_for_'a__FnOnce_Drain_'a__T___arrow_R ], [ array; func ] =>
        ltac:(M.monadic
          (let array := M.alloc (| array |) in
          let func := M.alloc (| func |) in
          M.read (|
            let array :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "core::mem::manually_drop::ManuallyDrop")
                      [ Ty.apply (Ty.path "array") [ T ] ],
                    "new",
                    []
                  |),
                  [ M.read (| array |) ]
                |)
              |) in
            let drain :=
              M.alloc (|
                Value.StructTuple
                  "core::array::drain::Drain"
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "slice") [ T ],
                        "iter_mut",
                        []
                      |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.call_closure (|
                            M.get_trait_method (|
                              "core::ops::deref::DerefMut",
                              Ty.apply
                                (Ty.path "core::mem::manually_drop::ManuallyDrop")
                                [ Ty.apply (Ty.path "array") [ T ] ],
                              [],
                              "deref_mut",
                              []
                            |),
                            [ array ]
                          |))
                      ]
                    |)
                  ]
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::FnOnce",
                  impl_for_'a__FnOnce_Drain_'a__T___arrow_R,
                  [ Ty.tuple [ Ty.apply (Ty.path "core::array::drain::Drain") [ T ] ] ],
                  "call_once",
                  []
                |),
                [ M.read (| func |); Value.Tuple [ M.read (| drain |) ] ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (* StructTuple
      {
        name := "Drain";
        ty_params := [ "T" ];
        fields := [ Ty.apply (Ty.path "core::slice::iter::IterMut") [ T ] ];
      } *)
    
    Module Impl_core_ops_drop_Drop_for_core_array_drain_Drain_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::array::drain::Drain") [ T ].
      
      (*
          fn drop(&mut self) {
              // SAFETY: By the type invariant, we're allowed to drop all these.
              unsafe { drop_in_place(self.0.as_mut_slice()) }
          }
      *)
      Definition drop (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_function (| "core::ptr::drop_in_place", [ Ty.apply (Ty.path "slice") [ T ] ] |),
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "core::slice::iter::IterMut") [ T ],
                    "as_mut_slice",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_tuple_field (|
                      M.read (| self |),
                      "core::array::drain::Drain",
                      0
                    |)
                  ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::ops::drop::Drop"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("drop", InstanceField.Method (drop T)) ].
    End Impl_core_ops_drop_Drop_for_core_array_drain_Drain_T.
    
    Module Impl_core_iter_traits_iterator_Iterator_for_core_array_drain_Drain_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::array::drain::Drain") [ T ].
      
      (*     type Item = T; *)
      Definition _Item (T : Ty.t) : Ty.t := T.
      
      (*
          fn next(&mut self) -> Option<T> {
              let p: *const T = self.0.next()?;
              // SAFETY: The iterator was already advanced, so we won't drop this later.
              Some(unsafe { p.read() })
          }
      *)
      Definition next (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.read (|
                  let p :=
                    M.copy (|
                      M.match_operator (|
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::ops::try_trait::Try",
                              Ty.apply
                                (Ty.path "core::option::Option")
                                [ Ty.apply (Ty.path "&mut") [ T ] ],
                              [],
                              "branch",
                              []
                            |),
                            [
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::iter::traits::iterator::Iterator",
                                  Ty.apply (Ty.path "core::slice::iter::IterMut") [ T ],
                                  [],
                                  "next",
                                  []
                                |),
                                [
                                  M.SubPointer.get_struct_tuple_field (|
                                    M.read (| self |),
                                    "core::array::drain::Drain",
                                    0
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
                                M.SubPointer.get_struct_tuple_field (|
                                  γ,
                                  "core::ops::control_flow::ControlFlow::Continue",
                                  0
                                |) in
                              let val := M.copy (| γ0_0 |) in
                              M.alloc (| M.read (| val |) |)))
                        ]
                      |)
                    |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::option::Option::Some"
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply (Ty.path "*const") [ T ],
                            "read",
                            []
                          |),
                          [ M.read (| p |) ]
                        |)
                      ]
                  |)
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn size_hint(&self) -> (usize, Option<usize>) {
              let n = self.len();
              (n, Some(n))
          }
      *)
      Definition size_hint (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let n :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::exact_size::ExactSizeIterator",
                      Ty.apply (Ty.path "core::array::drain::Drain") [ T ],
                      [],
                      "len",
                      []
                    |),
                    [ M.read (| self |) ]
                  |)
                |) in
              M.alloc (|
                Value.Tuple
                  [
                    M.read (| n |);
                    Value.StructTuple "core::option::Option::Some" [ M.read (| n |) ]
                  ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::iter::traits::iterator::Iterator"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Item", InstanceField.Ty (_Item T));
            ("next", InstanceField.Method (next T));
            ("size_hint", InstanceField.Method (size_hint T))
          ].
    End Impl_core_iter_traits_iterator_Iterator_for_core_array_drain_Drain_T.
    
    Module Impl_core_iter_traits_exact_size_ExactSizeIterator_for_core_array_drain_Drain_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::array::drain::Drain") [ T ].
      
      (*
          fn len(&self) -> usize {
              self.0.len()
          }
      *)
      Definition len (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::exact_size::ExactSizeIterator",
                Ty.apply (Ty.path "core::slice::iter::IterMut") [ T ],
                [],
                "len",
                []
              |),
              [
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "core::array::drain::Drain",
                  0
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::iter::traits::exact_size::ExactSizeIterator"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("len", InstanceField.Method (len T)) ].
    End Impl_core_iter_traits_exact_size_ExactSizeIterator_for_core_array_drain_Drain_T.
    
    Module Impl_core_iter_traits_marker_TrustedLen_for_core_array_drain_Drain_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::array::drain::Drain") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::iter::traits::marker::TrustedLen"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_iter_traits_marker_TrustedLen_for_core_array_drain_Drain_T.
    
    Module Impl_core_iter_traits_unchecked_iterator_UncheckedIterator_for_core_array_drain_Drain_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "core::array::drain::Drain") [ T ].
      
      (*
          unsafe fn next_unchecked(&mut self) -> T {
              // SAFETY: `Drain` is 1:1 with the inner iterator, so if the caller promised
              // that there's an element left, the inner iterator has one too.
              let p: *const T = unsafe { self.0.next_unchecked() };
              // SAFETY: The iterator was already advanced, so we won't drop this later.
              unsafe { p.read() }
          }
      *)
      Definition next_unchecked (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let p :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::unchecked_iterator::UncheckedIterator",
                      Ty.apply (Ty.path "core::slice::iter::IterMut") [ T ],
                      [],
                      "next_unchecked",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_tuple_field (|
                        M.read (| self |),
                        "core::array::drain::Drain",
                        0
                      |)
                    ]
                  |)
                |) in
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (| Ty.apply (Ty.path "*const") [ T ], "read", [] |),
                  [ M.read (| p |) ]
                |)
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::iter::traits::unchecked_iterator::UncheckedIterator"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("next_unchecked", InstanceField.Method (next_unchecked T)) ].
    End Impl_core_iter_traits_unchecked_iterator_UncheckedIterator_for_core_array_drain_Drain_T.
  End drain.
End array.
