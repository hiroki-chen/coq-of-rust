(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn read_lines(filename: String) -> io::Lines<BufReader<File>> {
    // Open the file in read-only mode.
    let file = File::open(filename).unwrap();
    // Read the file line by line, and return an iterator of the lines of the file.
    return io::BufReader::new(file).lines();
}
*)
Definition read_lines (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ filename ] =>
    let* filename := M.alloc filename in
    let* file :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error" ])
          "unwrap"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.path "std::fs::File")
          "open"
          [ Ty.path "alloc::string::String" ] in
      let* α2 := M.read filename in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* α0 :=
      M.get_trait_method
        "std::io::BufRead"
        (Ty.apply
          (Ty.path "std::io::buffered::bufreader::BufReader")
          [ Ty.path "std::fs::File" ])
        []
        "lines"
        [] in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "std::io::buffered::bufreader::BufReader")
          [ Ty.path "std::fs::File" ])
        "new"
        [] in
    let* α2 := M.read file in
    let* α3 := M.call_closure α1 [ α2 ] in
    let* α4 := M.call_closure α0 [ α3 ] in
    let* α0 := M.return_ α4 in
    let* α1 := M.read α0 in
    M.never_to_any α1
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Stores the iterator of lines of the file in lines variable.
    let lines = read_lines("./hosts".to_string());
    // Iterate over the lines of the file, and in this case print them.
    for line in lines {
        println!("{}", line.unwrap());
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* lines :=
      let* α0 := M.get_function "file_io_read_lines::read_lines" [] in
      let* α1 :=
        M.get_trait_method
          "alloc::string::ToString"
          (Ty.path "str")
          []
          "to_string"
          [] in
      let* α2 := M.read (mk_str "./hosts") in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply
          (Ty.path "std::io::Lines")
          [
            Ty.apply
              (Ty.path "std::io::buffered::bufreader::BufReader")
              [ Ty.path "std::fs::File" ]
          ])
        []
        "into_iter"
        [] in
    let* α1 := M.read lines in
    let* α2 := M.call_closure α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply
                      (Ty.path "std::io::Lines")
                      [
                        Ty.apply
                          (Ty.path "std::io::buffered::bufreader::BufReader")
                          [ Ty.path "std::fs::File" ]
                      ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      let* α0 := M.break in
                      let* α1 := M.read α0 in
                      let* α2 := M.never_to_any α1 in
                      M.alloc α2;
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          γ
                          "core::option::Option::Some"
                          0 in
                      let* line := M.copy γ0_0 in
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
                          let* α13 :=
                            (* Unsize *)
                              let* α6 :=
                                M.get_associated_function
                                  (Ty.path "core::fmt::rt::Argument")
                                  "new_display"
                                  [ Ty.path "alloc::string::String" ] in
                              let* α7 :=
                                M.get_associated_function
                                  (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.path "alloc::string::String";
                                      Ty.path "std::io::error::Error"
                                    ])
                                  "unwrap"
                                  [] in
                              let* α8 := M.read line in
                              let* α9 := M.call_closure α7 [ α8 ] in
                              let* α10 := M.alloc α9 in
                              let* α11 := M.call_closure α6 [ α10 ] in
                              let* α12 := M.alloc (Value.Array [ α11 ]) in
                              M.pure (M.pointer_coercion α12) in
                          let* α14 := M.call_closure α1 [ α5; α13 ] in
                          let* α15 := M.call_closure α0 [ α14 ] in
                          M.alloc α15 in
                        M.alloc (Value.Tuple []) in
                      M.alloc (Value.Tuple [])
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α4)
  | _, _ => M.impossible
  end.
