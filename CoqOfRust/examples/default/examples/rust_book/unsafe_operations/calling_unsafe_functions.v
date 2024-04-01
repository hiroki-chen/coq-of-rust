(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let some_vector = vec![1, 2, 3, 4];

    let pointer = some_vector.as_ptr();
    let length = some_vector.len();

    unsafe {
        let my_slice: &[u32] = slice::from_raw_parts(pointer, length);

        assert_eq!(some_vector.as_slice(), my_slice);
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let some_vector :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.path "u32" ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.path "u32" ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              Value.Integer Integer.U32 1;
                              Value.Integer Integer.U32 2;
                              Value.Integer Integer.U32 3;
                              Value.Integer Integer.U32 4
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let pointer :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ],
                "as_ptr",
                []
              |),
              [ some_vector ]
            |)
          |) in
        let length :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ],
                "len",
                []
              |),
              [ some_vector ]
            |)
          |) in
        let my_slice :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "core::slice::raw::from_raw_parts", [ Ty.path "u32" ] |),
              [ M.read (| pointer |); M.read (| length |) ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::vec::Vec")
                          [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ],
                        "as_slice",
                        []
                      |),
                      [ some_vector ]
                    |)
                  |);
                  my_slice
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.get_tuple_field γ 0 in
                  let γ0_1 := M.get_tuple_field γ 1 in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.apply
                                        (Ty.path "&")
                                        [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ],
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                                      ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ];
                                        Ty.apply
                                          (Ty.path "&")
                                          [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
