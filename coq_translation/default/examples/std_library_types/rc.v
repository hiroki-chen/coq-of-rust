(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* rc_examples := "Rc examples".["to_string"] in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "--- rc_a is created ---
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* rc_a := alloc.rc.Rc::["new"] rc_examples in
  let* _ :=
    let* _ :=
      let* α0 := alloc.rc.Rc::["strong_count"] (addr_of rc_a) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Reference Count of rc_a: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "--- rc_a is cloned to rc_b ---
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    let* rc_b := alloc.rc.Rc::["clone"] (addr_of rc_a) in
    let* _ :=
      let* _ :=
        let* α0 := alloc.rc.Rc::["strong_count"] (addr_of rc_b) in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ "Reference Count of rc_b: "; "
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := alloc.rc.Rc::["strong_count"] (addr_of rc_a) in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ "Reference Count of rc_a: "; "
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := rc_a.["eq"] (addr_of rc_b) in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ "rc_a and rc_b are equal: "; "
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := rc_a.["len"] in
        let* α1 := format_argument::["new_display"] (addr_of α0) in
        let* α2 :=
          format_arguments::["new_v1"]
            (addr_of [ "Length of the value inside rc_a: "; "
" ])
            (addr_of [ α1 ]) in
        std.io.stdio._print α2 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of rc_b) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "Value of rc_b: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "--- rc_b is dropped out of scope ---
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := alloc.rc.Rc::["strong_count"] (addr_of rc_a) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Reference Count of rc_a: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "--- rc_a is dropped out of scope ---
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.
