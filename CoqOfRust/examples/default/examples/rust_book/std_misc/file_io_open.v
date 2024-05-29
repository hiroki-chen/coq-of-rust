(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Create a path to the desired file
    let path = Path::new("hello.txt");
    let display = path.display();

    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display, why),
        Ok(file) => file,
    };

    // Read the file contents into a string, returns `io::Result<usize>`
    let mut s = String::new();
    match file.read_to_string(&mut s) {
        Err(why) => panic!("couldn't read {}: {}", display, why),
        Ok(_) => print!("{} contains:\n{}", display, s),
    }

    // `file` goes out of scope, and the "hello.txt" file gets closed
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ path :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "std::path::Path", "new", [ Ty.path "str" ] |),
              [ M.read (| Value.String "hello.txt" |) ]
            |)
          |) in
        let~ display :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "std::path::Path", "display", [] |),
              [ M.read (| path |) ]
            |)
          |) in
        let~ file :=
          M.copy (|
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "std::fs::File",
                    "open",
                    [
                      Ty.apply
                        (Ty.path "&")
                        [ Ty.apply (Ty.path "&") [ Ty.path "std::path::Path" ] ]
                    ]
                  |),
                  [ path ]
                |)
              |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                    let why := M.copy (| γ0_0 |) in
                    M.alloc (|
                      M.never_to_any (|
                        M.call_closure (|
                          M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                        M.read (| Value.String "couldn't open " |);
                                        M.read (| Value.String ": " |)
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
                                            [ Ty.path "std::path::Display" ]
                                          |),
                                          [ display ]
                                        |);
                                        M.call_closure (|
                                          M.get_associated_function (|
                                            Ty.path "core::fmt::rt::Argument",
                                            "new_display",
                                            [ Ty.path "std::io::error::Error" ]
                                          |),
                                          [ why ]
                                        |)
                                      ]
                                  |))
                              ]
                            |)
                          ]
                        |)
                      |)
                    |)));
                fun γ =>
                  ltac:(M.monadic
                    (let γ0_0 :=
                      M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                    let file := M.copy (| γ0_0 |) in
                    file))
              ]
            |)
          |) in
        let~ s :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "alloc::string::String", "new", [] |),
              []
            |)
          |) in
        M.match_operator (|
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "std::io::Read",
                Ty.path "std::fs::File",
                [],
                "read_to_string",
                []
              |),
              [ file; s ]
            |)
          |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                let why := M.copy (| γ0_0 |) in
                M.alloc (|
                  M.never_to_any (|
                    M.call_closure (|
                      M.get_function (| "core::panicking::panic_fmt", [] |),
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
                                    M.read (| Value.String "couldn't read " |);
                                    M.read (| Value.String ": " |)
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
                                        [ Ty.path "std::path::Display" ]
                                      |),
                                      [ display ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "std::io::error::Error" ]
                                      |),
                                      [ why ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |)
                |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                let~ _ :=
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
                                    M.read (| Value.String " contains:
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
                                        [ Ty.path "std::path::Display" ]
                                      |),
                                      [ display ]
                                    |);
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "alloc::string::String" ]
                                      |),
                                      [ s ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "file_io_open::main" main.
