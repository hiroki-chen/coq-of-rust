(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // `F` must be generic.
    fn apply<F>(f: F)
    where
        F: FnOnce(),
    {
        f();
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] => M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

Module main.
  (*
      fn apply<F>(f: F)
      where
          F: FnOnce(),
      {
          f();
      }
  *)
  Definition apply (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ F ], [ f ] =>
      let* f := M.alloc f in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::ops::function::FnOnce"
            F
            [ Ty.tuple [] ]
            "call_once"
            [] in
        let* α1 := M.read f in
        let* α2 := M.call_closure α0 [ α1; Value.Tuple [] ] in
        M.alloc α2 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
End main.
