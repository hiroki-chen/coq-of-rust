(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_NTHREADS : Value.t :=
  M.run (M.alloc (Value.Integer Integer.U32 10)).

(*
fn main() {
    // Make a vector to hold the children which are spawned.
    let mut children = vec![];

    for i in 0..NTHREADS {
        // Spin up another thread
        children.push(thread::spawn(move || {
            println!("this is thread number {}", i);
        }));
    }

    for child in children {
        // Wait for the thread to finish. Returns a result.
        let _ = child.join();
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* children :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ])
          []
          "into_iter"
          [] in
      let* α1 := M.get_constant "threads::NTHREADS" in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [ ("start", Value.Integer Integer.U32 0); ("end_", α2) ]
          ] in
      let* α4 := M.alloc α3 in
      let* α5 :=
        M.match_operator
          α4
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::ops::range::Range")
                        [ Ty.path "u32" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  M.match_operator
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
                        let* i := M.copy γ0_0 in
                        let* _ :=
                          let* α0 :=
                            M.get_associated_function
                              (Ty.apply
                                (Ty.path "alloc::vec::Vec")
                                [
                                  Ty.apply
                                    (Ty.path "std::thread::JoinHandle")
                                    [ Ty.tuple [] ];
                                  Ty.path "alloc::alloc::Global"
                                ])
                              "push"
                              [] in
                          let* α1 :=
                            M.get_function
                              "std::thread::spawn"
                              [
                                Ty.function [ Ty.tuple [] ] (Ty.tuple []);
                                Ty.tuple []
                              ] in
                          let* α2 :=
                            M.call_closure
                              α1
                              [
                                M.closure
                                  (fun γ =>
                                    match γ with
                                    | [ α0 ] =>
                                      let* α0 := M.alloc α0 in
                                      M.match_operator
                                        α0
                                        [
                                          fun γ =>
                                            let* _ :=
                                              let* _ :=
                                                let* α0 :=
                                                  M.get_function
                                                    "std::io::stdio::_print"
                                                    [] in
                                                let* α1 :=
                                                  M.get_associated_function
                                                    (Ty.path
                                                      "core::fmt::Arguments")
                                                    "new_v1"
                                                    [] in
                                                let* α5 :=
                                                  (* Unsize *)
                                                    let* α2 :=
                                                      M.read
                                                        (mk_str
                                                          "this is thread number ") in
                                                    let* α3 :=
                                                      M.read (mk_str "
") in
                                                    let* α4 :=
                                                      M.alloc
                                                        (Value.Array
                                                          [ α2; α3 ]) in
                                                    M.pure
                                                      (M.pointer_coercion α4) in
                                                let* α9 :=
                                                  (* Unsize *)
                                                    let* α6 :=
                                                      M.get_associated_function
                                                        (Ty.path
                                                          "core::fmt::rt::Argument")
                                                        "new_display"
                                                        [ Ty.path "u32" ] in
                                                    let* α7 :=
                                                      M.call_closure α6 [ i ] in
                                                    let* α8 :=
                                                      M.alloc
                                                        (Value.Array [ α7 ]) in
                                                    M.pure
                                                      (M.pointer_coercion α8) in
                                                let* α10 :=
                                                  M.call_closure
                                                    α1
                                                    [ α5; α9 ] in
                                                let* α11 :=
                                                  M.call_closure α0 [ α10 ] in
                                                M.alloc α11 in
                                              M.alloc (Value.Tuple []) in
                                            let* α0 :=
                                              M.alloc (Value.Tuple []) in
                                            M.read α0
                                        ]
                                    | _ => M.impossible
                                    end)
                              ] in
                          let* α3 := M.call_closure α0 [ children; α2 ] in
                          M.alloc α3 in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α5) in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply
          (Ty.path "alloc::vec::Vec")
          [
            Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
            Ty.path "alloc::alloc::Global"
          ])
        []
        "into_iter"
        [] in
    let* α1 := M.read children in
    let* α2 := M.call_closure α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      M.match_operator
        α3
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply
                      (Ty.path "alloc::vec::into_iter::IntoIter")
                      [
                        Ty.apply
                          (Ty.path "std::thread::JoinHandle")
                          [ Ty.tuple [] ];
                        Ty.path "alloc::alloc::Global"
                      ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                M.match_operator
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
                      let* child := M.copy γ0_0 in
                      let* α0 :=
                        M.get_associated_function
                          (Ty.apply
                            (Ty.path "std::thread::JoinHandle")
                            [ Ty.tuple [] ])
                          "join"
                          [] in
                      let* α1 := M.read child in
                      let* α2 := M.call_closure α0 [ α1 ] in
                      let* α3 := M.alloc α2 in
                      M.match_operator α3 [ fun γ => M.alloc (Value.Tuple []) ]
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α4)
  | _, _ => M.impossible
  end.
