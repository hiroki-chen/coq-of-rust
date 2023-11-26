(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn foo<A>(o: Option<A>) {
    match o {
        Some(_a) => println!("some"),
        None => println!("nothing"),
    }
}
*)
Definition foo {A : Set} (o : core.option.Option.t A) : M unit :=
  let* o : M.Val (core.option.Option.t A) := M.alloc o in
  M.function_body
    (let* α0 := M.read o in
    let* α1 : M.Val unit :=
      match α0 with
      | core.option.Option.Some _a =>
        let* _a := M.alloc _a in
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) := M.alloc [ mk_str "some
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      | core.option.Option.None  =>
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "nothing
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt
      end in
    M.read α1).

Module tests.
  (*
      fn test_file() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Ferris" 5 times.
          for _ in 0..5 {
              file.write_all("Ferris\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file : M unit :=
    M.function_body
      (let* file : M.Val std.fs.File.t :=
        let* α0 : std.fs.OpenOptions.t := std.fs.OpenOptions.t::["new"] in
        let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
        let* α2 : mut_ref std.fs.OpenOptions.t := borrow_mut α1 in
        let* α3 : M.Val bool.t := M.alloc true in
        let* α4 : bool.t := M.read α3 in
        let* α5 : mut_ref std.fs.OpenOptions.t :=
          std.fs.OpenOptions.t::["append"] α2 α4 in
        let* α6 : M.Val bool.t := M.alloc true in
        let* α7 : bool.t := M.read α6 in
        let* α8 : mut_ref std.fs.OpenOptions.t :=
          std.fs.OpenOptions.t::["create"] α5 α7 in
        let* α9 : M.Val std.fs.OpenOptions.t := deref α8 in
        let* α10 : ref std.fs.OpenOptions.t := borrow α9 in
        let* α11 : ref str.t := M.read (mk_str "ferris.txt") in
        let* α12 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
          std.fs.OpenOptions.t::["open"] α10 α11 in
        let* α13 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
        let* α14 : std.fs.File.t :=
          (core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
            α12
            α13 in
        M.alloc α14 in
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 5 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : core.ops.range.Range.t i32.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      let* α5 : M.Val (core.ops.range.Range.t i32.t) := M.alloc α4 in
      let* α6 := M.read α5 in
      let* α7 : M.Val unit :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.ops.range.Range.t i32.t) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t i32.t :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t i32.t) := M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some _ =>
                let* _ : M.Val unit :=
                  let* α0 : mut_ref std.fs.File.t := borrow_mut file in
                  let* α1 : ref str.t := M.read (mk_str "Ferris
") in
                  let* α2 : ref (slice u8.t) := str.t::["as_bytes"] α1 in
                  let* α3 : core.result.Result.t unit std.io.error.Error.t :=
                    (std.io.Write.write_all
                        (Self := std.fs.File.t)
                        (Trait := ltac:(refine _)))
                      α0
                      α2 in
                  let* α4 : ref str.t :=
                    M.read (mk_str "Could not write to ferris.txt") in
                  let* α5 : unit :=
                    (core.result.Result.t unit std.io.error.Error.t)::["expect"]
                      α3
                      α4 in
                  M.alloc α5 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      let* α0 : M.Val unit := use α7 in
      M.read α0).
  
  (*
      fn test_file_also() {
          // Opens the file ferris.txt or creates one if it doesn't exist.
          let mut file = OpenOptions::new()
              .append(true)
              .create(true)
              .open("ferris.txt")
              .expect("Failed to open ferris.txt");
  
          // Print "Corro" 5 times.
          for _ in 0..5 {
              file.write_all("Corro\n".as_bytes())
                  .expect("Could not write to ferris.txt");
          }
      }
  *)
  Definition test_file_also : M unit :=
    M.function_body
      (let* file : M.Val std.fs.File.t :=
        let* α0 : std.fs.OpenOptions.t := std.fs.OpenOptions.t::["new"] in
        let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
        let* α2 : mut_ref std.fs.OpenOptions.t := borrow_mut α1 in
        let* α3 : M.Val bool.t := M.alloc true in
        let* α4 : bool.t := M.read α3 in
        let* α5 : mut_ref std.fs.OpenOptions.t :=
          std.fs.OpenOptions.t::["append"] α2 α4 in
        let* α6 : M.Val bool.t := M.alloc true in
        let* α7 : bool.t := M.read α6 in
        let* α8 : mut_ref std.fs.OpenOptions.t :=
          std.fs.OpenOptions.t::["create"] α5 α7 in
        let* α9 : M.Val std.fs.OpenOptions.t := deref α8 in
        let* α10 : ref std.fs.OpenOptions.t := borrow α9 in
        let* α11 : ref str.t := M.read (mk_str "ferris.txt") in
        let* α12 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
          std.fs.OpenOptions.t::["open"] α10 α11 in
        let* α13 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
        let* α14 : std.fs.File.t :=
          (core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
            α12
            α13 in
        M.alloc α14 in
      let* α0 : M.Val i32.t := M.alloc 0 in
      let* α1 : i32.t := M.read α0 in
      let* α2 : M.Val i32.t := M.alloc 5 in
      let* α3 : i32.t := M.read α2 in
      let* α4 : core.ops.range.Range.t i32.t :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
          |} in
      let* α5 : M.Val (core.ops.range.Range.t i32.t) := M.alloc α4 in
      let* α6 := M.read α5 in
      let* α7 : M.Val unit :=
        match α6 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : M.Val unit :=
              let* α0 : mut_ref (core.ops.range.Range.t i32.t) :=
                borrow_mut iter in
              let* α1 : core.option.Option.t i32.t :=
                (core.iter.traits.iterator.Iterator.next
                    (Self := core.ops.range.Range.t i32.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 : M.Val (core.option.Option.t i32.t) := M.alloc α1 in
              let* α3 := M.read α2 in
              match α3 with
              | core.option.Option.None  =>
                let* α0 : M.Val never.t := Break in
                never_to_any α0
              | core.option.Option.Some _ =>
                let* _ : M.Val unit :=
                  let* α0 : mut_ref std.fs.File.t := borrow_mut file in
                  let* α1 : ref str.t := M.read (mk_str "Corro
") in
                  let* α2 : ref (slice u8.t) := str.t::["as_bytes"] α1 in
                  let* α3 : core.result.Result.t unit std.io.error.Error.t :=
                    (std.io.Write.write_all
                        (Self := std.fs.File.t)
                        (Trait := ltac:(refine _)))
                      α0
                      α2 in
                  let* α4 : ref str.t :=
                    M.read (mk_str "Could not write to ferris.txt") in
                  let* α5 : unit :=
                    (core.result.Result.t unit std.io.error.Error.t)::["expect"]
                      α3
                      α4 in
                  M.alloc α5 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      let* α0 : M.Val unit := use α7 in
      M.read α0).
End tests.

(*
    fn test_file() {
        // Opens the file ferris.txt or creates one if it doesn't exist.
        let mut file = OpenOptions::new()
            .append(true)
            .create(true)
            .open("ferris.txt")
            .expect("Failed to open ferris.txt");

        // Print "Ferris" 5 times.
        for _ in 0..5 {
            file.write_all("Ferris\n".as_bytes())
                .expect("Could not write to ferris.txt");
        }
    }
*)
Definition test_file : M unit :=
  M.function_body
    (let* file : M.Val std.fs.File.t :=
      let* α0 : std.fs.OpenOptions.t := std.fs.OpenOptions.t::["new"] in
      let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
      let* α2 : mut_ref std.fs.OpenOptions.t := borrow_mut α1 in
      let* α3 : M.Val bool.t := M.alloc true in
      let* α4 : bool.t := M.read α3 in
      let* α5 : mut_ref std.fs.OpenOptions.t :=
        std.fs.OpenOptions.t::["append"] α2 α4 in
      let* α6 : M.Val bool.t := M.alloc true in
      let* α7 : bool.t := M.read α6 in
      let* α8 : mut_ref std.fs.OpenOptions.t :=
        std.fs.OpenOptions.t::["create"] α5 α7 in
      let* α9 : M.Val std.fs.OpenOptions.t := deref α8 in
      let* α10 : ref std.fs.OpenOptions.t := borrow α9 in
      let* α11 : ref str.t := M.read (mk_str "ferris.txt") in
      let* α12 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        std.fs.OpenOptions.t::["open"] α10 α11 in
      let* α13 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
      let* α14 : std.fs.File.t :=
        (core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
          α12
          α13 in
      M.alloc α14 in
    let* α0 : M.Val i32.t := M.alloc 0 in
    let* α1 : i32.t := M.read α0 in
    let* α2 : M.Val i32.t := M.alloc 5 in
    let* α3 : i32.t := M.read α2 in
    let* α4 : core.ops.range.Range.t i32.t :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t i32.t)
          (Trait := ltac:(refine _)))
        {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
        |} in
    let* α5 : M.Val (core.ops.range.Range.t i32.t) := M.alloc α4 in
    let* α6 := M.read α5 in
    let* α7 : M.Val unit :=
      match α6 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : M.Val unit :=
            let* α0 : mut_ref (core.ops.range.Range.t i32.t) :=
              borrow_mut iter in
            let* α1 : core.option.Option.t i32.t :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t i32.t)
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 : M.Val (core.option.Option.t i32.t) := M.alloc α1 in
            let* α3 := M.read α2 in
            match α3 with
            | core.option.Option.None  =>
              let* α0 : M.Val never.t := Break in
              never_to_any α0
            | core.option.Option.Some _ =>
              let* _ : M.Val unit :=
                let* α0 : mut_ref std.fs.File.t := borrow_mut file in
                let* α1 : ref str.t := M.read (mk_str "Ferris
") in
                let* α2 : ref (slice u8.t) := str.t::["as_bytes"] α1 in
                let* α3 : core.result.Result.t unit std.io.error.Error.t :=
                  (std.io.Write.write_all
                      (Self := std.fs.File.t)
                      (Trait := ltac:(refine _)))
                    α0
                    α2 in
                let* α4 : ref str.t :=
                  M.read (mk_str "Could not write to ferris.txt") in
                let* α5 : unit :=
                  (core.result.Result.t unit std.io.error.Error.t)::["expect"]
                    α3
                    α4 in
                M.alloc α5 in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    let* α0 : M.Val unit := use α7 in
    M.read α0).

(*
    fn test_file_also() {
        // Opens the file ferris.txt or creates one if it doesn't exist.
        let mut file = OpenOptions::new()
            .append(true)
            .create(true)
            .open("ferris.txt")
            .expect("Failed to open ferris.txt");

        // Print "Corro" 5 times.
        for _ in 0..5 {
            file.write_all("Corro\n".as_bytes())
                .expect("Could not write to ferris.txt");
        }
    }
*)
Definition test_file_also : M unit :=
  M.function_body
    (let* file : M.Val std.fs.File.t :=
      let* α0 : std.fs.OpenOptions.t := std.fs.OpenOptions.t::["new"] in
      let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
      let* α2 : mut_ref std.fs.OpenOptions.t := borrow_mut α1 in
      let* α3 : M.Val bool.t := M.alloc true in
      let* α4 : bool.t := M.read α3 in
      let* α5 : mut_ref std.fs.OpenOptions.t :=
        std.fs.OpenOptions.t::["append"] α2 α4 in
      let* α6 : M.Val bool.t := M.alloc true in
      let* α7 : bool.t := M.read α6 in
      let* α8 : mut_ref std.fs.OpenOptions.t :=
        std.fs.OpenOptions.t::["create"] α5 α7 in
      let* α9 : M.Val std.fs.OpenOptions.t := deref α8 in
      let* α10 : ref std.fs.OpenOptions.t := borrow α9 in
      let* α11 : ref str.t := M.read (mk_str "ferris.txt") in
      let* α12 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        std.fs.OpenOptions.t::["open"] α10 α11 in
      let* α13 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
      let* α14 : std.fs.File.t :=
        (core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
          α12
          α13 in
      M.alloc α14 in
    let* α0 : M.Val i32.t := M.alloc 0 in
    let* α1 : i32.t := M.read α0 in
    let* α2 : M.Val i32.t := M.alloc 5 in
    let* α3 : i32.t := M.read α2 in
    let* α4 : core.ops.range.Range.t i32.t :=
      (core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t i32.t)
          (Trait := ltac:(refine _)))
        {| core.ops.range.Range.start := α1; core.ops.range.Range.end := α3;
        |} in
    let* α5 : M.Val (core.ops.range.Range.t i32.t) := M.alloc α4 in
    let* α6 := M.read α5 in
    let* α7 : M.Val unit :=
      match α6 with
      | iter =>
        let* iter := M.alloc iter in
        loop
          (let* _ : M.Val unit :=
            let* α0 : mut_ref (core.ops.range.Range.t i32.t) :=
              borrow_mut iter in
            let* α1 : core.option.Option.t i32.t :=
              (core.iter.traits.iterator.Iterator.next
                  (Self := core.ops.range.Range.t i32.t)
                  (Trait := ltac:(refine _)))
                α0 in
            let* α2 : M.Val (core.option.Option.t i32.t) := M.alloc α1 in
            let* α3 := M.read α2 in
            match α3 with
            | core.option.Option.None  =>
              let* α0 : M.Val never.t := Break in
              never_to_any α0
            | core.option.Option.Some _ =>
              let* _ : M.Val unit :=
                let* α0 : mut_ref std.fs.File.t := borrow_mut file in
                let* α1 : ref str.t := M.read (mk_str "Corro
") in
                let* α2 : ref (slice u8.t) := str.t::["as_bytes"] α1 in
                let* α3 : core.result.Result.t unit std.io.error.Error.t :=
                  (std.io.Write.write_all
                      (Self := std.fs.File.t)
                      (Trait := ltac:(refine _)))
                    α0
                    α2 in
                let* α4 : ref str.t :=
                  M.read (mk_str "Could not write to ferris.txt") in
                let* α5 : unit :=
                  (core.result.Result.t unit std.io.error.Error.t)::["expect"]
                    α3
                    α4 in
                M.alloc α5 in
              M.alloc tt
            end in
          M.alloc tt)
      end in
    let* α0 : M.Val unit := use α7 in
    M.read α0).
