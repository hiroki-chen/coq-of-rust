(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module thread := std.thread.

Definition main (_ : unit) : unit :=
  let data :=
    "86967897737416471853297327050364959
11861322575564723963297542624962850
70856234701860851907960690014725639
38397966707106094172783238747669219
52380795257888236525459303330302837
58495327135744041048897885734297812
69920216438980873548808413720956532
16278424637452589860345374828574668" in
  let children := _crate.vec.Vec::["new"] tt in
  let chunked_data := data.["split_whitespace"] in
  match LangItem chunked_data.["enumerate"] with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := (i, data_segment); |} =>
        _crate.io._print
          (format_arguments::["new_v1"]
            [ "data segment "; " is ""; ""
" ]
            [
              format_argument::["new_display"] i;
              format_argument::["new_display"] data_segment
            ]) ;;
        tt ;;
        children.["push"]
          (thread.spawn
            (fun  =>
              let result :=
                (data_segment.["chars"].["map"]
                    (fun c =>
                      (c.["to_digit"] 10).["expect"]
                        "should be a digit")).["sum"] in
              _crate.io._print
                (format_arguments::["new_v1"]
                  [ "processed segment "; ", result="; "
" ]
                  [
                    format_argument::["new_display"] i;
                    format_argument::["new_display"] result
                  ]) ;;
              tt ;;
              result)) ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  let final_result :=
    (children.["into_iter"].["map"] (fun c => c.["join"].["unwrap"])).["sum"] in
  _crate.io._print
    (format_arguments::["new_v1"]
      [ "Final sum result: "; "
" ]
      [ format_argument::["new_display"] final_result ]) ;;
  tt ;;
  tt.
