(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* vec1 :=
    let* α0 := alloc.boxed.Box::["new"] [ 1; 2; 3 ] in
    (Slice _)::["into_vec"] α0 in
  let* vec2 :=
    let* α0 := alloc.boxed.Box::["new"] [ 4; 5; 6 ] in
    (Slice _)::["into_vec"] α0 in
  let* iter := vec1.["iter"] in
  let* into_iter := vec2.["into_iter"] in
  let* _ :=
    let* _ :=
      let* α0 := iter.["find"] (fun x => x.["eq"] 2) in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Find 2 in vec1: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := into_iter.["find"] (fun x => x.["eq"] 2) in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Find 2 in vec2: "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let array1 := [ 1; 2; 3 ] in
  let array2 := [ 4; 5; 6 ] in
  let* _ :=
    let* _ :=
      let* α0 := array1.["iter"] in
      let* α1 := α0.["find"] (fun x => x.["eq"] 2) in
      let* α2 := format_argument::["new_debug"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Find 2 in array1: "; "
" ])
          (addr_of [ α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := array2.["into_iter"] in
      let* α1 := α0.["find"] (fun x => x.["eq"] 2) in
      let* α2 := format_argument::["new_debug"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Find 2 in array2: "; "
" ])
          (addr_of [ α2 ]) in
      std.io.stdio._print α3 in
    Pure tt in
  Pure tt.
