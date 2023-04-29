(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module HashMap := std.collections.HashMap.
Definition HashMap := HashMap.t.

Definition call (number : ref str) : ref str :=
  match number with
  | Str("798-1364", Cooked) =>
    "We're sorry, the call cannot be completed as dialed. 
            Please hang up and try again."
  | Str("645-7689", Cooked) =>
    "Hello, this is Mr. Awesome's Pizza. My name is Fred.
            What can I get for you today?"
  | _ => "Hi! Who is this again?"
  end.

Definition main (_ : unit) : unit :=
  let contacts := HashMap::["new"] tt in
  contacts.["insert"] "Daniel" "798-1364" ;;
  contacts.["insert"] "Ashley" "645-7689" ;;
  contacts.["insert"] "Katie" "435-8291" ;;
  contacts.["insert"] "Robert" "956-1745" ;;
  match contacts.["get"] "Daniel" with
  | Some.Build_t number =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Calling Daniel: "; "
" ]
        [ _crate.fmt.ArgumentV1::["new_display"] (call number) ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Don't have Daniel's number.
" ]
        [  ]) ;;
    tt
  end ;;
  contacts.["insert"] "Daniel" "164-6743" ;;
  match contacts.["get"] "Ashley" with
  | Some.Build_t number =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Calling Ashley: "; "
" ]
        [ _crate.fmt.ArgumentV1::["new_display"] (call number) ]) ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.Arguments::["new_v1"]
        [ "Don't have Ashley's number.
" ]
        [  ]) ;;
    tt
  end ;;
  contacts.["remove"] "Ashley" ;;
  match LangItem contacts.["iter"] with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := (contact, number); |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "Calling "; ": "; "
" ]
            [
              _crate.fmt.ArgumentV1::["new_display"] contact;
              _crate.fmt.ArgumentV1::["new_display"] (call number)
            ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end.
