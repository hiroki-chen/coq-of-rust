(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}
*)
Definition read_lines (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ P ], [ filename ] =>
    let* filename := M.alloc filename in
    let* file :=
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          "branch"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error" ]
          ] in
      let* α1 := M.get_associated_function (Ty.path "std::fs::File") "open" in
      let* α2 := M.read filename in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      let* α5 := M.alloc α4 in
      let* α6 :=
        match_operator
          α5
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_trait_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.apply
                                (Ty.path "std::io::Lines")
                                [
                                  Ty.apply
                                    (Ty.path
                                      "std::io::buffered::bufreader::BufReader")
                                    [ Ty.path "std::fs::File" ]
                                ];
                              Ty.path "std::io::error::Error"
                            ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "core::convert::Infallible";
                              Ty.path "std::io::error::Error"
                            ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := M.return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := M.never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end)
            ]) in
      M.copy α6 in
    let* α0 :=
      M.get_trait_method
        "std::io::BufRead"
        "lines"
        [
          (* Self *)
            Ty.apply
              (Ty.path "std::io::buffered::bufreader::BufReader")
              [ Ty.path "std::fs::File" ]
        ] in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "std::io::buffered::bufreader::BufReader")
          [ Ty.path "std::fs::File" ])
        "new" in
    let* α2 := M.read file in
    let* α3 := M.call α1 [ α2 ] in
    let* α4 := M.call α0 [ α3 ] in
    let* α0 := M.alloc (Value.StructTuple "core::result::Result::Ok" [ α4 ]) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // File hosts must exist in current path before this produces output
    if let Ok(lines) = read_lines("./hosts") {
        // Consumes the iterator, returns an (Optional) String
        for line in lines {
            if let Ok(ip) = line {
                println!("{}", ip);
            }
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.get_function "file_io_read_lines_efficient_method::read_lines" in
    let* α1 := M.read (mk_str "./hosts") in
    let* α2 := M.call α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      match_operator
        α3
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Ok _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::result::Result::Get_Ok_0" in
                  M.pure (α0 γ) in
                let* lines := M.copy γ0_0 in
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::collect::IntoIterator"
                    "into_iter"
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
                let* α1 := M.read lines in
                let* α2 := M.call α0 [ α1 ] in
                let* α3 := M.alloc α2 in
                let* α4 :=
                  match_operator
                    α3
                    (Value.Array
                      [
                        fun γ =>
                          (let* iter := M.copy γ in
                          M.loop
                            (let* _ :=
                              let* α0 :=
                                M.get_trait_method
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
                                (Value.Array
                                  [
                                    fun γ =>
                                      (let* α0 := M.read γ in
                                      match α0 with
                                      | core.option.Option.None =>
                                        let* α0 := M.break in
                                        let* α1 := M.read α0 in
                                        let* α2 := M.never_to_any α1 in
                                        M.alloc α2
                                      | _ => M.break_match 
                                      end);
                                    fun γ =>
                                      (let* α0 := M.read γ in
                                      match α0 with
                                      | core.option.Option.Some _ =>
                                        let* γ0_0 :=
                                          let* α0 :=
                                            M.var
                                              "core::option::Option::Get_Some_0" in
                                          M.pure (α0 γ) in
                                        let* line := M.copy γ0_0 in
                                        match_operator
                                          line
                                          (Value.Array
                                            [
                                              fun γ =>
                                                (let* α0 := M.read γ in
                                                match α0 with
                                                | core.result.Result.Ok _ =>
                                                  let* γ0_0 :=
                                                    let* α0 :=
                                                      M.var
                                                        "core::result::Result::Get_Ok_0" in
                                                    M.pure (α0 γ) in
                                                  let* ip := M.copy γ0_0 in
                                                  let* _ :=
                                                    let* _ :=
                                                      let* α0 :=
                                                        M.get_function
                                                          "std::io::stdio::_print" in
                                                      let* α1 :=
                                                        M.get_associated_function
                                                          (Ty.path
                                                            "core::fmt::Arguments")
                                                          "new_v1" in
                                                      let* α2 :=
                                                        M.read (mk_str "") in
                                                      let* α3 :=
                                                        M.read (mk_str "
") in
                                                      let* α4 :=
                                                        M.alloc
                                                          (Value.Array
                                                            [ α2; α3 ]) in
                                                      let* α5 :=
                                                        M.get_associated_function
                                                          (Ty.path
                                                            "core::fmt::rt::Argument")
                                                          "new_display" in
                                                      let* α6 :=
                                                        M.call α5 [ ip ] in
                                                      let* α7 :=
                                                        M.alloc
                                                          (Value.Array
                                                            [ α6 ]) in
                                                      let* α8 :=
                                                        M.call
                                                          α1
                                                          [
                                                            M.pointer_coercion
                                                              (* Unsize *)
                                                              α4;
                                                            M.pointer_coercion
                                                              (* Unsize *)
                                                              α7
                                                          ] in
                                                      let* α9 :=
                                                        M.call α0 [ α8 ] in
                                                      M.alloc α9 in
                                                    M.alloc (Value.Tuple []) in
                                                  M.alloc (Value.Tuple [])
                                                | _ => M.break_match 
                                                end);
                                              fun γ =>
                                                (M.alloc (Value.Tuple []))
                                            ])
                                      | _ => M.break_match 
                                      end)
                                  ]) in
                            M.alloc (Value.Tuple [])))
                      ]) in
                M.pure (M.use α4)
              | _ => M.break_match 
              end);
            fun γ => (M.alloc (Value.Tuple []))
          ]) in
    M.read α4
  | _, _ => M.impossible
  end.
