(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut names = vec!["Bob", "Frank", "Ferris"];

    for name in names.iter_mut() {
        *name = match name {
            &mut "Ferris" => "There is a rustacean among us!",
            _ => "Hello",
        }
    }

    println!("names: {:?}", names);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let names :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              M.read (| mk_str "Bob" |);
                              M.read (| mk_str "Frank" |);
                              M.read (| mk_str "Ferris" |)
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
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
                      (Ty.path "core::slice::iter::IterMut")
                      [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                    [],
                    "into_iter",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                        "iter_mut",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::deref::DerefMut",
                            Ty.apply
                              (Ty.path "alloc::vec::Vec")
                              [
                                Ty.apply (Ty.path "&") [ Ty.path "str" ];
                                Ty.path "alloc::alloc::Global"
                              ],
                            [],
                            "deref_mut",
                            []
                          |),
                          [ names ]
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
                                    (Ty.path "core::slice::iter::IterMut")
                                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
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
                                    M.get_struct_tuple_field_or_break_match (|
                                      γ,
                                      "core::option::Option::Some",
                                      0
                                    |) in
                                  let name := M.copy (| γ0_0 |) in
                                  M.assign (|
                                    M.read (| name |),
                                    M.read (|
                                      M.match_operator (|
                                        name,
                                        [
                                          fun γ =>
                                            ltac:(M.monadic
                                              (let γ := M.read (| γ |) in
                                              M.alloc (|
                                                M.read (| mk_str "There is a rustacean among us!" |)
                                              |)));
                                          fun γ =>
                                            ltac:(M.monadic
                                              (M.alloc (| M.read (| mk_str "Hello" |) |)))
                                        ]
                                      |)
                                    |)
                                  |)))
                            ]
                          |) in
                        M.alloc (| Value.Tuple [] |)))
                    |)))
              ]
            |)) in
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
                          Value.Array [ M.read (| mk_str "names: " |); M.read (| mk_str "
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
                                  "new_debug",
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::vec::Vec")
                                      [
                                        Ty.apply (Ty.path "&") [ Ty.path "str" ];
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ]
                                |),
                                [ names ]
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
