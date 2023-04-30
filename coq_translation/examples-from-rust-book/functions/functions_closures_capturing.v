(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let color := String::["from"] "green" in
  let print :=
    fun  =>
      _crate.io._print
        (format_arguments::["new_v1"]
          [ "`color`: "; "
" ]
          [ format_argument::["new_display"] color ]) ;;
      tt in
  print tt ;;
  let _reborrow := color in
  print tt ;;
  let _color_moved := color in
  let count := 0 in
  let inc :=
    fun  =>
      count.["add_assign"] 1 ;;
      _crate.io._print
        (format_arguments::["new_v1"]
          [ "`count`: "; "
" ]
          [ format_argument::["new_display"] count ]) ;;
      tt ;;
      tt in
  inc tt ;;
  inc tt ;;
  let _count_reborrowed := count in
  let movable := Box::["new"] 3 in
  let consume :=
    fun  =>
      _crate.io._print
        (format_arguments::["new_v1"]
          [ "`movable`: "; "
" ]
          [ format_argument::["new_debug"] movable ]) ;;
      tt ;;
      mem.drop movable ;;
      tt in
  consume tt ;;
  tt.

Module mem := std.mem.
