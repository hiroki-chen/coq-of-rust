(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let number := 4 in
  match number with
  | i =>
    let* _ :=
      let* α0 := format_arguments::["new_const"] (addr_of [ "Zero
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | i =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Greater than zero
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | _ => core.panicking.unreachable_display (addr_of "Should never happen.")
  end.
