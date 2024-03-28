(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> Result<Option<i32>, ParseIntError> {
    let opt = vec.first().map(|first| first.parse::<i32>().map(|n| 2 * n));

    opt.map_or(Ok(None), |r| r.map(Some))
}
*)
Definition double_first (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* opt :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            ])
          "map"
          [
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
            Ty.function
              [
                Ty.tuple
                  [
                    Ty.apply
                      (Ty.path "&")
                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                  ]
              ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
          ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "first"
          [] in
      let* α2 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          []
          "deref"
          [] in
      let* α3 := M.call_closure α2 [ vec ] in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 :=
        M.call_closure
          α0
          [
            α4;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* first := M.copy γ in
                        let* α0 :=
                          M.get_associated_function
                            (Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "i32";
                                Ty.path "core::num::error::ParseIntError"
                              ])
                            "map"
                            [
                              Ty.path "i32";
                              Ty.function
                                [ Ty.tuple [ Ty.path "i32" ] ]
                                (Ty.path "i32")
                            ] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "str")
                            "parse"
                            [ Ty.path "i32" ] in
                        let* α2 := M.read first in
                        let* α3 := M.read α2 in
                        let* α4 := M.call_closure α1 [ α3 ] in
                        M.call_closure
                          α0
                          [
                            α4;
                            M.closure
                              (fun γ =>
                                match γ with
                                | [ α0 ] =>
                                  let* α0 := M.alloc α0 in
                                  match_operator
                                    α0
                                    [
                                      fun γ =>
                                        let* n := M.copy γ in
                                        let* α0 := M.read n in
                                        BinOp.Panic.mul
                                          (Value.Integer Integer.I32 2)
                                          α0
                                    ]
                                | _ => M.impossible
                                end)
                          ]
                    ]
                | _ => M.impossible
                end)
          ] in
      M.alloc α5 in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
          ])
        "map_or"
        [
          Ty.apply
            (Ty.path "core::result::Result")
            [
              Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
              Ty.path "core::num::error::ParseIntError"
            ];
          Ty.function
            [
              Ty.tuple
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
                ]
            ]
            (Ty.apply
              (Ty.path "core::result::Result")
              [
                Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ];
                Ty.path "core::num::error::ParseIntError"
              ])
        ] in
    let* α1 := M.read opt in
    let* α2 :=
      M.call_closure
        α0
        [
          α1;
          Value.StructTuple
            "core::result::Result::Ok"
            [ Value.StructTuple "core::option::Option::None" [] ];
          M.closure
            (fun γ =>
              match γ with
              | [ α0 ] =>
                let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      let* r := M.copy γ in
                      let* α0 :=
                        M.get_associated_function
                          (Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ])
                          "map"
                          [
                            Ty.apply
                              (Ty.path "core::option::Option")
                              [ Ty.path "i32" ];
                            Ty.function
                              [ Ty.path "i32" ]
                              (Ty.apply
                                (Ty.path "core::option::Option")
                                [ Ty.path "i32" ])
                          ] in
                      let* α1 := M.read r in
                      M.call_closure
                        α0
                        [
                          α1;
                          M.constructor_as_closure "core::option::Option::Some"
                        ]
                  ]
              | _ => M.impossible
              end)
        ] in
    let* α0 := M.alloc α2 in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    println!("The first doubled is {:?}", double_first(numbers));
    println!("The first doubled is {:?}", double_first(empty));
    println!("The first doubled is {:?}", double_first(strings));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* numbers :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply
                    (Ty.path "array")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α2 := M.read (mk_str "42") in
          let* α3 := M.read (mk_str "93") in
          let* α4 := M.read (mk_str "18") in
          let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
          let* α6 := M.call_closure α1 [ α5 ] in
          let* α7 := M.read α6 in
          M.pure (M.pointer_coercion α7) in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
    let* empty :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply
                    (Ty.path "array")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α2 := M.read (mk_str "tofu") in
          let* α3 := M.read (mk_str "93") in
          let* α4 := M.read (mk_str "18") in
          let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
          let* α6 := M.call_closure α1 [ α5 ] in
          let* α7 := M.read α6 in
          M.pure (M.pointer_coercion α7) in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
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
            let* α2 := M.read (mk_str "The first doubled is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α13 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                      Ty.path "core::num::error::ParseIntError"
                    ]
                ] in
            let* α7 :=
              M.get_function
                "pulling_results_out_of_options_with_stop_error_processing::double_first"
                [] in
            let* α8 := M.read numbers in
            let* α9 := M.call_closure α7 [ α8 ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α6 [ α10 ] in
            let* α12 := M.alloc (Value.Array [ α11 ]) in
            M.pure (M.pointer_coercion α12) in
        let* α14 := M.call_closure α1 [ α5; α13 ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
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
            let* α2 := M.read (mk_str "The first doubled is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α13 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                      Ty.path "core::num::error::ParseIntError"
                    ]
                ] in
            let* α7 :=
              M.get_function
                "pulling_results_out_of_options_with_stop_error_processing::double_first"
                [] in
            let* α8 := M.read empty in
            let* α9 := M.call_closure α7 [ α8 ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α6 [ α10 ] in
            let* α12 := M.alloc (Value.Array [ α11 ]) in
            M.pure (M.pointer_coercion α12) in
        let* α14 := M.call_closure α1 [ α5; α13 ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
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
            let* α2 := M.read (mk_str "The first doubled is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α13 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.apply
                        (Ty.path "core::option::Option")
                        [ Ty.path "i32" ];
                      Ty.path "core::num::error::ParseIntError"
                    ]
                ] in
            let* α7 :=
              M.get_function
                "pulling_results_out_of_options_with_stop_error_processing::double_first"
                [] in
            let* α8 := M.read strings in
            let* α9 := M.call_closure α7 [ α8 ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α6 [ α10 ] in
            let* α12 := M.alloc (Value.Array [ α11 ]) in
            M.pure (M.pointer_coercion α12) in
        let* α14 := M.call_closure α1 [ α5; α13 ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
