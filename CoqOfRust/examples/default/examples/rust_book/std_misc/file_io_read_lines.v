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
Definition read_lines (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ filename ] =>
    let* filename := M.alloc filename in
    let return_ :=
      M.return_
        (R :=
          Ty.apply
            (Ty.path "std::io::Lines")
            [
              Ty.apply
                (Ty.path "std::io::buffered::bufreader::BufReader")
                [ Ty.path "std::fs::File" ]
            ]) in
    M.catch_return
      (let* file :=
        let* α0 := M.read filename in
        let* α1 := M.call (Ty.path "std::fs::File")::["open"] [ α0 ] in
        let* α2 :=
          M.call
            (Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error"
                ])::["unwrap"]
            [ α1 ] in
        M.alloc α2 in
      let* α0 :=
        M.get_method
          "std::io::BufRead"
          "lines"
          [
            (* Self *)
              Ty.apply
                (Ty.path "std::io::buffered::bufreader::BufReader")
                [ Ty.path "std::fs::File" ]
          ] in
      let* α1 := M.read file in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "std::io::buffered::bufreader::BufReader")
              [ Ty.path "std::fs::File" ])::["new"]
          [ α1 ] in
      let* α3 := M.call α0 [ α2 ] in
      let* α0 := return_ α3 in
      let* α1 := M.read α0 in
      never_to_any α1)
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* lines :=
      let* α0 := M.var "file_io_read_lines::read_lines" in
      let* α1 :=
        M.get_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "str" ] in
      let* α2 := M.read (mk_str "./hosts") in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* α0 :=
      M.get_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "std::io::Lines")
              [
                Ty.apply
                  (Ty.path "std::io::buffered::bufreader::BufReader")
                  [ Ty.path "std::fs::File" ]
              ]
        ] in
    let* α1 := M.read lines in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_method
                    "core::iter::traits::iterator::Iterator"
                    "next"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "std::io::Lines")
                          [
                            Ty.apply
                              (Ty.path
                                "std::io::buffered::bufreader::BufReader")
                              [ Ty.path "std::fs::File" ]
                          ]
                    ] in
                let* α1 := M.call α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match 
                      end);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let* γ0_0 :=
                          let* α0 := M.var "core::option::Option::Get_Some_0" in
                          M.pure (α0 γ) in
                        let* line := M.copy γ0_0 in
                        let* _ :=
                          let* _ :=
                            let* α0 := M.var "std::io::stdio::_print" in
                            let* α1 := M.read (mk_str "") in
                            let* α2 := M.read (mk_str "
") in
                            let* α3 := M.alloc [ α1; α2 ] in
                            let* α4 := M.read line in
                            let* α5 :=
                              M.call
                                (Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.path "alloc::string::String";
                                      Ty.path "std::io::error::Error"
                                    ])::["unwrap"]
                                [ α4 ] in
                            let* α6 := M.alloc α5 in
                            let* α7 :=
                              M.call
                                (Ty.path
                                    "core::fmt::rt::Argument")::["new_display"]
                                [ α6 ] in
                            let* α8 := M.alloc [ α7 ] in
                            let* α9 :=
                              M.call
                                (Ty.path "core::fmt::Arguments")::["new_v1"]
                                [
                                  pointer_coercion "Unsize" α3;
                                  pointer_coercion "Unsize" α8
                                ] in
                            let* α10 := M.call α0 [ α9 ] in
                            M.alloc α10 in
                          M.alloc tt in
                        M.alloc tt
                      | _ => M.break_match 
                      end)
                  ] in
              M.alloc tt))
        ] in
    M.read (use α4)
  | _, _ => M.impossible
  end.
