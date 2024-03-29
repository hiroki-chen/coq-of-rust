(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* α0 := M.read a in
    let* α1 := M.read b in
    BinOp.Panic.add α0 α1
  | _, _ => M.impossible
  end.

(*
pub fn div(a: i32, b: i32) -> i32 {
    if b == 0 {
        panic!("Divide-by-zero error");
    }

    a / b
}
*)
Definition div (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ a; b ] =>
    let* a := M.alloc a in
    let* b := M.alloc b in
    let* _ :=
      let* α0 := M.alloc (Value.Tuple []) in
      M.match_operator
        α0
        [
          fun γ =>
            let* γ :=
              let* α0 := M.read b in
              let* α1 :=
                M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.I32 0)) in
              M.pure (M.use α1) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* α0 :=
              M.get_function
                "std::panicking::begin_panic"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α1 := M.read (mk_str "Divide-by-zero error") in
            let* α2 := M.call_closure α0 [ α1 ] in
            let* α3 := M.never_to_any α2 in
            M.alloc α3;
          fun γ => M.alloc (Value.Tuple [])
        ] in
    let* α0 := M.read a in
    let* α1 := M.read b in
    let* α2 := BinOp.Panic.div α0 α1 in
    let* α0 := M.alloc α2 in
    M.read α0
  | _, _ => M.impossible
  end.
