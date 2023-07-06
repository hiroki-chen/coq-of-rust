(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* path := std.path.Path::["new"] "." in
  let* _display := path.["display"] in
  let* new_path :=
    let* α0 := path.["join"] "a" in
    α0.["join"] "b" in
  let* _ := new_path.["push"] "c" in
  let* _ := new_path.["push"] "myfile.tar.gz" in
  let* _ := new_path.["set_file_name"] "package.tgz" in
  let* α0 := new_path.["to_str"] in
  match α0 with
  | core.option.Option.None =>
    std.panicking.begin_panic "new path is not a valid UTF-8 sequence"
  | core.option.Option.Some s =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of s) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "new path is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt
  end.
