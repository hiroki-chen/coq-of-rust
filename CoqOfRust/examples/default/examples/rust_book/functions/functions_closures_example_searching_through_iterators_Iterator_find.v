(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec1 = vec![1, 2, 3];
    let vec2 = vec![4, 5, 6];

    // `iter()` for vecs yields `&i32`.
    let mut iter = vec1.iter();
    // `into_iter()` for vecs yields `i32`.
    let mut into_iter = vec2.into_iter();

    // `iter()` for vecs yields `&i32`, and we want to reference one of its
    // items, so we have to destructure `&&i32` to `i32`
    println!("Find 2 in vec1: {:?}", iter.find(|&&x| x == 2));
    // `into_iter()` for vecs yields `i32`, and we want to reference one of
    // its items, so we have to destructure `&i32` to `i32`
    println!("Find 2 in vec2: {:?}", into_iter.find(|&x| x == 2));

    let array1 = [1, 2, 3];
    let array2 = [4, 5, 6];

    // `iter()` for arrays yields `&i32`
    println!("Find 2 in array1: {:?}", array1.iter().find(|&&x| x == 2));
    // `into_iter()` for arrays yields `i32`
    println!(
        "Find 2 in array2: {:?}",
        array2.into_iter().find(|&x| *x == 2)
    );
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* vec1 :=
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
                [
                  Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ])
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
          let* α4 := M.read α3 in
          M.pure (M.pointer_coercion α4) in
      let* α6 := M.call_closure α0 [ α5 ] in
      M.alloc α6 in
    let* vec2 :=
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
                [
                  Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α2 :=
            M.alloc
              (Value.Array
                [
                  Value.Integer Integer.I32 4;
                  Value.Integer Integer.I32 5;
                  Value.Integer Integer.I32 6
                ]) in
          let* α3 := M.call_closure α1 [ α2 ] in
          let* α4 := M.read α3 in
          M.pure (M.pointer_coercion α4) in
      let* α6 := M.call_closure α0 [ α5 ] in
      M.alloc α6 in
    let* iter :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "iter"
          [] in
      let* α1 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "deref"
          [] in
      let* α2 := M.call_closure α1 [ vec1 ] in
      let* α3 := M.call_closure α0 [ α2 ] in
      M.alloc α3 in
    let* into_iter :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "into_iter"
          [] in
      let* α1 := M.read vec2 in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Find 2 in vec1: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::option::Option")
                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                ] in
            let* α7 :=
              M.get_trait_method
                "core::iter::traits::iterator::Iterator"
                (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ])
                []
                "find"
                [
                  Ty.function
                    [
                      Ty.tuple
                        [
                          Ty.apply
                            (Ty.path "&")
                            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                        ]
                    ]
                    (Ty.path "bool")
                ] in
            let* α8 :=
              M.call_closure
                α7
                [
                  iter;
                  M.closure
                    (fun γ =>
                      match γ with
                      | [ α0 ] =>
                        let* α0 := M.alloc α0 in
                        M.match_operator
                          α0
                          [
                            fun γ =>
                              let* γ := M.read γ in
                              let* γ := M.read γ in
                              let* x := M.copy γ in
                              let* α0 := M.read x in
                              M.pure
                                (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2))
                          ]
                      | _ => M.impossible
                      end)
                ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Find 2 in vec2: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ]
                ] in
            let* α7 :=
              M.get_trait_method
                "core::iter::traits::iterator::Iterator"
                (Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
                []
                "find"
                [
                  Ty.function
                    [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] ]
                    (Ty.path "bool")
                ] in
            let* α8 :=
              M.call_closure
                α7
                [
                  into_iter;
                  M.closure
                    (fun γ =>
                      match γ with
                      | [ α0 ] =>
                        let* α0 := M.alloc α0 in
                        M.match_operator
                          α0
                          [
                            fun γ =>
                              let* γ := M.read γ in
                              let* x := M.copy γ in
                              let* α0 := M.read x in
                              M.pure
                                (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2))
                          ]
                      | _ => M.impossible
                      end)
                ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* array1 :=
      M.alloc
        (Value.Array
          [
            Value.Integer Integer.I32 1;
            Value.Integer Integer.I32 2;
            Value.Integer Integer.I32 3
          ]) in
    let* array2 :=
      M.alloc
        (Value.Array
          [
            Value.Integer Integer.I32 4;
            Value.Integer Integer.I32 5;
            Value.Integer Integer.I32 6
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Find 2 in array1: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α16 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::option::Option")
                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                ] in
            let* α7 :=
              M.get_trait_method
                "core::iter::traits::iterator::Iterator"
                (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ])
                []
                "find"
                [
                  Ty.function
                    [
                      Ty.tuple
                        [
                          Ty.apply
                            (Ty.path "&")
                            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                        ]
                    ]
                    (Ty.path "bool")
                ] in
            let* α8 :=
              M.get_associated_function
                (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
                "iter"
                [] in
            let* α9 := (* Unsize *) M.pure (M.pointer_coercion array1) in
            let* α10 := M.call_closure α8 [ α9 ] in
            let* α11 := M.alloc α10 in
            let* α12 :=
              M.call_closure
                α7
                [
                  α11;
                  M.closure
                    (fun γ =>
                      match γ with
                      | [ α0 ] =>
                        let* α0 := M.alloc α0 in
                        M.match_operator
                          α0
                          [
                            fun γ =>
                              let* γ := M.read γ in
                              let* γ := M.read γ in
                              let* x := M.copy γ in
                              let* α0 := M.read x in
                              M.pure
                                (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2))
                          ]
                      | _ => M.impossible
                      end)
                ] in
            let* α13 := M.alloc α12 in
            let* α14 := M.call_closure α6 [ α13 ] in
            let* α15 := M.alloc (Value.Array [ α14 ]) in
            M.pure (M.pointer_coercion α15) in
        let* α17 := M.call_closure α1 [ α5; α16 ] in
        let* α18 := M.call_closure α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Find 2 in array2: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α15 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::option::Option")
                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                ] in
            let* α7 :=
              M.get_trait_method
                "core::iter::traits::iterator::Iterator"
                (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ])
                []
                "find"
                [
                  Ty.function
                    [
                      Ty.tuple
                        [
                          Ty.apply
                            (Ty.path "&")
                            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                        ]
                    ]
                    (Ty.path "bool")
                ] in
            let* α8 :=
              M.get_trait_method
                "core::iter::traits::collect::IntoIterator"
                (Ty.apply
                  (Ty.path "&")
                  [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ])
                []
                "into_iter"
                [] in
            let* α9 := M.call_closure α8 [ array2 ] in
            let* α10 := M.alloc α9 in
            let* α11 :=
              M.call_closure
                α7
                [
                  α10;
                  M.closure
                    (fun γ =>
                      match γ with
                      | [ α0 ] =>
                        let* α0 := M.alloc α0 in
                        M.match_operator
                          α0
                          [
                            fun γ =>
                              let* γ := M.read γ in
                              let* x := M.copy γ in
                              let* α0 := M.read x in
                              let* α1 := M.read α0 in
                              M.pure
                                (BinOp.Pure.eq α1 (Value.Integer Integer.I32 2))
                          ]
                      | _ => M.impossible
                      end)
                ] in
            let* α12 := M.alloc α11 in
            let* α13 := M.call_closure α6 [ α12 ] in
            let* α14 := M.alloc (Value.Array [ α13 ]) in
            M.pure (M.pointer_coercion α14) in
        let* α16 := M.call_closure α1 [ α5; α15 ] in
        let* α17 := M.call_closure α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
