(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    fn foo() -> ! {
        panic!("This call never returns.");
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.

Module main.
  (*
      fn foo() -> ! {
          panic!("This call never returns.");
      }
  *)
  Definition foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.call_closure (|
          M.get_function (|
            "std::panicking::begin_panic",
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
          |),
          [ M.read (| mk_str "This call never returns." |) ]
        |)))
    | _, _ => M.impossible
    end.
End main.
