(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn combine_vecs_explicit_return_type(
    v: Vec<i32>,
    u: Vec<i32>,
) -> iter::Cycle<iter::Chain<IntoIter<i32>, IntoIter<i32>>> {
    v.into_iter().chain(u.into_iter()).cycle()
}
*)
Definition combine_vecs_explicit_return_type (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ v; u ] =>
    let* v := M.alloc v in
    let* u := M.alloc u in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        (Ty.apply
          (Ty.path "core::iter::adapters::chain::Chain")
          [
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ])
        []
        "cycle"
        [] in
    let* α1 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        (Ty.apply
          (Ty.path "alloc::vec::into_iter::IntoIter")
          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "chain"
        [
          Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α2 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "alloc::vec::Vec") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "into_iter"
        [] in
    let* α3 := M.read v in
    let* α4 := M.call_closure α2 [ α3 ] in
    let* α5 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "alloc::vec::Vec") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "into_iter"
        [] in
    let* α6 := M.read u in
    let* α7 := M.call_closure α5 [ α6 ] in
    let* α8 := M.call_closure α1 [ α4; α7 ] in M.call_closure α0 [ α8 ]
  | _, _ => M.impossible
  end.

(*
fn combine_vecs(v: Vec<i32>, u: Vec<i32>) -> impl Iterator<Item = i32> {
    v.into_iter().chain(u.into_iter()).cycle()
}
*)
Definition combine_vecs (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ v; u ] =>
    let* v := M.alloc v in
    let* u := M.alloc u in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        (Ty.apply
          (Ty.path "core::iter::adapters::chain::Chain")
          [
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ])
        []
        "cycle"
        [] in
    let* α1 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        (Ty.apply
          (Ty.path "alloc::vec::into_iter::IntoIter")
          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "chain"
        [
          Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
        ] in
    let* α2 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "alloc::vec::Vec") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "into_iter"
        [] in
    let* α3 := M.read v in
    let* α4 := M.call_closure α2 [ α3 ] in
    let* α5 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "alloc::vec::Vec") [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
        []
        "into_iter"
        [] in
    let* α6 := M.read u in
    let* α7 := M.call_closure α5 [ α6 ] in
    let* α8 := M.call_closure α1 [ α4; α7 ] in M.call_closure α0 [ α8 ]
  | _, _ => M.impossible
  end.

Module combine_vecs.
  (* Error OpaqueTy *)
End combine_vecs.

(*
fn main() {
    let v1 = vec![1, 2, 3];
    let v2 = vec![4, 5];
    let mut v3 = combine_vecs(v1, v2);
    assert_eq!(Some(1), v3.next());
    assert_eq!(Some(2), v3.next());
    assert_eq!(Some(3), v3.next());
    assert_eq!(Some(4), v3.next());
    assert_eq!(Some(5), v3.next());
    println!("all done");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* v1 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α5 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.apply (Ty.path "array") [ Ty.path "i32" ]; Ty.path "alloc::alloc::Global" ])
              "new"
              [] in
          let* α2 :=
            M.alloc
              (Value.Array
                [
                  Value.Integer Integer.I32 1;
                  Value.Integer Integer.I32 2;
                  Value.Integer Integer.I32 3
                ]) in
          let* α3 := M.call_closure α1 [ α2 ] in
          let* α4 := M.read α3 in M.pure (M.pointer_coercion α4) in
      let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
    let* v2 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α5 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.apply (Ty.path "array") [ Ty.path "i32" ]; Ty.path "alloc::alloc::Global" ])
              "new"
              [] in
          let* α2 :=
            M.alloc (Value.Array [ Value.Integer Integer.I32 4; Value.Integer Integer.I32 5 ]) in
          let* α3 := M.call_closure α1 [ α2 ] in
          let* α4 := M.read α3 in M.pure (M.pointer_coercion α4) in
      let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
    let* v3 :=
      let* α0 := M.get_function "impl_trait_as_return_type::combine_vecs" [] in
      let* α1 := M.read v1 in
      let* α2 := M.read v2 in let* α3 := M.call_closure α0 [ α1; α2 ] in M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 1 ]) in
      let* α1 :=
        M.get_trait_method "core::iter::traits::iterator::Iterator" Ty.associated [] "next" [] in
      let* α2 := M.call_closure α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      M.match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                        [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 2 ]) in
      let* α1 :=
        M.get_trait_method "core::iter::traits::iterator::Iterator" Ty.associated [] "next" [] in
      let* α2 := M.call_closure α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      M.match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                        [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 3 ]) in
      let* α1 :=
        M.get_trait_method "core::iter::traits::iterator::Iterator" Ty.associated [] "next" [] in
      let* α2 := M.call_closure α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      M.match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                        [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 4 ]) in
      let* α1 :=
        M.get_trait_method "core::iter::traits::iterator::Iterator" Ty.associated [] "next" [] in
      let* α2 := M.call_closure α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      M.match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                        [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* _ :=
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 5 ]) in
      let* α1 :=
        M.get_trait_method "core::iter::traits::iterator::Iterator" Ty.associated [] "next" [] in
      let* α2 := M.call_closure α1 [ v3 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α0; α3 ]) in
      M.match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
                        [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind := M.alloc (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                        Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [ α1; α2; α3; Value.StructTuple "core::option::Option::None" [] ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "all done
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
