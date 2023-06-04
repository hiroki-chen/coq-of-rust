(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module mem := std.mem.

Definition analyze_slice (slice : ref Slice) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of slice[0]) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "first element of the slice: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := slice.["len"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "the slice has "; " elements
" ])
          (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let xs := [ 1; 2; 3; 4; 5 ] in
  let* ys := repeat 0 in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of xs[0]) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "first element of the array: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of xs[1]) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "second element of the array: "; "
" ])
          (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := xs.["len"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "number of elements in array: "; "
" ])
          (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := mem.size_of_val (addr_of xs) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "array occupies "; " bytes
" ])
          (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "borrow the whole array as a slice
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ := analyze_slice (addr_of xs) in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "borrow a section of the array as a slice
" ]) in
      _crate.io._print α0 in
    Pure tt in
  let* _ :=
    analyze_slice (addr_of ys[Range {| Range.start := 1; Range.end := 4; |}]) in
  let empty_array := [ ] in
  let* _ :=
    match (addr_of (addr_of empty_array), addr_of (addr_of [ ])) with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := _crate.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          _crate.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            _crate.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* _ :=
    match
      (addr_of (addr_of empty_array), addr_of (addr_of [ ][RangeFull {|  |}]))
    with
    | (left_val, right_val) =>
      let* α0 := left_val.["deref"] in
      let* α1 := right_val.["deref"] in
      let* α2 := α0.["eq"] α1 in
      let* α3 := α2.["not"] in
      if (α3 : bool) then
        let kind := _crate.panicking.AssertKind.Eq in
        let* _ :=
          let* α0 := left_val.["deref"] in
          let* α1 := right_val.["deref"] in
          _crate.panicking.assert_failed
            kind
            (addr_of α0)
            (addr_of α1)
            _crate.option.Option.None in
        Pure tt
      else
        Pure tt
    end in
  let* α0 := xs.["len"] in
  let* α1 := α0.["add"] 1 in
  let* α2 := LangItem Range {| Range.start := 0; Range.end := α1; |} in
  match α2 with
  | iter =>
    loop
      let* _ :=
        let* α0 := LangItem (addr_of iter) in
        match α0 with
        | None => Pure Break
        | Some {| Some.0 := i; |} =>
          let* α0 := xs.["get"] i in
          match α0 with
          | Some xval =>
            let* _ :=
              let* α0 := format_argument::["new_display"] (addr_of i) in
              let* α1 := format_argument::["new_display"] (addr_of xval) in
              let* α2 :=
                format_arguments::["new_v1"]
                  (addr_of [ ""; ": "; "
" ])
                  (addr_of [ α0; α1 ]) in
              _crate.io._print α2 in
            Pure tt
          | None =>
            let* _ :=
              let* α0 := format_argument::["new_display"] (addr_of i) in
              let* α1 :=
                format_arguments::["new_v1"]
                  (addr_of [ "Slow down! "; " is too far!
" ])
                  (addr_of [ α0 ]) in
              _crate.io._print α1 in
            Pure tt
          end
        end in
      Pure tt
      from
      for
  end.
