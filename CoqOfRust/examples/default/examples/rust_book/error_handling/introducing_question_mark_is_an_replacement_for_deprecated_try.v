(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> Result<i32, ParseIntError> {
    let first_number = try!(first_number_str.parse::<i32>());
    let second_number = try!(second_number_str.parse::<i32>());

    Ok(first_number * second_number)
}
*)
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ first_number_str; second_number_str ] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let return_ :=
      M.return_
        (R :=
          Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]) in
    M.catch_return
      (let* first_number :=
        let* α0 := M.read first_number_str in
        let* α1 := M.call (Ty.path "str")::["parse"] [ α0 ] in
        let* α2 := M.alloc α1 in
        let* α3 :=
          match_operator
            α2
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Ok _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Ok_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end) :
                Ty.path "i32";
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Err _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Err_0" in
                    M.pure (α0 γ) in
                  let* err := M.copy γ0_0 in
                  let* α0 :=
                    M.get_method
                      "core::convert::From"
                      "from"
                      [
                        (* Self *) Ty.path "core::num::error::ParseIntError";
                        (* T *) Ty.path "core::num::error::ParseIntError"
                      ] in
                  let* α1 := M.read err in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 :=
                    return_
                      (Value.StructTuple "core::result::Result::Err" [ α2 ]) in
                  let* α4 := M.read α3 in
                  let* α5 := never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end) :
                Ty.path "i32"
            ] in
        M.copy α3 in
      let* second_number :=
        let* α0 := M.read second_number_str in
        let* α1 := M.call (Ty.path "str")::["parse"] [ α0 ] in
        let* α2 := M.alloc α1 in
        let* α3 :=
          match_operator
            α2
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Ok _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Ok_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match 
                end) :
                Ty.path "i32";
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Err _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Err_0" in
                    M.pure (α0 γ) in
                  let* err := M.copy γ0_0 in
                  let* α0 :=
                    M.get_method
                      "core::convert::From"
                      "from"
                      [
                        (* Self *) Ty.path "core::num::error::ParseIntError";
                        (* T *) Ty.path "core::num::error::ParseIntError"
                      ] in
                  let* α1 := M.read err in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 :=
                    return_
                      (Value.StructTuple "core::result::Result::Err" [ α2 ]) in
                  let* α4 := M.read α3 in
                  let* α5 := never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match 
                end) :
                Ty.path "i32"
            ] in
        M.copy α3 in
      let* α0 := M.var "BinOp::Panic::mul" in
      let* α1 := M.read first_number in
      let* α2 := M.read second_number in
      let* α3 := α0 α1 α2 in
      let* α0 :=
        M.alloc (Value.StructTuple "core::result::Result::Ok" [ α3 ]) in
      M.read α0)
  | _, _ => M.impossible
  end.

(*
fn print(result: Result<i32, ParseIntError>) {
    match result {
        Ok(n) => println!("n is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Ok_0" in
                M.pure (α0 γ) in
              let* n := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "n is ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow n ] in
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
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Err_0" in
                M.pure (α0 γ) in
              let* e := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Error: ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow e ] in
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
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    print(multiply("10", "2"));
    print(multiply("t", "2"));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.var
          "introducing_question_mark_is_an_replacement_for_deprecated_try::print" in
      let* α1 :=
        M.var
          "introducing_question_mark_is_an_replacement_for_deprecated_try::multiply" in
      let* α2 := M.read (mk_str "10") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call α1 [ α2; α3 ] in
      let* α5 := M.call α0 [ α4 ] in
      M.alloc α5 in
    let* _ :=
      let* α0 :=
        M.var
          "introducing_question_mark_is_an_replacement_for_deprecated_try::print" in
      let* α1 :=
        M.var
          "introducing_question_mark_is_an_replacement_for_deprecated_try::multiply" in
      let* α2 := M.read (mk_str "t") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call α1 [ α2; α3 ] in
      let* α5 := M.call α0 [ α4 ] in
      M.alloc α5 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
