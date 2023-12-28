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
  let* o := M.alloc o in
  let* α0 : core.option.Option.t A := M.read o in
  let* α1 : M.Val unit :=
    match_operator
      α0
      [
        fun α =>
          match α with
          | core.option.Option.Some _a =>
            let* _a := M.alloc _a in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "some
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | core.option.Option.None =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "nothing
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit)
      ] in
  M.read α1.

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
    let* file : M.Val std.fs.File.t :=
      let* α0 : std.fs.OpenOptions.t := M.call std.fs.OpenOptions.t::["new"] in
      let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
      let* α2 : mut_ref std.fs.OpenOptions.t :=
        M.call (std.fs.OpenOptions.t::["append"] (borrow_mut α1) true) in
      let* α3 : mut_ref std.fs.OpenOptions.t :=
        M.call (std.fs.OpenOptions.t::["create"] α2 true) in
      let* α4 : ref str.t := M.read (mk_str "ferris.txt") in
      let* α5 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        M.call (std.fs.OpenOptions.t::["open"] (borrow (deref α3)) α4) in
      let* α6 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
      let* α7 : std.fs.File.t :=
        M.call
          ((core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
            α5
            α6) in
      M.alloc α7 in
    let* α0 : core.ops.range.Range.t i32.t :=
      M.call
        ((core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {|
            core.ops.range.Range.start := Integer.of_Z 0;
            core.ops.range.Range.end_ := Integer.of_Z 5;
          |}) in
    let* α1 : M.Val unit :=
      match_operator
        α0
        [
          fun α =>
            match α with
            | iter =>
              let* iter := M.alloc iter in
              M.loop
                (let* _ : M.Val unit :=
                  let* α0 : core.option.Option.t i32.t :=
                    M.call
                      ((core.iter.traits.iterator.Iterator.next
                          (Self := core.ops.range.Range.t i32.t)
                          (Trait := ltac:(refine _)))
                        (borrow_mut iter)) in
                  match_operator
                    α0
                    [
                      fun α =>
                        match α with
                        | core.option.Option.None =>
                          let* α0 : M.Val never.t := M.break in
                          let* α1 := M.read α0 in
                          let* α2 : unit := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match
                        end :
                        M (M.Val unit);
                      fun α =>
                        match α with
                        | core.option.Option.Some _ =>
                          let* _ : M.Val unit :=
                            let* α0 : ref str.t := M.read (mk_str "Ferris
") in
                            let* α1 : ref (slice u8.t) :=
                              M.call (str.t::["as_bytes"] α0) in
                            let* α2 :
                                core.result.Result.t
                                  unit
                                  std.io.error.Error.t :=
                              M.call
                                ((std.io.Write.write_all
                                    (Self := std.fs.File.t)
                                    (Trait := ltac:(refine _)))
                                  (borrow_mut file)
                                  α1) in
                            let* α3 : ref str.t :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α4 : unit :=
                              M.call
                                ((core.result.Result.t
                                      unit
                                      std.io.error.Error.t)::["expect"]
                                  α2
                                  α3) in
                            M.alloc α4 in
                          M.alloc tt
                        | _ => M.break_match
                        end :
                        M (M.Val unit)
                    ] in
                M.alloc tt)
            end :
            M (M.Val unit)
        ] in
    M.read (use α1).
  
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
    let* file : M.Val std.fs.File.t :=
      let* α0 : std.fs.OpenOptions.t := M.call std.fs.OpenOptions.t::["new"] in
      let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
      let* α2 : mut_ref std.fs.OpenOptions.t :=
        M.call (std.fs.OpenOptions.t::["append"] (borrow_mut α1) true) in
      let* α3 : mut_ref std.fs.OpenOptions.t :=
        M.call (std.fs.OpenOptions.t::["create"] α2 true) in
      let* α4 : ref str.t := M.read (mk_str "ferris.txt") in
      let* α5 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
        M.call (std.fs.OpenOptions.t::["open"] (borrow (deref α3)) α4) in
      let* α6 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
      let* α7 : std.fs.File.t :=
        M.call
          ((core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
            α5
            α6) in
      M.alloc α7 in
    let* α0 : core.ops.range.Range.t i32.t :=
      M.call
        ((core.iter.traits.collect.IntoIterator.into_iter
            (Self := core.ops.range.Range.t i32.t)
            (Trait := ltac:(refine _)))
          {|
            core.ops.range.Range.start := Integer.of_Z 0;
            core.ops.range.Range.end_ := Integer.of_Z 5;
          |}) in
    let* α1 : M.Val unit :=
      match_operator
        α0
        [
          fun α =>
            match α with
            | iter =>
              let* iter := M.alloc iter in
              M.loop
                (let* _ : M.Val unit :=
                  let* α0 : core.option.Option.t i32.t :=
                    M.call
                      ((core.iter.traits.iterator.Iterator.next
                          (Self := core.ops.range.Range.t i32.t)
                          (Trait := ltac:(refine _)))
                        (borrow_mut iter)) in
                  match_operator
                    α0
                    [
                      fun α =>
                        match α with
                        | core.option.Option.None =>
                          let* α0 : M.Val never.t := M.break in
                          let* α1 := M.read α0 in
                          let* α2 : unit := never_to_any α1 in
                          M.alloc α2
                        | _ => M.break_match
                        end :
                        M (M.Val unit);
                      fun α =>
                        match α with
                        | core.option.Option.Some _ =>
                          let* _ : M.Val unit :=
                            let* α0 : ref str.t := M.read (mk_str "Corro
") in
                            let* α1 : ref (slice u8.t) :=
                              M.call (str.t::["as_bytes"] α0) in
                            let* α2 :
                                core.result.Result.t
                                  unit
                                  std.io.error.Error.t :=
                              M.call
                                ((std.io.Write.write_all
                                    (Self := std.fs.File.t)
                                    (Trait := ltac:(refine _)))
                                  (borrow_mut file)
                                  α1) in
                            let* α3 : ref str.t :=
                              M.read (mk_str "Could not write to ferris.txt") in
                            let* α4 : unit :=
                              M.call
                                ((core.result.Result.t
                                      unit
                                      std.io.error.Error.t)::["expect"]
                                  α2
                                  α3) in
                            M.alloc α4 in
                          M.alloc tt
                        | _ => M.break_match
                        end :
                        M (M.Val unit)
                    ] in
                M.alloc tt)
            end :
            M (M.Val unit)
        ] in
    M.read (use α1).
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
  let* file : M.Val std.fs.File.t :=
    let* α0 : std.fs.OpenOptions.t := M.call std.fs.OpenOptions.t::["new"] in
    let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
    let* α2 : mut_ref std.fs.OpenOptions.t :=
      M.call (std.fs.OpenOptions.t::["append"] (borrow_mut α1) true) in
    let* α3 : mut_ref std.fs.OpenOptions.t :=
      M.call (std.fs.OpenOptions.t::["create"] α2 true) in
    let* α4 : ref str.t := M.read (mk_str "ferris.txt") in
    let* α5 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
      M.call (std.fs.OpenOptions.t::["open"] (borrow (deref α3)) α4) in
    let* α6 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
    let* α7 : std.fs.File.t :=
      M.call
        ((core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
          α5
          α6) in
    M.alloc α7 in
  let* α0 : core.ops.range.Range.t i32.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t i32.t)
          (Trait := ltac:(refine _)))
        {|
          core.ops.range.Range.start := Integer.of_Z 0;
          core.ops.range.Range.end_ := Integer.of_Z 5;
        |}) in
  let* α1 : M.Val unit :=
    match_operator
      α0
      [
        fun α =>
          match α with
          | iter =>
            let* iter := M.alloc iter in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 : core.option.Option.t i32.t :=
                  M.call
                    ((core.iter.traits.iterator.Iterator.next
                        (Self := core.ops.range.Range.t i32.t)
                        (Trait := ltac:(refine _)))
                      (borrow_mut iter)) in
                match_operator
                  α0
                  [
                    fun α =>
                      match α with
                      | core.option.Option.None =>
                        let* α0 : M.Val never.t := M.break in
                        let* α1 := M.read α0 in
                        let* α2 : unit := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end :
                      M (M.Val unit);
                    fun α =>
                      match α with
                      | core.option.Option.Some _ =>
                        let* _ : M.Val unit :=
                          let* α0 : ref str.t := M.read (mk_str "Ferris
") in
                          let* α1 : ref (slice u8.t) :=
                            M.call (str.t::["as_bytes"] α0) in
                          let* α2 :
                              core.result.Result.t unit std.io.error.Error.t :=
                            M.call
                              ((std.io.Write.write_all
                                  (Self := std.fs.File.t)
                                  (Trait := ltac:(refine _)))
                                (borrow_mut file)
                                α1) in
                          let* α3 : ref str.t :=
                            M.read (mk_str "Could not write to ferris.txt") in
                          let* α4 : unit :=
                            M.call
                              ((core.result.Result.t
                                    unit
                                    std.io.error.Error.t)::["expect"]
                                α2
                                α3) in
                          M.alloc α4 in
                        M.alloc tt
                      | _ => M.break_match
                      end :
                      M (M.Val unit)
                  ] in
              M.alloc tt)
          end :
          M (M.Val unit)
      ] in
  M.read (use α1).

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
  let* file : M.Val std.fs.File.t :=
    let* α0 : std.fs.OpenOptions.t := M.call std.fs.OpenOptions.t::["new"] in
    let* α1 : M.Val std.fs.OpenOptions.t := M.alloc α0 in
    let* α2 : mut_ref std.fs.OpenOptions.t :=
      M.call (std.fs.OpenOptions.t::["append"] (borrow_mut α1) true) in
    let* α3 : mut_ref std.fs.OpenOptions.t :=
      M.call (std.fs.OpenOptions.t::["create"] α2 true) in
    let* α4 : ref str.t := M.read (mk_str "ferris.txt") in
    let* α5 : core.result.Result.t std.fs.File.t std.io.error.Error.t :=
      M.call (std.fs.OpenOptions.t::["open"] (borrow (deref α3)) α4) in
    let* α6 : ref str.t := M.read (mk_str "Failed to open ferris.txt") in
    let* α7 : std.fs.File.t :=
      M.call
        ((core.result.Result.t std.fs.File.t std.io.error.Error.t)::["expect"]
          α5
          α6) in
    M.alloc α7 in
  let* α0 : core.ops.range.Range.t i32.t :=
    M.call
      ((core.iter.traits.collect.IntoIterator.into_iter
          (Self := core.ops.range.Range.t i32.t)
          (Trait := ltac:(refine _)))
        {|
          core.ops.range.Range.start := Integer.of_Z 0;
          core.ops.range.Range.end_ := Integer.of_Z 5;
        |}) in
  let* α1 : M.Val unit :=
    match_operator
      α0
      [
        fun α =>
          match α with
          | iter =>
            let* iter := M.alloc iter in
            M.loop
              (let* _ : M.Val unit :=
                let* α0 : core.option.Option.t i32.t :=
                  M.call
                    ((core.iter.traits.iterator.Iterator.next
                        (Self := core.ops.range.Range.t i32.t)
                        (Trait := ltac:(refine _)))
                      (borrow_mut iter)) in
                match_operator
                  α0
                  [
                    fun α =>
                      match α with
                      | core.option.Option.None =>
                        let* α0 : M.Val never.t := M.break in
                        let* α1 := M.read α0 in
                        let* α2 : unit := never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match
                      end :
                      M (M.Val unit);
                    fun α =>
                      match α with
                      | core.option.Option.Some _ =>
                        let* _ : M.Val unit :=
                          let* α0 : ref str.t := M.read (mk_str "Corro
") in
                          let* α1 : ref (slice u8.t) :=
                            M.call (str.t::["as_bytes"] α0) in
                          let* α2 :
                              core.result.Result.t unit std.io.error.Error.t :=
                            M.call
                              ((std.io.Write.write_all
                                  (Self := std.fs.File.t)
                                  (Trait := ltac:(refine _)))
                                (borrow_mut file)
                                α1) in
                          let* α3 : ref str.t :=
                            M.read (mk_str "Could not write to ferris.txt") in
                          let* α4 : unit :=
                            M.call
                              ((core.result.Result.t
                                    unit
                                    std.io.error.Error.t)::["expect"]
                                α2
                                α3) in
                          M.alloc α4 in
                        M.alloc tt
                      | _ => M.break_match
                      end :
                      M (M.Val unit)
                  ] in
              M.alloc tt)
          end :
          M (M.Val unit)
      ] in
  M.read (use α1).
