(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} : M unit :=
  let* path :=
    let* α0 := deref (mk_str "hello.txt") str in
    let* α1 := borrow α0 str in
    std.path.Path::["new"] α1 in
  let* display :=
    let* α0 := deref path std.path.Path in
    let* α1 := borrow α0 std.path.Path in
    std.path.Path::["display"] α1 in
  let* file :=
    let* α0 := borrow path (ref std.path.Path) in
    let* α1 := std.fs.File::["open"] α0 in
    match α1 with
    | core.result.Result why =>
      let* α0 :=
        borrow [ mk_str "couldn't open "; mk_str ": " ] (list (ref str)) in
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
  let* s := alloc.string.String::["new"] in
  let* α0 := borrow_mut file std.fs.File in
  let* α1 := borrow_mut s alloc.string.String in
  let* α2 := deref α1 alloc.string.String in
  let* α3 := borrow_mut α2 alloc.string.String in
  let* α4 := std.io.Read.read_to_string α0 α3 in
  match α4 with
  | core.result.Result why =>
    let* α0 :=
      borrow [ mk_str "couldn't read "; mk_str ": " ] (list (ref str)) in
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
      let* α0 := borrow [ mk_str ""; mk_str " contains:
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := borrow display std.path.Display in
      let* α5 := deref α4 std.path.Display in
      let* α6 := borrow α5 std.path.Display in
      let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
      let* α8 := borrow s alloc.string.String in
      let* α9 := deref α8 alloc.string.String in
      let* α10 := borrow α9 alloc.string.String in
      let* α11 := core.fmt.rt.Argument::["new_display"] α10 in
      let* α12 := borrow [ α7; α11 ] (list core.fmt.rt.Argument) in
      let* α13 := deref α12 (list core.fmt.rt.Argument) in
      let* α14 := borrow α13 (list core.fmt.rt.Argument) in
      let* α15 := pointer_coercion "Unsize" α14 in
      let* α16 := core.fmt.Arguments::["new_v1"] α3 α15 in
      std.io.stdio._print α16 in
    M.alloc tt
  end.
