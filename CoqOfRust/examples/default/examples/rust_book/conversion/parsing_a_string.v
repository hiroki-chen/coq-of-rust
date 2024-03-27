(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    "12".parse::<i32>();
    "true".parse::<bool>();
    "unparsable".parse::<u32>();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
      let* α1 := M.read (mk_str "12") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "bool" ] in
      let* α1 := M.read (mk_str "true") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "u32" ] in
      let* α1 := M.read (mk_str "unparsable") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
