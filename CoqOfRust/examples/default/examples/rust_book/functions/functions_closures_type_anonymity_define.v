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
  match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.

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
      ltac:(M.monadic
        (let f := M.alloc (| f |) in
        M.read
          (|
            (let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_trait_method
                        (| "core::ops::function::FnOnce", F, [ Ty.tuple [] ], "call_once", []
                        |)),
                      [ M.read (| f |); Value.Tuple [] ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |))
          |)))
    | _, _ => M.impossible
    end.
End main.
