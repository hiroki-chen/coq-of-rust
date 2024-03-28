(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
(* Empty module 'UsernameWidget' *)

(* Trait *)
(* Empty module 'AgeWidget' *)

(* StructRecord
  {
    name := "Form";
    ty_params := [];
    fields :=
      [ ("username", Ty.path "alloc::string::String"); ("age", Ty.path "u8") ];
  } *)

Module Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self : Ty.t := Ty.path "disambiguating_overlapping_traits::Form".
  
  (*
      fn get(&self) -> String {
          self.username.clone()
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "core::clone::Clone"
          (Ty.path "alloc::string::String")
          []
          "clone"
          [] in
      let* α1 := M.read self in
      M.call_closure
        α0
        [
          M.get_struct_record_field
            α1
            "disambiguating_overlapping_traits::Form"
            "username"
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "disambiguating_overlapping_traits::UsernameWidget"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("get", InstanceField.Method get) ].
End Impl_disambiguating_overlapping_traits_UsernameWidget_for_disambiguating_overlapping_traits_Form.

Module Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.
  Definition Self : Ty.t := Ty.path "disambiguating_overlapping_traits::Form".
  
  (*
      fn get(&self) -> u8 {
          self.age
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read
        (M.get_struct_record_field
          α0
          "disambiguating_overlapping_traits::Form"
          "age")
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "disambiguating_overlapping_traits::AgeWidget"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("get", InstanceField.Method get) ].
End Impl_disambiguating_overlapping_traits_AgeWidget_for_disambiguating_overlapping_traits_Form.

(*
fn main() {
    let form = Form {
        username: "rustacean".to_owned(),
        age: 28,
    };

    // If you uncomment this line, you'll get an error saying
    // "multiple `get` found". Because, after all, there are multiple methods
    // named `get`.
    // println!("{}", form.get());

    let username = <Form as UsernameWidget>::get(&form);
    assert_eq!(("rustacean".to_string()), username);
    let age = <Form as AgeWidget>::get(&form);
    assert_eq!(28, age);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* form :=
      let* α0 :=
        M.get_trait_method
          "alloc::borrow::ToOwned"
          (Ty.path "str")
          []
          "to_owned"
          [] in
      let* α1 := M.read (mk_str "rustacean") in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc
        (Value.StructRecord
          "disambiguating_overlapping_traits::Form"
          [ ("username", α2); ("age", Value.Integer Integer.U8 28) ]) in
    let* username :=
      let* α0 :=
        M.get_trait_method
          "disambiguating_overlapping_traits::UsernameWidget"
          (Ty.path "disambiguating_overlapping_traits::Form")
          []
          "get"
          [] in
      let* α1 := M.call_closure α0 [ form ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "alloc::string::ToString"
          (Ty.path "str")
          []
          "to_string"
          [] in
      let* α1 := M.read (mk_str "rustacean") in
      let* α2 := M.call_closure α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 := M.alloc (Value.Tuple [ α3; username ]) in
      M.match_operator
        α4
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
                    let* α0 :=
                      M.get_trait_method
                        "core::cmp::PartialEq"
                        (Ty.path "alloc::string::String")
                        [ Ty.path "alloc::string::String" ]
                        "eq"
                        [] in
                    let* α1 := M.read left_val in
                    let* α2 := M.read right_val in
                    let* α3 := M.call_closure α0 [ α1; α2 ] in
                    let* α4 := M.alloc (UnOp.Pure.not α3) in
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
                      [
                        Ty.path "alloc::string::String";
                        Ty.path "alloc::string::String"
                      ] in
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
    let* age :=
      let* α0 :=
        M.get_trait_method
          "disambiguating_overlapping_traits::AgeWidget"
          (Ty.path "disambiguating_overlapping_traits::Form")
          []
          "get"
          [] in
      let* α1 := M.call_closure α0 [ form ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.alloc (Value.Integer Integer.U8 28) in
      let* α1 := M.alloc (Value.Tuple [ α0; age ]) in
      M.match_operator
        α1
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
                      [ Ty.path "u8"; Ty.path "u8" ] in
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
