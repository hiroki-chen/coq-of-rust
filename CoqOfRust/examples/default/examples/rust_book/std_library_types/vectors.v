(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Iterators can be collected into vectors
    let collected_iterator: Vec<i32> = (0..10).collect();
    println!("Collected (0..10) into: {:?}", collected_iterator);

    // The `vec!` macro can be used to initialize a vector
    let mut xs = vec![1i32, 2, 3];
    println!("Initial vector: {:?}", xs);

    // Insert new element at the end of the vector
    println!("Push 4 into the vector");
    xs.push(4);
    println!("Vector: {:?}", xs);

    // Error! Immutable vectors can't grow
    // collected_iterator.push(0);
    // FIXME ^ Comment out this line

    // The `len` method yields the number of elements currently stored in a vector
    println!("Vector length: {}", xs.len());

    // Indexing is done using the square brackets (indexing starts at 0)
    println!("Second element: {}", xs[1]);

    // `pop` removes the last element from the vector and returns it
    println!("Pop last element: {:?}", xs.pop());

    // Out of bounds indexing yields a panic
    // println!("Fourth element: {}", xs[3]);
    // FIXME ^ Comment out this line

    // `Vector`s can be easily iterated over
    println!("Contents of xs:");
    for x in xs.iter() {
        println!("> {}", x);
    }

    // A `Vector` can also be iterated over while the iteration
    // count is enumerated in a separate variable (`i`)
    for (i, x) in xs.iter().enumerate() {
        println!("In position {} we have value {}", i, x);
    }

    // Thanks to `iter_mut`, mutable `Vector`s can also be iterated
    // over in a way that allows modifying each value
    for x in xs.iter_mut() {
        *x *= 3;
    }
    println!("Updated vector: {:?}", xs);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* collected_iterator :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", Value.Integer Integer.I32 0);
                ("end_", Value.Integer Integer.I32 10)
              ]
          ] in
      M.alloc α1 in
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
            let* α2 := M.read (mk_str "Collected (0..10) into: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                ] in
            let* α7 := M.call_closure α6 [ collected_iterator ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* xs :=
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
            let* α2 := M.read (mk_str "Initial vector: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                ] in
            let* α7 := M.call_closure α6 [ xs ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Push 4 into the vector
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in
        let* α6 := M.call_closure α0 [ α5 ] in
        M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "push"
          [] in
      let* α1 := M.call_closure α0 [ xs; Value.Integer Integer.I32 4 ] in
      M.alloc α1 in
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
            let* α2 := M.read (mk_str "Vector: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                ] in
            let* α7 := M.call_closure α6 [ xs ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
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
            let* α2 := M.read (mk_str "Vector length: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "usize" ] in
            let* α7 :=
              M.get_associated_function
                (Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
                "len"
                [] in
            let* α8 := M.call_closure α7 [ xs ] in
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
            let* α2 := M.read (mk_str "Second element: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α11 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α7 :=
              M.get_trait_method
                "core::ops::index::Index"
                (Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
                [ Ty.path "usize" ]
                "index"
                [] in
            let* α8 :=
              M.call_closure α7 [ xs; Value.Integer Integer.Usize 1 ] in
            let* α9 := M.call_closure α6 [ α8 ] in
            let* α10 := M.alloc (Value.Array [ α9 ]) in
            M.pure (M.pointer_coercion α10) in
        let* α12 := M.call_closure α1 [ α5; α11 ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
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
            let* α2 := M.read (mk_str "Pop last element: ") in
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
              M.get_associated_function
                (Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
                "pop"
                [] in
            let* α8 := M.call_closure α7 [ xs ] in
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
            "new_const"
            [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Contents of xs:
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in
        let* α6 := M.call_closure α0 [ α5 ] in
        M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "iter"
          [] in
      let* α2 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "deref"
          [] in
      let* α3 := M.call_closure α2 [ xs ] in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::slice::iter::Iter")
                        [ Ty.path "i32" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* x := M.copy γ0_0 in
                        let* _ :=
                          let* _ :=
                            let* α0 :=
                              M.get_function "std::io::stdio::_print" [] in
                            let* α1 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::Arguments")
                                "new_v1"
                                [] in
                            let* α5 :=
                              (* Unsize *)
                                let* α2 := M.read (mk_str "> ") in
                                let* α3 := M.read (mk_str "
") in
                                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                                M.pure (M.pointer_coercion α4) in
                            let* α9 :=
                              (* Unsize *)
                                let* α6 :=
                                  M.get_associated_function
                                    (Ty.path "core::fmt::rt::Argument")
                                    "new_display"
                                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ]
                                    ] in
                                let* α7 := M.call_closure α6 [ x ] in
                                let* α8 := M.alloc (Value.Array [ α7 ]) in
                                M.pure (M.pointer_coercion α8) in
                            let* α10 := M.call_closure α1 [ α5; α9 ] in
                            let* α11 := M.call_closure α0 [ α10 ] in
                            M.alloc α11 in
                          M.alloc (Value.Tuple []) in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α7) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::enumerate::Enumerate")
            [ Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ] ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ])
          []
          "enumerate"
          [] in
      let* α2 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "iter"
          [] in
      let* α3 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "deref"
          [] in
      let* α4 := M.call_closure α3 [ xs ] in
      let* α5 := M.call_closure α2 [ α4 ] in
      let* α6 := M.call_closure α1 [ α5 ] in
      let* α7 := M.call_closure α0 [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::iter::adapters::enumerate::Enumerate")
                        [
                          Ty.apply
                            (Ty.path "core::slice::iter::Iter")
                            [ Ty.path "i32" ]
                        ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let γ1_0 := M.get_tuple_field γ0_0 0 in
                        let γ1_1 := M.get_tuple_field γ0_0 1 in
                        let* i := M.copy γ1_0 in
                        let* x := M.copy γ1_1 in
                        let* _ :=
                          let* _ :=
                            let* α0 :=
                              M.get_function "std::io::stdio::_print" [] in
                            let* α1 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::Arguments")
                                "new_v1"
                                [] in
                            let* α6 :=
                              (* Unsize *)
                                let* α2 := M.read (mk_str "In position ") in
                                let* α3 := M.read (mk_str " we have value ") in
                                let* α4 := M.read (mk_str "
") in
                                let* α5 :=
                                  M.alloc (Value.Array [ α2; α3; α4 ]) in
                                M.pure (M.pointer_coercion α5) in
                            let* α12 :=
                              (* Unsize *)
                                let* α7 :=
                                  M.get_associated_function
                                    (Ty.path "core::fmt::rt::Argument")
                                    "new_display"
                                    [ Ty.path "usize" ] in
                                let* α8 := M.call_closure α7 [ i ] in
                                let* α9 :=
                                  M.get_associated_function
                                    (Ty.path "core::fmt::rt::Argument")
                                    "new_display"
                                    [ Ty.apply (Ty.path "&") [ Ty.path "i32" ]
                                    ] in
                                let* α10 := M.call_closure α9 [ x ] in
                                let* α11 := M.alloc (Value.Array [ α8; α10 ]) in
                                M.pure (M.pointer_coercion α11) in
                            let* α13 := M.call_closure α1 [ α6; α12 ] in
                            let* α14 := M.call_closure α0 [ α13 ] in
                            M.alloc α14 in
                          M.alloc (Value.Tuple []) in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α9) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::slice::iter::IterMut") [ Ty.path "i32" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "iter_mut"
          [] in
      let* α2 :=
        M.get_trait_method
          "core::ops::deref::DerefMut"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "deref_mut"
          [] in
      let* α3 := M.call_closure α2 [ xs ] in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::slice::iter::IterMut")
                        [ Ty.path "i32" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* x := M.copy γ0_0 in
                        let* _ :=
                          let* β := M.read x in
                          let* α0 := M.read β in
                          let* α1 :=
                            BinOp.Panic.mul α0 (Value.Integer Integer.I32 3) in
                          M.assign β α1 in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α7) in
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
            let* α2 := M.read (mk_str "Updated vector: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                ] in
            let* α7 := M.call_closure α6 [ xs ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
