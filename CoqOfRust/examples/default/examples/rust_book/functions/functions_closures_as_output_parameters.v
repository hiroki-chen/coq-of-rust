(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn create_fn() -> impl Fn() {
    let text = "Fn".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fn (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let text :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (| "alloc::borrow::ToOwned", Ty.path "str", [], "to_owned", [] |),
              [ M.read (| mk_str "Fn" |) ]
            |)
          |) in
        M.alloc (|
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (M.read (|
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
                                                M.read (| mk_str "This is a: " |);
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
                                                    Ty.path "core::fmt::rt::Argument",
                                                    "new_display",
                                                    [ Ty.path "alloc::string::String" ]
                                                  |),
                                                  [ text ]
                                                |)
                                              ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)
                          |)))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        |)
      |)))
  | _, _ => M.impossible
  end.

Module create_fn.
  (* Error OpaqueTy *)
End create_fn.

(*
fn create_fnmut() -> impl FnMut() {
    let text = "FnMut".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fnmut (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let text :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (| "alloc::borrow::ToOwned", Ty.path "str", [], "to_owned", [] |),
              [ M.read (| mk_str "FnMut" |) ]
            |)
          |) in
        M.alloc (|
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (M.read (|
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
                                                M.read (| mk_str "This is a: " |);
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
                                                    Ty.path "core::fmt::rt::Argument",
                                                    "new_display",
                                                    [ Ty.path "alloc::string::String" ]
                                                  |),
                                                  [ text ]
                                                |)
                                              ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)
                          |)))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        |)
      |)))
  | _, _ => M.impossible
  end.

Module create_fnmut.
  (* Error OpaqueTy *)
End create_fnmut.

(*
fn create_fnonce() -> impl FnOnce() {
    let text = "FnOnce".to_owned();

    move || println!("This is a: {}", text)
}
*)
Definition create_fnonce (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let text :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (| "alloc::borrow::ToOwned", Ty.path "str", [], "to_owned", [] |),
              [ M.read (| mk_str "FnOnce" |) ]
            |)
          |) in
        M.alloc (|
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (M.read (|
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
                                                M.read (| mk_str "This is a: " |);
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
                                                    Ty.path "core::fmt::rt::Argument",
                                                    "new_display",
                                                    [ Ty.path "alloc::string::String" ]
                                                  |),
                                                  [ text ]
                                                |)
                                              ]
                                          |))
                                      ]
                                    |)
                                  ]
                                |)
                              |) in
                            M.alloc (| Value.Tuple [] |)
                          |)))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        |)
      |)))
  | _, _ => M.impossible
  end.

Module create_fnonce.
  (* Error OpaqueTy *)
End create_fnonce.

(*
fn main() {
    let fn_plain = create_fn();
    let mut fn_mut = create_fnmut();
    let fn_once = create_fnonce();

    fn_plain();
    fn_mut();
    fn_once();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let fn_plain :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "functions_closures_as_output_parameters::create_fn", [] |),
              []
            |)
          |) in
        let fn_mut :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "functions_closures_as_output_parameters::create_fnmut", [] |),
              []
            |)
          |) in
        let fn_once :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "functions_closures_as_output_parameters::create_fnonce", [] |),
              []
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::Fn",
                Ty.associated,
                [ Ty.tuple [] ],
                "call",
                []
              |),
              [ fn_plain; Value.Tuple [] ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnMut",
                Ty.associated,
                [ Ty.tuple [] ],
                "call_mut",
                []
              |),
              [ fn_mut; Value.Tuple [] ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnOnce",
                Ty.associated,
                [ Ty.tuple [] ],
                "call_once",
                []
              |),
              [ M.read (| fn_once |); Value.Tuple [] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
