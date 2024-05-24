(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ascii.
  (* StructTuple
    {
      name := "EscapeDefault";
      ty_params := [];
      fields := [ Ty.path "core::escape::EscapeIterInner" ];
    } *)
  
  Module Impl_core_clone_Clone_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (* Clone *)
    Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructTuple
            "core::ascii::EscapeDefault"
            [
              M.call_closure (|
                M.get_trait_method (|
                  "core::clone::Clone",
                  Ty.path "core::escape::EscapeIterInner",
                  [],
                  "clone",
                  []
                |),
                [
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| self |),
                    "core::ascii::EscapeDefault",
                    0
                  |)
                ]
              |)
            ]))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_core_ascii_EscapeDefault.
  
  (*
  pub fn escape_default(c: u8) -> EscapeDefault {
      let mut data = [Char::Null; 4];
      let range = escape::escape_ascii_into(&mut data, c);
      EscapeDefault(escape::EscapeIterInner::new(data, range))
  }
  *)
  Definition escape_default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ c ] =>
      ltac:(M.monadic
        (let c := M.alloc (| c |) in
        M.read (|
          let data :=
            M.alloc (|
              repeat (Value.StructTuple "core::ascii::ascii_char::AsciiChar::Null" []) 4
            |) in
          let range :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "core::escape::escape_ascii_into", [] |),
                [ data; M.read (| c |) ]
              |)
            |) in
          M.alloc (|
            Value.StructTuple
              "core::ascii::EscapeDefault"
              [
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::escape::EscapeIterInner",
                    "new",
                    []
                  |),
                  [ M.read (| data |); M.read (| range |) ]
                |)
              ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Function_escape_default : M.IsFunction "core::ascii::escape_default" escape_default.
  
  Module Impl_core_iter_traits_iterator_Iterator_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (*     type Item = u8; *)
    Definition _Item : Ty.t := Ty.path "u8".
    
    (*
        fn next(&mut self) -> Option<u8> {
            self.0.next()
        }
    *)
    Definition next (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::escape::EscapeIterInner", "next", [] |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::ascii::EscapeDefault",
                0
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    (*
        fn size_hint(&self) -> (usize, Option<usize>) {
            let n = self.0.len();
            (n, Some(n))
        }
    *)
    Definition size_hint (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            let n :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "core::escape::EscapeIterInner",
                    "len",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_tuple_field (|
                      M.read (| self |),
                      "core::ascii::EscapeDefault",
                      0
                    |)
                  ]
                |)
              |) in
            M.alloc (|
              Value.Tuple
                [ M.read (| n |); Value.StructTuple "core::option::Option::Some" [ M.read (| n |) ]
                ]
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    (*
        fn count(self) -> usize {
            self.0.len()
        }
    *)
    Definition count (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::escape::EscapeIterInner", "len", [] |),
            [ M.SubPointer.get_struct_tuple_field (| self, "core::ascii::EscapeDefault", 0 |) ]
          |)))
      | _, _ => M.impossible
      end.
    
    (*
        fn last(mut self) -> Option<u8> {
            self.0.next_back()
        }
    *)
    Definition last (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::escape::EscapeIterInner",
              "next_back",
              []
            |),
            [ M.SubPointer.get_struct_tuple_field (| self, "core::ascii::EscapeDefault", 0 |) ]
          |)))
      | _, _ => M.impossible
      end.
    
    (*
        fn advance_by(&mut self, n: usize) -> Result<(), NonZeroUsize> {
            self.0.advance_by(n)
        }
    *)
    Definition advance_by (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; n ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let n := M.alloc (| n |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::escape::EscapeIterInner",
              "advance_by",
              []
            |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::ascii::EscapeDefault",
                0
              |);
              M.read (| n |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::iter::traits::iterator::Iterator"
        Self
        (* Trait polymorphic types *) []
        (* Instance *)
        [
          ("Item", InstanceField.Ty _Item);
          ("next", InstanceField.Method next);
          ("size_hint", InstanceField.Method size_hint);
          ("count", InstanceField.Method count);
          ("last", InstanceField.Method last);
          ("advance_by", InstanceField.Method advance_by)
        ].
  End Impl_core_iter_traits_iterator_Iterator_for_core_ascii_EscapeDefault.
  
  Module Impl_core_iter_traits_double_ended_DoubleEndedIterator_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (*
        fn next_back(&mut self) -> Option<u8> {
            self.0.next_back()
        }
    *)
    Definition next_back (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::escape::EscapeIterInner",
              "next_back",
              []
            |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::ascii::EscapeDefault",
                0
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    (*
        fn advance_back_by(&mut self, n: usize) -> Result<(), NonZeroUsize> {
            self.0.advance_back_by(n)
        }
    *)
    Definition advance_back_by (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; n ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let n := M.alloc (| n |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::escape::EscapeIterInner",
              "advance_back_by",
              []
            |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::ascii::EscapeDefault",
                0
              |);
              M.read (| n |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::iter::traits::double_ended::DoubleEndedIterator"
        Self
        (* Trait polymorphic types *) []
        (* Instance *)
        [
          ("next_back", InstanceField.Method next_back);
          ("advance_back_by", InstanceField.Method advance_back_by)
        ].
  End Impl_core_iter_traits_double_ended_DoubleEndedIterator_for_core_ascii_EscapeDefault.
  
  Module Impl_core_iter_traits_exact_size_ExactSizeIterator_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (*
        fn len(&self) -> usize {
            self.0.len()
        }
    *)
    Definition len (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::escape::EscapeIterInner", "len", [] |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "core::ascii::EscapeDefault",
                0
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::iter::traits::exact_size::ExactSizeIterator"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("len", InstanceField.Method len) ].
  End Impl_core_iter_traits_exact_size_ExactSizeIterator_for_core_ascii_EscapeDefault.
  
  Module Impl_core_iter_traits_marker_FusedIterator_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    Axiom Implements :
      M.IsTraitInstance
        "core::iter::traits::marker::FusedIterator"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [].
  End Impl_core_iter_traits_marker_FusedIterator_for_core_ascii_EscapeDefault.
  
  Module Impl_core_fmt_Display_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (*
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            f.write_str(self.0.as_str())
        }
    *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
            [
              M.read (| f |);
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::escape::EscapeIterInner",
                  "as_str",
                  []
                |),
                [
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| self |),
                    "core::ascii::EscapeDefault",
                    0
                  |)
                ]
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Display"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Display_for_core_ascii_EscapeDefault.
  
  Module Impl_core_fmt_Debug_for_core_ascii_EscapeDefault.
    Definition Self : Ty.t := Ty.path "core::ascii::EscapeDefault".
    
    (*
        fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
            f.debug_struct("EscapeDefault").finish_non_exhaustive()
        }
    *)
    Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::fmt::builders::DebugStruct",
              "finish_non_exhaustive",
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
                  [ M.read (| f |); M.read (| Value.String "EscapeDefault" |) ]
                |)
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_core_ascii_EscapeDefault.
End ascii.
