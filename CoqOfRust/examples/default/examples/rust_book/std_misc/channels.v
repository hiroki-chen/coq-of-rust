(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition NTHREADS : Ty.apply (Ty.path "ref") [ Ty.path "i32" ] :=
  M.run
    (let* α0 := M.alloc (Value.Integer Integer.I32 3) in
    M.alloc α0).

(*
fn main() {
    // Channels have two endpoints: the `Sender<T>` and the `Receiver<T>`,
    // where `T` is the type of the message to be transferred
    // (type annotation is superfluous)
    let (tx, rx): (Sender<i32>, Receiver<i32>) = mpsc::channel();
    let mut children = Vec::new();

    for id in 0..NTHREADS {
        // The sender endpoint can be copied
        let thread_tx = tx.clone();

        // Each thread will send its id via the channel
        let child = thread::spawn(move || {
            // The thread takes ownership over `thread_tx`
            // Each thread queues a message in the channel
            thread_tx.send(id).unwrap();

            // Sending is a non-blocking operation, the thread will continue
            // immediately after sending its message
            println!("thread {} finished", id);
        });

        children.push(child);
    }

    // Here, all the messages are collected
    let mut ids = Vec::with_capacity(NTHREADS as usize);
    for _ in 0..NTHREADS {
        // The `recv` method picks a message from the channel
        // `recv` will block the current thread if there are no messages available
        ids.push(rx.recv());
    }

    // Wait for the threads to complete any remaining work
    for child in children {
        child.join().expect("oops! the child thread panicked");
    }

    // Show the order in which the messages were sent
    println!("{:?}", ids);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 := M.var "std::sync::mpsc::channel" in
    let* α1 := M.call α0 [] in
    let* α2 := M.alloc α1 in
    let* α3 :=
      match_operator
        α2
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* tx := M.copy γ0_0 in
              let* rx := M.copy γ0_1 in
              let* children :=
                let* α0 :=
                  M.call
                    (Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [
                          Ty.apply
                            (Ty.path "std::thread::JoinHandle")
                            [ Ty.tuple [] ];
                          Ty.path "alloc::alloc::Global"
                        ])::["new"]
                    [] in
                M.alloc α0 in
              let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::ops::range::Range")
                          [ Ty.path "i32" ]
                    ] in
                let* α1 := M.var "channels::NTHREADS" in
                let* α2 := M.read α1 in
                let* α3 := M.read α2 in
                let* α4 :=
                  M.call
                    α0
                    [
                      Value.StructRecord
                        "core::ops::range::Range"
                        [ ("start", Value.Integer Integer.I32 0); ("end_", α3) ]
                    ] in
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
                              M.get_trait_method
                                "core::iter::traits::iterator::Iterator"
                                "next"
                                [
                                  (* Self *)
                                    Ty.apply
                                      (Ty.path "core::ops::range::Range")
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
                                        M.var
                                          "core::option::Option::Get_Some_0" in
                                      M.pure (α0 γ) in
                                    let* id := M.copy γ0_0 in
                                    let* thread_tx :=
                                      let* α0 :=
                                        M.get_trait_method
                                          "core::clone::Clone"
                                          "clone"
                                          [
                                            (* Self *)
                                              Ty.apply
                                                (Ty.path
                                                  "std::sync::mpsc::Sender")
                                                [ Ty.path "i32" ]
                                          ] in
                                      let* α1 := M.call α0 [ tx ] in
                                      M.alloc α1 in
                                    let* child :=
                                      let* α0 := M.var "std::thread::spawn" in
                                      let* α1 :=
                                        M.call
                                          α0
                                          [
                                            fun (α0 : Ty.path "unit") =>
                                              (let* α0 := M.alloc α0 in
                                              match_operator
                                                α0
                                                [
                                                  fun γ =>
                                                    (let* _ :=
                                                      let* α0 := M.read id in
                                                      let* α1 :=
                                                        M.call
                                                          (Ty.apply
                                                              (Ty.path
                                                                "std::sync::mpsc::Sender")
                                                              [ Ty.path "i32"
                                                              ])::["send"]
                                                          [ thread_tx; α0 ] in
                                                      let* α2 :=
                                                        M.call
                                                          (Ty.apply
                                                              (Ty.path
                                                                "core::result::Result")
                                                              [
                                                                Ty.tuple [];
                                                                Ty.apply
                                                                  (Ty.path
                                                                    "std::sync::mpsc::SendError")
                                                                  [
                                                                    Ty.path
                                                                      "i32"
                                                                  ]
                                                              ])::["unwrap"]
                                                          [ α1 ] in
                                                      M.alloc α2 in
                                                    let* _ :=
                                                      let* _ :=
                                                        let* α0 :=
                                                          M.var
                                                            "std::io::stdio::_print" in
                                                        let* α1 :=
                                                          M.read
                                                            (mk_str
                                                              "thread ") in
                                                        let* α2 :=
                                                          M.read
                                                            (mk_str
                                                              " finished
") in
                                                        let* α3 :=
                                                          M.alloc [ α1; α2 ] in
                                                        let* α4 :=
                                                          M.call
                                                            (Ty.path
                                                                "core::fmt::rt::Argument")::["new_display"]
                                                            [ id ] in
                                                        let* α5 :=
                                                          M.alloc [ α4 ] in
                                                        let* α6 :=
                                                          M.call
                                                            (Ty.path
                                                                "core::fmt::Arguments")::["new_v1"]
                                                            [
                                                              M.pointer_coercion
                                                                "Unsize"
                                                                α3;
                                                              M.pointer_coercion
                                                                "Unsize"
                                                                α5
                                                            ] in
                                                        let* α7 :=
                                                          M.call α0 [ α6 ] in
                                                        M.alloc α7 in
                                                      M.alloc tt in
                                                    let* α0 := M.alloc tt in
                                                    M.read α0)
                                                ])
                                          ] in
                                      M.alloc α1 in
                                    let* _ :=
                                      let* α0 := M.read child in
                                      let* α1 :=
                                        M.call
                                          (Ty.apply
                                              (Ty.path "alloc::vec::Vec")
                                              [
                                                Ty.apply
                                                  (Ty.path
                                                    "std::thread::JoinHandle")
                                                  [ Ty.tuple [] ];
                                                Ty.path "alloc::alloc::Global"
                                              ])::["push"]
                                          [ children; α0 ] in
                                      M.alloc α1 in
                                    M.alloc tt
                                  | _ => M.break_match 
                                  end)
                              ] in
                          M.alloc tt))
                    ] in
                M.pure (M.use α6) in
              let* ids :=
                let* α0 := M.var "channels::NTHREADS" in
                let* α1 := M.read α0 in
                let* α2 := M.read α1 in
                let* α3 :=
                  M.call
                    (Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "std::sync::mpsc::RecvError"
                            ];
                          Ty.path "alloc::alloc::Global"
                        ])::["with_capacity"]
                    [ M.rust_cast α2 ] in
                M.alloc α3 in
              let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::ops::range::Range")
                          [ Ty.path "i32" ]
                    ] in
                let* α1 := M.var "channels::NTHREADS" in
                let* α2 := M.read α1 in
                let* α3 := M.read α2 in
                let* α4 :=
                  M.call
                    α0
                    [
                      Value.StructRecord
                        "core::ops::range::Range"
                        [ ("start", Value.Integer Integer.I32 0); ("end_", α3) ]
                    ] in
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
                              M.get_trait_method
                                "core::iter::traits::iterator::Iterator"
                                "next"
                                [
                                  (* Self *)
                                    Ty.apply
                                      (Ty.path "core::ops::range::Range")
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
                                        M.var
                                          "core::option::Option::Get_Some_0" in
                                      M.pure (α0 γ) in
                                    let* _ :=
                                      let* α0 :=
                                        M.call
                                          (Ty.apply
                                              (Ty.path
                                                "std::sync::mpsc::Receiver")
                                              [ Ty.path "i32" ])::["recv"]
                                          [ rx ] in
                                      let* α1 :=
                                        M.call
                                          (Ty.apply
                                              (Ty.path "alloc::vec::Vec")
                                              [
                                                Ty.apply
                                                  (Ty.path
                                                    "core::result::Result")
                                                  [
                                                    Ty.path "i32";
                                                    Ty.path
                                                      "std::sync::mpsc::RecvError"
                                                  ];
                                                Ty.path "alloc::alloc::Global"
                                              ])::["push"]
                                          [ ids; α0 ] in
                                      M.alloc α1 in
                                    M.alloc tt
                                  | _ => M.break_match 
                                  end)
                              ] in
                          M.alloc tt))
                    ] in
                M.pure (M.use α6) in
              let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [
                            Ty.apply
                              (Ty.path "std::thread::JoinHandle")
                              [ Ty.tuple [] ];
                            Ty.path "alloc::alloc::Global"
                          ]
                    ] in
                let* α1 := M.read children in
                let* α2 := M.call α0 [ α1 ] in
                let* α3 := M.alloc α2 in
                let* α4 :=
                  match_operator
                    α3
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
                                      (Ty.path
                                        "alloc::vec::into_iter::IntoIter")
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
                                        M.var
                                          "core::option::Option::Get_Some_0" in
                                      M.pure (α0 γ) in
                                    let* child := M.copy γ0_0 in
                                    let* _ :=
                                      let* α0 := M.read child in
                                      let* α1 :=
                                        M.call
                                          (Ty.apply
                                              (Ty.path
                                                "std::thread::JoinHandle")
                                              [ Ty.tuple [] ])::["join"]
                                          [ α0 ] in
                                      let* α2 :=
                                        M.read
                                          (mk_str
                                            "oops! the child thread panicked") in
                                      let* α3 :=
                                        M.call
                                          (Ty.apply
                                              (Ty.path "core::result::Result")
                                              [
                                                Ty.tuple [];
                                                Ty.apply
                                                  (Ty.path "alloc::boxed::Box")
                                                  [
                                                    Ty.dyn
                                                      [
                                                        ("core::any::Any::Trait",
                                                          [])
                                                      ];
                                                    Ty.path
                                                      "alloc::alloc::Global"
                                                  ]
                                              ])::["expect"]
                                          [ α1; α2 ] in
                                      M.alloc α3 in
                                    M.alloc tt
                                  | _ => M.break_match 
                                  end)
                              ] in
                          M.alloc tt))
                    ] in
                M.pure (M.use α4) in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                      [ ids ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        M.pointer_coercion "Unsize" α3;
                        M.pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              M.alloc tt
            end)
        ] in
    M.read α3
  | _, _ => M.impossible
  end.
