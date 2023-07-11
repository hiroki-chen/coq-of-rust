(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition multiply (first : ref i32) (second : ref i32) : M i32 :=
  first.["mul"] second.

Definition choose_first (first : ref i32) (arg : ref i32) : M (ref i32) :=
  Pure first.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let first := 2 in
  let* _ :=
    let second := 3 in
    let* _ :=
      let* _ :=
        let* α0 :=
          scoping_rules_lifetimes_coercion.multiply
            (addr_of first)
            (addr_of second) in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ "The product is "; "
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          scoping_rules_lifetimes_coercion.choose_first
            (addr_of first)
            (addr_of second) in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ ""; " is the first
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    Pure tt in
  Pure tt.
