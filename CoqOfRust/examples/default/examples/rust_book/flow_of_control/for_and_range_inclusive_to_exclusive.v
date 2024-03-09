(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `n` will take the values: 1, 2, ..., 100 in each iteration
    for n in 1..101 {
        if n % 15 == 0 {
            println!("fizzbuzz");
        } else if n % 3 == 0 {
            println!("fizz");
        } else if n % 5 == 0 {
            println!("buzz");
        } else {
            println!("{}", n);
        }
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ]
        ] in
    let* α1 :=
      M.call
        α0
        [
          Value.StructRecord
            "core::ops::range::Range"
            [
              ("start", Value.Integer Integer.I32 1);
              ("end_", Value.Integer Integer.I32 101)
            ]
        ] in
    let* α2 := M.alloc α1 in
    let* α3 :=
      match_operator
        α2
        (Value.Array
          [
            fun γ =>
              (let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      "next"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::ops::range::Range")
                            [ Ty.path "i32" ]
                      ] in
                  let* α1 := M.call α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    (Value.Array
                      [
                        fun γ =>
                          (let* α0 := M.read γ in
                          match α0 with
                          | core.option.Option.None =>
                            let* α0 := M.break in
                            let* α1 := M.read α0 in
                            let* α2 := M.never_to_any α1 in
                            M.alloc α2
                          | _ => M.break_match 
                          end);
                        fun γ =>
                          (let* α0 := M.read γ in
                          match α0 with
                          | core.option.Option.Some _ =>
                            let* γ0_0 :=
                              let* α0 :=
                                M.var "core::option::Option::Get_Some_0" in
                              M.pure (α0 γ) in
                            let* n := M.copy γ0_0 in
                            let* α0 := M.read n in
                            let* α1 :=
                              BinOp.Panic.rem
                                α0
                                (Value.Integer Integer.I32 15) in
                            let* α2 :=
                              M.alloc
                                (BinOp.Pure.eq
                                  α1
                                  (Value.Integer Integer.I32 0)) in
                            let* α3 := M.read (M.use α2) in
                            if Value.is_true α3 then
                              let* _ :=
                                let* _ :=
                                  let* α0 :=
                                    M.get_function "std::io::stdio::_print" in
                                  let* α1 :=
                                    M.get_associated_function
                                      (Ty.path "core::fmt::Arguments")
                                      "new_const" in
                                  let* α2 := M.read (mk_str "fizzbuzz
") in
                                  let* α3 := M.alloc (Value.Array [ α2 ]) in
                                  let* α4 :=
                                    M.call
                                      α1
                                      [ M.pointer_coercion (* Unsize *) α3 ] in
                                  let* α5 := M.call α0 [ α4 ] in
                                  M.alloc α5 in
                                M.alloc (Value.Tuple []) in
                              M.alloc (Value.Tuple [])
                            else
                              let* α0 := M.read n in
                              let* α1 :=
                                BinOp.Panic.rem
                                  α0
                                  (Value.Integer Integer.I32 3) in
                              let* α2 :=
                                M.alloc
                                  (BinOp.Pure.eq
                                    α1
                                    (Value.Integer Integer.I32 0)) in
                              let* α3 := M.read (M.use α2) in
                              if Value.is_true α3 then
                                let* _ :=
                                  let* _ :=
                                    let* α0 :=
                                      M.get_function "std::io::stdio::_print" in
                                    let* α1 :=
                                      M.get_associated_function
                                        (Ty.path "core::fmt::Arguments")
                                        "new_const" in
                                    let* α2 := M.read (mk_str "fizz
") in
                                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                                    let* α4 :=
                                      M.call
                                        α1
                                        [ M.pointer_coercion (* Unsize *) α3
                                        ] in
                                    let* α5 := M.call α0 [ α4 ] in
                                    M.alloc α5 in
                                  M.alloc (Value.Tuple []) in
                                M.alloc (Value.Tuple [])
                              else
                                let* α0 := M.read n in
                                let* α1 :=
                                  BinOp.Panic.rem
                                    α0
                                    (Value.Integer Integer.I32 5) in
                                let* α2 :=
                                  M.alloc
                                    (BinOp.Pure.eq
                                      α1
                                      (Value.Integer Integer.I32 0)) in
                                let* α3 := M.read (M.use α2) in
                                if Value.is_true α3 then
                                  let* _ :=
                                    let* _ :=
                                      let* α0 :=
                                        M.get_function
                                          "std::io::stdio::_print" in
                                      let* α1 :=
                                        M.get_associated_function
                                          (Ty.path "core::fmt::Arguments")
                                          "new_const" in
                                      let* α2 := M.read (mk_str "buzz
") in
                                      let* α3 := M.alloc (Value.Array [ α2 ]) in
                                      let* α4 :=
                                        M.call
                                          α1
                                          [ M.pointer_coercion (* Unsize *) α3
                                          ] in
                                      let* α5 := M.call α0 [ α4 ] in
                                      M.alloc α5 in
                                    M.alloc (Value.Tuple []) in
                                  M.alloc (Value.Tuple [])
                                else
                                  let* _ :=
                                    let* _ :=
                                      let* α0 :=
                                        M.get_function
                                          "std::io::stdio::_print" in
                                      let* α1 :=
                                        M.get_associated_function
                                          (Ty.path "core::fmt::Arguments")
                                          "new_v1" in
                                      let* α2 := M.read (mk_str "") in
                                      let* α3 := M.read (mk_str "
") in
                                      let* α4 :=
                                        M.alloc (Value.Array [ α2; α3 ]) in
                                      let* α5 :=
                                        M.get_associated_function
                                          (Ty.path "core::fmt::rt::Argument")
                                          "new_display" in
                                      let* α6 := M.call α5 [ n ] in
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
                                  M.alloc (Value.Tuple [])
                          | _ => M.break_match 
                          end)
                      ]) in
                M.alloc (Value.Tuple [])))
          ]) in
    M.read (M.use α3)
  | _, _ => M.impossible
  end.
