(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    assert_eq!(result, 20);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let counter := M.alloc (| Value.Integer Integer.I32 0 |) in
        let result :=
          M.copy (|
            M.loop (|
              ltac:(M.monadic
                (let _ :=
                  let β := counter in
                  M.write (|
                    β,
                    BinOp.Panic.add (| M.read (| β |), Value.Integer Integer.I32 1 |)
                  |) in
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              BinOp.Pure.eq (M.read (| counter |)) (Value.Integer Integer.I32 10)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |)))
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [ result; M.alloc (| Value.Integer Integer.I32 20 |) ] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field γ 0 in
                  let γ0_1 := M.get_tuple_field γ 1 in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (BinOp.Pure.eq
                                    (M.read (| M.read (| left_val |) |))
                                    (M.read (| M.read (| right_val |) |)))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [ Ty.path "i32"; Ty.path "i32" ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
