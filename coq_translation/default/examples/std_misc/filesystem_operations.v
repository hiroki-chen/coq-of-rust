(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition cat
    `{ℋ : State.Trait}
    (path : ref std.path.Path)
    : M ltac:(std.io.error.Result constr:(alloc.string.String)) :=
  let* f :=
    let* α0 := std.fs.File::["open"] path in
    let* α1 :=
      (core.ops.try_trait.Try.branch
          (Self := (core.result.Result std.fs.File std.io.error.Error)))
        α0 in
    match α1 with
    | core.ops.control_flow.ControlFlow residual =>
      let* α0 :=
        (core.ops.try_trait.FromResidual.from_residual
            (Self :=
              (core.result.Result alloc.string.String std.io.error.Error)))
          residual in
      let* α1 := Return α0 in
      never_to_any α1
    | core.ops.control_flow.ControlFlow val => Pure val
    end in
  let* s := alloc.string.String::["new"] in
  let* α0 := borrow_mut f std.fs.File in
  let* α1 := borrow_mut s alloc.string.String in
  let* α2 := deref α1 alloc.string.String in
  let* α3 := borrow_mut α2 alloc.string.String in
  let* α4 := (std.io.Read.read_to_string (Self := std.fs.File)) α0 α3 in
  match α4 with
  | core.result.Result _ => Pure (core.result.Result.Ok s)
  | core.result.Result e => Pure (core.result.Result.Err e)
  end.

Definition echo
    `{ℋ : State.Trait}
    (s : ref str)
    (path : ref std.path.Path)
    : M ltac:(std.io.error.Result constr:(unit)) :=
  let* f :=
    let* α0 := std.fs.File::["create"] path in
    let* α1 :=
      (core.ops.try_trait.Try.branch
          (Self := (core.result.Result std.fs.File std.io.error.Error)))
        α0 in
    match α1 with
    | core.ops.control_flow.ControlFlow residual =>
      let* α0 :=
        (core.ops.try_trait.FromResidual.from_residual
            (Self := (core.result.Result unit std.io.error.Error)))
          residual in
      let* α1 := Return α0 in
      never_to_any α1
    | core.ops.control_flow.ControlFlow val => Pure val
    end in
  let* α0 := borrow_mut f std.fs.File in
  let* α1 := deref s str in
  let* α2 := borrow α1 str in
  let* α3 := str::["as_bytes"] α2 in
  let* α4 := deref α3 (Slice u8) in
  let* α5 := borrow α4 (Slice u8) in
  (std.io.Write.write_all (Self := std.fs.File)) α0 α5.

Definition touch
    `{ℋ : State.Trait}
    (path : ref std.path.Path)
    : M ltac:(std.io.error.Result constr:(unit)) :=
  let* α0 := std.fs.OpenOptions::["new"] in
  let* α1 := borrow_mut α0 std.fs.OpenOptions in
  let* α2 := M.alloc true in
  let* α3 := std.fs.OpenOptions::["create"] α1 α2 in
  let* α4 := deref α3 std.fs.OpenOptions in
  let* α5 := borrow_mut α4 std.fs.OpenOptions in
  let* α6 := M.alloc true in
  let* α7 := std.fs.OpenOptions::["write"] α5 α6 in
  let* α8 := deref α7 std.fs.OpenOptions in
  let* α9 := borrow α8 std.fs.OpenOptions in
  let* α10 := std.fs.OpenOptions::["open"] α9 path in
  match α10 with
  | core.result.Result _ =>
    let* α0 := M.alloc tt in
    Pure (core.result.Result.Ok α0)
  | core.result.Result e => Pure (core.result.Result.Err e)
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`mkdir a`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := std.fs.create_dir (mk_str "a") in
    match α0 with
    | core.result.Result why =>
      let* _ :=
        let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow why std.io.error.Error in
        let* α5 := std.io.error.Error::["kind"] α4 in
        let* α6 := borrow α5 std.io.error.ErrorKind in
        let* α7 := deref α6 std.io.error.ErrorKind in
        let* α8 := borrow α7 std.io.error.ErrorKind in
        let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
        let* α11 := deref α10 (list core.fmt.rt.Argument) in
        let* α12 := borrow α11 (list core.fmt.rt.Argument) in
        let* α13 := pointer_coercion "Unsize" α12 in
        let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
        std.io.stdio._print α14 in
      M.alloc tt
    | core.result.Result _ => M.alloc tt
    end in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`echo hello > a/b.txt`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := deref (mk_str "hello") str in
    let* α1 := borrow α0 str in
    let* α2 := deref (mk_str "a/b.txt") str in
    let* α3 := borrow α2 str in
    let* α4 := std.path.Path::["new"] α3 in
    let* α5 := borrow α4 (ref std.path.Path) in
    let* α6 := deref α5 (ref std.path.Path) in
    let* α7 := deref α6 std.path.Path in
    let* α8 := borrow α7 std.path.Path in
    let* α9 := filesystem_operations.echo α1 α8 in
    (core.result.Result T E)::["unwrap_or_else"]
      α9
      (let* _ :=
        let* _ :=
          let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow why std.io.error.Error in
          let* α5 := std.io.error.Error::["kind"] α4 in
          let* α6 := borrow α5 std.io.error.ErrorKind in
          let* α7 := deref α6 std.io.error.ErrorKind in
          let* α8 := borrow α7 std.io.error.ErrorKind in
          let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
          let* α11 := deref α10 (list core.fmt.rt.Argument) in
          let* α12 := borrow α11 (list core.fmt.rt.Argument) in
          let* α13 := pointer_coercion "Unsize" α12 in
          let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
          std.io.stdio._print α14 in
        M.alloc tt in
      M.alloc tt) in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`mkdir -p a/c/d`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := std.fs.create_dir_all (mk_str "a/c/d") in
    (core.result.Result T E)::["unwrap_or_else"]
      α0
      (let* _ :=
        let* _ :=
          let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow why std.io.error.Error in
          let* α5 := std.io.error.Error::["kind"] α4 in
          let* α6 := borrow α5 std.io.error.ErrorKind in
          let* α7 := deref α6 std.io.error.ErrorKind in
          let* α8 := borrow α7 std.io.error.ErrorKind in
          let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
          let* α11 := deref α10 (list core.fmt.rt.Argument) in
          let* α12 := borrow α11 (list core.fmt.rt.Argument) in
          let* α13 := pointer_coercion "Unsize" α12 in
          let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
          std.io.stdio._print α14 in
        M.alloc tt in
      M.alloc tt) in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`touch a/c/e.txt`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := deref (mk_str "a/c/e.txt") str in
    let* α1 := borrow α0 str in
    let* α2 := std.path.Path::["new"] α1 in
    let* α3 := borrow α2 (ref std.path.Path) in
    let* α4 := deref α3 (ref std.path.Path) in
    let* α5 := deref α4 std.path.Path in
    let* α6 := borrow α5 std.path.Path in
    let* α7 := filesystem_operations.touch α6 in
    (core.result.Result T E)::["unwrap_or_else"]
      α7
      (let* _ :=
        let* _ :=
          let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow why std.io.error.Error in
          let* α5 := std.io.error.Error::["kind"] α4 in
          let* α6 := borrow α5 std.io.error.ErrorKind in
          let* α7 := deref α6 std.io.error.ErrorKind in
          let* α8 := borrow α7 std.io.error.ErrorKind in
          let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
          let* α11 := deref α10 (list core.fmt.rt.Argument) in
          let* α12 := borrow α11 (list core.fmt.rt.Argument) in
          let* α13 := pointer_coercion "Unsize" α12 in
          let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
          std.io.stdio._print α14 in
        M.alloc tt in
      M.alloc tt) in
  let* _ :=
    let* _ :=
      let* α0 :=
        borrow [ mk_str "`ln -s ../b.txt a/c/b.txt`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := M.alloc true in
    let* α1 := use α0 in
    if (α1 : bool) then
      let* _ :=
        let* α0 :=
          std.os.unix.fs.symlink (mk_str "../b.txt") (mk_str "a/c/b.txt") in
        (core.result.Result T E)::["unwrap_or_else"]
          α0
          (let* _ :=
            let* _ :=
              let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
              let* α1 := deref α0 (list (ref str)) in
              let* α2 := borrow α1 (list (ref str)) in
              let* α3 := pointer_coercion "Unsize" α2 in
              let* α4 := borrow why std.io.error.Error in
              let* α5 := std.io.error.Error::["kind"] α4 in
              let* α6 := borrow α5 std.io.error.ErrorKind in
              let* α7 := deref α6 std.io.error.ErrorKind in
              let* α8 := borrow α7 std.io.error.ErrorKind in
              let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
              let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
              let* α11 := deref α10 (list core.fmt.rt.Argument) in
              let* α12 := borrow α11 (list core.fmt.rt.Argument) in
              let* α13 := pointer_coercion "Unsize" α12 in
              let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
              std.io.stdio._print α14 in
            M.alloc tt in
          M.alloc tt) in
      M.alloc tt
    else
      M.alloc tt in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`cat a/c/b.txt`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := deref (mk_str "a/c/b.txt") str in
    let* α1 := borrow α0 str in
    let* α2 := std.path.Path::["new"] α1 in
    let* α3 := borrow α2 (ref std.path.Path) in
    let* α4 := deref α3 (ref std.path.Path) in
    let* α5 := deref α4 std.path.Path in
    let* α6 := borrow α5 std.path.Path in
    let* α7 := filesystem_operations.cat α6 in
    match α7 with
    | core.result.Result why =>
      let* _ :=
        let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow why std.io.error.Error in
        let* α5 := std.io.error.Error::["kind"] α4 in
        let* α6 := borrow α5 std.io.error.ErrorKind in
        let* α7 := deref α6 std.io.error.ErrorKind in
        let* α8 := borrow α7 std.io.error.ErrorKind in
        let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
        let* α11 := deref α10 (list core.fmt.rt.Argument) in
        let* α12 := borrow α11 (list core.fmt.rt.Argument) in
        let* α13 := pointer_coercion "Unsize" α12 in
        let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
        std.io.stdio._print α14 in
      M.alloc tt
    | core.result.Result s =>
      let* _ :=
        let* α0 := borrow [ mk_str "> "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow s alloc.string.String in
        let* α5 := deref α4 alloc.string.String in
        let* α6 := borrow α5 alloc.string.String in
        let* α7 := core.fmt.rt.Argument::["new_display"] α6 in
        let* α8 := borrow [ α7 ] (list core.fmt.rt.Argument) in
        let* α9 := deref α8 (list core.fmt.rt.Argument) in
        let* α10 := borrow α9 (list core.fmt.rt.Argument) in
        let* α11 := pointer_coercion "Unsize" α10 in
        let* α12 := core.fmt.Arguments::["new_v1"] α3 α11 in
        std.io.stdio._print α12 in
      M.alloc tt
    end in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`ls a`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := std.fs.read_dir (mk_str "a") in
    match α0 with
    | core.result.Result why =>
      let* _ :=
        let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := borrow why std.io.error.Error in
        let* α5 := std.io.error.Error::["kind"] α4 in
        let* α6 := borrow α5 std.io.error.ErrorKind in
        let* α7 := deref α6 std.io.error.ErrorKind in
        let* α8 := borrow α7 std.io.error.ErrorKind in
        let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
        let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
        let* α11 := deref α10 (list core.fmt.rt.Argument) in
        let* α12 := borrow α11 (list core.fmt.rt.Argument) in
        let* α13 := pointer_coercion "Unsize" α12 in
        let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
        std.io.stdio._print α14 in
      M.alloc tt
    | core.result.Result paths =>
      let* α0 :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := std.fs.ReadDir))
          paths in
      let* α1 :=
        match α0 with
        | iter =>
          loop
            (let* _ :=
              let* α0 := borrow_mut iter std.fs.ReadDir in
              let* α1 := deref α0 std.fs.ReadDir in
              let* α2 := borrow_mut α1 std.fs.ReadDir in
              let* α3 :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := std.fs.ReadDir))
                  α2 in
              match α3 with
              | core.option.Option  =>
                let* α0 := Break in
                never_to_any α0
              | core.option.Option path =>
                let* _ :=
                  let* _ :=
                    let* α0 :=
                      borrow [ mk_str "> "; mk_str "
" ] (list (ref str)) in
                    let* α1 := deref α0 (list (ref str)) in
                    let* α2 := borrow α1 (list (ref str)) in
                    let* α3 := pointer_coercion "Unsize" α2 in
                    let* α4 := (core.result.Result T E)::["unwrap"] path in
                    let* α5 := borrow α4 std.fs.DirEntry in
                    let* α6 := std.fs.DirEntry::["path"] α5 in
                    let* α7 := borrow α6 std.path.PathBuf in
                    let* α8 := deref α7 std.path.PathBuf in
                    let* α9 := borrow α8 std.path.PathBuf in
                    let* α10 := core.fmt.rt.Argument::["new_debug"] α9 in
                    let* α11 := borrow [ α10 ] (list core.fmt.rt.Argument) in
                    let* α12 := deref α11 (list core.fmt.rt.Argument) in
                    let* α13 := borrow α12 (list core.fmt.rt.Argument) in
                    let* α14 := pointer_coercion "Unsize" α13 in
                    let* α15 := core.fmt.Arguments::["new_v1"] α3 α14 in
                    std.io.stdio._print α15 in
                  M.alloc tt in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α1
    end in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`rm a/c/e.txt`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := std.fs.remove_file (mk_str "a/c/e.txt") in
    (core.result.Result T E)::["unwrap_or_else"]
      α0
      (let* _ :=
        let* _ :=
          let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow why std.io.error.Error in
          let* α5 := std.io.error.Error::["kind"] α4 in
          let* α6 := borrow α5 std.io.error.ErrorKind in
          let* α7 := deref α6 std.io.error.ErrorKind in
          let* α8 := borrow α7 std.io.error.ErrorKind in
          let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
          let* α11 := deref α10 (list core.fmt.rt.Argument) in
          let* α12 := borrow α11 (list core.fmt.rt.Argument) in
          let* α13 := pointer_coercion "Unsize" α12 in
          let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
          std.io.stdio._print α14 in
        M.alloc tt in
      M.alloc tt) in
  let* _ :=
    let* _ :=
      let* α0 := borrow [ mk_str "`rmdir a/c/d`
" ] (list (ref str)) in
      let* α1 := deref α0 (list (ref str)) in
      let* α2 := borrow α1 (list (ref str)) in
      let* α3 := pointer_coercion "Unsize" α2 in
      let* α4 := core.fmt.Arguments::["new_const"] α3 in
      std.io.stdio._print α4 in
    M.alloc tt in
  let* _ :=
    let* α0 := std.fs.remove_dir (mk_str "a/c/d") in
    (core.result.Result T E)::["unwrap_or_else"]
      α0
      (let* _ :=
        let* _ :=
          let* α0 := borrow [ mk_str "! "; mk_str "
" ] (list (ref str)) in
          let* α1 := deref α0 (list (ref str)) in
          let* α2 := borrow α1 (list (ref str)) in
          let* α3 := pointer_coercion "Unsize" α2 in
          let* α4 := borrow why std.io.error.Error in
          let* α5 := std.io.error.Error::["kind"] α4 in
          let* α6 := borrow α5 std.io.error.ErrorKind in
          let* α7 := deref α6 std.io.error.ErrorKind in
          let* α8 := borrow α7 std.io.error.ErrorKind in
          let* α9 := core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 := borrow [ α9 ] (list core.fmt.rt.Argument) in
          let* α11 := deref α10 (list core.fmt.rt.Argument) in
          let* α12 := borrow α11 (list core.fmt.rt.Argument) in
          let* α13 := pointer_coercion "Unsize" α12 in
          let* α14 := core.fmt.Arguments::["new_v1"] α3 α13 in
          std.io.stdio._print α14 in
        M.alloc tt in
      M.alloc tt) in
  M.alloc tt.
