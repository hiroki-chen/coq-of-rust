(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_LOREM_IPSUM : Value.t :=
  M.run
    (M.alloc
      (mk_str
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
")).

(*
fn main() {
    let path = Path::new("lorem_ipsum.txt");
    let display = path.display();

    // Open a file in write-only mode, returns `io::Result<File>`
    let mut file = match File::create(&path) {
        Err(why) => panic!("couldn't create {}: {}", display, why),
        Ok(file) => file,
    };

    // Write the `LOREM_IPSUM` string to `file`, returns `io::Result<()>`
    match file.write_all(LOREM_IPSUM.as_bytes()) {
        Err(why) => panic!("couldn't write to {}: {}", display, why),
        Ok(_) => println!("successfully wrote to {}", display),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* path :=
      let* α0 := M.get_associated_function (Ty.path "std::path::Path") "new" [ Ty.path "str" ] in
      let* α1 := M.read (mk_str "lorem_ipsum.txt") in
      let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* display :=
      let* α0 := M.get_associated_function (Ty.path "std::path::Path") "display" [] in
      let* α1 := M.read path in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* file :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "std::fs::File")
          "create"
          [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "std::path::Path" ] ] ] in
      let* α1 := M.call_closure α0 [ path ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        M.match_operator
          α2
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match γ "core::result::Result::Err" 0 in
              let* why := M.copy γ0_0 in
              let* α0 := M.get_function "core::panicking::panic_fmt" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "couldn't create ") in
                  let* α3 := M.read (mk_str ": ") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α11 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "std::path::Display" ] in
                  let* α7 := M.call_closure α6 [ display ] in
                  let* α8 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "std::io::error::Error" ] in
                  let* α9 := M.call_closure α8 [ why ] in
                  let* α10 := M.alloc (Value.Array [ α7; α9 ]) in M.pure (M.pointer_coercion α10) in
              let* α12 := M.call_closure α1 [ α5; α11 ] in
              let* α13 := M.call_closure α0 [ α12 ] in
              let* α14 := M.never_to_any α13 in M.alloc α14;
            fun γ =>
              let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Ok" 0 in
              let* file := M.copy γ0_0 in M.pure file
          ] in
      M.copy α3 in
    let* α0 := M.get_trait_method "std::io::Write" (Ty.path "std::fs::File") [] "write_all" [] in
    let* α1 := M.get_associated_function (Ty.path "str") "as_bytes" [] in
    let* α2 := M.get_constant "file_io_create::LOREM_IPSUM" in
    let* α3 := M.read α2 in
    let* α4 := M.read α3 in
    let* α5 := M.call_closure α1 [ α4 ] in
    let* α6 := M.call_closure α0 [ file; α5 ] in
    let* α7 := M.alloc α6 in
    let* α0 :=
      M.match_operator
        α7
        [
          fun γ =>
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Err" 0 in
            let* why := M.copy γ0_0 in
            let* α0 := M.get_function "core::panicking::panic_fmt" [] in
            let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
            let* α5 :=
              (* Unsize *)
                let* α2 := M.read (mk_str "couldn't write to ") in
                let* α3 := M.read (mk_str ": ") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
            let* α11 :=
              (* Unsize *)
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "std::path::Display" ] in
                let* α7 := M.call_closure α6 [ display ] in
                let* α8 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "std::io::error::Error" ] in
                let* α9 := M.call_closure α8 [ why ] in
                let* α10 := M.alloc (Value.Array [ α7; α9 ]) in M.pure (M.pointer_coercion α10) in
            let* α12 := M.call_closure α1 [ α5; α11 ] in
            let* α13 := M.call_closure α0 [ α12 ] in let* α14 := M.never_to_any α13 in M.alloc α14;
          fun γ =>
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Ok" 0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "successfully wrote to ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "std::path::Display" ] in
                  let* α7 := M.call_closure α6 [ display ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
