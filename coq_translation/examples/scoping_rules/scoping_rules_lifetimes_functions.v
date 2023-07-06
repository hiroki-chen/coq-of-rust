(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition print_one `{State.Trait} (x : ref i32) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of x) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "`print_one`: x is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.

Definition add_one `{State.Trait} (x : mut_ref i32) : M unit :=
  let* _ :=
    let* α0 := x.["deref"] in
    α0.["add_assign"] 1 in
  Pure tt.

Definition print_multi `{State.Trait} (x : ref i32) (y : ref i32) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of x) in
      let* α1 := format_argument::["new_display"] (addr_of y) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "`print_multi`: x is "; ", y is "; "
" ])
          (addr_of [ α0; α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.

Definition pass_x `{State.Trait} (x : ref i32) (arg : ref i32) : M (ref i32) :=
  Pure x.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let x := 7 in
  let y := 9 in
  let* _ := scoping_rules_lifetimes_functions.print_one (addr_of x) in
  let* _ :=
    scoping_rules_lifetimes_functions.print_multi (addr_of x) (addr_of y) in
  let* z := scoping_rules_lifetimes_functions.pass_x (addr_of x) (addr_of y) in
  let* _ := scoping_rules_lifetimes_functions.print_one z in
  let t := 3 in
  let* _ := scoping_rules_lifetimes_functions.add_one (addr_of t) in
  let* _ := scoping_rules_lifetimes_functions.print_one (addr_of t) in
  Pure tt.
