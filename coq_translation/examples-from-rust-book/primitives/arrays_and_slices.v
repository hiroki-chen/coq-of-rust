(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module mem := std.mem.

Definition analyze_slice (slice : ref Slice) : unit :=
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "first element of the slice: "; "
" ]
      [ format_argument::["new_display"] slice[0] ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "the slice has "; " elements
" ]
      [ format_argument::["new_display"] slice.["len"] ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let xs := [ 1; 2; 3; 4; 5 ] in
  let ys := repeat 0 in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "first element of the array: "; "
" ]
      [ format_argument::["new_display"] xs[0] ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "second element of the array: "; "
" ]
      [ format_argument::["new_display"] xs[1] ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "number of elements in array: "; "
" ]
      [ format_argument::["new_display"] xs.["len"] ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "array occupies "; " bytes
" ]
      [ format_argument::["new_display"] (mem.size_of_val xs) ]) ;;
  tt ;;
  _crate.io._print
    (format_arguments::["new_const"]
      [ "borrow the whole array as a slice
" ]) ;;
  tt ;;
  analyze_slice xs ;;
  _crate.io._print
    (format_arguments::["new_const"]
      [ "borrow a section of the array as a slice
" ]) ;;
  tt ;;
  analyze_slice ys[Range {| Range.start := 1; Range.end := 4; |}] ;;
  let empty_array := [ ] in
  match (empty_array, [ ]) with
  | (left_val, right_val) =>
    if ((left_val.["deref"].["eq"] right_val.["deref"]).["not"] : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        left_val.["deref"]
        right_val.["deref"]
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (empty_array, [ ][RangeFull {|  |}]) with
  | (left_val, right_val) =>
    if ((left_val.["deref"].["eq"] right_val.["deref"]).["not"] : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        left_val.["deref"]
        right_val.["deref"]
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match
    LangItem Range {| Range.start := 0; Range.end := xs.["len"].["add"] 1; |}
  with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := i; |} =>
        match xs.["get"] i with
        | Some xval =>
          _crate.io._print
            (format_arguments::["new_v1"]
              [ ""; ": "; "
" ]
              [
                format_argument::["new_display"] i;
                format_argument::["new_display"] xval
              ]) ;;
          tt
        | None =>
          _crate.io._print
            (format_arguments::["new_v1"]
              [ "Slow down! "; " is too far!
" ]
              [ format_argument::["new_display"] i ]) ;;
          tt
        end
      end ;;
      tt
      from
      for
  end.
