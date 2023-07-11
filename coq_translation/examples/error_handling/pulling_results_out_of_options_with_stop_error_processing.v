(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition double_first
    (vec : alloc.vec.Vec (ref str))
    :
      M
        (core.result.Result
          (core.option.Option i32)
          core.num.error.ParseIntError) :=
  let* opt :=
    let* α0 := vec.["first"] in
    α0.["map"]
      (fun first =>
        let* α0 := first.["parse"] in
        α0.["map"] (fun n => 2.["mul"] n)) in
  opt.["map_or"]
    (core.result.Result.Ok core.option.Option.None)
    (fun r => r.["map"] core.option.Option.Some).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* numbers :=
    let* α0 := alloc.boxed.Box::["new"] [ "42"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* empty := alloc.vec.Vec::["new"] tt in
  let* strings :=
    let* α0 := alloc.boxed.Box::["new"] [ "tofu"; "93"; "18" ] in
    Slice::["into_vec"] α0 in
  let* _ :=
    let* _ :=
      let* α0 :=
        pulling_results_out_of_options_with_stop_error_processing.double_first
          numbers in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        pulling_results_out_of_options_with_stop_error_processing.double_first
          empty in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        pulling_results_out_of_options_with_stop_error_processing.double_first
          strings in
      let* α1 := format_argument::["new_debug"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "The first doubled is "; "
" ])
          (addr_of [ α1 ]) in
      std.io.stdio._print α2 in
    Pure tt in
  Pure tt.
