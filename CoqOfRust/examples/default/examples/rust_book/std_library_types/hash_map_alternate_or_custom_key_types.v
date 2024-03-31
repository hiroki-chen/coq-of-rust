(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Account";
    ty_params := [];
    fields :=
      [
        ("username", Ty.apply (Ty.path "&") [ Ty.path "str" ]);
        ("password", Ty.apply (Ty.path "&") [ Ty.path "str" ])
      ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t := Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t := Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  (*
  PartialEq
  *)
  Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          (Ty.apply (Ty.path "&") [ Ty.path "str" ])
          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
          "eq"
          [] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      let* α3 :=
        M.call_closure
          α0
          [
            M.get_struct_record_field
              α1
              "hash_map_alternate_or_custom_key_types::Account"
              "username";
            M.get_struct_record_field
              α2
              "hash_map_alternate_or_custom_key_types::Account"
              "username"
          ] in
      LogicalOp.and
        α3
        (let* α0 :=
          M.get_trait_method
            "core::cmp::PartialEq"
            (Ty.apply (Ty.path "&") [ Ty.path "str" ])
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            "eq"
            [] in
        let* α1 := M.read self in
        let* α2 := M.read other in
        M.call_closure
          α0
          [
            M.get_struct_record_field
              α1
              "hash_map_alternate_or_custom_key_types::Account"
              "password";
            M.get_struct_record_field
              α2
              "hash_map_alternate_or_custom_key_types::Account"
              "password"
          ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t := Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t := Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.match_operator
          Value.DeclaredButUndefined
          [
            fun γ =>
              M.match_operator Value.DeclaredButUndefined [ fun γ => M.alloc (Value.Tuple []) ]
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  Definition Self : Ty.t := Ty.path "hash_map_alternate_or_custom_key_types::Account".
  
  (*
  Hash
  *)
  Definition hash (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ __H ], [ self; state ] =>
      let* self := M.alloc self in
      let* state := M.alloc state in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::hash::Hash"
            (Ty.apply (Ty.path "&") [ Ty.path "str" ])
            []
            "hash"
            [ __H ] in
        let* α1 := M.read self in
        let* α2 := M.read state in
        let* α3 :=
          M.call_closure
            α0
            [
              M.get_struct_record_field
                α1
                "hash_map_alternate_or_custom_key_types::Account"
                "username";
              α2
            ] in
        M.alloc α3 in
      let* α0 :=
        M.get_trait_method
          "core::hash::Hash"
          (Ty.apply (Ty.path "&") [ Ty.path "str" ])
          []
          "hash"
          [ __H ] in
      let* α1 := M.read self in
      let* α2 := M.read state in
      let* α3 :=
        M.call_closure
          α0
          [
            M.get_struct_record_field
              α1
              "hash_map_alternate_or_custom_key_types::Account"
              "password";
            α2
          ] in
      let* α0 := M.alloc α3 in M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::hash::Hash"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("hash", InstanceField.Method hash) ].
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

(* StructRecord
  {
    name := "AccountInfo";
    ty_params := [];
    fields :=
      [
        ("name", Ty.apply (Ty.path "&") [ Ty.path "str" ]);
        ("email", Ty.apply (Ty.path "&") [ Ty.path "str" ])
      ];
  } *)

Axiom Accounts :
  (Ty.path "hash_map_alternate_or_custom_key_types::Accounts") =
    (Ty.apply
      (Ty.path "std::collections::hash::map::HashMap")
      [
        Ty.path "hash_map_alternate_or_custom_key_types::Account";
        Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
        Ty.path "std::hash::random::RandomState"
      ]).

(*
fn try_logon<'a>(accounts: &Accounts<'a>, username: &'a str, password: &'a str) {
    println!("Username: {}", username);
    println!("Password: {}", password);
    println!("Attempting logon...");

    let logon = Account { username, password };

    match accounts.get(&logon) {
        Some(account_info) => {
            println!("Successful logon!");
            println!("Name: {}", account_info.name);
            println!("Email: {}", account_info.email);
        }
        _ => println!("Login failed!"),
    }
}
*)
Definition try_logon (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ accounts; username; password ] =>
    let* accounts := M.alloc accounts in
    let* username := M.alloc username in
    let* password := M.alloc password in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Username: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α7 := M.call_closure α6 [ username ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Password: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α7 := M.call_closure α6 [ password ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
        let* α4 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Attempting logon...
") in
            let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
        let* α5 := M.call_closure α1 [ α4 ] in let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
      M.alloc (Value.Tuple []) in
    let* logon :=
      let* α0 := M.read username in
      let* α1 := M.read password in
      M.alloc
        (Value.StructRecord
          "hash_map_alternate_or_custom_key_types::Account"
          [ ("username", α0); ("password", α1) ]) in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "std::collections::hash::map::HashMap")
          [
            Ty.path "hash_map_alternate_or_custom_key_types::Account";
            Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
            Ty.path "std::hash::random::RandomState"
          ])
        "get"
        [ Ty.path "hash_map_alternate_or_custom_key_types::Account" ] in
    let* α1 := M.read accounts in
    let* α2 := M.call_closure α0 [ α1; logon ] in
    let* α3 := M.alloc α2 in
    let* α0 :=
      M.match_operator
        α3
        [
          fun γ =>
            let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::option::Option::Some" 0 in
            let* account_info := M.copy γ0_0 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
                let* α4 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Successful logon!
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
                let* α5 := M.call_closure α1 [ α4 ] in
                let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
              M.alloc (Value.Tuple []) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Name: ") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
                let* α10 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display"
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                    let* α7 := M.read account_info in
                    let* α8 :=
                      M.call_closure
                        α6
                        [
                          M.get_struct_record_field
                            α7
                            "hash_map_alternate_or_custom_key_types::AccountInfo"
                            "name"
                        ] in
                    let* α9 := M.alloc (Value.Array [ α8 ]) in M.pure (M.pointer_coercion α9) in
                let* α11 := M.call_closure α1 [ α5; α10 ] in
                let* α12 := M.call_closure α0 [ α11 ] in M.alloc α12 in
              M.alloc (Value.Tuple []) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "Email: ") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
                let* α10 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display"
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                    let* α7 := M.read account_info in
                    let* α8 :=
                      M.call_closure
                        α6
                        [
                          M.get_struct_record_field
                            α7
                            "hash_map_alternate_or_custom_key_types::AccountInfo"
                            "email"
                        ] in
                    let* α9 := M.alloc (Value.Array [ α8 ]) in M.pure (M.pointer_coercion α9) in
                let* α11 := M.call_closure α1 [ α5; α10 ] in
                let* α12 := M.call_closure α0 [ α11 ] in M.alloc α12 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
              let* α4 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Login failed!
") in
                  let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
              let* α5 := M.call_closure α1 [ α4 ] in
              let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let mut accounts: Accounts = HashMap::new();

    let account = Account {
        username: "j.everyman",
        password: "password123",
    };

    let account_info = AccountInfo {
        name: "John Everyman",
        email: "j.everyman@email.com",
    };

    accounts.insert(account, account_info);

    try_logon(&accounts, "j.everyman", "psasword123");

    try_logon(&accounts, "j.everyman", "password123");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* accounts :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.path "hash_map_alternate_or_custom_key_types::Account";
              Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
              Ty.path "std::hash::random::RandomState"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in M.alloc α1 in
    let* account :=
      let* α0 := M.read (mk_str "j.everyman") in
      let* α1 := M.read (mk_str "password123") in
      M.alloc
        (Value.StructRecord
          "hash_map_alternate_or_custom_key_types::Account"
          [ ("username", α0); ("password", α1) ]) in
    let* account_info :=
      let* α0 := M.read (mk_str "John Everyman") in
      let* α1 := M.read (mk_str "j.everyman@email.com") in
      M.alloc
        (Value.StructRecord
          "hash_map_alternate_or_custom_key_types::AccountInfo"
          [ ("name", α0); ("email", α1) ]) in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "std::collections::hash::map::HashMap")
            [
              Ty.path "hash_map_alternate_or_custom_key_types::Account";
              Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
              Ty.path "std::hash::random::RandomState"
            ])
          "insert"
          [] in
      let* α1 := M.read account in
      let* α2 := M.read account_info in
      let* α3 := M.call_closure α0 [ accounts; α1; α2 ] in M.alloc α3 in
    let* _ :=
      let* α0 := M.get_function "hash_map_alternate_or_custom_key_types::try_logon" [] in
      let* α1 := M.read (mk_str "j.everyman") in
      let* α2 := M.read (mk_str "psasword123") in
      let* α3 := M.call_closure α0 [ accounts; α1; α2 ] in M.alloc α3 in
    let* _ :=
      let* α0 := M.get_function "hash_map_alternate_or_custom_key_types::try_logon" [] in
      let* α1 := M.read (mk_str "j.everyman") in
      let* α2 := M.read (mk_str "password123") in
      let* α3 := M.call_closure α0 [ accounts; α1; α2 ] in M.alloc α3 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
