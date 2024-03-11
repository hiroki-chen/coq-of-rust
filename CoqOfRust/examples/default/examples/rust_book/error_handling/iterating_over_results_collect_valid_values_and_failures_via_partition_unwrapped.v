(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let strings = vec!["tofu", "93", "18"];
    let (numbers, errors): (Vec<_>, Vec<_>) = strings
        .into_iter()
        .map(|s| s.parse::<i32>())
        .partition(Result::is_ok);
    let numbers: Vec<_> = numbers.into_iter().map(Result::unwrap).collect();
    let errors: Vec<_> = errors.into_iter().map(Result::unwrap_err).collect();
    println!("Numbers: {:?}", numbers);
    println!("Errors: {:?}", errors);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec" in
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
          "new" in
      let* α2 := M.read (mk_str "tofu") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "partition"
        [
          (* Self *)
            Ty.apply
              (Ty.path "core::iter::adapters::map::Map")
              [
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [
                    Ty.apply (Ty.path "&") [ Ty.path "str" ];
                    Ty.path "alloc::alloc::Global"
                  ];
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                    ])
              ];
          (* B *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
                Ty.path "alloc::alloc::Global"
              ];
          (* F *)
            Ty.function
              [
                Ty.apply
                  (Ty.path "&")
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                      ]
                  ]
              ]
              (Ty.path "bool")
        ] in
    let* α1 :=
      M.get_trait_method
        "core::iter::traits::iterator::Iterator"
        "map"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::into_iter::IntoIter")
              [
                Ty.apply (Ty.path "&") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ];
          (* B *)
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
          (* F *)
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        ] in
    let* α2 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "&") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ]
        ] in
    let* α3 := M.read strings in
    let* α4 := M.call α2 [ α3 ] in
    let* α5 :=
      M.call
        α1
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
                      let* s := M.copy γ in
                      let* α0 :=
                        M.get_associated_function (Ty.path "str") "parse" in
                      let* α1 := M.read s in
                      M.call α0 [ α1 ]
                  ]
              | _ => M.impossible
              end)
        ] in
    let* α6 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::result::Result")
          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        "is_ok" in
    let* α7 := M.call α0 [ α5; α6 ] in
    let* α8 := M.alloc α7 in
    let* α0 :=
      match_operator
        α8
        [
          fun γ =>
            let* γ0_0 := M.get_tuple_field γ 0 in
            let* γ0_1 := M.get_tuple_field γ 1 in
            let* numbers := M.copy γ0_0 in
            let* errors := M.copy γ0_1 in
            let* numbers :=
              let* α0 :=
                M.get_trait_method
                  "core::iter::traits::iterator::Iterator"
                  "collect"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::iter::adapters::map::Map")
                        [
                          Ty.apply
                            (Ty.path "alloc::vec::into_iter::IntoIter")
                            [
                              Ty.apply
                                (Ty.path "core::result::Result")
                                [
                                  Ty.path "i32";
                                  Ty.path "core::num::error::ParseIntError"
                                ];
                              Ty.path "alloc::alloc::Global"
                            ];
                          Ty.function
                            [
                              Ty.apply
                                (Ty.path "core::result::Result")
                                [
                                  Ty.path "i32";
                                  Ty.path "core::num::error::ParseIntError"
                                ]
                            ]
                            (Ty.path "i32")
                        ];
                    (* B *)
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
                  ] in
              let* α1 :=
                M.get_trait_method
                  "core::iter::traits::iterator::Iterator"
                  "map"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "alloc::vec::into_iter::IntoIter")
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ];
                          Ty.path "alloc::alloc::Global"
                        ];
                    (* B *) Ty.path "i32";
                    (* F *)
                      Ty.function
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ]
                        ]
                        (Ty.path "i32")
                  ] in
              let* α2 :=
                M.get_trait_method
                  "core::iter::traits::collect::IntoIterator"
                  "into_iter"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ];
                          Ty.path "alloc::alloc::Global"
                        ]
                  ] in
              let* α3 := M.read numbers in
              let* α4 := M.call α2 [ α3 ] in
              let* α5 :=
                M.get_associated_function
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                    ])
                  "unwrap" in
              let* α6 := M.call α1 [ α4; α5 ] in
              let* α7 := M.call α0 [ α6 ] in
              M.alloc α7 in
            let* errors :=
              let* α0 :=
                M.get_trait_method
                  "core::iter::traits::iterator::Iterator"
                  "collect"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "core::iter::adapters::map::Map")
                        [
                          Ty.apply
                            (Ty.path "alloc::vec::into_iter::IntoIter")
                            [
                              Ty.apply
                                (Ty.path "core::result::Result")
                                [
                                  Ty.path "i32";
                                  Ty.path "core::num::error::ParseIntError"
                                ];
                              Ty.path "alloc::alloc::Global"
                            ];
                          Ty.function
                            [
                              Ty.apply
                                (Ty.path "core::result::Result")
                                [
                                  Ty.path "i32";
                                  Ty.path "core::num::error::ParseIntError"
                                ]
                            ]
                            (Ty.path "core::num::error::ParseIntError")
                        ];
                    (* B *)
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [
                          Ty.path "core::num::error::ParseIntError";
                          Ty.path "alloc::alloc::Global"
                        ]
                  ] in
              let* α1 :=
                M.get_trait_method
                  "core::iter::traits::iterator::Iterator"
                  "map"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "alloc::vec::into_iter::IntoIter")
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ];
                          Ty.path "alloc::alloc::Global"
                        ];
                    (* B *) Ty.path "core::num::error::ParseIntError";
                    (* F *)
                      Ty.function
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ]
                        ]
                        (Ty.path "core::num::error::ParseIntError")
                  ] in
              let* α2 :=
                M.get_trait_method
                  "core::iter::traits::collect::IntoIterator"
                  "into_iter"
                  [
                    (* Self *)
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ];
                          Ty.path "alloc::alloc::Global"
                        ]
                  ] in
              let* α3 := M.read errors in
              let* α4 := M.call α2 [ α3 ] in
              let* α5 :=
                M.get_associated_function
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                    ])
                  "unwrap_err" in
              let* α6 := M.call α1 [ α4; α5 ] in
              let* α7 := M.call α0 [ α6 ] in
              M.alloc α7 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "Numbers: ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_debug" in
                let* α6 := M.call α5 [ numbers ] in
                let* α7 := M.alloc (Value.Array [ α6 ]) in
                let* α8 :=
                  M.call
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α7
                    ] in
                let* α9 := M.call α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple []) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "Errors: ") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                let* α5 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_debug" in
                let* α6 := M.call α5 [ errors ] in
                let* α7 := M.alloc (Value.Array [ α6 ]) in
                let* α8 :=
                  M.call
                    α1
                    [
                      M.pointer_coercion (* Unsize *) α4;
                      M.pointer_coercion (* Unsize *) α7
                    ] in
                let* α9 := M.call α0 [ α8 ] in
                M.alloc α9 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
