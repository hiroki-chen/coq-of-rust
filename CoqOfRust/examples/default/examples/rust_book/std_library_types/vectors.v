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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* collected_iterator :=
      let* α0 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "collect"
          [
            (* Self *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ];
            (* B *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", (Integer.of_Z 0) : Ty.path "i32");
                ("end_", (Integer.of_Z 10) : Ty.path "i32")
              ]
          ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Collected (0..10) into: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ collected_iterator ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* xs :=
      let* α0 :=
        M.alloc
          [
            (Integer.of_Z 1) : Ty.path "i32";
            (Integer.of_Z 2) : Ty.path "i32";
            (Integer.of_Z 3) : Ty.path "i32"
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Initial vector: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ xs ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Push 4 into the vector
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* _ :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["push"]
          [ xs; (Integer.of_Z 4) : Ty.path "i32" ] in
      M.alloc α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Vector: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ xs ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Vector length: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["len"]
            [ xs ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α7 ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Second element: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_method
            "core::ops::index::Index"
            "index"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
              (* Idx *) Ty.path "usize"
            ] in
        let* α5 := M.call α4 [ xs; (Integer.of_Z 1) : Ty.path "usize" ] in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α7 ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Pop last element: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["pop"]
            [ xs ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α7 ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Contents of xs:
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ]
          ] in
      let* α1 :=
        M.get_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α2 := M.call α1 [ xs ] in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter"]
          [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      let* α5 := M.alloc α4 in
      let* α6 :=
        match_operator
          α5
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::slice::iter::Iter")
                            [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* x := M.copy γ0_0 in
                          let* _ :=
                            let* _ :=
                              let* α0 := M.var "std::io::stdio::_print" in
                              let* α1 := M.read (mk_str "> ") in
                              let* α2 := M.read (mk_str "
") in
                              let* α3 := M.alloc [ α1; α2 ] in
                              let* α4 :=
                                M.call
                                  (Ty.path
                                      "core::fmt::rt::Argument")::["new_display"]
                                  [ x ] in
                              let* α5 := M.alloc [ α4 ] in
                              let* α6 :=
                                M.call
                                  (Ty.path "core::fmt::Arguments")::["new_v1"]
                                  [
                                    pointer_coercion "Unsize" α3;
                                    pointer_coercion "Unsize" α5
                                  ] in
                              let* α7 := M.call α0 [ α6 ] in
                              M.alloc α7 in
                            M.alloc tt in
                          M.alloc tt
                        | _ => M.break_match 
                        end)
                    ] in
                M.alloc tt))
          ] in
      M.pure (use α6) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::iter::adapters::enumerate::Enumerate")
                [ Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ]
                ]
          ] in
      let* α1 :=
        M.get_method
          "core::iter::traits::iterator::Iterator"
          "enumerate"
          [
            (* Self *)
              Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ]
          ] in
      let* α2 :=
        M.get_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α3 := M.call α2 [ xs ] in
      let* α4 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter"]
          [ α3 ] in
      let* α5 := M.call α1 [ α4 ] in
      let* α6 := M.call α0 [ α5 ] in
      let* α7 := M.alloc α6 in
      let* α8 :=
        match_operator
          α7
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path
                              "core::iter::adapters::enumerate::Enumerate")
                            [
                              Ty.apply
                                (Ty.path "core::slice::iter::Iter")
                                [ Ty.path "i32" ]
                            ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* α0 := M.read γ0_0 in
                          match α0 with
                          | (_, _) =>
                            let γ1_0 := Tuple.Access.left γ0_0 in
                            let γ1_1 := Tuple.Access.right γ0_0 in
                            let* i := M.copy γ1_0 in
                            let* x := M.copy γ1_1 in
                            let* _ :=
                              let* _ :=
                                let* α0 := M.var "std::io::stdio::_print" in
                                let* α1 := M.read (mk_str "In position ") in
                                let* α2 := M.read (mk_str " we have value ") in
                                let* α3 := M.read (mk_str "
") in
                                let* α4 := M.alloc [ α1; α2; α3 ] in
                                let* α5 :=
                                  M.call
                                    (Ty.path
                                        "core::fmt::rt::Argument")::["new_display"]
                                    [ i ] in
                                let* α6 :=
                                  M.call
                                    (Ty.path
                                        "core::fmt::rt::Argument")::["new_display"]
                                    [ x ] in
                                let* α7 := M.alloc [ α5; α6 ] in
                                let* α8 :=
                                  M.call
                                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                                    [
                                      pointer_coercion "Unsize" α4;
                                      pointer_coercion "Unsize" α7
                                    ] in
                                let* α9 := M.call α0 [ α8 ] in
                                M.alloc α9 in
                              M.alloc tt in
                            M.alloc tt
                          end
                        | _ => M.break_match 
                        end)
                    ] in
                M.alloc tt))
          ] in
      M.pure (use α8) in
    let* _ :=
      let* α0 :=
        M.get_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::slice::iter::IterMut") [ Ty.path "i32" ]
          ] in
      let* α1 :=
        M.get_method
          "core::ops::deref::DerefMut"
          "deref_mut"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α2 := M.call α1 [ xs ] in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter_mut"]
          [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      let* α5 := M.alloc α4 in
      let* α6 :=
        match_operator
          α5
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::slice::iter::IterMut")
                            [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.None =>
                          let* α0 := M.break in
                          let* α1 := M.read α0 in
                          let* α2 := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match 
                        end);
                      fun γ =>
                        (let* α0 := M.read γ in
                        match α0 with
                        | core.option.Option.Some _ =>
                          let* γ0_0 :=
                            let* α0 :=
                              M.var "core::option::Option::Get_Some_0" in
                            M.pure (α0 γ) in
                          let* x := M.copy γ0_0 in
                          let* _ :=
                            let* β := M.read x in
                            let* α0 := M.var "assign" in
                            let* α1 := M.var "BinOp::Panic::mul" in
                            let* α2 := M.read β in
                            let* α3 :=
                              α1 α2 ((Integer.of_Z 3) : Ty.path "i32") in
                            α0 β α3 in
                          M.alloc tt
                        | _ => M.break_match 
                        end)
                    ] in
                M.alloc tt))
          ] in
      M.pure (use α6) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Updated vector: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ xs ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ pointer_coercion "Unsize" α3; pointer_coercion "Unsize" α5 ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
