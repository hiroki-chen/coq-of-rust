(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS : Ty.path "u32" :=
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
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
          "new" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          "into_iter"
          [
            (* Self *)
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ]
          ] in
      let* α1 := M.var "threads::NTHREADS" in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [ ("start", Value.Integer Integer.U32 0); ("end_", α2) ]
          ] in
      let* α4 := M.alloc α3 in
      let* α5 :=
        match_operator
          α4
          (Value.Array
            [
              fun γ =>
                (let* iter := M.copy γ in
                M.loop
                  (let* _ :=
                    let* α0 :=
                      M.get_trait_method
                        "core::iter::traits::iterator::Iterator"
                        "next"
                        [
                          (* Self *)
                            Ty.apply
                              (Ty.path "core::ops::range::Range")
                              [ Ty.path "u32" ]
                        ] in
                    let* α1 := M.call α0 [ iter ] in
                    let* α2 := M.alloc α1 in
                    match_operator
                      α2
                      (Value.Array
                        [
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            | core.option.Option.None =>
                              let* α0 := M.break in
                              let* α1 := M.read α0 in
                              let* α2 := M.never_to_any α1 in
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
                                    "push" in
                                let* α1 :=
                                  M.get_function "std::thread::spawn" in
                                let* α2 :=
                                  M.call
                                    α1
                                    [
                                      fun (α0 : Ty.path "unit") =>
                                        (let* α0 := M.alloc α0 in
                                        match_operator
                                          α0
                                          (Value.Array
                                            [
                                              fun γ =>
                                                (let* _ :=
                                                  let* _ :=
                                                    let* α0 :=
                                                      M.get_function
                                                        "std::io::stdio::_print" in
                                                    let* α1 :=
                                                      M.get_associated_function
                                                        (Ty.path
                                                          "core::fmt::Arguments")
                                                        "new_v1" in
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
                                                    let* α5 :=
                                                      M.get_associated_function
                                                        (Ty.path
                                                          "core::fmt::rt::Argument")
                                                        "new_display" in
                                                    let* α6 :=
                                                      M.call α5 [ i ] in
                                                    let* α7 :=
                                                      M.alloc
                                                        (Value.Array [ α6 ]) in
                                                    let* α8 :=
                                                      M.call
                                                        α1
                                                        [
                                                          M.pointer_coercion
                                                            (* Unsize *)
                                                            α4;
                                                          M.pointer_coercion
                                                            (* Unsize *)
                                                            α7
                                                        ] in
                                                    let* α9 :=
                                                      M.call α0 [ α8 ] in
                                                    M.alloc α9 in
                                                  M.alloc (Value.Tuple []) in
                                                let* α0 :=
                                                  M.alloc (Value.Tuple []) in
                                                M.read α0)
                                            ]))
                                    ] in
                                let* α3 := M.call α0 [ children; α2 ] in
                                M.alloc α3 in
                              M.alloc (Value.Tuple [])
                            | _ => M.break_match 
                            end)
                        ]) in
                  M.alloc (Value.Tuple [])))
            ]) in
      M.pure (M.use α5) in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "std::thread::JoinHandle") [ Ty.tuple [] ];
                Ty.path "alloc::alloc::Global"
              ]
        ] in
    let* α1 := M.read children in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        (Value.Array
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "alloc::vec::into_iter::IntoIter")
                            [
                              Ty.apply
                                (Ty.path "std::thread::JoinHandle")
                                [ Ty.tuple [] ];
                              Ty.path "alloc::alloc::Global"
                            ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    (Value.Array
                      [
                        fun γ =>
                          (let* α0 := M.read γ in
                          match α0 with
                          | core.option.Option.None =>
                            let* α0 := M.break in
                            let* α1 := M.read α0 in
                            let* α2 := M.never_to_any α1 in
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
                            let* child := M.copy γ0_0 in
                            let* α0 :=
                              M.get_associated_function
                                (Ty.apply
                                  (Ty.path "std::thread::JoinHandle")
                                  [ Ty.tuple [] ])
                                "join" in
                            let* α1 := M.read child in
                            let* α2 := M.call α0 [ α1 ] in
                            let* α3 := M.alloc α2 in
                            match_operator
                              α3
                              (Value.Array
                                [ fun γ => (M.alloc (Value.Tuple [])) ])
                          | _ => M.break_match 
                          end)
                      ]) in
                M.alloc (Value.Tuple [])))
          ]) in
    M.read (M.use α4)
  | _, _ => M.impossible
  end.
