(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [ "T" ];
    fields := [ ("data", T) ];
  } *)

Module Impl_polymorphic_associated_function_Foo_A.
  Definition Self (A : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "polymorphic_associated_function::Foo") [ A ].
  
  (*
      fn convert<B: From<A>>(self) -> Foo<B> {
          Foo {
              data: self.data.into(),
          }
      }
  *)
  Definition convert (A : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A in
    match τ, α with
    | [ B ], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.get_trait_method "core::convert::Into" A [ B ] "into" [] in
      let* α1 :=
        M.read
          (M.get_struct_record_field
            self
            "polymorphic_associated_function::Foo"
            "data") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.pure
        (Value.StructRecord
          "polymorphic_associated_function::Foo"
          [ ("data", α2) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_convert :
    forall (A : Ty.t),
    M.IsAssociatedFunction (Self A) "convert" (convert A).
End Impl_polymorphic_associated_function_Foo_A.

(*
fn main() {
    let foo = Foo { data: 42 };
    let bar: Foo<f64> = foo.convert();

    assert_eq!(bar.data, 42.0);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* foo :=
      M.alloc
        (Value.StructRecord
          "polymorphic_associated_function::Foo"
          [ ("data", Value.Integer Integer.I32 42) ]) in
    let* bar :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "polymorphic_associated_function::Foo")
            [ Ty.path "i32" ])
          "convert"
          [ Ty.path "f64" ] in
      let* α1 := M.read foo in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 :=
        M.alloc
          (Value.Tuple
            [
              M.get_struct_record_field
                bar
                "polymorphic_associated_function::Foo"
                "data";
              UnsupportedLiteral
            ]) in
      M.match_operator
        α0
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.alloc (Value.Tuple []) in
            M.match_operator
              α0
              [
                fun γ =>
                  let* γ :=
                    let* α0 := M.read left_val in
                    let* α1 := M.read α0 in
                    let* α2 := M.read right_val in
                    let* α3 := M.read α2 in
                    let* α4 := M.alloc (UnOp.Pure.not (BinOp.Pure.eq α1 α3)) in
                    M.pure (M.use α4) in
                  let* _ :=
                    let* α0 := M.read γ in
                    M.is_constant_or_break_match α0 (Value.Bool true) in
                  let* kind :=
                    M.alloc
                      (Value.StructTuple
                        "core::panicking::AssertKind::Eq"
                        []) in
                  let* α0 :=
                    M.get_function
                      "core::panicking::assert_failed"
                      [ Ty.path "f64"; Ty.path "f64" ] in
                  let* α1 := M.read kind in
                  let* α2 := M.read left_val in
                  let* α3 := M.read right_val in
                  let* α4 :=
                    M.call_closure
                      α0
                      [
                        α1;
                        α2;
                        α3;
                        Value.StructTuple "core::option::Option::None" []
                      ] in
                  let* α0 := M.alloc α4 in
                  let* α1 := M.read α0 in
                  let* α2 := M.never_to_any α1 in
                  M.alloc α2;
                fun γ => M.alloc (Value.Tuple [])
              ]
        ] in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
