(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let strings = vec!["tofu", "93", "18"];
    let numbers: Result<Vec<_>, _> = strings.into_iter().map(|s| s.parse::<i32>()).collect();
    println!("Results: {:?}", numbers);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
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
    let* numbers :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::map::Map")
            [
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ];
              Ty.function
                [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
                (Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
            ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "core::result::Result")
              [
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                Ty.path "core::num::error::ParseIntError"
              ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ])
          []
          "map"
          [
            Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ];
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
          ] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ])
          []
          "into_iter"
          [] in
      let* α3 := M.read strings in
      let* α4 := M.call_closure α2 [ α3 ] in
      let* α5 :=
        M.call_closure
          α1
          [
            α4;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  M.match_operator
                    α0
                    [
                      fun γ =>
                        let* s := M.copy γ in
                        let* α0 :=
                          M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
                        let* α1 := M.read s in
                        M.call_closure α0 [ α1 ]
                    ]
                | _ => M.impossible
                end)
          ] in
      let* α6 := M.call_closure α0 [ α5 ] in
      M.alloc α6 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Results: ") in
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
                    (Ty.path "core::result::Result")
                    [
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
                      Ty.path "core::num::error::ParseIntError"
                    ]
                ] in
            let* α7 := M.call_closure α6 [ numbers ] in
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
