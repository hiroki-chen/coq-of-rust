(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* color := alloc.string.String::["from"] "green" in
  let print :=
    fun  =>
      let* _ :=
        let* α0 := format_argument::["new_display"] (addr_of color) in
        let* α1 :=
          format_arguments::["new_v1"]
            (addr_of [ "`color`: "; "
" ])
            (addr_of [ α0 ]) in
        std.io.stdio._print α1 in
      Pure tt in
  let* _ := print in
  let _reborrow := addr_of color in
  let* _ := print in
  let _color_moved := color in
  let count := 0 in
  let inc :=
    fun  =>
      let* _ := count.["add_assign"] 1 in
      let* _ :=
        let* _ :=
          let* α0 := format_argument::["new_display"] (addr_of count) in
          let* α1 :=
            format_arguments::["new_v1"]
              (addr_of [ "`count`: "; "
" ])
              (addr_of [ α0 ]) in
          std.io.stdio._print α1 in
        Pure tt in
      Pure tt in
  let* _ := inc in
  let* _ := inc in
  let _count_reborrowed := addr_of count in
  let* movable := alloc.boxed.Box::["new"] 3 in
  let consume :=
    fun  =>
      let* _ :=
        let* _ :=
          let* α0 := format_argument::["new_debug"] (addr_of movable) in
          let* α1 :=
            format_arguments::["new_v1"]
              (addr_of [ "`movable`: "; "
" ])
              (addr_of [ α0 ]) in
          std.io.stdio._print α1 in
        Pure tt in
      let* _ := core.mem.drop movable in
      Pure tt in
  let* _ := consume in
  Pure tt.
