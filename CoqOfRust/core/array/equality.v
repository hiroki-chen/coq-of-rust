(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module array.
  Module equality.
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_array_B_for_array_A.
      Definition Self (A B : Ty.t) : Ty.t := Ty.apply (Ty.path "array") [ A ].
      
      (*
          fn eq(&self, other: &[B; N]) -> bool {
              SpecArrayEq::spec_eq(self, other)
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::array::equality::SpecArrayEq",
                A,
                [ B ],
                "spec_eq",
                []
              |),
              [ M.read (| self |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &[B; N]) -> bool {
              SpecArrayEq::spec_ne(self, other)
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::array::equality::SpecArrayEq",
                A,
                [ B ],
                "spec_ne",
                []
              |),
              [ M.read (| self |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *) [ (* Rhs *) Ty.apply (Ty.path "array") [ B ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_array_B_for_array_A.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_slice_B_for_array_A.
      Definition Self (A B : Ty.t) : Ty.t := Ty.apply (Ty.path "array") [ A ].
      
      (*
          fn eq(&self, other: &[B]) -> bool {
              let b: Result<&[B; N], _> = other.try_into();
              match b {
                  Ok(b) => *self == *b,
                  Err(_) => false,
              }
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              let b :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::convert::TryInto",
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ],
                      [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ B ] ] ],
                      "try_into",
                      []
                    |),
                    [ M.read (| other |) ]
                  |)
                |) in
              M.match_operator (|
                b,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Ok",
                          0
                        |) in
                      let b := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::cmp::PartialEq",
                            Ty.apply (Ty.path "array") [ A ],
                            [ Ty.apply (Ty.path "array") [ B ] ],
                            "eq",
                            []
                          |),
                          [ M.read (| self |); M.read (| b |) ]
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Err",
                          0
                        |) in
                      M.alloc (| Value.Bool false |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &[B]) -> bool {
              let b: Result<&[B; N], _> = other.try_into();
              match b {
                  Ok(b) => *self != *b,
                  Err(_) => true,
              }
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              let b :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::convert::TryInto",
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ],
                      [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ B ] ] ],
                      "try_into",
                      []
                    |),
                    [ M.read (| other |) ]
                  |)
                |) in
              M.match_operator (|
                b,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Ok",
                          0
                        |) in
                      let b := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::cmp::PartialEq",
                            Ty.apply (Ty.path "array") [ A ],
                            [ Ty.apply (Ty.path "array") [ B ] ],
                            "ne",
                            []
                          |),
                          [ M.read (| self |); M.read (| b |) ]
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Err",
                          0
                        |) in
                      M.alloc (| Value.Bool true |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *) [ (* Rhs *) Ty.apply (Ty.path "slice") [ B ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_slice_B_for_array_A.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_slice_B.
      Definition Self (A B : Ty.t) : Ty.t := Ty.apply (Ty.path "slice") [ B ].
      
      (*
          fn eq(&self, other: &[A; N]) -> bool {
              let b: Result<&[B; N], _> = self.try_into();
              match b {
                  Ok(b) => *b == *other,
                  Err(_) => false,
              }
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              let b :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::convert::TryInto",
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ],
                      [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ B ] ] ],
                      "try_into",
                      []
                    |),
                    [ M.read (| self |) ]
                  |)
                |) in
              M.match_operator (|
                b,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Ok",
                          0
                        |) in
                      let b := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::cmp::PartialEq",
                            Ty.apply (Ty.path "array") [ B ],
                            [ Ty.apply (Ty.path "array") [ A ] ],
                            "eq",
                            []
                          |),
                          [ M.read (| b |); M.read (| other |) ]
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Err",
                          0
                        |) in
                      M.alloc (| Value.Bool false |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &[A; N]) -> bool {
              let b: Result<&[B; N], _> = self.try_into();
              match b {
                  Ok(b) => *b != *other,
                  Err(_) => true,
              }
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.read (|
              let b :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::convert::TryInto",
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ],
                      [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ B ] ] ],
                      "try_into",
                      []
                    |),
                    [ M.read (| self |) ]
                  |)
                |) in
              M.match_operator (|
                b,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Ok",
                          0
                        |) in
                      let b := M.copy (| γ0_0 |) in
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::cmp::PartialEq",
                            Ty.apply (Ty.path "array") [ B ],
                            [ Ty.apply (Ty.path "array") [ A ] ],
                            "ne",
                            []
                          |),
                          [ M.read (| b |); M.read (| other |) ]
                        |)
                      |)));
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.SubPointer.get_struct_tuple_field (|
                          γ,
                          "core::result::Result::Err",
                          0
                        |) in
                      M.alloc (| Value.Bool true |)))
                ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *) [ (* Rhs *) Ty.apply (Ty.path "array") [ A ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_slice_B.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_ref__slice_B_for_array_A.
      Definition Self (A B : Ty.t) : Ty.t := Ty.apply (Ty.path "array") [ A ].
      
      (*
          fn eq(&self, other: &&[B]) -> bool {
              *self == **other
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "array") [ A ],
                [ Ty.apply (Ty.path "slice") [ B ] ],
                "eq",
                []
              |),
              [ M.read (| self |); M.read (| M.read (| other |) |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &&[B]) -> bool {
              *self != **other
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "array") [ A ],
                [ Ty.apply (Ty.path "slice") [ B ] ],
                "ne",
                []
              |),
              [ M.read (| self |); M.read (| M.read (| other |) |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *)
          [ (* Rhs *) Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_ref__slice_B_for_array_A.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_ref__slice_B.
      Definition Self (A B : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ B ] ].
      
      (*
          fn eq(&self, other: &[A; N]) -> bool {
              **self == *other
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ B ],
                [ Ty.apply (Ty.path "array") [ A ] ],
                "eq",
                []
              |),
              [ M.read (| M.read (| self |) |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &[A; N]) -> bool {
              **self != *other
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ B ],
                [ Ty.apply (Ty.path "array") [ A ] ],
                "ne",
                []
              |),
              [ M.read (| M.read (| self |) |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *) [ (* Rhs *) Ty.apply (Ty.path "array") [ A ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_ref__slice_B.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_ref_mut_slice_B_for_array_A.
      Definition Self (A B : Ty.t) : Ty.t := Ty.apply (Ty.path "array") [ A ].
      
      (*
          fn eq(&self, other: &&mut [B]) -> bool {
              *self == **other
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "array") [ A ],
                [ Ty.apply (Ty.path "slice") [ B ] ],
                "eq",
                []
              |),
              [ M.read (| self |); M.read (| M.read (| other |) |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &&mut [B]) -> bool {
              *self != **other
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "array") [ A ],
                [ Ty.apply (Ty.path "slice") [ B ] ],
                "ne",
                []
              |),
              [ M.read (| self |); M.read (| M.read (| other |) |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *)
          [ (* Rhs *) Ty.apply (Ty.path "&mut") [ Ty.apply (Ty.path "slice") [ B ] ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_B_ref_mut_slice_B_for_array_A.
    
    Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_ref_mut_slice_B.
      Definition Self (A B : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "&mut") [ Ty.apply (Ty.path "slice") [ B ] ].
      
      (*
          fn eq(&self, other: &[A; N]) -> bool {
              **self == *other
          }
      *)
      Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ B ],
                [ Ty.apply (Ty.path "array") [ A ] ],
                "eq",
                []
              |),
              [ M.read (| M.read (| self |) |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn ne(&self, other: &[A; N]) -> bool {
              **self != *other
          }
      *)
      Definition ne (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self A B in
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ B ],
                [ Ty.apply (Ty.path "array") [ A ] ],
                "ne",
                []
              |),
              [ M.read (| M.read (| self |) |); M.read (| other |) ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (A B : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self A B)
          (* Trait polymorphic types *) [ (* Rhs *) Ty.apply (Ty.path "array") [ A ] ]
          (* Instance *)
          [ ("eq", InstanceField.Method (eq A B)); ("ne", InstanceField.Method (ne A B)) ].
    End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_B_A_array_A_for_ref_mut_slice_B.
    
    Module Impl_core_cmp_Eq_where_core_cmp_Eq_T_for_array_T.
      Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "array") [ T ].
      
      Axiom Implements :
        forall (T : Ty.t),
        M.IsTraitInstance
          "core::cmp::Eq"
          (Self T)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_cmp_Eq_where_core_cmp_Eq_T_for_array_T.
    
    (* Trait *)
    (* Empty module 'SpecArrayEq' *)
    
    Module Impl_core_array_equality_SpecArrayEq_where_core_cmp_PartialEq_T_Other_Other_for_T.
      Definition Self (T Other : Ty.t) : Ty.t := T.
      
      (*
          default fn spec_eq(a: &[Self; N], b: &[Other; N]) -> bool {
              a[..] == b[..]
          }
      *)
      Definition spec_eq (T Other : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T Other in
        match τ, α with
        | [], [ a; b ] =>
          ltac:(M.monadic
            (let a := M.alloc (| a |) in
            let b := M.alloc (| b |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ T ],
                [ Ty.apply (Ty.path "slice") [ Other ] ],
                "eq",
                []
              |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::index::Index",
                    Ty.apply (Ty.path "array") [ T ],
                    [ Ty.path "core::ops::range::RangeFull" ],
                    "index",
                    []
                  |),
                  [ M.read (| a |); Value.StructTuple "core::ops::range::RangeFull" [] ]
                |);
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::index::Index",
                    Ty.apply (Ty.path "array") [ Other ],
                    [ Ty.path "core::ops::range::RangeFull" ],
                    "index",
                    []
                  |),
                  [ M.read (| b |); Value.StructTuple "core::ops::range::RangeFull" [] ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          default fn spec_ne(a: &[Self; N], b: &[Other; N]) -> bool {
              a[..] != b[..]
          }
      *)
      Definition spec_ne (T Other : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T Other in
        match τ, α with
        | [], [ a; b ] =>
          ltac:(M.monadic
            (let a := M.alloc (| a |) in
            let b := M.alloc (| b |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "slice") [ T ],
                [ Ty.apply (Ty.path "slice") [ Other ] ],
                "ne",
                []
              |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::index::Index",
                    Ty.apply (Ty.path "array") [ T ],
                    [ Ty.path "core::ops::range::RangeFull" ],
                    "index",
                    []
                  |),
                  [ M.read (| a |); Value.StructTuple "core::ops::range::RangeFull" [] ]
                |);
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::index::Index",
                    Ty.apply (Ty.path "array") [ Other ],
                    [ Ty.path "core::ops::range::RangeFull" ],
                    "index",
                    []
                  |),
                  [ M.read (| b |); Value.StructTuple "core::ops::range::RangeFull" [] ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T Other : Ty.t),
        M.IsTraitInstance
          "core::array::equality::SpecArrayEq"
          (Self T Other)
          (* Trait polymorphic types *) [ (* Other *) Other ]
          (* Instance *)
          [
            ("spec_eq", InstanceField.Method (spec_eq T Other));
            ("spec_ne", InstanceField.Method (spec_ne T Other))
          ].
    End Impl_core_array_equality_SpecArrayEq_where_core_cmp_PartialEq_T_Other_Other_for_T.
    
    Module Impl_core_array_equality_SpecArrayEq_where_core_cmp_bytewise_BytewiseEq_T_U_U_for_T.
      Definition Self (T U : Ty.t) : Ty.t := T.
      
      (*
          fn spec_eq(a: &[T; N], b: &[U; N]) -> bool {
              // SAFETY: Arrays are compared element-wise, and don't add any padding
              // between elements, so when the elements are `BytewiseEq`, we can
              // compare the entire array at once.
              unsafe { crate::intrinsics::raw_eq(a, crate::mem::transmute(b)) }
          }
      *)
      Definition spec_eq (T U : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T U in
        match τ, α with
        | [], [ a; b ] =>
          ltac:(M.monadic
            (let a := M.alloc (| a |) in
            let b := M.alloc (| b |) in
            M.call_closure (|
              M.get_function (| "core::intrinsics::raw_eq", [ Ty.apply (Ty.path "array") [ T ] ] |),
              [
                M.read (| a |);
                M.call_closure (|
                  M.get_function (|
                    "core::intrinsics::transmute",
                    [
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ U ] ];
                      Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "array") [ T ] ]
                    ]
                  |),
                  [ M.read (| b |) ]
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      (*
          fn spec_ne(a: &[T; N], b: &[U; N]) -> bool {
              !Self::spec_eq(a, b)
          }
      *)
      Definition spec_ne (T U : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T U in
        match τ, α with
        | [], [ a; b ] =>
          ltac:(M.monadic
            (let a := M.alloc (| a |) in
            let b := M.alloc (| b |) in
            UnOp.Pure.not
              (M.call_closure (|
                M.get_trait_method (|
                  "core::array::equality::SpecArrayEq",
                  T,
                  [ U ],
                  "spec_eq",
                  []
                |),
                [ M.read (| a |); M.read (| b |) ]
              |))))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T U : Ty.t),
        M.IsTraitInstance
          "core::array::equality::SpecArrayEq"
          (Self T U)
          (* Trait polymorphic types *) [ (* Other *) U ]
          (* Instance *)
          [
            ("spec_eq", InstanceField.Method (spec_eq T U));
            ("spec_ne", InstanceField.Method (spec_ne T U))
          ].
    End Impl_core_array_equality_SpecArrayEq_where_core_cmp_bytewise_BytewiseEq_T_U_U_for_T.
  End equality.
End array.
