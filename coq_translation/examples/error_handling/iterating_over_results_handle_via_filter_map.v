(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* strings :=
    let* α0 := alloc.boxed.Box::["new"] [ "tofu"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* numbers :=
    let* α0 := strings.["into_iter"] in
    let* α1 :=
      α0.["filter_map"]
        (fun s =>
          let* α0 := s.["parse"] in
          α0.["ok"]) in
    α1.["collect"] in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of numbers) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "Results: "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  Pure tt.
