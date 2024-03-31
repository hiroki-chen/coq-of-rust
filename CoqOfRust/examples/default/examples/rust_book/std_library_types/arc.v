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
    let* apple :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.read (mk_str "the same apple") in
      let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [ ("start", Value.Integer Integer.I32 0); ("end_", Value.Integer Integer.I32 10) ]
          ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.match_operator
          α2
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
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
                        let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* apple :=
                          let* α0 :=
                            M.get_trait_method
                              "core::clone::Clone"
                              (Ty.apply
                                (Ty.path "alloc::sync::Arc")
                                [
                                  Ty.apply (Ty.path "&") [ Ty.path "str" ];
                                  Ty.path "alloc::alloc::Global"
                                ])
                              []
                              "clone"
                              [] in
                          let* α1 := M.call_closure α0 [ apple ] in M.alloc α1 in
                        let* _ :=
                          let* α0 :=
                            M.get_function
                              "std::thread::spawn"
                              [ Ty.function [ Ty.tuple [] ] (Ty.tuple []); Ty.tuple [] ] in
                          let* α1 :=
                            M.call_closure
                              α0
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
                                                  M.get_function "std::io::stdio::_print" [] in
                                                let* α1 :=
                                                  M.get_associated_function
                                                    (Ty.path "core::fmt::Arguments")
                                                    "new_v1"
                                                    [] in
                                                let* α5 :=
                                                  (* Unsize *)
                                                    let* α2 := M.read (mk_str "") in
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
                                                            (Ty.path "alloc::sync::Arc")
                                                            [
                                                              Ty.apply
                                                                (Ty.path "&")
                                                                [ Ty.path "str" ];
                                                              Ty.path "alloc::alloc::Global"
                                                            ]
                                                        ] in
                                                    let* α7 := M.call_closure α6 [ apple ] in
                                                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                                                    M.pure (M.pointer_coercion α8) in
                                                let* α10 := M.call_closure α1 [ α5; α9 ] in
                                                let* α11 := M.call_closure α0 [ α10 ] in
                                                M.alloc α11 in
                                              M.alloc (Value.Tuple []) in
                                            let* α0 := M.alloc (Value.Tuple []) in M.read α0
                                        ]
                                    | _ => M.impossible
                                    end)
                              ] in
                          M.alloc α1 in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α3) in
    let* _ :=
      let* α0 := M.get_function "std::thread::sleep" [] in
      let* α1 := M.get_associated_function (Ty.path "core::time::Duration") "from_secs" [] in
      let* α2 := M.call_closure α1 [ Value.Integer Integer.U64 1 ] in
      let* α3 := M.call_closure α0 [ α2 ] in M.alloc α3 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
