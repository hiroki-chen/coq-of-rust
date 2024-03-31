(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    F: Fn(),
{
    f();
}
*)
Definition apply (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ F ], [ f ] =>
    let* f := M.alloc f in
    let* _ :=
      let* α0 := M.get_trait_method "core::ops::function::Fn" F [ Ty.tuple [] ] "call" [] in
      let* α1 := M.call_closure α0 [ f; Value.Tuple [] ] in M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;

    // Capture `x` into an anonymous type and implement
    // `Fn` for it. Store it in `print`.
    let print = || println!("{}", x);

    apply(print);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 7) in
    let* print :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              M.match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                      let* α5 :=
                        (* Unsize *)
                          let* α2 := M.read (mk_str "") in
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
                          let* α7 := M.call_closure α6 [ x ] in
                          let* α8 := M.alloc (Value.Array [ α7 ]) in
                          M.pure (M.pointer_coercion α8) in
                      let* α10 := M.call_closure α1 [ α5; α9 ] in
                      let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
                    let* α0 := M.alloc (Value.Tuple []) in M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_function
          "functions_closures_type_anonymity_define_and_use::apply"
          [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ] in
      let* α1 := M.read print in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
