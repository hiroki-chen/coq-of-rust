(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let raw_p: *const u32 = &10;

    unsafe {
        assert!( *raw_p == 10);
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ raw_p := M.alloc (| M.alloc (| Value.Integer 10 |) |) in
        let~ _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        UnOp.Pure.not
                          (BinOp.Pure.eq (M.read (| M.read (| raw_p |) |)) (Value.Integer 10))
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    M.never_to_any (|
                      M.call_closure (|
                        M.get_function (| "core::panicking::panic", [] |),
                        [ M.read (| Value.String "assertion failed: *raw_p == 10" |) ]
                      |)
                    |)
                  |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "raw_pointers::main" main.
