(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Number";
    ty_params := [];
    fields := [ ("value", Ty.path "i32") ];
  } *)

Module Impl_core_convert_From_i32_for_into_Number.
  Definition Self : Ty.t := Ty.path "into::Number".
  
  (*
      fn from(item: i32) -> Self {
          Number { value: item }
      }
  *)
  Definition from (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ item ] =>
      ltac:(M.monadic
        (let item := M.alloc (| item |) in
        Value.StructRecord "into::Number" [ ("value", M.read (| item |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "i32" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_i32_for_into_Number.

(*
fn main() {
    <i32 as std::convert::Into<Number>>::into(5);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::convert::Into",
                Ty.path "i32",
                [ Ty.path "into::Number" ],
                "into",
                []
              |),
              [ Value.Integer Integer.I32 5 ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
