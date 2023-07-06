(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let reference := addr_of 4 in
  let* _ :=
    match reference with
    | val =>
      let* _ :=
        let* α0 := format_argument::["new_debug"] (addr_of val) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Got a value via destructuring: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    end in
  let* _ :=
    let* α0 := reference.["deref"] in
    match α0 with
    | val =>
      let* _ :=
        let* α0 := format_argument::["new_debug"] (addr_of val) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Got a value via dereferencing: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    end in
  let _not_a_reference := 3 in
  let _is_a_reference := 3 in
  let value := 5 in
  let mut_value := 6 in
  let* _ :=
    match value with
    | r =>
      let* _ :=
        let* α0 := format_argument::["new_debug"] (addr_of r) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Got a reference to a value: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt
    end in
  match mut_value with
  | m =>
    let* _ :=
      let* α0 := m.["deref"] in
      α0.["add_assign"] 10 in
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_debug"] (addr_of m) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "We added 10. `mut_value`: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    Pure tt
  end.
