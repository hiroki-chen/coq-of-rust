(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition foo {A : Set} (o : Option A) : unit :=
  match o with
  | Some.Build_t _a =>
    _crate.io._print (_crate.fmt.Arguments::["new_v1"] [ "some
" ] [  ]) ;;
    tt
  | None =>
    _crate.io._print (_crate.fmt.Arguments::["new_v1"] [ "nothing
" ] [  ]) ;;
    tt
  end.

Module tests.
  Module OpenOptions := std.fs.OpenOptions.
  Definition OpenOptions := OpenOptions.t.
  
  Definition test_file (_ : unit) : unit :=
    let file :=
      ((((OpenOptions::["new"] tt).["append"] true).["create"] true).["open"]
          "ferris.txt").["expect"]
        "Failed to open ferris.txt" in
    match LangItem {| Range.start := 0; Range.end := 5; |} with
    | iter =>
      loop
        match LangItem iter with
        | None => Break
        | Some {| Some.0 := _; |} =>
          (file.["write_all"] "Ferris
".["as_bytes"]).["expect"]
            "Could not write to ferris.txt" ;;
          tt
        end ;;
        tt
        from
        for
    end.
  
  Definition test_file_also (_ : unit) : unit :=
    let file :=
      ((((OpenOptions::["new"] tt).["append"] true).["create"] true).["open"]
          "ferris.txt").["expect"]
        "Failed to open ferris.txt" in
    match LangItem {| Range.start := 0; Range.end := 5; |} with
    | iter =>
      loop
        match LangItem iter with
        | None => Break
        | Some {| Some.0 := _; |} =>
          (file.["write_all"] "Corro
".["as_bytes"]).["expect"]
            "Could not write to ferris.txt" ;;
          tt
        end ;;
        tt
        from
        for
    end.
End tests.

Module OpenOptions := std.fs.OpenOptions.
Definition OpenOptions := OpenOptions.t.

Definition test_file (_ : unit) : unit :=
  let file :=
    ((((OpenOptions::["new"] tt).["append"] true).["create"] true).["open"]
        "ferris.txt").["expect"]
      "Failed to open ferris.txt" in
  match LangItem {| Range.start := 0; Range.end := 5; |} with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := _; |} =>
        (file.["write_all"] "Ferris
".["as_bytes"]).["expect"]
          "Could not write to ferris.txt" ;;
        tt
      end ;;
      tt
      from
      for
  end.

Definition test_file_also (_ : unit) : unit :=
  let file :=
    ((((OpenOptions::["new"] tt).["append"] true).["create"] true).["open"]
        "ferris.txt").["expect"]
      "Failed to open ferris.txt" in
  match LangItem {| Range.start := 0; Range.end := 5; |} with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := _; |} =>
        (file.["write_all"] "Corro
".["as_bytes"]).["expect"]
          "Could not write to ferris.txt" ;;
        tt
      end ;;
      tt
      from
      for
  end.
