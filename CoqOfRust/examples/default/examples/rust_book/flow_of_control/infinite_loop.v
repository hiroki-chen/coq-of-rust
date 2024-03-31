(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let mut count = 0u32;

    println!("Let's count until infinity!");

    // Infinite loop
    loop {
        count += 1;

        if count == 3 {
            println!("three");

            // Skip the rest of this iteration
            continue;
        }

        println!("{}", count);

        if count == 5 {
            println!("OK, that's enough");

            // Exit this loop
            break;
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* count := M.alloc (Value.Integer Integer.U32 0) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Let's count until infinity!
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      M.loop
        (let* _ :=
          let β := count in
          let* α0 := M.read β in
          let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.U32 1) in M.assign β α1 in
        let* _ :=
          let* α0 := M.alloc (Value.Tuple []) in
          M.match_operator
            α0
            [
              fun γ =>
                let* γ :=
                  let* α0 := M.read count in
                  let* α1 := M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.U32 3)) in
                  M.pure (M.use α1) in
                let* _ :=
                  let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" [] in
                    let* α1 :=
                      M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                    let* α4 :=
                      (* Unsize *)
                        let* α2 := M.read (mk_str "three
") in
                        let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
                    let* α5 := M.call_closure α1 [ α4 ] in
                    let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
                  M.alloc (Value.Tuple []) in
                let* α0 := M.continue in
                let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
              fun γ => M.alloc (Value.Tuple [])
            ] in
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
            let* α5 :=
              (* Unsize *)
                let* α2 := M.read (mk_str "") in
                let* α3 := M.read (mk_str "
") in
                let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
            let* α9 :=
              (* Unsize *)
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display"
                    [ Ty.path "u32" ] in
                let* α7 := M.call_closure α6 [ count ] in
                let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
            let* α10 := M.call_closure α1 [ α5; α9 ] in
            let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
          M.alloc (Value.Tuple []) in
        let* α0 := M.alloc (Value.Tuple []) in
        M.match_operator
          α0
          [
            fun γ =>
              let* γ :=
                let* α0 := M.read count in
                let* α1 := M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.U32 5)) in
                M.pure (M.use α1) in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                  let* α4 :=
                    (* Unsize *)
                      let* α2 := M.read (mk_str "OK, that's enough
") in
                      let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
                  let* α5 := M.call_closure α1 [ α4 ] in
                  let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
                M.alloc (Value.Tuple []) in
              let* α0 := M.break in
              let* α1 := M.read α0 in let* α2 := M.never_to_any α1 in M.alloc α2;
            fun γ => M.alloc (Value.Tuple [])
          ]) in
    M.read α0
  | _, _ => M.impossible
  end.
