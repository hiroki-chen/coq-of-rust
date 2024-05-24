(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Years";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

(*
fn main() {
    let years = Years(42);
    let years_as_primitive_1: i64 = years.0; // Tuple
    let Years(years_as_primitive_2) = years; // Destructuring
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let years :=
          M.alloc (|
            Value.StructTuple "generics_new_type_idiom_as_base_type::Years" [ Value.Integer 42 ]
          |) in
        let years_as_primitive_1 :=
          M.copy (|
            M.SubPointer.get_struct_tuple_field (|
              years,
              "generics_new_type_idiom_as_base_type::Years",
              0
            |)
          |) in
        M.match_operator (|
          years,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (|
                    γ,
                    "generics_new_type_idiom_as_base_type::Years",
                    0
                  |) in
                let years_as_primitive_2 := M.copy (| γ0_0 |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "generics_new_type_idiom_as_base_type::main" main.
