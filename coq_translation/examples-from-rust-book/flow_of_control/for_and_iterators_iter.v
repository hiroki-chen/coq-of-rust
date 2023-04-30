(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition main (_ : unit) : unit :=
  let names := Slice::["into_vec"] [ "Bob"; "Frank"; "Ferris" ] in
  match LangItem names.["iter"] with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := name; |} =>
        match name with
        | Str("Ferris", Cooked) =>
          _crate.io._print
            (_crate.fmt.Arguments::["new_v1"]
              [ "There is a rustacean among us!
" ]
              [  ]) ;;
          tt
        | _ =>
          _crate.io._print
            (_crate.fmt.Arguments::["new_v1"]
              [ "Hello "; "
" ]
              [ _crate.fmt.ArgumentV1::["new_display"] name ]) ;;
          tt
        end
      end ;;
      tt
      from
      for
  end ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "names: "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] names ]) ;;
  tt ;;
  tt.
