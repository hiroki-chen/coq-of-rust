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
    ltac:(M.monadic
      (let filename := M.alloc (| filename |) in
      M.catch_return (|
        ltac:(M.monadic
          (M.never_to_any (|
            M.read (|
              let file :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::result::Result")
                        [ Ty.path "std::fs::File"; Ty.path "std::io::error::Error" ],
                      "unwrap",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.path "std::fs::File",
                          "open",
                          [ Ty.path "alloc::string::String" ]
                        |),
                        [ M.read (| filename |) ]
                      |)
                    ]
                  |)
                |) in
              M.return_ (|
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
              |)
            |)
          |)))
      |)))
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
    ltac:(M.monadic
      (M.read (|
        let lines :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "file_io_read_lines::read_lines", [] |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "alloc::string::ToString",
                    Ty.path "str",
                    [],
                    "to_string",
                    []
                  |),
                  [ M.read (| Value.String "./hosts" |) ]
                |)
              ]
            |)
          |) in
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
                                (M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.get_struct_tuple_field (|
                                    γ,
                                    "core::option::Option::Some",
                                    0
                                  |) in
                                let line := M.copy (| γ0_0 |) in
                                let _ :=
                                  let _ :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_function (| "std::io::stdio::_print", [] |),
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
                                                      M.read (| Value.String "" |);
                                                      M.read (| Value.String "
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
                                                          Ty.path "core::fmt::rt::Argument",
                                                          "new_display",
                                                          [ Ty.path "alloc::string::String" ]
                                                        |),
                                                        [
                                                          M.alloc (|
                                                            M.call_closure (|
                                                              M.get_associated_function (|
                                                                Ty.apply
                                                                  (Ty.path "core::result::Result")
                                                                  [
                                                                    Ty.path "alloc::string::String";
                                                                    Ty.path "std::io::error::Error"
                                                                  ],
                                                                "unwrap",
                                                                []
                                                              |),
                                                              [ M.read (| line |) ]
                                                            |)
                                                          |)
                                                        ]
                                                      |)
                                                    ]
                                                |))
                                            ]
                                          |)
                                        ]
                                      |)
                                    |) in
                                  M.alloc (| Value.Tuple [] |) in
                                M.alloc (| Value.Tuple [] |)))
                          ]
                        |) in
                      M.alloc (| Value.Tuple [] |)))
                  |)))
            ]
          |))
      |)))
  | _, _ => M.impossible
  end.
