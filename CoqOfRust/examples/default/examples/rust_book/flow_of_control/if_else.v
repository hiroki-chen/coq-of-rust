(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let n = 5;

    if n < 0 {
        print!("{} is negative", n);
    } else if n > 0 {
        print!("{} is positive", n);
    } else {
        print!("{} is zero", n);
    }

    let big_n = if n < 10 && n > -10 {
        println!(", and is a small number, increase ten-fold");

        // This expression returns an `i32`.
        10 * n
    } else {
        println!(", and is a big number, halve the number");

        // This expression must return an `i32` as well.
        n / 2
        // TODO ^ Try suppressing this expression with a semicolon.
    };
    //   ^ Don't forget to put a semicolon here! All `let` bindings need it.

    println!("{} -> {}", n, big_n);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* n := M.alloc (Value.Integer Integer.I32 5) in
    let* _ :=
      let* α0 := M.alloc (Value.Tuple []) in
      M.match_operator
        α0
        [
          fun γ =>
            let* γ :=
              let* α0 := M.read n in
              let* α1 := M.alloc (BinOp.Pure.lt α0 (Value.Integer Integer.I32 0)) in
              M.pure (M.use α1) in
            let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "") in
                    let* α3 := M.read (mk_str " is negative") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
                let* α9 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display"
                        [ Ty.path "i32" ] in
                    let* α7 := M.call_closure α6 [ n ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
                let* α10 := M.call_closure α1 [ α5; α9 ] in
                let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 := M.read n in
                    let* α1 := M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.I32 0)) in
                    M.pure (M.use α1) in
                  let* _ :=
                    let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "") in
                          let* α3 := M.read (mk_str " is positive") in
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
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple []);
                fun γ =>
                  let* _ :=
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "") in
                          let* α3 := M.read (mk_str " is zero") in
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
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    M.alloc (Value.Tuple []) in
                  M.alloc (Value.Tuple [])
              ]
        ] in
    let* big_n :=
      let* α0 := M.alloc (Value.Tuple []) in
      let* α1 :=
        M.match_operator
          α0
          [
            fun γ =>
              let* γ :=
                let* α0 := M.read n in
                let* α1 :=
                  LogicalOp.and
                    (BinOp.Pure.lt α0 (Value.Integer Integer.I32 10))
                    (let* α0 := M.read n in
                    M.pure (BinOp.Pure.gt α0 (Value.Integer Integer.I32 (-10)))) in
                let* α2 := M.alloc α1 in M.pure (M.use α2) in
              let* _ := let* α0 := M.read γ in M.is_constant_or_break_match α0 (Value.Bool true) in
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                  let* α4 :=
                    (* Unsize *)
                      let* α2 := M.read (mk_str ", and is a small number, increase ten-fold
") in
                      let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
                  let* α5 := M.call_closure α1 [ α4 ] in
                  let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
                M.alloc (Value.Tuple []) in
              let* α0 := M.read n in
              let* α1 := BinOp.Panic.mul (Value.Integer Integer.I32 10) α0 in M.alloc α1;
            fun γ =>
              let* _ :=
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" [] in
                  let* α1 :=
                    M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                  let* α4 :=
                    (* Unsize *)
                      let* α2 := M.read (mk_str ", and is a big number, halve the number
") in
                      let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
                  let* α5 := M.call_closure α1 [ α4 ] in
                  let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
                M.alloc (Value.Tuple []) in
              let* α0 := M.read n in
              let* α1 := BinOp.Panic.div α0 (Value.Integer Integer.I32 2) in M.alloc α1
          ] in
      M.copy α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α6 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str " -> ") in
            let* α4 := M.read (mk_str "
") in
            let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in M.pure (M.pointer_coercion α5) in
        let* α12 :=
          (* Unsize *)
            let* α7 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α8 := M.call_closure α7 [ n ] in
            let* α9 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α10 := M.call_closure α9 [ big_n ] in
            let* α11 := M.alloc (Value.Array [ α8; α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α6; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
