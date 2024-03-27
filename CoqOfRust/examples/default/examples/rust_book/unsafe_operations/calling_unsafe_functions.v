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
    let* some_vector :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "u32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "u32" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 :=
        M.alloc
          (Value.Array
            [
              Value.Integer Integer.U32 1;
              Value.Integer Integer.U32 2;
              Value.Integer Integer.U32 3;
              Value.Integer Integer.U32 4
            ]) in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.read α3 in
      let* α5 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.alloc α5 in
    let* pointer :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ])
          "as_ptr"
          [] in
      let* α1 := M.call_closure α0 [ some_vector ] in
      M.alloc α1 in
    let* length :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ])
          "len"
          [] in
      let* α1 := M.call_closure α0 [ some_vector ] in
      M.alloc α1 in
    let* my_slice :=
      let* α0 :=
        M.get_function "core::slice::raw::from_raw_parts" [ Ty.path "u32" ] in
      let* α1 := M.read pointer in
      let* α2 := M.read length in
      let* α3 := M.call_closure α0 [ α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u32"; Ty.path "alloc::alloc::Global" ])
          "as_slice"
          [] in
      let* α1 := M.call_closure α0 [ some_vector ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc (Value.Tuple [ α2; my_slice ]) in
      match_operator
        α3
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 :=
              M.get_trait_method
                "core::cmp::PartialEq"
                (Ty.apply
                  (Ty.path "&")
                  [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ])
                [
                  Ty.apply
                    (Ty.path "&")
                    [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                ]
                "eq"
                [] in
            let* α1 := M.read left_val in
            let* α2 := M.read right_val in
            let* α3 := M.call_closure α0 [ α1; α2 ] in
            let* α4 := M.alloc (UnOp.Pure.not α3) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [
                    Ty.apply
                      (Ty.path "&")
                      [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ];
                    Ty.apply
                      (Ty.path "&")
                      [ Ty.apply (Ty.path "slice") [ Ty.path "u32" ] ]
                  ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call_closure
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
