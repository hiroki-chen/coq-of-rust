(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let output = Command::new("rustc")
        .arg("--version")
        .output()
        .unwrap_or_else(|e| panic!("failed to execute process: {}", e));

    if output.status.success() {
        let s = String::from_utf8_lossy(&output.stdout);

        print!("rustc succeeded and stdout was:\n{}", s);
    } else {
        let s = String::from_utf8_lossy(&output.stderr);

        print!("rustc failed and stderr was:\n{}", s);
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* output :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "std::process::Output"; Ty.path "std::io::error::Error" ])
          "unwrap_or_else"
          [
            Ty.function
              [ Ty.tuple [ Ty.path "std::io::error::Error" ] ]
              (Ty.path "std::process::Output")
          ] in
      let* α1 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "output"
          [] in
      let* α2 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "arg"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α3 :=
        M.get_associated_function
          (Ty.path "std::process::Command")
          "new"
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
      let* α4 := M.read (mk_str "rustc") in
      let* α5 := M.call_closure α3 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 := M.read (mk_str "--version") in
      let* α8 := M.call_closure α2 [ α6; α7 ] in
      let* α9 := M.call_closure α1 [ α8 ] in
      let* α10 :=
        M.call_closure
          α0
          [
            α9;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  M.match_operator
                    α0
                    [
                      fun γ =>
                        let* e := M.copy γ in
                        let* α0 :=
                          M.get_function "core::panicking::panic_fmt" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_v1"
                            [] in
                        let* α4 :=
                          (* Unsize *)
                            let* α2 :=
                              M.read (mk_str "failed to execute process: ") in
                            let* α3 := M.alloc (Value.Array [ α2 ]) in
                            M.pure (M.pointer_coercion α3) in
                        let* α8 :=
                          (* Unsize *)
                            let* α5 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "std::io::error::Error" ] in
                            let* α6 := M.call_closure α5 [ e ] in
                            let* α7 := M.alloc (Value.Array [ α6 ]) in
                            M.pure (M.pointer_coercion α7) in
                        let* α9 := M.call_closure α1 [ α4; α8 ] in
                        let* α10 := M.call_closure α0 [ α9 ] in
                        M.never_to_any α10
                    ]
                | _ => M.impossible
                end)
          ] in
      M.alloc α10 in
    let* α0 := M.alloc (Value.Tuple []) in
    let* α0 :=
      M.match_operator
        α0
        [
          fun γ =>
            let* γ :=
              let* α0 :=
                M.get_associated_function
                  (Ty.path "std::process::ExitStatus")
                  "success"
                  [] in
              let* α1 :=
                M.call_closure
                  α0
                  [
                    M.get_struct_record_field
                      output
                      "std::process::Output"
                      "status"
                  ] in
              let* α2 := M.alloc α1 in
              M.pure (M.use α2) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* s :=
              let* α0 :=
                M.get_associated_function
                  (Ty.path "alloc::string::String")
                  "from_utf8_lossy"
                  [] in
              let* α1 :=
                M.get_trait_method
                  "core::ops::deref::Deref"
                  (Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
                  []
                  "deref"
                  [] in
              let* α2 :=
                M.call_closure
                  α1
                  [
                    M.get_struct_record_field
                      output
                      "std::process::Output"
                      "stdout"
                  ] in
              let* α3 := M.call_closure α0 [ α2 ] in
              M.alloc α3 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α4 :=
                  (* Unsize *)
                    let* α2 :=
                      M.read (mk_str "rustc succeeded and stdout was:
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    M.pure (M.pointer_coercion α3) in
                let* α8 :=
                  (* Unsize *)
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display"
                        [
                          Ty.apply
                            (Ty.path "alloc::borrow::Cow")
                            [ Ty.path "str" ]
                        ] in
                    let* α6 := M.call_closure α5 [ s ] in
                    let* α7 := M.alloc (Value.Array [ α6 ]) in
                    M.pure (M.pointer_coercion α7) in
                let* α9 := M.call_closure α1 [ α4; α8 ] in
                let* α10 := M.call_closure α0 [ α9 ] in
                M.alloc α10 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* s :=
              let* α0 :=
                M.get_associated_function
                  (Ty.path "alloc::string::String")
                  "from_utf8_lossy"
                  [] in
              let* α1 :=
                M.get_trait_method
                  "core::ops::deref::Deref"
                  (Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
                  []
                  "deref"
                  [] in
              let* α2 :=
                M.call_closure
                  α1
                  [
                    M.get_struct_record_field
                      output
                      "std::process::Output"
                      "stderr"
                  ] in
              let* α3 := M.call_closure α0 [ α2 ] in
              M.alloc α3 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α4 :=
                  (* Unsize *)
                    let* α2 :=
                      M.read (mk_str "rustc failed and stderr was:
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    M.pure (M.pointer_coercion α3) in
                let* α8 :=
                  (* Unsize *)
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display"
                        [
                          Ty.apply
                            (Ty.path "alloc::borrow::Cow")
                            [ Ty.path "str" ]
                        ] in
                    let* α6 := M.call_closure α5 [ s ] in
                    let* α7 := M.alloc (Value.Array [ α6 ]) in
                    M.pure (M.pointer_coercion α7) in
                let* α9 := M.call_closure α1 [ α4; α8 ] in
                let* α10 := M.call_closure α0 [ α9 ] in
                M.alloc α10 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
