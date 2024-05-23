Require Import CoqOfRust.CoqOfRust.
Require Import proofs.M.
Require Import simulations.M.

Require core.intrinsics.

Import Run.

Definition sub_with_overflow_kind (kind : Integer.t) (x y : Z) : Z * bool :=
  let z := Integer.normalize_wrap kind (x - y) in
  let has_overflow := orb (z <? Integer.min kind) (Integer.max kind <? z) in
  (z, has_overflow).

(* TODO: add the other integer cases *)
Axiom sub_with_overflow_u64_eq :
  core.intrinsics.intrinsics.sub_with_overflow [Ty.path "u64"] =
  fun α =>
    match α with
    | [ Value.Integer x; Value.Integer y ] => M.pure (φ (sub_with_overflow_kind Integer.U64 x y))
    | _ => M.impossible
    end.

Definition run_sub_with_overflow_u64_u64 (self rhs : Z) :
  Run.pure (core.intrinsics.intrinsics.sub_with_overflow [Ty.path "u64"] [φ self; φ rhs])
    (fun (v : (Z * bool)) => inl (φ v)).
Proof.
  unfold Run.pure; intros.
  rewrite sub_with_overflow_u64_eq.
  with_strategy opaque [sub_with_overflow_kind] run_symbolic.
Defined.
