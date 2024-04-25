(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module vec.
  Module extract_if.
    (* StructRecord
      {
        name := "ExtractIf";
        ty_params := [ "T"; "F"; "A" ];
        fields :=
          [
            ("vec", Ty.apply (Ty.path "&mut") [ Ty.apply (Ty.path "alloc::vec::Vec") [ T; A ] ]);
            ("idx", Ty.path "usize");
            ("del", Ty.path "usize");
            ("old_len", Ty.path "usize");
            ("pred", F)
          ];
      } *)
    
    Module Impl_core_fmt_Debug_where_core_fmt_Debug_T_where_core_fmt_Debug_F_where_core_fmt_Debug_A_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
      Definition Self (T F A : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::extract_if::ExtractIf") [ T; F; A ].
      
      (* Debug *)
      Definition fmt (T F A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F A in
        match τ, α with
        | [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::Formatter",
                "debug_struct_field5_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "ExtractIf" |);
                M.read (| Value.String "vec" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::extract_if::ExtractIf"
                    "vec");
                M.read (| Value.String "idx" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::extract_if::ExtractIf"
                    "idx");
                M.read (| Value.String "del" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::extract_if::ExtractIf"
                    "del");
                M.read (| Value.String "old_len" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::extract_if::ExtractIf"
                    "old_len");
                M.read (| Value.String "pred" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "alloc::vec::extract_if::ExtractIf"
                      "pred"
                  |))
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F A : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self T F A)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt T F A)) ].
    End Impl_core_fmt_Debug_where_core_fmt_Debug_T_where_core_fmt_Debug_F_where_core_fmt_Debug_A_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
    
    Module Impl_alloc_vec_extract_if_ExtractIf_T_F_A.
      Definition Self (T F A : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::extract_if::ExtractIf") [ T; F; A ].
      
      (*
          pub fn allocator(&self) -> &A {
              self.vec.allocator()
          }
      *)
      Definition allocator (T F A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F A in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "alloc::vec::Vec") [ T; A ],
                "allocator",
                []
              |),
              [
                M.read (|
                  M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::extract_if::ExtractIf"
                    "vec"
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_allocator :
        forall (T F A : Ty.t),
        M.IsAssociatedFunction (Self T F A) "allocator" (allocator T F A).
    End Impl_alloc_vec_extract_if_ExtractIf_T_F_A.
    
    Module Impl_core_iter_traits_iterator_Iterator_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
      Definition Self (T F A : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::extract_if::ExtractIf") [ T; F; A ].
      
      (*     type Item = T; *)
      Definition _Item (T F A : Ty.t) : Ty.t := T.
      
      (*
          fn next(&mut self) -> Option<T> {
              unsafe {
                  while self.idx < self.old_len {
                      let i = self.idx;
                      let v = slice::from_raw_parts_mut(self.vec.as_mut_ptr(), self.old_len);
                      let drained = (self.pred)(&mut v[i]);
                      // Update the index *after* the predicate is called. If the index
                      // is updated prior and the predicate panics, the element at this
                      // index would be leaked.
                      self.idx += 1;
                      if drained {
                          self.del += 1;
                          return Some(ptr::read(&v[i]));
                      } else if self.del > 0 {
                          let del = self.del;
                          let src: *const T = &v[i];
                          let dst: *mut T = &mut v[i - del];
                          ptr::copy_nonoverlapping(src, dst, 1);
                      }
                  }
                  None
              }
          }
      *)
      Definition next (T F A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F A in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.read (|
                  let _ :=
                    M.loop (|
                      ltac:(M.monadic
                        (M.match_operator (|
                          M.alloc (| Value.Tuple [] |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ :=
                                  M.use
                                    (M.alloc (|
                                      BinOp.Pure.lt
                                        (M.read (|
                                          M.get_struct_record_field
                                            (M.read (| self |))
                                            "alloc::vec::extract_if::ExtractIf"
                                            "idx"
                                        |))
                                        (M.read (|
                                          M.get_struct_record_field
                                            (M.read (| self |))
                                            "alloc::vec::extract_if::ExtractIf"
                                            "old_len"
                                        |))
                                    |)) in
                                let _ :=
                                  M.is_constant_or_break_match (|
                                    M.read (| γ |),
                                    Value.Bool true
                                  |) in
                                let i :=
                                  M.copy (|
                                    M.get_struct_record_field
                                      (M.read (| self |))
                                      "alloc::vec::extract_if::ExtractIf"
                                      "idx"
                                  |) in
                                let v :=
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "core::slice::raw::from_raw_parts_mut",
                                        [ T ]
                                      |),
                                      [
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.apply (Ty.path "alloc::vec::Vec") [ T; A ],
                                            "as_mut_ptr",
                                            []
                                          |),
                                          [
                                            M.read (|
                                              M.get_struct_record_field
                                                (M.read (| self |))
                                                "alloc::vec::extract_if::ExtractIf"
                                                "vec"
                                            |)
                                          ]
                                        |);
                                        M.read (|
                                          M.get_struct_record_field
                                            (M.read (| self |))
                                            "alloc::vec::extract_if::ExtractIf"
                                            "old_len"
                                        |)
                                      ]
                                    |)
                                  |) in
                                let drained :=
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::function::FnMut",
                                        F,
                                        [ Ty.tuple [ Ty.apply (Ty.path "&mut") [ T ] ] ],
                                        "call_mut",
                                        []
                                      |),
                                      [
                                        M.get_struct_record_field
                                          (M.read (| self |))
                                          "alloc::vec::extract_if::ExtractIf"
                                          "pred";
                                        Value.Tuple [ M.get_array_field (| M.read (| v |), i |) ]
                                      ]
                                    |)
                                  |) in
                                let _ :=
                                  let β :=
                                    M.get_struct_record_field
                                      (M.read (| self |))
                                      "alloc::vec::extract_if::ExtractIf"
                                      "idx" in
                                  M.write (|
                                    β,
                                    BinOp.Panic.add (|
                                      M.read (| β |),
                                      Value.Integer Integer.Usize 1
                                    |)
                                  |) in
                                M.match_operator (|
                                  M.alloc (| Value.Tuple [] |),
                                  [
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let γ := M.use drained in
                                        let _ :=
                                          M.is_constant_or_break_match (|
                                            M.read (| γ |),
                                            Value.Bool true
                                          |) in
                                        M.alloc (|
                                          M.never_to_any (|
                                            M.read (|
                                              let _ :=
                                                let β :=
                                                  M.get_struct_record_field
                                                    (M.read (| self |))
                                                    "alloc::vec::extract_if::ExtractIf"
                                                    "del" in
                                                M.write (|
                                                  β,
                                                  BinOp.Panic.add (|
                                                    M.read (| β |),
                                                    Value.Integer Integer.Usize 1
                                                  |)
                                                |) in
                                              M.return_ (|
                                                Value.StructTuple
                                                  "core::option::Option::Some"
                                                  [
                                                    M.call_closure (|
                                                      M.get_function (| "core::ptr::read", [ T ] |),
                                                      [ M.get_array_field (| M.read (| v |), i |) ]
                                                    |)
                                                  ]
                                              |)
                                            |)
                                          |)
                                        |)));
                                    fun γ =>
                                      ltac:(M.monadic
                                        (M.match_operator (|
                                          M.alloc (| Value.Tuple [] |),
                                          [
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let γ :=
                                                  M.use
                                                    (M.alloc (|
                                                      BinOp.Pure.gt
                                                        (M.read (|
                                                          M.get_struct_record_field
                                                            (M.read (| self |))
                                                            "alloc::vec::extract_if::ExtractIf"
                                                            "del"
                                                        |))
                                                        (Value.Integer Integer.Usize 0)
                                                    |)) in
                                                let _ :=
                                                  M.is_constant_or_break_match (|
                                                    M.read (| γ |),
                                                    Value.Bool true
                                                  |) in
                                                let del :=
                                                  M.copy (|
                                                    M.get_struct_record_field
                                                      (M.read (| self |))
                                                      "alloc::vec::extract_if::ExtractIf"
                                                      "del"
                                                  |) in
                                                let src :=
                                                  M.alloc (|
                                                    M.get_array_field (| M.read (| v |), i |)
                                                  |) in
                                                let dst :=
                                                  M.alloc (|
                                                    M.get_array_field (|
                                                      M.read (| v |),
                                                      M.alloc (|
                                                        BinOp.Panic.sub (|
                                                          M.read (| i |),
                                                          M.read (| del |)
                                                        |)
                                                      |)
                                                    |)
                                                  |) in
                                                let _ :=
                                                  M.alloc (|
                                                    M.call_closure (|
                                                      M.get_function (|
                                                        "core::intrinsics::copy_nonoverlapping",
                                                        [ T ]
                                                      |),
                                                      [
                                                        M.read (| src |);
                                                        M.read (| dst |);
                                                        Value.Integer Integer.Usize 1
                                                      ]
                                                    |)
                                                  |) in
                                                M.alloc (| Value.Tuple [] |)));
                                            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                                          ]
                                        |)))
                                  ]
                                |)));
                            fun γ =>
                              ltac:(M.monadic
                                (M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      let _ :=
                                        M.alloc (|
                                          M.never_to_any (| M.read (| M.break (||) |) |)
                                        |) in
                                      M.alloc (| Value.Tuple [] |)
                                    |)
                                  |)
                                |)))
                          ]
                        |)))
                    |) in
                  M.alloc (| Value.StructTuple "core::option::Option::None" [] |)
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn size_hint(&self) -> (usize, Option<usize>) {
              (0, Some(self.old_len - self.idx))
          }
      *)
      Definition size_hint (T F A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F A in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.Tuple
              [
                Value.Integer Integer.Usize 0;
                Value.StructTuple
                  "core::option::Option::Some"
                  [
                    BinOp.Panic.sub (|
                      M.read (|
                        M.get_struct_record_field
                          (M.read (| self |))
                          "alloc::vec::extract_if::ExtractIf"
                          "old_len"
                      |),
                      M.read (|
                        M.get_struct_record_field
                          (M.read (| self |))
                          "alloc::vec::extract_if::ExtractIf"
                          "idx"
                      |)
                    |)
                  ]
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F A : Ty.t),
        M.IsTraitInstance
          "core::iter::traits::iterator::Iterator"
          (Self T F A)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Item", InstanceField.Ty (_Item T F A));
            ("next", InstanceField.Method (next T F A));
            ("size_hint", InstanceField.Method (size_hint T F A))
          ].
    End Impl_core_iter_traits_iterator_Iterator_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
    
    Module Impl_core_ops_drop_Drop_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
      Definition Self (T F A : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::extract_if::ExtractIf") [ T; F; A ].
      
      (*
          fn drop(&mut self) {
              unsafe {
                  if self.idx < self.old_len && self.del > 0 {
                      // This is a pretty messed up state, and there isn't really an
                      // obviously right thing to do. We don't want to keep trying
                      // to execute `pred`, so we just backshift all the unprocessed
                      // elements and tell the vec that they still exist. The backshift
                      // is required to prevent a double-drop of the last successfully
                      // drained item prior to a panic in the predicate.
                      let ptr = self.vec.as_mut_ptr();
                      let src = ptr.add(self.idx);
                      let dst = src.sub(self.del);
                      let tail_len = self.old_len - self.idx;
                      src.copy_to(dst, tail_len);
                  }
                  self.vec.set_len(self.old_len - self.del);
              }
          }
      *)
      Definition drop (T F A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F A in
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              LogicalOp.and (|
                                BinOp.Pure.lt
                                  (M.read (|
                                    M.get_struct_record_field
                                      (M.read (| self |))
                                      "alloc::vec::extract_if::ExtractIf"
                                      "idx"
                                  |))
                                  (M.read (|
                                    M.get_struct_record_field
                                      (M.read (| self |))
                                      "alloc::vec::extract_if::ExtractIf"
                                      "old_len"
                                  |)),
                                ltac:(M.monadic
                                  (BinOp.Pure.gt
                                    (M.read (|
                                      M.get_struct_record_field
                                        (M.read (| self |))
                                        "alloc::vec::extract_if::ExtractIf"
                                        "del"
                                    |))
                                    (Value.Integer Integer.Usize 0)))
                              |)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let ptr :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "alloc::vec::Vec") [ T; A ],
                                "as_mut_ptr",
                                []
                              |),
                              [
                                M.read (|
                                  M.get_struct_record_field
                                    (M.read (| self |))
                                    "alloc::vec::extract_if::ExtractIf"
                                    "vec"
                                |)
                              ]
                            |)
                          |) in
                        let src :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "*mut") [ T ],
                                "add",
                                []
                              |),
                              [
                                M.read (| ptr |);
                                M.read (|
                                  M.get_struct_record_field
                                    (M.read (| self |))
                                    "alloc::vec::extract_if::ExtractIf"
                                    "idx"
                                |)
                              ]
                            |)
                          |) in
                        let dst :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "*mut") [ T ],
                                "sub",
                                []
                              |),
                              [
                                M.read (| src |);
                                M.read (|
                                  M.get_struct_record_field
                                    (M.read (| self |))
                                    "alloc::vec::extract_if::ExtractIf"
                                    "del"
                                |)
                              ]
                            |)
                          |) in
                        let tail_len :=
                          M.alloc (|
                            BinOp.Panic.sub (|
                              M.read (|
                                M.get_struct_record_field
                                  (M.read (| self |))
                                  "alloc::vec::extract_if::ExtractIf"
                                  "old_len"
                              |),
                              M.read (|
                                M.get_struct_record_field
                                  (M.read (| self |))
                                  "alloc::vec::extract_if::ExtractIf"
                                  "idx"
                              |)
                            |)
                          |) in
                        let _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply (Ty.path "*mut") [ T ],
                                "copy_to",
                                []
                              |),
                              [ M.read (| src |); M.read (| dst |); M.read (| tail_len |) ]
                            |)
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              let _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply (Ty.path "alloc::vec::Vec") [ T; A ],
                      "set_len",
                      []
                    |),
                    [
                      M.read (|
                        M.get_struct_record_field
                          (M.read (| self |))
                          "alloc::vec::extract_if::ExtractIf"
                          "vec"
                      |);
                      BinOp.Panic.sub (|
                        M.read (|
                          M.get_struct_record_field
                            (M.read (| self |))
                            "alloc::vec::extract_if::ExtractIf"
                            "old_len"
                        |),
                        M.read (|
                          M.get_struct_record_field
                            (M.read (| self |))
                            "alloc::vec::extract_if::ExtractIf"
                            "del"
                        |)
                      |)
                    ]
                  |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F A : Ty.t),
        M.IsTraitInstance
          "core::ops::drop::Drop"
          (Self T F A)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("drop", InstanceField.Method (drop T F A)) ].
    End Impl_core_ops_drop_Drop_where_core_alloc_Allocator_A_where_core_ops_function_FnMut_F_Tuple_ref_mut_T__for_alloc_vec_extract_if_ExtractIf_T_F_A.
  End extract_if.
End vec.
