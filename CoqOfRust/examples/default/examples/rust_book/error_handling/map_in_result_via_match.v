(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> Result<i32, ParseIntError> {
    match first_number_str.parse::<i32>() {
        Ok(first_number) => match second_number_str.parse::<i32>() {
            Ok(second_number) => Ok(first_number * second_number),
            Err(e) => Err(e),
        },
        Err(e) => Err(e),
    }
}
*)
Definition multiply (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ first_number_str; second_number_str ] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let* α0 :=
      M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
    let* α1 := M.read first_number_str in
    let* α2 := M.call_closure α0 [ α1 ] in
    let* α3 := M.alloc α2 in
    let* α4 :=
      M.match_operator
        α3
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* first_number := M.copy γ0_0 in
            let* α0 :=
              M.get_associated_function
                (Ty.path "str")
                "parse"
                [ Ty.path "i32" ] in
            let* α1 := M.read second_number_str in
            let* α2 := M.call_closure α0 [ α1 ] in
            let* α3 := M.alloc α2 in
            M.match_operator
              α3
              [
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "core::result::Result::Ok"
                      0 in
                  let* second_number := M.copy γ0_0 in
                  let* α0 := M.read first_number in
                  let* α1 := M.read second_number in
                  let* α2 := BinOp.Panic.mul α0 α1 in
                  M.alloc (Value.StructTuple "core::result::Result::Ok" [ α2 ]);
                fun γ =>
                  let* γ0_0 :=
                    M.get_struct_tuple_field_or_break_match
                      γ
                      "core::result::Result::Err"
                      0 in
                  let* e := M.copy γ0_0 in
                  let* α0 := M.read e in
                  M.alloc (Value.StructTuple "core::result::Result::Err" [ α0 ])
              ];
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* e := M.copy γ0_0 in
            let* α0 := M.read e in
            M.alloc (Value.StructTuple "core::result::Result::Err" [ α0 ])
        ] in
    M.read α4
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
Definition print (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      M.match_operator
        result
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "n is ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "i32" ] in
                  let* α7 := M.call_closure α6 [ n ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* e := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Error: ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "core::num::error::ParseIntError" ] in
                  let* α7 := M.call_closure α6 [ e ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // This still presents a reasonable answer.
    let twenty = multiply("10", "2");
    print(twenty);

    // The following now provides a much more helpful error message.
    let tt = multiply("t", "2");
    print(tt);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* twenty :=
      let* α0 := M.get_function "map_in_result_via_match::multiply" [] in
      let* α1 := M.read (mk_str "10") in
      let* α2 := M.read (mk_str "2") in
      let* α3 := M.call_closure α0 [ α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 := M.get_function "map_in_result_via_match::print" [] in
      let* α1 := M.read twenty in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* tt_ :=
      let* α0 := M.get_function "map_in_result_via_match::multiply" [] in
      let* α1 := M.read (mk_str "t") in
      let* α2 := M.read (mk_str "2") in
      let* α3 := M.call_closure α0 [ α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 := M.get_function "map_in_result_via_match::print" [] in
      let* α1 := M.read tt_ in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
