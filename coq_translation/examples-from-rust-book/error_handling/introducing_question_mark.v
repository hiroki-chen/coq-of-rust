(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module ParseIntError := std.num.ParseIntError.
Definition ParseIntError := ParseIntError.t.

Definition multiply
    (first_number_str : ref str)
    (second_number_str : ref str)
    : Result i32 ParseIntError :=
  let first_number :=
    match LangItem first_number_str.["parse"] with
    | Break {| Break.0 := residual; |} => Return (LangItem residual)
    | Continue {| Continue.0 := val; |} => val
    end in
  let second_number :=
    match LangItem second_number_str.["parse"] with
    | Break {| Break.0 := residual; |} => Return (LangItem residual)
    | Continue {| Continue.0 := val; |} => val
    end in
  Ok (first_number.["mul"] second_number).

Definition print (result : Result i32 ParseIntError) : unit :=
  match result with
  | Ok.Build_t n =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "n is "; "
" ]
        [ _crate.fmt.ArgumentV1::["new_display"] n ]) ;;
    tt
  | Err.Build_t e =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Error: "; "
" ]
        [ _crate.fmt.ArgumentV1::["new_display"] e ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  print (multiply "10" "2") ;;
  print (multiply "t" "2") ;;
  tt.
