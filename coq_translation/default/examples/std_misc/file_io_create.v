(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LOREM_IPSUM `{H' : State.Trait} : ref str :=
  run
    (Pure
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
").

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let* path :=
    let* α0 := deref "lorem_ipsum.txt" str in
    let* α1 := borrow α0 str in
    std.path.Path::["new"] α1 in
  let* display :=
    let* α0 := deref path std.path.Path in
    let* α1 := borrow α0 std.path.Path in
    std.path.Path::["display"] α1 in
  let* file :=
    let* α0 := borrow path (ref std.path.Path) in
    let* α1 := std.fs.File::["create"] α0 in
    match α1 with
    | core.result.Result why =>
      let* α0 := borrow [ "couldn't create "; ": " ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow display std.path.Display in
      let* α5 := deref α4 std.path.Display in
      let* α6 := borrow α5 std.path.Display in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow why std.io.error.Error in
      let* α9 := deref α8 std.io.error.Error in
      let* α10 := borrow α9 std.io.error.Error in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      let* α17 := core.panicking.panic_fmt α16 in
      never_to_any α17
    | core.result.Result file => Pure file
    end in
  let* α0 := borrow_mut file std.fs.File in
  let* α1 := deref file_io_create.LOREM_IPSUM (ref str) in
  let* α2 := deref α1 str in
  let* α3 := borrow α2 str in
  let* α4 := str::["as_bytes"] α3 in
  let* α5 := deref α4 (Slice u8) in
  let* α6 := borrow α5 (Slice u8) in
  let* α7 := std.io.Write.write_all α0 α6 in
  match α7 with
  | core.result.Result why =>
    let* α0 := borrow [ "couldn't write to "; ": " ] (list (ref str)) in
    let* α1 := deref α0 (list (ref str)) in
    let* α2 := borrow α1 (list (ref str)) in
    let* α3 := pointer_coercion "Unsize" α2 in
    let* α4 := borrow display std.path.Display in
    let* α5 := deref α4 std.path.Display in
    let* α6 := borrow α5 std.path.Display in
    let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
    let* α8 := borrow why std.io.error.Error in
    let* α9 := deref α8 std.io.error.Error in
    let* α10 := borrow α9 std.io.error.Error in
    let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
    let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
    let* α13 := deref α12 (list core.fmt.rt.Argument) in
    let* α14 := borrow α13 (list core.fmt.rt.Argument) in
    let* α15 := pointer_coercion "Unsize" α14 in
    let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
    let* α17 := core.panicking.panic_fmt α16 in
    never_to_any α17
  | core.result.Result _ =>
    let* _ :=
      let* α0 := borrow [ "successfully wrote to "; "
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow display std.path.Display in
      let* α5 := deref α4 std.path.Display in
      let* α6 := borrow α5 std.path.Display in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
      let* α9 := deref α8 (list core.fmt.rt.Argument) in
      let* α10 := borrow α9 (list core.fmt.rt.Argument) in
      let* α11 := pointer_coercion "Unsize" α10 in
      let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
      std.io.stdio._print α12 in
    Pure tt
  end.
