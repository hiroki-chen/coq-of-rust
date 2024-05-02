(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // This variable declaration is where its value is specified.
    let apple = Arc::new("the same apple");

    for _ in 0..10 {
        // Here there is no value specification as it is a pointer to a
        // reference in the memory heap.
        let apple = Arc::clone(&apple);

        thread::spawn(move || {
            // As Arc was used, threads can be spawned using the value allocated
            // in the Arc variable pointer's location.
            println!("{:?}", apple);
        });
    }

    // Make sure all Arc instances are printed from spawned threads.
    thread::sleep(Duration::from_secs(1));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let apple :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              [ M.read (| Value.String "the same apple" |) ]
            |)
          |) in
        let _ :=
          M.use
            (M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::collect::IntoIterator",
                    Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ],
                    [],
                    "into_iter",
                    []
                  |),
                  [
                    Value.StructRecord
                      "core::ops::range::Range"
                      [
                        ("start", Value.Integer Integer.I32 0);
                        ("end_", Value.Integer Integer.I32 10)
                      ]
                  ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let iter := M.copy (| γ |) in
                    M.loop (|
                      ltac:(M.monadic
                        (let _ :=
                          M.match_operator (|
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "core::iter::traits::iterator::Iterator",
                                  Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ],
                                  [],
                                  "next",
                                  []
                                |),
                                [ iter ]
                              |)
                            |),
                            [
                              fun γ =>
                                ltac:(M.monadic
                                  (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                              fun γ =>
                                ltac:(M.monadic
                                  (let γ0_0 :=
                                    M.get_struct_tuple_field (|
                                      γ,
                                      "core::option::Option::Some",
                                      0
                                    |) in
                                  let apple :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_trait_method (|
                                          "core::clone::Clone",
                                          Ty.apply
                                            (Ty.path "alloc::sync::Arc")
                                            [
                                              Ty.apply (Ty.path "&") [ Ty.path "str" ];
                                              Ty.path "alloc::alloc::Global"
                                            ],
                                          [],
                                          "clone",
                                          []
                                        |),
                                        [ apple ]
                                      |)
                                    |) in
                                  let _ :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_function (|
                                          "std::thread::spawn",
                                          [ Ty.function [ Ty.tuple [] ] (Ty.tuple []); Ty.tuple [] ]
                                        |),
                                        [
                                          M.closure
                                            (fun γ =>
                                              ltac:(M.monadic
                                                match γ with
                                                | [ α0 ] =>
                                                  M.match_operator (|
                                                    M.alloc (| α0 |),
                                                    [
                                                      fun γ =>
                                                        ltac:(M.monadic
                                                          (M.read (|
                                                            let _ :=
                                                              let _ :=
                                                                M.alloc (|
                                                                  M.call_closure (|
                                                                    M.get_function (|
                                                                      "std::io::stdio::_print",
                                                                      []
                                                                    |),
                                                                    [
                                                                      M.call_closure (|
                                                                        M.get_associated_function (|
                                                                          Ty.path
                                                                            "core::fmt::Arguments",
                                                                          "new_v1",
                                                                          []
                                                                        |),
                                                                        [
                                                                          (* Unsize *)
                                                                          M.pointer_coercion
                                                                            (M.alloc (|
                                                                              Value.Array
                                                                                [
                                                                                  M.read (|
                                                                                    Value.String ""
                                                                                  |);
                                                                                  M.read (|
                                                                                    Value.String "
"
                                                                                  |)
                                                                                ]
                                                                            |));
                                                                          (* Unsize *)
                                                                          M.pointer_coercion
                                                                            (M.alloc (|
                                                                              Value.Array
                                                                                [
                                                                                  M.call_closure (|
                                                                                    M.get_associated_function (|
                                                                                      Ty.path
                                                                                        "core::fmt::rt::Argument",
                                                                                      "new_debug",
                                                                                      [
                                                                                        Ty.apply
                                                                                          (Ty.path
                                                                                            "alloc::sync::Arc")
                                                                                          [
                                                                                            Ty.apply
                                                                                              (Ty.path
                                                                                                "&")
                                                                                              [
                                                                                                Ty.path
                                                                                                  "str"
                                                                                              ];
                                                                                            Ty.path
                                                                                              "alloc::alloc::Global"
                                                                                          ]
                                                                                      ]
                                                                                    |),
                                                                                    [ apple ]
                                                                                  |)
                                                                                ]
                                                                            |))
                                                                        ]
                                                                      |)
                                                                    ]
                                                                  |)
                                                                |) in
                                                              M.alloc (| Value.Tuple [] |) in
                                                            M.alloc (| Value.Tuple [] |)
                                                          |)))
                                                    ]
                                                  |)
                                                | _ => M.impossible (||)
                                                end))
                                        ]
                                      |)
                                    |) in
                                  M.alloc (| Value.Tuple [] |)))
                            ]
                          |) in
                        M.alloc (| Value.Tuple [] |)))
                    |)))
              ]
            |)) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "std::thread::sleep", [] |),
              [
                M.call_closure (|
                  M.get_associated_function (| Ty.path "core::time::Duration", "from_secs", [] |),
                  [ Value.Integer Integer.U64 1 ]
                |)
              ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
