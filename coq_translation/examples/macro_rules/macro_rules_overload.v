(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of "1i32 + 1 == 2i32") in
      let* α1 := format_argument::["new_debug"] (addr_of "2i32 * 2 == 4i32") in
      let* α2 := 1.["add"] 1 in
      let* α3 := α2.["eq"] 2 in
      let* α4 := 2.["mul"] 2 in
      let* α5 := α4.["eq"] 4 in
      let* α6 := α3.["andb"] α5 in
      let* α7 := format_argument::["new_debug"] (addr_of α6) in
      let* α8 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " and "; " is "; "
" ])
          (addr_of [ α0; α1; α7 ]) in
      std.io.stdio._print α8 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of "true") in
      let* α1 := format_argument::["new_debug"] (addr_of "false") in
      let* α2 := true.["or"] false in
      let* α3 := format_argument::["new_debug"] (addr_of α2) in
      let* α4 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " or "; " is "; "
" ])
          (addr_of [ α0; α1; α3 ]) in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
