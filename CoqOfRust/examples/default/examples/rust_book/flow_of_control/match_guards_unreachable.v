(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let number: u8 = 4;

    match number {
        i if i == 0 => println!("Zero"),
        i if i > 0 => println!("Greater than zero"),
        _ => unreachable!("Should never happen."),
        // TODO ^ uncomment to fix compilation
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ number := M.alloc (| Value.Integer 4 |) in
        M.match_operator (|
          number,
          [
            fun γ =>
              ltac:(M.monadic
                (let i := M.copy (| γ |) in
                let γ := M.alloc (| BinOp.Pure.eq (M.read (| i |)) (Value.Integer 0) |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                let~ _ :=
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
                              (M.alloc (| Value.Array [ M.read (| Value.String "Zero
" |) ] |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let i := M.copy (| γ |) in
                let γ := M.alloc (| BinOp.Pure.gt (M.read (| i |)) (Value.Integer 0) |) in
                let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                let~ _ :=
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
                                Value.Array [ M.read (| Value.String "Greater than zero
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
                (M.alloc (|
                  M.never_to_any (|
                    M.call_closure (|
                      M.get_function (|
                        "core::panicking::unreachable_display",
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                      |),
                      [ Value.String "Should never happen." ]
                    |)
                  |)
                |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "match_guards_unreachable::main" main.
