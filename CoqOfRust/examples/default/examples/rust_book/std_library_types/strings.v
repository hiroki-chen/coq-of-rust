(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // (all the type annotations are superfluous)
    // A reference to a string allocated in read only memory
    let pangram: &'static str = "the quick brown fox jumps over the lazy dog";
    println!("Pangram: {}", pangram);

    // Iterate over words in reverse, no new string is allocated
    println!("Words in reverse");
    for word in pangram.split_whitespace().rev() {
        println!("> {}", word);
    }

    // Copy chars into a vector, sort and remove duplicates
    let mut chars: Vec<char> = pangram.chars().collect();
    chars.sort();
    chars.dedup();

    // Create an empty and growable `String`
    let mut string = String::new();
    for c in chars {
        // Insert a char at the end of string
        string.push(c);
        // Insert a string at the end of string
        string.push_str(", ");
    }

    // The trimmed string is a slice to the original string, hence no new
    // allocation is performed
    let chars_to_trim: &[char] = &[' ', ','];
    let trimmed_str: &str = string.trim_matches(chars_to_trim);
    println!("Used characters: {}", trimmed_str);

    // Heap allocate a string
    let alice = String::from("I like dogs");
    // Allocate new memory and store the modified string there
    let bob: String = alice.replace("dog", "cat");

    println!("Alice says: {}", alice);
    println!("Bob says: {}", bob);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let pangram := M.copy (| Value.String "the quick brown fox jumps over the lazy dog" |) in
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
                            [ M.read (| Value.String "Pangram: " |); M.read (| Value.String "
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
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ pangram ]
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
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "Words in reverse
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let _ :=
          M.use
            (M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::collect::IntoIterator",
                    Ty.apply
                      (Ty.path "core::iter::adapters::rev::Rev")
                      [ Ty.path "core::str::iter::SplitWhitespace" ],
                    [],
                    "into_iter",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::iter::traits::iterator::Iterator",
                        Ty.path "core::str::iter::SplitWhitespace",
                        [],
                        "rev",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (| Ty.path "str", "split_whitespace", [] |),
                          [ M.read (| pangram |) ]
                        |)
                      ]
                    |)
                  ]
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
                                    (Ty.path "core::iter::adapters::rev::Rev")
                                    [ Ty.path "core::str::iter::SplitWhitespace" ],
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
                                    M.SubPointer.get_struct_tuple_field (|
                                      γ,
                                      "core::option::Option::Some",
                                      0
                                    |) in
                                  let word := M.copy (| γ0_0 |) in
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
                                                        M.read (| Value.String "> " |);
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
                                                            [
                                                              Ty.apply
                                                                (Ty.path "&")
                                                                [ Ty.path "str" ]
                                                            ]
                                                          |),
                                                          [ word ]
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
            |)) in
        let chars :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::iterator::Iterator",
                Ty.path "core::str::iter::Chars",
                [],
                "collect",
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "char"; Ty.path "alloc::alloc::Global" ]
                ]
              |),
              [
                M.call_closure (|
                  M.get_associated_function (| Ty.path "str", "chars", [] |),
                  [ M.read (| pangram |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.path "char" ],
                "sort",
                []
              |),
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::ops::deref::DerefMut",
                    Ty.apply
                      (Ty.path "alloc::vec::Vec")
                      [ Ty.path "char"; Ty.path "alloc::alloc::Global" ],
                    [],
                    "deref_mut",
                    []
                  |),
                  [ chars ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "char"; Ty.path "alloc::alloc::Global" ],
                "dedup",
                []
              |),
              [ chars ]
            |)
          |) in
        let string :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (| Ty.path "alloc::string::String", "new", [] |),
              []
            |)
          |) in
        let _ :=
          M.use
            (M.match_operator (|
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::iter::traits::collect::IntoIterator",
                    Ty.apply
                      (Ty.path "alloc::vec::Vec")
                      [ Ty.path "char"; Ty.path "alloc::alloc::Global" ],
                    [],
                    "into_iter",
                    []
                  |),
                  [ M.read (| chars |) ]
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
                                    (Ty.path "alloc::vec::into_iter::IntoIter")
                                    [ Ty.path "char"; Ty.path "alloc::alloc::Global" ],
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
                                    M.SubPointer.get_struct_tuple_field (|
                                      γ,
                                      "core::option::Option::Some",
                                      0
                                    |) in
                                  let c := M.copy (| γ0_0 |) in
                                  let _ :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "alloc::string::String",
                                          "push",
                                          []
                                        |),
                                        [ string; M.read (| c |) ]
                                      |)
                                    |) in
                                  let _ :=
                                    M.alloc (|
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "alloc::string::String",
                                          "push_str",
                                          []
                                        |),
                                        [ string; M.read (| Value.String ", " |) ]
                                      |)
                                    |) in
                                  M.alloc (| Value.Tuple [] |)))
                            ]
                          |) in
                        M.alloc (| Value.Tuple [] |)))
                    |)))
              ]
            |)) in
        let chars_to_trim :=
          M.alloc (|
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (| Value.Array [ Value.UnicodeChar 32; Value.UnicodeChar 44 ] |))
          |) in
        let trimmed_str :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "str",
                "trim_matches",
                [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "slice") [ Ty.path "char" ] ] ]
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
                  [ string ]
                |);
                M.read (| chars_to_trim |)
              ]
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
                              M.read (| Value.String "Used characters: " |);
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
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ trimmed_str ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let alice :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::From",
                Ty.path "alloc::string::String",
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "from",
                []
              |),
              [ M.read (| Value.String "I like dogs" |) ]
            |)
          |) in
        let bob :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "str",
                "replace",
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
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
                  [ alice ]
                |);
                M.read (| Value.String "dog" |);
                M.read (| Value.String "cat" |)
              ]
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
                              M.read (| Value.String "Alice says: " |);
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
                                [ alice ]
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
                            [ M.read (| Value.String "Bob says: " |); M.read (| Value.String "
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
                                [ bob ]
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
