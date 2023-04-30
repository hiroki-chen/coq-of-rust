(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module mem := std.mem.

Definition analyze_slice (slice : ref Slice) : unit :=
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "first element of the slice: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] slice[0] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "the slice has "; " elements
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] slice.["len"] ]) ;;
  tt ;;
  tt.

Definition main (_ : unit) : unit :=
  let xs := [ 1; 2; 3; 4; 5 ] in
  let ys := repeat 0 in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "first element of the array: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] xs[0] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "second element of the array: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] xs[1] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "number of elements in array: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] xs.["len"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "array occupies "; " bytes
" ]
      [ _crate.fmt.ArgumentV1::["new_display"] (mem.size_of_val xs) ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "borrow the whole array as a slice
" ]
      [ ]) ;;
  tt ;;
  analyze_slice xs ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "borrow a section of the array as a slice
" ]
      [ ]) ;;
  tt ;;
  analyze_slice ys[Range {| Range.start := 1; Range.end := 4; |}] ;;
  let empty_array := [ ] in
  match (empty_array, [ ]) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
        _crate.option.Option.None ;;
      tt
    else
      tt
  end ;;
  match (empty_array, [ ][RangeFull {|  |}]) with
  | (left_val, right_val) =>
    if (not ((deref left_val).["eq"] (deref right_val)) : bool) then
      let kind := _crate.panicking.AssertKind.Eq in
      _crate.panicking.assert_failed
        kind
        (deref left_val)
        (deref right_val)
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
            (_crate.fmt.Arguments::["new_v1"]
              [ ""; ": "; "
" ]
              [
                _crate.fmt.ArgumentV1::["new_display"] i;
                _crate.fmt.ArgumentV1::["new_display"] xval
              ]) ;;
          tt
        | None =>
          _crate.io._print
            (_crate.fmt.Arguments::["new_v1"]
              [ "Slow down! "; " is too far!
" ]
              [ _crate.fmt.ArgumentV1::["new_display"] i ]) ;;
          tt
        end
      end ;;
      tt
      from
      for
  end.
