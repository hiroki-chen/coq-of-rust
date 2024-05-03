(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn increase(number: i32) {
    println!("{}", number + 1);
}
*)
Definition increase (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ number ] =>
    ltac:(M.monadic
      (let number := M.alloc (| number |) in
      M.read (|
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| Value.String "" |); M.read (| Value.String "
" |) ]
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
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    BinOp.Panic.add (|
                                      M.read (| number |),
                                      Value.Integer Integer.I32 1
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
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn decrease(number: i32) {
    println!("{}", number - 1);
}
*)
Definition decrease (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ number ] =>
    ltac:(M.monadic
      (let number := M.alloc (| number |) in
      M.read (|
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| Value.String "" |); M.read (| Value.String "
" |) ]
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
                                  [ Ty.path "i32" ]
                                |),
                                [
                                  M.alloc (|
                                    BinOp.Panic.sub (|
                                      M.read (| number |),
                                      Value.Integer Integer.I32 1
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
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn help() {
    println!(
        "usage:
match_args <string>
    Check whether given string is the answer.
match_args {{increase|decrease}} <integer>
    Increase or decrease given integer by one."
    );
}
*)
Definition help (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (|
                                Value.String
                                  "usage:
match_args <string>
    Check whether given string is the answer.
match_args {increase|decrease} <integer>
    Increase or decrease given integer by one.
"
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    match args.len() {
        // no arguments passed
        1 => {
            println!("My name is 'match_args'. Try passing some arguments!");
        }
        // one argument passed
        2 => match args[1].parse() {
            Ok(42) => println!("This is the answer!"),
            _ => println!("This is not the answer."),
        },
        // one command and one argument passed
        3 => {
            let cmd = &args[1];
            let num = &args[2];
            // parse the number
            let number: i32 = match num.parse() {
                Ok(n) => n,
                Err(_) => {
                    eprintln!("error: second argument not an integer");
                    help();
                    return;
                }
            };
            // parse the command
            match &cmd[..] {
                "increase" => increase(number),
                "decrease" => decrease(number),
                _ => {
                    eprintln!("error: invalid command");
                    help();
                }
            }
        }
        // all the other cases
        _ => {
            // show a help message
            help();
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.catch_return (|
        ltac:(M.monadic
          (M.read (|
            let args :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::iterator::Iterator",
                    Ty.path "std::env::Args",
                    [],
                    "collect",
                    [
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global" ]
                    ]
                  |),
                  [ M.call_closure (| M.get_function (| "std::env::args", [] |), [] |) ]
                |)
              |) in
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "alloc::vec::Vec")
                      [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global" ],
                    "len",
                    []
                  |),
                  [ args ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.is_constant_or_break_match (|
                        M.read (| γ |),
                        Value.Integer Integer.Usize 1
                      |) in
                    let _ :=
                      let _ :=
                        M.alloc (|
                          M.call_closure (|
                            M.get_function (| "std::io::stdio::_print", [] |),
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::Arguments",
                                  "new_const",
                                  []
                                |),
                                [
                                  (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc (|
                                      Value.Array
                                        [
                                          M.read (|
                                            Value.String
                                              "My name is 'match_args'. Try passing some arguments!
"
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
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.is_constant_or_break_match (|
                        M.read (| γ |),
                        Value.Integer Integer.Usize 2
                      |) in
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_associated_function (| Ty.path "str", "parse", [ Ty.path "i32" ] |),
                          [
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::ops::deref::Deref",
                                Ty.path "alloc::string::String",
                                [],
                                "deref",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::index::Index",
                                    Ty.apply
                                      (Ty.path "alloc::vec::Vec")
                                      [
                                        Ty.path "alloc::string::String";
                                        Ty.path "alloc::alloc::Global"
                                      ],
                                    [ Ty.path "usize" ],
                                    "index",
                                    []
                                  |),
                                  [ args; Value.Integer Integer.Usize 1 ]
                                |)
                              ]
                            |)
                          ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::result::Result::Ok",
                                0
                              |) in
                            let _ :=
                              M.is_constant_or_break_match (|
                                M.read (| γ0_0 |),
                                Value.Integer Integer.I32 42
                              |) in
                            let _ :=
                              M.alloc (|
                                M.call_closure (|
                                  M.get_function (| "std::io::stdio::_print", [] |),
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::Arguments",
                                        "new_const",
                                        []
                                      |),
                                      [
                                        (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                            Value.Array
                                              [ M.read (| Value.String "This is the answer!
" |) ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let _ :=
                              M.alloc (|
                                M.call_closure (|
                                  M.get_function (| "std::io::stdio::_print", [] |),
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::Arguments",
                                        "new_const",
                                        []
                                      |),
                                      [
                                        (* Unsize *)
                                        M.pointer_coercion
                                          (M.alloc (|
                                            Value.Array
                                              [ M.read (| Value.String "This is not the answer.
" |)
                                              ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)))
                      ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.is_constant_or_break_match (|
                        M.read (| γ |),
                        Value.Integer Integer.Usize 3
                      |) in
                    let cmd :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::index::Index",
                            Ty.apply
                              (Ty.path "alloc::vec::Vec")
                              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global" ],
                            [ Ty.path "usize" ],
                            "index",
                            []
                          |),
                          [ args; Value.Integer Integer.Usize 1 ]
                        |)
                      |) in
                    let num :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::index::Index",
                            Ty.apply
                              (Ty.path "alloc::vec::Vec")
                              [ Ty.path "alloc::string::String"; Ty.path "alloc::alloc::Global" ],
                            [ Ty.path "usize" ],
                            "index",
                            []
                          |),
                          [ args; Value.Integer Integer.Usize 2 ]
                        |)
                      |) in
                    let number :=
                      M.copy (|
                        M.match_operator (|
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "str",
                                "parse",
                                [ Ty.path "i32" ]
                              |),
                              [
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::deref::Deref",
                                    Ty.path "alloc::string::String",
                                    [],
                                    "deref",
                                    []
                                  |),
                                  [ M.read (| num |) ]
                                |)
                              ]
                            |)
                          |),
                          [
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::result::Result::Ok",
                                    0
                                  |) in
                                let n := M.copy (| γ0_0 |) in
                                n));
                            fun γ =>
                              ltac:(M.monadic
                                (let γ0_0 :=
                                  M.SubPointer.get_struct_tuple_field (|
                                    γ,
                                    "core::result::Result::Err",
                                    0
                                  |) in
                                M.alloc (|
                                  M.never_to_any (|
                                    M.read (|
                                      let _ :=
                                        let _ :=
                                          M.alloc (|
                                            M.call_closure (|
                                              M.get_function (| "std::io::stdio::_eprint", [] |),
                                              [
                                                M.call_closure (|
                                                  M.get_associated_function (|
                                                    Ty.path "core::fmt::Arguments",
                                                    "new_const",
                                                    []
                                                  |),
                                                  [
                                                    (* Unsize *)
                                                    M.pointer_coercion
                                                      (M.alloc (|
                                                        Value.Array
                                                          [
                                                            M.read (|
                                                              Value.String
                                                                "error: second argument not an integer
"
                                                            |)
                                                          ]
                                                      |))
                                                  ]
                                                |)
                                              ]
                                            |)
                                          |) in
                                        M.alloc (| Value.Tuple [] |) in
                                      let _ :=
                                        M.alloc (|
                                          M.call_closure (|
                                            M.get_function (|
                                              "program_arguments_parsing::help",
                                              []
                                            |),
                                            []
                                          |)
                                        |) in
                                      M.return_ (| Value.Tuple [] |)
                                    |)
                                  |)
                                |)))
                          ]
                        |)
                      |) in
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::index::Index",
                            Ty.path "alloc::string::String",
                            [ Ty.path "core::ops::range::RangeFull" ],
                            "index",
                            []
                          |),
                          [ M.read (| cmd |); Value.StructTuple "core::ops::range::RangeFull" [] ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let _ :=
                              M.is_constant_or_break_match (|
                                M.read (| γ |),
                                Value.String "increase"
                              |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_function (| "program_arguments_parsing::increase", [] |),
                                [ M.read (| number |) ]
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let _ :=
                              M.is_constant_or_break_match (|
                                M.read (| γ |),
                                Value.String "decrease"
                              |) in
                            M.alloc (|
                              M.call_closure (|
                                M.get_function (| "program_arguments_parsing::decrease", [] |),
                                [ M.read (| number |) ]
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let _ :=
                              let _ :=
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (| "std::io::stdio::_eprint", [] |),
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::Arguments",
                                          "new_const",
                                          []
                                        |),
                                        [
                                          (* Unsize *)
                                          M.pointer_coercion
                                            (M.alloc (|
                                              Value.Array
                                                [
                                                  M.read (|
                                                    Value.String "error: invalid command
"
                                                  |)
                                                ]
                                            |))
                                        ]
                                      |)
                                    ]
                                  |)
                                |) in
                              M.alloc (| Value.Tuple [] |) in
                            let _ :=
                              M.alloc (|
                                M.call_closure (|
                                  M.get_function (| "program_arguments_parsing::help", [] |),
                                  []
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)))
                      ]
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let _ :=
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (| "program_arguments_parsing::help", [] |),
                          []
                        |)
                      |) in
                    M.alloc (| Value.Tuple [] |)))
              ]
            |)
          |)))
      |)))
  | _, _ => M.impossible
  end.
