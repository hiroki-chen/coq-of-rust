(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut child = Command::new("sleep").arg("5").spawn().unwrap();
    let _result = child.wait().unwrap();

    println!("reached end of main");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let child :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "std::process::Child"; Ty.path "std::io::error::Error" ],
                "unwrap",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (| Ty.path "std::process::Command", "spawn", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "std::process::Command",
                        "arg",
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                      |),
                      [
                        M.alloc (|
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "std::process::Command",
                              "new",
                              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                            |),
                            [ M.read (| Value.String "sleep" |) ]
                          |)
                        |);
                        M.read (| Value.String "5" |)
                      ]
                    |)
                  ]
                |)
              ]
            |)
          |) in
        let _result :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "std::process::ExitStatus"; Ty.path "std::io::error::Error" ],
                "unwrap",
                []
              |),
              [
                M.call_closure (|
                  M.get_associated_function (| Ty.path "std::process::Child", "wait", [] |),
                  [ child ]
                |)
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
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "reached end of main
" |) ]
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

Axiom Function_main : M.IsFunction "child_processes_wait::main" main.
