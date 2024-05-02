(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply(first_number_str: &str, second_number_str: &str) -> Result<i32, ParseIntError> {
    let first_number = try!(first_number_str.parse::<i32>());
    let second_number = try!(second_number_str.parse::<i32>());

    Ok(first_number * second_number)
}
*)
Definition multiply (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ first_number_str; second_number_str ] =>
    ltac:(M.monadic
      (let first_number_str := M.alloc (| first_number_str |) in
      let second_number_str := M.alloc (| second_number_str |) in
      M.catch_return (|
        ltac:(M.monadic
          (M.read (|
            let first_number :=
              M.copy (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "str", "parse", [ Ty.path "i32" ] |),
                      [ M.read (| first_number_str |) ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                        let val := M.copy (| γ0_0 |) in
                        val));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                        let err := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                Value.StructTuple
                                  "core::result::Result::Err"
                                  [
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::convert::From",
                                        Ty.path "core::num::error::ParseIntError",
                                        [ Ty.path "core::num::error::ParseIntError" ],
                                        "from",
                                        []
                                      |),
                                      [ M.read (| err |) ]
                                    |)
                                  ]
                              |)
                            |)
                          |)
                        |)))
                  ]
                |)
              |) in
            let second_number :=
              M.copy (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "str", "parse", [ Ty.path "i32" ] |),
                      [ M.read (| second_number_str |) ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                        let val := M.copy (| γ0_0 |) in
                        val));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                        let err := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                Value.StructTuple
                                  "core::result::Result::Err"
                                  [
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::convert::From",
                                        Ty.path "core::num::error::ParseIntError",
                                        [ Ty.path "core::num::error::ParseIntError" ],
                                        "from",
                                        []
                                      |),
                                      [ M.read (| err |) ]
                                    |)
                                  ]
                              |)
                            |)
                          |)
                        |)))
                  ]
                |)
              |) in
            M.alloc (|
              Value.StructTuple
                "core::result::Result::Ok"
                [ BinOp.Panic.mul (| M.read (| first_number |), M.read (| second_number |) |) ]
            |)
          |)))
      |)))
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
    ltac:(M.monadic
      (let result := M.alloc (| result |) in
      M.read (|
        M.match_operator (|
          result,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                let n := M.copy (| γ0_0 |) in
                let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_v1",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [ M.read (| Value.String "n is " |); M.read (| Value.String "
" |)
                                  ]
                              |));
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                      [ n ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 := M.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                let e := M.copy (| γ0_0 |) in
                let _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_v1",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (| Value.String "Error: " |);
                                    M.read (| Value.String "
" |)
                                  ]
                              |));
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.call_closure (|
                                      M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "core::num::error::ParseIntError" ]
                                      |),
                                      [ e ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
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
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "introducing_question_mark_is_an_replacement_for_deprecated_try::print",
                []
              |),
              [
                M.call_closure (|
                  M.get_function (|
                    "introducing_question_mark_is_an_replacement_for_deprecated_try::multiply",
                    []
                  |),
                  [ M.read (| Value.String "10" |); M.read (| Value.String "2" |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (|
                "introducing_question_mark_is_an_replacement_for_deprecated_try::print",
                []
              |),
              [
                M.call_closure (|
                  M.get_function (|
                    "introducing_question_mark_is_an_replacement_for_deprecated_try::multiply",
                    []
                  |),
                  [ M.read (| Value.String "t" |); M.read (| Value.String "2" |) ]
                |)
              ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
