(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum VeryVerboseEnumOfThingsToDoWithNumbers *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Add";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Subtract";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Axiom Operations :
  (Ty.path "enums_type_aliases_v1::Operations") =
    (Ty.path "enums_type_aliases_v1::VeryVerboseEnumOfThingsToDoWithNumbers").

(*
fn main() {
    // We can refer to each variant via its alias, not its long and inconvenient
    // name.
    let x = Operations::Add;
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let x :=
          M.alloc (|
            Value.StructTuple
              "enums_type_aliases_v1::VeryVerboseEnumOfThingsToDoWithNumbers::Add"
              []
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
