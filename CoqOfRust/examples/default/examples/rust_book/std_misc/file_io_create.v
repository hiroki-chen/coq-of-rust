(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition value_LOREM_IPSUM : Value.t :=
  M.run
    ltac:(M.monadic
      (M.alloc (|
        Value.String
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"
      |))).

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
    ltac:(M.monadic
      (M.read (|
        let path :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "std::path::Path", "new", [ Ty.path "str" ] |),
              [ M.read (| Value.String "lorem_ipsum.txt" |) ]
            |)
          |) in
        let display :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "std::path::Path", "display", [] |),
              [ M.read (| path |) ]
            |)
          |) in
        let file :=
          M.copy (|
            M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "std::fs::File",
                    "create",
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
                    (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
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
                                        M.read (| Value.String "couldn't create " |);
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
                    (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                    let file := M.copy (| γ0_0 |) in
                    file))
              ]
            |)
          |) in
        M.match_operator (|
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "std::io::Write",
                Ty.path "std::fs::File",
                [],
                "write_all",
                []
              |),
              [
                file;
                M.call_closure (|
                  M.get_associated_function (| Ty.path "str", "as_bytes", [] |),
                  [ M.read (| M.read (| M.get_constant (| "file_io_create::LOREM_IPSUM" |) |) |) ]
                |)
              ]
            |)
          |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
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
                                    M.read (| Value.String "couldn't write to " |);
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
                (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
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
                                    M.read (| Value.String "successfully wrote to " |);
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
                                        [ Ty.path "std::path::Display" ]
                                      |),
                                      [ display ]
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
