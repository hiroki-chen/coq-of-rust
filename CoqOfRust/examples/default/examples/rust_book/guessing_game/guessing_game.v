(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn gen_range() -> u32 {
    todo!()
}
*)
Definition gen_range (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 := M.var "core::panicking::panic" in
    let* α1 := M.read (mk_str "not yet implemented") in
    let* α2 := M.call α0 [ α1 ] in
    never_to_any α2
  | _, _ => M.impossible
  end.

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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Guess the number!
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α2) ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* secret_number :=
      let* α0 := M.var "guessing_game::gen_range" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* α0 :=
      M.loop
        (let* _ :=
          let* _ :=
            let* α0 := M.var "std::io::stdio::_print" in
            let* α1 := M.read (mk_str "Please input your guess.
") in
            let* α2 := M.alloc [ α1 ] in
            let* α3 :=
              M.call
                (Ty.path "core::fmt::Arguments")::["new_const"]
                [ pointer_coercion "Unsize" (borrow α2) ] in
            let* α4 := M.call α0 [ α3 ] in
            M.alloc α4 in
          M.alloc tt in
        let* guess :=
          let* α0 := M.call (Ty.path "alloc::string::String")::["new"] [] in
          M.alloc α0 in
        let* _ :=
          let* α0 := M.var "std::io::stdio::stdin" in
          let* α1 := M.call α0 [] in
          let* α2 := M.alloc α1 in
          let* α3 :=
            M.call
              (Ty.path "std::io::stdio::Stdin")::["read_line"]
              [ borrow α2; borrow_mut guess ] in
          let* α4 := M.read (mk_str "Failed to read line") in
          let* α5 :=
            M.call
              (Ty.apply
                  (Ty.path "core::result::Result")
                  [ Ty.path "usize"; Ty.path "std::io::error::Error"
                  ])::["expect"]
              [ α3; α4 ] in
          M.alloc α5 in
        let* guess :=
          let* α0 :=
            M.get_method
              "core::ops::deref::Deref"
              "deref"
              [ (* Self *) Ty.path "alloc::string::String" ] in
          let* α1 := M.call α0 [ borrow guess ] in
          let* α2 := M.call (Ty.path "str")::["trim"] [ α1 ] in
          let* α3 := M.call (Ty.path "str")::["parse"] [ α2 ] in
          let* α4 := M.alloc α3 in
          let* α5 :=
            match_operator
              α4
              [
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.result.Result.Ok _ =>
                    let* γ0_0 :=
                      let* α0 := M.var "core::result::Result::Get_Ok_0" in
                      M.pure (α0 γ) in
                    let* num := M.copy γ0_0 in
                    M.pure num
                  | _ => M.break_match 
                  end) :
                  Ty.path "u32";
                fun γ =>
                  (let* α0 := M.read γ in
                  match α0 with
                  | core.result.Result.Err _ =>
                    let* γ0_0 :=
                      let* α0 := M.var "core::result::Result::Get_Err_0" in
                      M.pure (α0 γ) in
                    let* α0 := M.continue in
                    let* α1 := M.read α0 in
                    let* α2 := never_to_any α1 in
                    M.alloc α2
                  | _ => M.break_match 
                  end) :
                  Ty.path "u32"
              ] in
          M.copy α5 in
        let* _ :=
          let* _ :=
            let* α0 := M.var "std::io::stdio::_print" in
            let* α1 := M.read (mk_str "You guessed: ") in
            let* α2 := M.read (mk_str "
") in
            let* α3 := M.alloc [ α1; α2 ] in
            let* α4 :=
              M.call
                (Ty.path "core::fmt::rt::Argument")::["new_display"]
                [ borrow guess ] in
            let* α5 := M.alloc [ α4 ] in
            let* α6 :=
              M.call
                (Ty.path "core::fmt::Arguments")::["new_v1"]
                [
                  pointer_coercion "Unsize" (borrow α3);
                  pointer_coercion "Unsize" (borrow α5)
                ] in
            let* α7 := M.call α0 [ α6 ] in
            M.alloc α7 in
          M.alloc tt in
        let* α0 :=
          M.get_method "core::cmp::Ord" "cmp" [ (* Self *) Ty.path "u32" ] in
        let* α1 := M.call α0 [ borrow guess; borrow secret_number ] in
        let* α2 := M.alloc α1 in
        match_operator
          α2
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.cmp.Ordering.Less =>
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "Too small!
") in
                  let* α2 := M.alloc [ α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_const"]
                      [ pointer_coercion "Unsize" (borrow α2) ] in
                  let* α4 := M.call α0 [ α3 ] in
                  M.alloc α4 in
                M.alloc tt
              | _ => M.break_match 
              end) :
              Ty.tuple [];
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.cmp.Ordering.Greater =>
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "Too big!
") in
                  let* α2 := M.alloc [ α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_const"]
                      [ pointer_coercion "Unsize" (borrow α2) ] in
                  let* α4 := M.call α0 [ α3 ] in
                  M.alloc α4 in
                M.alloc tt
              | _ => M.break_match 
              end) :
              Ty.tuple [];
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.cmp.Ordering.Equal =>
                let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "You win!
") in
                    let* α2 := M.alloc [ α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" (borrow α2) ] in
                    let* α4 := M.call α0 [ α3 ] in
                    M.alloc α4 in
                  M.alloc tt in
                let* α0 := M.break in
                let* α1 := M.read α0 in
                let* α2 := never_to_any α1 in
                M.alloc α2
              | _ => M.break_match 
              end) :
              Ty.tuple []
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
