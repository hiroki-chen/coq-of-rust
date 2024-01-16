(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn gen_range() -> u32 {
    todo!()
}
*)
Definition gen_range : M u32.t :=
  let* α0 : ref str.t := M.read (mk_str "not yet implemented") in
  let* α1 : never.t := M.call (core.panicking.panic α0) in
  never_to_any α1.

(*
fn main() {
    println!("Guess the number!");
    let secret_number = gen_range();
    // println!("The secret number is: {secret_number}");
    loop {
        println!("Please input your guess.");

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        // shadowing previous var {guess}.
        // We do shadowing when we want to convert var from one type to another
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {guess}");

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Guess the number!
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : core.fmt.Arguments.t :=
        M.call
          (core.fmt.Arguments.t::["new_const"]
            (pointer_coercion "Unsize" (borrow α1))) in
      let* α3 : unit := M.call (std.io.stdio._print α2) in
      M.alloc α3 in
    M.alloc tt in
  let* secret_number : M.Val u32.t :=
    let* α0 : u32.t := M.call guessing_game.gen_range in
    M.alloc α0 in
  let* α0 : M.Val unit :=
    M.loop
      (let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Please input your guess.
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : core.fmt.Arguments.t :=
            M.call
              (core.fmt.Arguments.t::["new_const"]
                (pointer_coercion "Unsize" (borrow α1))) in
          let* α3 : unit := M.call (std.io.stdio._print α2) in
          M.alloc α3 in
        M.alloc tt in
      let* guess : M.Val alloc.string.String.t :=
        let* α0 : alloc.string.String.t :=
          M.call alloc.string.String.t::["new"] in
        M.alloc α0 in
      let* _ : M.Val usize.t :=
        let* α0 : std.io.stdio.Stdin.t := M.call std.io.stdio.stdin in
        let* α1 : M.Val std.io.stdio.Stdin.t := M.alloc α0 in
        let* α2 : core.result.Result.t usize.t std.io.error.Error.t :=
          M.call
            (std.io.stdio.Stdin.t::["read_line"]
              (borrow α1)
              (borrow_mut guess)) in
        let* α3 : ref str.t := M.read (mk_str "Failed to read line") in
        let* α4 : usize.t :=
          M.call
            ((core.result.Result.t usize.t std.io.error.Error.t)::["expect"]
              α2
              α3) in
        M.alloc α4 in
      let* guess : M.Val u32.t :=
        let* α0 : (ref alloc.string.String.t) -> M (ref _) :=
          ltac:(M.get_method (fun ℐ =>
            core.ops.deref.Deref.deref
              (Self := alloc.string.String.t)
              (Trait := ℐ))) in
        let* α1 : ref str.t := M.call (α0 (borrow guess)) in
        let* α2 : ref str.t := M.call (str.t::["trim"] α1) in
        let* α3 : core.result.Result.t u32.t core.num.error.ParseIntError.t :=
          M.call (str.t::["parse"] α2) in
        let* α4 :
            M.Val (core.result.Result.t u32.t core.num.error.ParseIntError.t) :=
          M.alloc α3 in
        let* α5 : M.Val u32.t :=
          match_operator
            α4
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Ok _ =>
                  let γ0_0 := core.result.Result.Get_Ok_0 γ in
                  let* num := M.copy γ0_0 in
                  M.pure num
                | _ => M.break_match
                end) :
                M (M.Val u32.t);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Err _ =>
                  let γ0_0 := core.result.Result.Get_Err_0 γ in
                  let* α0 : M.Val never.t := M.continue in
                  let* α1 := M.read α0 in
                  let* α2 : u32.t := never_to_any α1 in
                  M.alloc α2
                | _ => M.break_match
                end) :
                M (M.Val u32.t)
            ] in
        M.copy α5 in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "You guessed: ") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : core.fmt.rt.Argument.t :=
            M.call (core.fmt.rt.Argument.t::["new_display"] (borrow guess)) in
          let* α4 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α3 ] in
          let* α5 : core.fmt.Arguments.t :=
            M.call
              (core.fmt.Arguments.t::["new_v1"]
                (pointer_coercion "Unsize" (borrow α2))
                (pointer_coercion "Unsize" (borrow α4))) in
          let* α6 : unit := M.call (std.io.stdio._print α5) in
          M.alloc α6 in
        M.alloc tt in
      let* α0 : (ref u32.t) -> (ref u32.t) -> M core.cmp.Ordering.t :=
        ltac:(M.get_method (fun ℐ =>
          core.cmp.Ord.cmp (Self := u32.t) (Trait := ℐ))) in
      let* α1 : core.cmp.Ordering.t :=
        M.call (α0 (borrow guess) (borrow secret_number)) in
      let* α2 : M.Val core.cmp.Ordering.t := M.alloc α1 in
      match_operator
        α2
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.cmp.Ordering.Less =>
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Too small!
") in
                let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                let* α2 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : unit := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            M (M.Val unit);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.cmp.Ordering.Greater =>
              let* _ : M.Val unit :=
                let* α0 : ref str.t := M.read (mk_str "Too big!
") in
                let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                let* α2 : core.fmt.Arguments.t :=
                  M.call
                    (core.fmt.Arguments.t::["new_const"]
                      (pointer_coercion "Unsize" (borrow α1))) in
                let* α3 : unit := M.call (std.io.stdio._print α2) in
                M.alloc α3 in
              M.alloc tt
            | _ => M.break_match
            end) :
            M (M.Val unit);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.cmp.Ordering.Equal =>
              let* _ : M.Val unit :=
                let* _ : M.Val unit :=
                  let* α0 : ref str.t := M.read (mk_str "You win!
") in
                  let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
                  let* α2 : core.fmt.Arguments.t :=
                    M.call
                      (core.fmt.Arguments.t::["new_const"]
                        (pointer_coercion "Unsize" (borrow α1))) in
                  let* α3 : unit := M.call (std.io.stdio._print α2) in
                  M.alloc α3 in
                M.alloc tt in
              let* α0 : M.Val never.t := M.break in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            | _ => M.break_match
            end) :
            M (M.Val unit)
        ]) in
  M.read α0.
