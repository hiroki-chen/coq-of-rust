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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* optional :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.Integer Integer.I32 0 ]) in
    let* α0 :=
      M.loop
        (match_operator
          optional
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::option::Option::Some"
                  0 in
              let* i := M.copy γ0_0 in
              let* α0 := M.read i in
              let* α1 :=
                M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.I32 9)) in
              let* α2 := M.read (M.use α1) in
              if Value.is_true α2 then
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_const" in
                    let* α2 := M.read (mk_str "Greater than 9, quit!
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    let* α4 :=
                      M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                    let* α5 := M.call α0 [ α4 ] in
                    M.alloc α5 in
                  M.alloc (Value.Tuple []) in
                let* _ :=
                  M.assign
                    optional
                    (Value.StructTuple "core::option::Option::None" []) in
                M.alloc (Value.Tuple [])
              else
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "`i` is `") in
                    let* α3 := M.read (mk_str "`. Try again.
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug" in
                    let* α6 := M.call α5 [ i ] in
                    let* α7 := M.alloc (Value.Array [ α6 ]) in
                    let* α8 :=
                      M.call
                        α1
                        [
                          M.pointer_coercion (* Unsize *) α4;
                          M.pointer_coercion (* Unsize *) α7
                        ] in
                    let* α9 := M.call α0 [ α8 ] in
                    M.alloc α9 in
                  M.alloc (Value.Tuple []) in
                let* _ :=
                  let* α0 := M.read i in
                  let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 1) in
                  M.assign
                    optional
                    (Value.StructTuple "core::option::Option::Some" [ α1 ]) in
                M.alloc (Value.Tuple []);
            fun γ =>
              let* α0 := M.break in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
