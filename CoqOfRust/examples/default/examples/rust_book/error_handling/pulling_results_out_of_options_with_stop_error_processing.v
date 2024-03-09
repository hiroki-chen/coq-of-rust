(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn double_first(vec: Vec<&str>) -> Result<Option<i32>, ParseIntError> {
    let opt = vec.first().map(|first| first.parse::<i32>().map(|n| 2 * n));

    opt.map_or(Ok(None), |r| r.map(Some))
}
*)
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
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
          "map" in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "first" in
      let* α2 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "str" ];
                  Ty.path "alloc::alloc::Global"
                ]
          ] in
      let* α3 := M.call α2 [ vec ] in
      let* α4 := M.call α1 [ α3 ] in
      let* α5 :=
        M.call
          α0
          [
            α4;
            fun
                (α0 :
                  Ty.apply
                    (Ty.path "&")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]) =>
              (let* α0 := M.alloc α0 in
              match_operator
                α0
                (Value.Array
                  [
                    fun γ =>
                      (let* first := M.copy γ in
                      let* α0 :=
                        M.get_associated_function
                          (Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.path "core::num::error::ParseIntError"
                            ])
                          "map" in
                      let* α1 :=
                        M.get_associated_function (Ty.path "str") "parse" in
                      let* α2 := M.read first in
                      let* α3 := M.read α2 in
                      let* α4 := M.call α1 [ α3 ] in
                      M.call
                        α0
                        [
                          α4;
                          fun (α0 : Ty.path "i32") =>
                            (let* α0 := M.alloc α0 in
                            match_operator
                              α0
                              (Value.Array
                                [
                                  fun γ =>
                                    (let* n := M.copy γ in
                                    let* α0 := M.read n in
                                    BinOp.Panic.mul
                                      (Value.Integer Integer.I32 2)
                                      α0)
                                ]))
                        ])
                  ]))
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
        "map_or" in
    let* α1 := M.read opt in
    let* α2 :=
      M.call
        α0
        [
          α1;
          Value.StructTuple
            "core::result::Result::Ok"
            [ Value.StructTuple "core::option::Option::None" [] ];
          fun
              (α0 :
                Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError"
                  ]) =>
            (let* α0 := M.alloc α0 in
            match_operator
              α0
              (Value.Array
                [
                  fun γ =>
                    (let* r := M.copy γ in
                    let* α0 :=
                      M.get_associated_function
                        (Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.path "i32";
                            Ty.path "core::num::error::ParseIntError"
                          ])
                        "map" in
                    let* α1 := M.read r in
                    M.call α0 [ α1; core.option.Option.Some ])
                ]))
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* numbers :=
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
      let* α2 := M.read (mk_str "42") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* empty :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
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
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 :=
          M.get_function
            "pulling_results_out_of_options_with_stop_error_processing::double_first" in
        let* α7 := M.read numbers in
        let* α8 := M.call α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 :=
          M.get_function
            "pulling_results_out_of_options_with_stop_error_processing::double_first" in
        let* α7 := M.read empty in
        let* α8 := M.call α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The first doubled is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 :=
          M.get_function
            "pulling_results_out_of_options_with_stop_error_processing::double_first" in
        let* α7 := M.read strings in
        let* α8 := M.call α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 := M.call α5 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
