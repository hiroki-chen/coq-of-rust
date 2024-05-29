(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    fn sum_odd_numbers(up_to: u32) -> u32 {
        let mut acc = 0;
        for i in 0..up_to {
            // Notice that the return type of this match expression must be u32
            // because of the type of the "addition" variable.
            let addition: u32 = match i % 2 == 1 {
                // The "i" variable is of type u32, which is perfectly fine.
                true => i,
                // On the other hand, the "continue" expression does not return
                // u32, but it is still fine, because it never returns and therefore
                // does not violate the type requirements of the match expression.
                false => continue,
            };
            acc += addition;
        }
        acc
    }
    println!(
        "Sum of odd numbers up to 9 (excluding): {}",
        sum_odd_numbers(9)
    );
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ _ :=
          let~ _ :=
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
                              M.read (| Value.String "Sum of odd numbers up to 9 (excluding): " |);
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
                                  [ Ty.path "u32" ]
                                |),
                                [
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_function (|
                                        "diverging_functions_example_sum_odd_numbers::main.sum_odd_numbers",
                                        []
                                      |),
                                      [ Value.Integer 9 ]
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

Axiom Function_main : M.IsFunction "diverging_functions_example_sum_odd_numbers::main" main.

Module main.
  (*
      fn sum_odd_numbers(up_to: u32) -> u32 {
          let mut acc = 0;
          for i in 0..up_to {
              // Notice that the return type of this match expression must be u32
              // because of the type of the "addition" variable.
              let addition: u32 = match i % 2 == 1 {
                  // The "i" variable is of type u32, which is perfectly fine.
                  true => i,
                  // On the other hand, the "continue" expression does not return
                  // u32, but it is still fine, because it never returns and therefore
                  // does not violate the type requirements of the match expression.
                  false => continue,
              };
              acc += addition;
          }
          acc
      }
  *)
  Definition sum_odd_numbers (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ up_to ] =>
      ltac:(M.monadic
        (let up_to := M.alloc (| up_to |) in
        M.read (|
          let~ acc := M.alloc (| Value.Integer 0 |) in
          let~ _ :=
            M.use
              (M.match_operator (|
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::iter::traits::collect::IntoIterator",
                      Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ],
                      [],
                      "into_iter",
                      []
                    |),
                    [
                      Value.StructRecord
                        "core::ops::range::Range"
                        [ ("start", Value.Integer 0); ("end_", M.read (| up_to |)) ]
                    ]
                  |)
                |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let iter := M.copy (| γ |) in
                      M.loop (|
                        ltac:(M.monadic
                          (let~ _ :=
                            M.match_operator (|
                              M.alloc (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::iter::traits::iterator::Iterator",
                                    Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "u32" ],
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
                                    (let _ :=
                                      M.is_struct_tuple (| γ, "core::option::Option::None" |) in
                                    M.alloc (| M.never_to_any (| M.read (| M.break (||) |) |) |)));
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ0_0 :=
                                      M.SubPointer.get_struct_tuple_field (|
                                        γ,
                                        "core::option::Option::Some",
                                        0
                                      |) in
                                    let i := M.copy (| γ0_0 |) in
                                    let~ addition :=
                                      M.copy (|
                                        M.match_operator (|
                                          M.alloc (|
                                            BinOp.Pure.eq
                                              (BinOp.Wrap.rem
                                                Integer.U32
                                                (M.read (| i |))
                                                (Value.Integer 2))
                                              (Value.Integer 1)
                                          |),
                                          [
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let _ :=
                                                  M.is_constant_or_break_match (|
                                                    M.read (| γ |),
                                                    Value.Bool true
                                                  |) in
                                                i));
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let _ :=
                                                  M.is_constant_or_break_match (|
                                                    M.read (| γ |),
                                                    Value.Bool false
                                                  |) in
                                                M.alloc (|
                                                  M.never_to_any (| M.read (| M.continue (||) |) |)
                                                |)))
                                          ]
                                        |)
                                      |) in
                                    let~ _ :=
                                      let β := acc in
                                      M.write (|
                                        β,
                                        BinOp.Wrap.add
                                          Integer.U32
                                          (M.read (| β |))
                                          (M.read (| addition |))
                                      |) in
                                    M.alloc (| Value.Tuple [] |)))
                              ]
                            |) in
                          M.alloc (| Value.Tuple [] |)))
                      |)))
                ]
              |)) in
          acc
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Function_sum_odd_numbers :
    M.IsFunction
      "diverging_functions_example_sum_odd_numbers::main::sum_odd_numbers"
      sum_odd_numbers.
End main.
