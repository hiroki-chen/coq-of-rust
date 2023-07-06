(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition destroy_box `{State.Trait} (c : alloc.boxed.Box i32) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of c) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Destroying a box that contains "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let x := 5 in
  let y := x in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of x) in
      let* α1 := format_argument::["new_display"] (addr_of y) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "x is "; ", and y is "; "
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* a := alloc.boxed.Box::["new"] 5 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of a) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "a contains: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let b := a in
  let* _ := scoping_rules_ownership_and_rules.destroy_box b in
  Pure tt.
