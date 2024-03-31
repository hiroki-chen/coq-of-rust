(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // Repeatedly try this test.
    loop {
        match optional {
            // If `optional` destructures, evaluate the block.
            Some(i) => {
                if i > 9 {
                    println!("Greater than 9, quit!");
                    optional = None;
                } else {
                    println!("`i` is `{:?}`. Try again.", i);
                    optional = Some(i + 1);
                }
                // ^ Requires 3 indentations!
            }
            // Quit the loop when the destructure fails:
            _ => {
                break;
            } // ^ Why should this be required? There must be a better way!
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* optional :=
      M.alloc (Value.StructTuple "core::option::Option::Some" [ Value.Integer Integer.I32 0 ]) in
    let* α0 :=
      M.loop
        (M.match_operator
          optional
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
              let* i := M.copy γ0_0 in
              let* α0 := M.alloc (Value.Tuple []) in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* γ :=
                      let* α0 := M.read i in
                      let* α1 := M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.I32 9)) in
                      M.pure (M.use α1) in
                    let* _ :=
                      let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function
                            (Ty.path "core::fmt::Arguments")
                            "new_const"
                            [] in
                        let* α4 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "Greater than 9, quit!
") in
                            let* α3 := M.alloc (Value.Array [ α2 ]) in
                            M.pure (M.pointer_coercion α3) in
                        let* α5 := M.call_closure α1 [ α4 ] in
                        let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      M.assign optional (Value.StructTuple "core::option::Option::None" []) in
                    M.alloc (Value.Tuple []);
                  fun γ =>
                    let* _ :=
                      let* _ :=
                        let* α0 := M.get_function "std::io::stdio::_print" [] in
                        let* α1 :=
                          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                        let* α5 :=
                          (* Unsize *)
                            let* α2 := M.read (mk_str "`i` is `") in
                            let* α3 := M.read (mk_str "`. Try again.
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            M.pure (M.pointer_coercion α4) in
                        let* α9 :=
                          (* Unsize *)
                            let* α6 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_debug"
                                [ Ty.path "i32" ] in
                            let* α7 := M.call_closure α6 [ i ] in
                            let* α8 := M.alloc (Value.Array [ α7 ]) in
                            M.pure (M.pointer_coercion α8) in
                        let* α10 := M.call_closure α1 [ α5; α9 ] in
                        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                      M.alloc (Value.Tuple []) in
                    let* _ :=
                      let* α0 := M.read i in
                      let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 1) in
                      M.assign optional (Value.StructTuple "core::option::Option::Some" [ α1 ]) in
                    M.alloc (Value.Tuple [])
                ];
            fun γ =>
              let* α0 := M.break in
              let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
