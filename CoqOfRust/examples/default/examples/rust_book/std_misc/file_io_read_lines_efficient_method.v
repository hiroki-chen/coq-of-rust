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
Definition read_lines (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ P ], [ filename ] =>
    ltac:(M.monadic
      (let filename := M.alloc (| filename |) in
      M.read (|
        let file :=
          M.copy (|
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::try_trait::Try",
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error" ],
                    [],
                    "branch",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "std::fs::File", "open", [ P ] |),
                      [ M.read (| filename |) ]
                    |)
                  ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "core::ops::control_flow::ControlFlow::Break",
                        0
                      |) in
                    let residual := M.copy (| γ0_0 |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.read (|
                          M.return_ (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::try_trait::FromResidual",
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  [
                                    Ty.apply
                                      (Ty.path "std::io::Lines")
                                      [
                                        Ty.apply
                                          (Ty.path "std::io::buffered::bufreader::BufReader")
                                          [ Ty.path "std::fs::File" ]
                                      ];
                                    Ty.path "std::io::error::Error"
                                  ],
                                [
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [
                                      Ty.path "core::convert::Infallible";
                                      Ty.path "std::io::error::Error"
                                    ]
                                ],
                                "from_residual",
                                []
                              |),
                              [ M.read (| residual |) ]
                            |)
                          |)
                        |)
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.get_struct_tuple_field_or_break_match (|
                        γ,
                        "core::ops::control_flow::ControlFlow::Continue",
                        0
                      |) in
                    let val := M.copy (| γ0_0 |) in
                    val))
              ]
            |)
          |) in
        M.alloc (|
          Value.StructTuple
            "core::result::Result::Ok"
            [
              M.call_closure (|
                M.get_trait_method (|
                  "std::io::BufRead",
                  Ty.apply
                    (Ty.path "std::io::buffered::bufreader::BufReader")
                    [ Ty.path "std::fs::File" ],
                  [],
                  "lines",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "std::io::buffered::bufreader::BufReader")
                        [ Ty.path "std::fs::File" ],
                      "new",
                      []
                    |),
                    [ M.read (| file |) ]
                  |)
                ]
              |)
            ]
        |)
      |)))
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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        M.match_operator (|
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (|
                        "file_io_read_lines_efficient_method::read_lines",
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                      |),
                      [ M.read (| mk_str "./hosts" |) ]
                    |)
                  |) in
                let γ0_0 :=
                  M.get_struct_tuple_field_or_break_match (| γ, "core::result::Result::Ok", 0 |) in
                let lines := M.copy (| γ0_0 |) in
                M.use
                  (M.match_operator (|
                    M.alloc (|
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::iter::traits::collect::IntoIterator",
                          Ty.apply
                            (Ty.path "std::io::Lines")
                            [
                              Ty.apply
                                (Ty.path "std::io::buffered::bufreader::BufReader")
                                [ Ty.path "std::fs::File" ]
                            ],
                          [],
                          "into_iter",
                          []
                        |),
                        [ M.read (| lines |) ]
                      |)
                    |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let iter := M.copy (| γ |) in
                          M.loop (|
                            ltac:(M.monadic
                              (let _ :=
                                M.match_operator (|
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::iter::traits::iterator::Iterator",
                                        Ty.apply
                                          (Ty.path "std::io::Lines")
                                          [
                                            Ty.apply
                                              (Ty.path "std::io::buffered::bufreader::BufReader")
                                              [ Ty.path "std::fs::File" ]
                                          ],
                                        [],
                                        "next",
                                        []
                                      |),
                                      [ iter ]
                                    |)
                                  |),
                                  [
                                    fun γ =>
                                      ltac:(M.monadic
                                        (M.alloc (|
                                          M.never_to_any (| M.read (| M.break (||) |) |)
                                        |)));
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let γ0_0 :=
                                          M.get_struct_tuple_field_or_break_match (|
                                            γ,
                                            "core::option::Option::Some",
                                            0
                                          |) in
                                        let line := M.copy (| γ0_0 |) in
                                        M.match_operator (|
                                          M.alloc (| Value.Tuple [] |),
                                          [
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let γ := line in
                                                let γ0_0 :=
                                                  M.get_struct_tuple_field_or_break_match (|
                                                    γ,
                                                    "core::result::Result::Ok",
                                                    0
                                                  |) in
                                                let ip := M.copy (| γ0_0 |) in
                                                let _ :=
                                                  let _ :=
                                                    M.alloc (|
                                                      M.call_closure (|
                                                        M.get_function (|
                                                          "std::io::stdio::_print",
                                                          []
                                                        |),
                                                        [
                                                          M.call_closure (|
                                                            M.get_associated_function (|
                                                              Ty.path "core::fmt::Arguments",
                                                              "new_v1",
                                                              []
                                                            |),
                                                            [
                                                              (* Unsize *)
                                                              M.pointer_coercion
                                                                (M.alloc (|
                                                                  Value.Array
                                                                    [
                                                                      M.read (| mk_str "" |);
                                                                      M.read (| mk_str "
" |)
                                                                    ]
                                                                |));
                                                              (* Unsize *)
                                                              M.pointer_coercion
                                                                (M.alloc (|
                                                                  Value.Array
                                                                    [
                                                                      M.call_closure (|
                                                                        M.get_associated_function (|
                                                                          Ty.path
                                                                            "core::fmt::rt::Argument",
                                                                          "new_display",
                                                                          [
                                                                            Ty.path
                                                                              "alloc::string::String"
                                                                          ]
                                                                        |),
                                                                        [ ip ]
                                                                      |)
                                                                    ]
                                                                |))
                                                            ]
                                                          |)
                                                        ]
                                                      |)
                                                    |) in
                                                  M.alloc (| Value.Tuple [] |) in
                                                M.alloc (| Value.Tuple [] |)));
                                            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                                          ]
                                        |)))
                                  ]
                                |) in
                              M.alloc (| Value.Tuple [] |)))
                          |)))
                    ]
                  |))));
            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.
