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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* output :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "std::process::Output"; Ty.path "std::io::error::Error" ])
          "unwrap_or_else" in
      let* α1 :=
        M.get_associated_function (Ty.path "std::process::Command") "output" in
      let* α2 :=
        M.get_associated_function (Ty.path "std::process::Command") "arg" in
      let* α3 :=
        M.get_associated_function (Ty.path "std::process::Command") "new" in
      let* α4 := M.read (mk_str "rustc") in
      let* α5 := M.call α3 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 := M.read (mk_str "--version") in
      let* α8 := M.call α2 [ α6; α7 ] in
      let* α9 := M.call α1 [ α8 ] in
      let* α10 :=
        M.call
          α0
          [
            α9;
            M.closure
              (fun γ =>
                match γ with
                | [ α0 ] =>
                  let* α0 := M.alloc α0 in
                  match_operator
                    α0
                    [
                      fun γ =>
                        let* e := M.copy γ in
                        let* α0 :=
                          M.get_function "core::panicking::panic_fmt" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_v1" in
                        let* α2 :=
                          M.read (mk_str "failed to execute process: ") in
                        let* α3 := M.alloc (Value.Array [ α2 ]) in
                        let* α4 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::rt::Argument")
                            "new_display" in
                        let* α5 := M.call α4 [ e ] in
                        let* α6 := M.alloc (Value.Array [ α5 ]) in
                        let* α7 :=
                          M.call
                            α1
                            [
                              M.pointer_coercion (* Unsize *) α3;
                              M.pointer_coercion (* Unsize *) α6
                            ] in
                        let* α8 := M.call α0 [ α7 ] in
                        M.never_to_any α8
                    ]
                | _ => M.impossible
                end)
          ] in
      M.alloc α10 in
    let* α0 :=
      M.get_associated_function
        (Ty.path "std::process::ExitStatus")
        "success" in
    let* α1 := M.call α0 [ M.get_struct_record output "status" ] in
    let* α2 := M.alloc α1 in
    let* α3 := M.read (M.use α2) in
    let* α0 :=
      if Value.is_true α3 then
        let* s :=
          let* α0 :=
            M.get_associated_function
              (Ty.path "alloc::string::String")
              "from_utf8_lossy" in
          let* α1 :=
            M.get_trait_method
              "core::ops::deref::Deref"
              "deref"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ]
              ] in
          let* α2 := M.call α1 [ M.get_struct_record output "stdout" ] in
          let* α3 := M.call α0 [ α2 ] in
          M.alloc α3 in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_v1" in
            let* α2 := M.read (mk_str "rustc succeeded and stdout was:
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display" in
            let* α5 := M.call α4 [ s ] in
            let* α6 := M.alloc (Value.Array [ α5 ]) in
            let* α7 :=
              M.call
                α1
                [
                  M.pointer_coercion (* Unsize *) α3;
                  M.pointer_coercion (* Unsize *) α6
                ] in
            let* α8 := M.call α0 [ α7 ] in
            M.alloc α8 in
          M.alloc (Value.Tuple []) in
        M.alloc (Value.Tuple [])
      else
        let* s :=
          let* α0 :=
            M.get_associated_function
              (Ty.path "alloc::string::String")
              "from_utf8_lossy" in
          let* α1 :=
            M.get_trait_method
              "core::ops::deref::Deref"
              "deref"
              [
                (* Self *)
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ]
              ] in
          let* α2 := M.call α1 [ M.get_struct_record output "stderr" ] in
          let* α3 := M.call α0 [ α2 ] in
          M.alloc α3 in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 :=
              M.get_associated_function
                (Ty.path "core::fmt::Arguments")
                "new_v1" in
            let* α2 := M.read (mk_str "rustc failed and stderr was:
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in
            let* α4 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display" in
            let* α5 := M.call α4 [ s ] in
            let* α6 := M.alloc (Value.Array [ α5 ]) in
            let* α7 :=
              M.call
                α1
                [
                  M.pointer_coercion (* Unsize *) α3;
                  M.pointer_coercion (* Unsize *) α6
                ] in
            let* α8 := M.call α0 [ α7 ] in
            M.alloc α8 in
          M.alloc (Value.Tuple []) in
        M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
