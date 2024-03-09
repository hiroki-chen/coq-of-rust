(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Account *)

Module Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.
  (*
  PartialEq
  *)
  Definition eq (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; other ] =>
      let* self := M.alloc self in
      let* other := M.alloc other in
      let* α0 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "&") [ Ty.path "str" ];
            (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ] in
      let* α1 := M.read self in
      let* α2 := M.read other in
      let* α3 :=
        M.call
          α0
          [ M.get_struct_record α1 "username"; M.get_struct_record α2 "username"
          ] in
      let* α4 :=
        M.get_trait_method
          "core::cmp::PartialEq"
          "eq"
          [
            (* Self *) Ty.apply (Ty.path "&") [ Ty.path "str" ];
            (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "str" ]
          ] in
      let* α5 := M.read self in
      let* α6 := M.read other in
      let* α7 :=
        M.call
          α4
          [ M.get_struct_record α5 "password"; M.get_struct_record α6 "password"
          ] in
      M.pure (BinOp.Pure.and α3 α7)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq
      (𝜏 : list Ty.t)
      (α : list Value.t)
      : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          Value.DeclaredButUndefined
          (Value.Array
            [
              fun γ =>
                (match_operator
                  Value.DeclaredButUndefined
                  (Value.Array [ fun γ => (M.alloc (Value.Tuple [])) ]))
            ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("assert_receiver_is_total_eq",
            InstanceField.Method assert_receiver_is_total_eq)
        ]
      (* Instance polymorphic types *) [].
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account.

Module Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.
  (*
  Hash
  *)
  Definition hash (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; __H ], [ self; state ] =>
      let* self := M.alloc self in
      let* state := M.alloc state in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::hash::Hash"
            "hash"
            [ (* Self *) Ty.apply (Ty.path "&") [ Ty.path "str" ]; (* H *) __H
            ] in
        let* α1 := M.read self in
        let* α2 := M.read state in
        let* α3 := M.call α0 [ M.get_struct_record α1 "username"; α2 ] in
        M.alloc α3 in
      let* α0 :=
        M.get_trait_method
          "core::hash::Hash"
          "hash"
          [ (* Self *) Ty.apply (Ty.path "&") [ Ty.path "str" ]; (* H *) __H
          ] in
      let* α1 := M.read self in
      let* α2 := M.read state in
      let* α3 := M.call α0 [ M.get_struct_record α1 "password"; α2 ] in
      let* α0 := M.alloc α3 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::hash::Hash"
      (* Self *) (Ty.path "hash_map_alternate_or_custom_key_types::Account")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("hash", InstanceField.Method hash) ]
      (* Instance polymorphic types *) [].
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account.

(* Struct AccountInfo *)

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
Definition try_logon (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ accounts; username; password ] =>
    let* accounts := M.alloc accounts in
    let* username := M.alloc username in
    let* password := M.alloc password in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Username: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ username ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Password: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ password ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const" in
        let* α2 := M.read (mk_str "Attempting logon...
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call α0 [ α4 ] in
        M.alloc α5 in
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
        "get" in
    let* α1 := M.read accounts in
    let* α2 := M.call α0 [ α1; logon ] in
    let* α3 := M.alloc α2 in
    let* α0 :=
      match_operator
        α3
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.Some _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::option::Option::Get_Some_0" in
                  M.pure (α0 γ) in
                let* account_info := M.copy γ0_0 in
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_const" in
                    let* α2 := M.read (mk_str "Successful logon!
") in
                    let* α3 := M.alloc (Value.Array [ α2 ]) in
                    let* α4 :=
                      M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                    let* α5 := M.call α0 [ α4 ] in
                    M.alloc α5 in
                  M.alloc (Value.Tuple []) in
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "Name: ") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display" in
                    let* α6 := M.read account_info in
                    let* α7 := M.call α5 [ M.get_struct_record α6 "name" ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    let* α9 :=
                      M.call
                        α1
                        [
                          M.pointer_coercion (* Unsize *) α4;
                          M.pointer_coercion (* Unsize *) α8
                        ] in
                    let* α10 := M.call α0 [ α9 ] in
                    M.alloc α10 in
                  M.alloc (Value.Tuple []) in
                let* _ :=
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "Email: ") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display" in
                    let* α6 := M.read account_info in
                    let* α7 := M.call α5 [ M.get_struct_record α6 "email" ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    let* α9 :=
                      M.call
                        α1
                        [
                          M.pointer_coercion (* Unsize *) α4;
                          M.pointer_coercion (* Unsize *) α8
                        ] in
                    let* α10 := M.call α0 [ α9 ] in
                    M.alloc α10 in
                  M.alloc (Value.Tuple []) in
                M.alloc (Value.Tuple [])
              | _ => M.break_match 
              end);
            fun γ =>
              (let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_const" in
                let* α2 := M.read (mk_str "Login failed!
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in
                let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
                let* α5 := M.call α0 [ α4 ] in
                M.alloc α5 in
              M.alloc (Value.Tuple []))
          ]) in
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
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
          "new" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
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
          "insert" in
      let* α1 := M.read account in
      let* α2 := M.read account_info in
      let* α3 := M.call α0 [ accounts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_function "hash_map_alternate_or_custom_key_types::try_logon" in
      let* α1 := M.read (mk_str "j.everyman") in
      let* α2 := M.read (mk_str "psasword123") in
      let* α3 := M.call α0 [ accounts; α1; α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_function "hash_map_alternate_or_custom_key_types::try_logon" in
      let* α1 := M.read (mk_str "j.everyman") in
      let* α2 := M.read (mk_str "password123") in
      let* α3 := M.call α0 [ accounts; α1; α2 ] in
      M.alloc α3 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
