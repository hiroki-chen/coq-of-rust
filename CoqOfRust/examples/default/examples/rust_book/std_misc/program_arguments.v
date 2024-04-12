(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let args: Vec<String> = env::args().collect();

    // The first argument is the path that was used to call the program.
    println!("My path is {}.", args[0]);

    // The rest of the arguments are the passed command line parameters.
    // Call the program like this:
    //   $ ./args arg1 arg2
    println!("I got {:?} arguments: {:?}.", args.len() - 1, &args[1..]);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
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
                            [
                              M.read (| Value.String "My path is " |);
                              M.read (| Value.String ".
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
                                    [ args; Value.Integer Integer.Usize 0 ]
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
                            [
                              M.read (| Value.String "I got " |);
                              M.read (| Value.String " arguments: " |);
                              M.read (| Value.String ".
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
                                  "new_debug",
                                  [ Ty.path "usize" ]
                                |),
                                [
                                  M.alloc (|
                                    BinOp.Panic.sub (|
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.apply
                                            (Ty.path "alloc::vec::Vec")
                                            [
                                              Ty.path "alloc::string::String";
                                              Ty.path "alloc::alloc::Global"
                                            ],
                                          "len",
                                          []
                                        |),
                                        [ args ]
                                      |),
                                      Value.Integer Integer.Usize 1
                                    |)
                                  |)
                                ]
                              |);
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_debug",
                                  [
                                    Ty.apply
                                      (Ty.path "&")
                                      [
                                        Ty.apply
                                          (Ty.path "slice")
                                          [ Ty.path "alloc::string::String" ]
                                      ]
                                  ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::index::Index",
                                        Ty.apply
                                          (Ty.path "alloc::vec::Vec")
                                          [
                                            Ty.path "alloc::string::String";
                                            Ty.path "alloc::alloc::Global"
                                          ],
                                        [
                                          Ty.apply
                                            (Ty.path "core::ops::range::RangeFrom")
                                            [ Ty.path "usize" ]
                                        ],
                                        "index",
                                        []
                                      |),
                                      [
                                        args;
                                        Value.StructRecord
                                          "core::ops::range::RangeFrom"
                                          [ ("start", Value.Integer Integer.Usize 1) ]
                                      ]
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
