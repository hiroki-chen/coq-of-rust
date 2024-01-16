(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Number.
Section Number.
  Record t : Set := {
    value : i32.t;
  }.
  
  Definition Get_value :=
    Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>)).
End Number.
End Number.

Module  Impl_core_convert_From_i32_t_for_into_Number_t.
Section Impl_core_convert_From_i32_t_for_into_Number_t.
  Definition Self : Set := into.Number.t.
  
  (*
      fn from(item: i32) -> Self {
          Number { value: item }
      }
  *)
  Definition from (item : i32.t) : M Self :=
    let* item := M.alloc item in
    let* α0 : i32.t := M.read item in
    M.pure {| into.Number.value := α0; |}.
  
  Global Instance AssociatedFunction_from :
    Notations.DoubleColon Self "from" := {
    Notations.double_colon := from;
  }.
  
  Global Instance ℐ : core.convert.From.Trait Self (T := i32.t) := {
    core.convert.From.from := from;
  }.
End Impl_core_convert_From_i32_t_for_into_Number_t.
End Impl_core_convert_From_i32_t_for_into_Number_t.

(*
fn main() {
    <i32 as std::convert::Into<Number>>::into(5);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* _ : M.Val into.Number.t :=
    let* α0 : i32.t -> M into.Number.t :=
      ltac:(M.get_method (fun ℐ =>
        core.convert.Into.into
          (Self := i32.t)
          (T := into.Number.t)
          (Trait := ℐ))) in
    let* α1 : into.Number.t := M.call (α0 ((Integer.of_Z 5) : i32.t)) in
    M.alloc α1 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
