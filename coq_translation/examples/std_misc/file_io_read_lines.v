(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition read_lines
    `{H : State.Trait}
    (filename : alloc.string.String)
    :
      M (H := H)
        (std.io.Lines (std.io.buffered.bufreader.BufReader std.fs.File)) :=
  let* file :=
    let* α0 := std.fs.File::["open"] filename in
    α0.["unwrap"] in
  let* _ :=
    let* α0 := std.io.buffered.bufreader.BufReader::["new"] file in
    let* α1 := α0.["lines"] in
    Return α1 in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} (_ : unit) : M (H := H) unit :=
  let* lines :=
    let* α0 := "./hosts".["to_string"] in
    file_io_read_lines.read_lines α0 in
  let* α0 := into_iter lines in
  match α0 with
  | iter =>
    loop
      (let* _ :=
        let* α0 := next (addr_of iter) in
        match α0 with
        | None  => Break
        | Some line =>
          let* _ :=
            let* _ :=
              let* α0 := line.["unwrap"] in
              let* α1 := format_argument::["new_display"] (addr_of α0) in
              let* α2 :=
                format_arguments::["new_v1"]
                  (addr_of [ ""; "
" ])
                  (addr_of [ α1 ]) in
              std.io.stdio._print α2 in
            Pure tt in
          Pure tt
        end in
      Pure tt)
  end.
