(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LOREM_IPSUM : ref str.t :=
  M.run
    (M.pure
      (mk_str
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
")).

(*
fn main() {
    let path = Path::new("lorem_ipsum.txt");
    let display = path.display();

    // Open a file in write-only mode, returns `io::Result<File>`
    let mut file = match File::create(&path) {
        Err(why) => panic!("couldn't create {}: {}", display, why),
        Ok(file) => file,
    };

    // Write the `LOREM_IPSUM` string to `file`, returns `io::Result<()>`
    match file.write_all(LOREM_IPSUM.as_bytes()) {
        Err(why) => panic!("couldn't write to {}: {}", display, why),
        Ok(_) => println!("successfully wrote to {}", display),
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* path : M.Val (ref std.path.Path.t) :=
      let* α0 : ref str.t := M.read (mk_str "lorem_ipsum.txt") in
      let* α1 : ref std.path.Path.t := std.path.Path.t::["new"] α0 in
      M.alloc α1 in
    let* display : M.Val std.path.Display.t :=
      let* α0 : ref std.path.Path.t := M.read path in
      let* α1 : std.path.Display.t := std.path.Path.t::["display"] α0 in
      M.alloc α1 in
    let* file : M.Val std.fs.File.t :=
      let* α0 : ref (ref std.path.Path.t) := borrow path in
      let* α1 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        std.fs.File.t::["create"] α0 in
      let* α2 :
          M.Val (core.result.Result.t std.fs.File.t std.io.error.Error.t) :=
        M.alloc α1 in
      let* α3 := M.read α2 in
      let* α4 : M.Val std.fs.File.t :=
        match α3 with
        | core.result.Result.Err why =>
          let* why := M.alloc why in
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "couldn't create "; mk_str ": " ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref std.path.Display.t := borrow display in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : ref std.io.error.Error.t := borrow why in
          let* α9 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α8 in
          let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
          let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
            M.alloc [ α7; α10 ] in
          let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
          let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc α12 in
          let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
          let* α16 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α15 in
          let* α17 : never.t := core.panicking.panic_fmt α16 in
          let* α18 : M.Val never.t := M.alloc α17 in
          never_to_any α18
        | core.result.Result.Ok file =>
          let* file := M.alloc file in
          M.pure file
        end in
      M.copy α4 in
    let* α0 : mut_ref std.fs.File.t := borrow_mut file in
    let* α1 : ref (ref str.t) := M.read file_io_create.LOREM_IPSUM in
    let* α2 : M.Val (ref str.t) := deref α1 in
    let* α3 : ref str.t := M.read α2 in
    let* α4 : ref (slice u8.t) := str.t::["as_bytes"] α3 in
    let* α5 : core.result.Result.t unit std.io.error.Error.t :=
      (std.io.Write.write_all
          (Self := std.fs.File.t)
          (Trait := ltac:(refine _)))
        α0
        α4 in
    let* α6 : M.Val (core.result.Result.t unit std.io.error.Error.t) :=
      M.alloc α5 in
    let* α7 := M.read α6 in
    let* α0 : M.Val unit :=
      match α7 with
      | core.result.Result.Err why =>
        let* why := M.alloc why in
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "couldn't write to "; mk_str ": " ] in
        let* α1 : ref (array (ref str.t)) := borrow α0 in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
        let* α3 : M.Val (ref (slice (ref str.t))) :=
          pointer_coercion "Unsize" α2 in
        let* α4 : ref (slice (ref str.t)) := M.read α3 in
        let* α5 : ref std.path.Display.t := borrow display in
        let* α6 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α5 in
        let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
        let* α8 : ref std.io.error.Error.t := borrow why in
        let* α9 : core.fmt.rt.Argument.t :=
          core.fmt.rt.Argument.t::["new_display"] α8 in
        let* α10 : M.Val core.fmt.rt.Argument.t := M.alloc α9 in
        let* α11 : M.Val (array core.fmt.rt.Argument.t) :=
          M.alloc [ α7; α10 ] in
        let* α12 : ref (array core.fmt.rt.Argument.t) := borrow α11 in
        let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α12 in
        let* α14 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
          pointer_coercion "Unsize" α13 in
        let* α15 : ref (slice core.fmt.rt.Argument.t) := M.read α14 in
        let* α16 : core.fmt.Arguments.t :=
          core.fmt.Arguments.t::["new_v1"] α4 α15 in
        let* α17 : never.t := core.panicking.panic_fmt α16 in
        let* α18 : M.Val never.t := M.alloc α17 in
        never_to_any α18
      | core.result.Result.Ok _ =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "successfully wrote to "; mk_str "
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : ref std.path.Display.t := borrow display in
          let* α6 : core.fmt.rt.Argument.t :=
            core.fmt.rt.Argument.t::["new_display"] α5 in
          let* α7 : M.Val core.fmt.rt.Argument.t := M.alloc α6 in
          let* α8 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α7 ] in
          let* α9 : ref (array core.fmt.rt.Argument.t) := borrow α8 in
          let* α10 : M.Val (ref (array core.fmt.rt.Argument.t)) := M.alloc α9 in
          let* α11 : M.Val (ref (slice core.fmt.rt.Argument.t)) :=
            pointer_coercion "Unsize" α10 in
          let* α12 : ref (slice core.fmt.rt.Argument.t) := M.read α11 in
          let* α13 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_v1"] α4 α12 in
          let* α14 : unit := std.io.stdio._print α13 in
          M.alloc α14 in
        M.alloc tt
      end in
    M.read α0).
