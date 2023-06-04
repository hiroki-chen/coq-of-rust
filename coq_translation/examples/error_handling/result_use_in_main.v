(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.
Definition ParseIntError := ParseIntError.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M (Result unit ParseIntError) :=
  let number_str := "10" in
  let* number :=
    let* α0 := number_str.["parse"] in
    match α0 with
    | Ok number => Pure number
    | Err e => Return (Err e)
    end in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of number) in
      let* α1 :=
        format_arguments::["new_v1"] (addr_of [ ""; "
" ]) (addr_of [ α0 ]) in
      _crate.io._print α1 in
    Pure tt in
  Pure (Ok tt).
