(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() -> Result<(), ParseIntError> {
    let number_str = "10";
    let number = match number_str.parse::<i32>() {
        Ok(number) => number,
        Err(e) => return Err(e),
    };
    println!("{}", number);
    Ok(())
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let number_str := M.copy (| (mk_str "10") |) in
          let number :=
            M.copy
              (|
                (M.match_operator
                  (|
                    (M.alloc
                      (|
                        (M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "str"), "parse", [ Ty.path "i32" ]
                              |)),
                            [ M.read (| number_str |) ]
                          |))
                      |)),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.get_struct_tuple_field_or_break_match
                              (| γ, "core::result::Result::Ok", 0
                              |) in
                          let number := M.copy (| γ0_0 |) in
                          number));
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 :=
                            M.get_struct_tuple_field_or_break_match
                              (| γ, "core::result::Result::Err", 0
                              |) in
                          let e := M.copy (| γ0_0 |) in
                          M.alloc
                            (|
                              (M.never_to_any
                                (|
                                  (M.read
                                    (|
                                      (M.return_
                                        (|
                                          (Value.StructTuple
                                            "core::result::Result::Err"
                                            [ M.read (| e |) ])
                                        |))
                                    |))
                                |))
                            |)))
                    ]
                  |))
              |) in
          let _ :=
            let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "std::io::stdio::_print", [] |)),
                      [
                        M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                              |)),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [ M.read (| (mk_str "") |); M.read (| (mk_str "
") |) ])
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_display",
                                                  [ Ty.path "i32" ]
                                                |)),
                                              [ number ]
                                            |)
                                        ])
                                    |))
                            ]
                          |)
                      ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |) in
          M.alloc (| (Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ]) |))
        |)))
  | _, _ => M.impossible
  end.
