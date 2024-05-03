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
    fields := [ ("username", Ty.path "alloc::string::String"); ("age", Ty.path "u8") ];
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.call_closure (|
          M.get_trait_method (|
            "core::clone::Clone",
            Ty.path "alloc::string::String",
            [],
            "clone",
            []
          |),
          [
            M.SubPointer.get_struct_record_field (|
              M.read (| self |),
              "disambiguating_overlapping_traits::Form",
              "username"
            |)
          ]
        |)))
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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.SubPointer.get_struct_record_field (|
            M.read (| self |),
            "disambiguating_overlapping_traits::Form",
            "age"
          |)
        |)))
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
    ltac:(M.monadic
      (M.read (|
        let form :=
          M.alloc (|
            Value.StructRecord
              "disambiguating_overlapping_traits::Form"
              [
                ("username",
                  M.call_closure (|
                    M.get_trait_method (|
                      "alloc::borrow::ToOwned",
                      Ty.path "str",
                      [],
                      "to_owned",
                      []
                    |),
                    [ M.read (| Value.String "rustacean" |) ]
                  |));
                ("age", Value.Integer Integer.U8 28)
              ]
          |) in
        let username :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "disambiguating_overlapping_traits::UsernameWidget",
                Ty.path "disambiguating_overlapping_traits::Form",
                [],
                "get",
                []
              |),
              [ form ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (|
              Value.Tuple
                [
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "alloc::string::ToString",
                        Ty.path "str",
                        [],
                        "to_string",
                        []
                      |),
                      [ M.read (| Value.String "rustacean" |) ]
                    |)
                  |);
                  username
                ]
            |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (M.call_closure (|
                                    M.get_trait_method (|
                                      "core::cmp::PartialEq",
                                      Ty.path "alloc::string::String",
                                      [ Ty.path "alloc::string::String" ],
                                      "eq",
                                      []
                                    |),
                                    [ M.read (| left_val |); M.read (| right_val |) ]
                                  |))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [
                                        Ty.path "alloc::string::String";
                                        Ty.path "alloc::string::String"
                                      ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        let age :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "disambiguating_overlapping_traits::AgeWidget",
                Ty.path "disambiguating_overlapping_traits::Form",
                [],
                "get",
                []
              |),
              [ form ]
            |)
          |) in
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [ M.alloc (| Value.Integer Integer.U8 28 |); age ] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 := M.SubPointer.get_tuple_field (| γ, 0 |) in
                  let γ0_1 := M.SubPointer.get_tuple_field (| γ, 1 |) in
                  let left_val := M.copy (| γ0_0 |) in
                  let right_val := M.copy (| γ0_1 |) in
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.use
                              (M.alloc (|
                                UnOp.Pure.not
                                  (BinOp.Pure.eq
                                    (M.read (| M.read (| left_val |) |))
                                    (M.read (| M.read (| right_val |) |)))
                              |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                let kind :=
                                  M.alloc (|
                                    Value.StructTuple "core::panicking::AssertKind::Eq" []
                                  |) in
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_function (|
                                      "core::panicking::assert_failed",
                                      [ Ty.path "u8"; Ty.path "u8" ]
                                    |),
                                    [
                                      M.read (| kind |);
                                      M.read (| left_val |);
                                      M.read (| right_val |);
                                      Value.StructTuple "core::option::Option::None" []
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |)))
            ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
