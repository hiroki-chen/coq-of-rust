(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom AliasedResult :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "aliases_for_result::AliasedResult") [ T ]) =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "core::num::error::ParseIntError" ]).

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> AliasedResult<i32> {
    first_number_str.parse::<i32>().and_then(|first_number| {
        second_number_str
            .parse::<i32>()
            .map(|second_number| first_number * second_number)
    })
}
*)
Definition multiply (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ first_number_str; second_number_str ] =>
    let* first_number_str := M.alloc first_number_str in
    let* second_number_str := M.alloc second_number_str in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::result::Result")
          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        "and_then"
        [
          Ty.path "i32";
          Ty.function
            [ Ty.tuple [ Ty.path "i32" ] ]
            (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
        ] in
    let* α1 := M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
    let* α2 := M.read first_number_str in
    let* α3 := M.call_closure α1 [ α2 ] in
    M.call_closure
      α0
      [
        α3;
        M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* first_number := M.copy γ in
                    let* α0 :=
                      M.get_associated_function
                        (Ty.apply
                          (Ty.path "core::result::Result")
                          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
                        "map"
                        [ Ty.path "i32"; Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32")
                        ] in
                    let* α1 :=
                      M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
                    let* α2 := M.read second_number_str in
                    let* α3 := M.call_closure α1 [ α2 ] in
                    M.call_closure
                      α0
                      [
                        α3;
                        M.closure
                          (fun γ =>
                            match γ with
                            | [ α0 ] =>
                              let* α0 := M.alloc α0 in
                              M.match_operator
                                α0
                                [
                                  fun γ =>
                                    let* second_number := M.copy γ in
                                    let* α0 := M.read first_number in
                                    let* α1 := M.read second_number in
                                    BinOp.Panic.mul α0 α1
                                ]
                            | _ => M.impossible
                            end)
                      ]
                ]
            | _ => M.impossible
            end)
      ]
  | _, _ => M.impossible
  end.

(*
fn print(result: AliasedResult<i32>) {
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
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Ok" 0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
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
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Err" 0 in
            let* e := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
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
    print(multiply("10", "2"));
    print(multiply("t", "2"));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "aliases_for_result::print" [] in
      let* α1 := M.get_function "aliases_for_result::multiply" [] in
      let* α2 := M.read (mk_str "10") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      M.alloc α5 in
    let* _ :=
      let* α0 := M.get_function "aliases_for_result::print" [] in
      let* α1 := M.get_function "aliases_for_result::multiply" [] in
      let* α2 := M.read (mk_str "t") in
      let* α3 := M.read (mk_str "2") in
      let* α4 := M.call_closure α1 [ α2; α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      M.alloc α5 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
