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
  
  (* PartialEq *)
  Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        LogicalOp.and (|
          M.call_closure (|
            M.get_trait_method (|
              "core::cmp::PartialEq",
              Ty.apply (Ty.path "&") [ Ty.path "str" ],
              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
              "eq",
              []
            |),
            [
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "hash_map_alternate_or_custom_key_types::Account",
                "username"
              |);
              M.SubPointer.get_struct_record_field (|
                M.read (| other |),
                "hash_map_alternate_or_custom_key_types::Account",
                "username"
              |)
            ]
          |),
          ltac:(M.monadic
            (M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "&") [ Ty.path "str" ],
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "eq",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "hash_map_alternate_or_custom_key_types::Account",
                  "password"
                |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| other |),
                  "hash_map_alternate_or_custom_key_types::Account",
                  "password"
                |)
              ]
            |)))
        |)))
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
  
  (* Eq *)
  Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            Value.DeclaredButUndefined,
            [
              fun γ =>
                ltac:(M.monadic
                  (M.match_operator (|
                    Value.DeclaredButUndefined,
                    [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                  |)))
            ]
          |)
        |)))
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
  
  (* Hash *)
  Definition hash (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ __H ], [ self; state ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let state := M.alloc (| state |) in
        M.read (|
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_trait_method (|
                  "core::hash::Hash",
                  Ty.apply (Ty.path "&") [ Ty.path "str" ],
                  [],
                  "hash",
                  [ __H ]
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "hash_map_alternate_or_custom_key_types::Account",
                    "username"
                  |);
                  M.read (| state |)
                ]
              |)
            |) in
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::hash::Hash",
                Ty.apply (Ty.path "&") [ Ty.path "str" ],
                [],
                "hash",
                [ __H ]
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "hash_map_alternate_or_custom_key_types::Account",
                  "password"
                |);
                M.read (| state |)
              ]
            |)
          |)
        |)))
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
    ltac:(M.monadic
      (let accounts := M.alloc (| accounts |) in
      let username := M.alloc (| username |) in
      let password := M.alloc (| password |) in
      M.read (|
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| Value.String "Username: " |); M.read (| Value.String "
" |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ username ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [ M.read (| Value.String "Password: " |); M.read (| Value.String "
" |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ password ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array [ M.read (| Value.String "Attempting logon...
" |) ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let~ logon :=
          M.alloc (|
            Value.StructRecord
              "hash_map_alternate_or_custom_key_types::Account"
              [ ("username", M.read (| username |)); ("password", M.read (| password |)) ]
          |) in
        M.match_operator (|
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "std::collections::hash::map::HashMap")
                  [
                    Ty.path "hash_map_alternate_or_custom_key_types::Account";
                    Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
                    Ty.path "std::hash::random::RandomState"
                  ],
                "get",
                [ Ty.path "hash_map_alternate_or_custom_key_types::Account" ]
              |),
              [ M.read (| accounts |); logon ]
            |)
          |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::option::Option::Some", 0 |) in
                let account_info := M.copy (| γ0_0 |) in
                let~ _ :=
                  let~ _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_const",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array [ M.read (| Value.String "Successful logon!
" |) ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                let~ _ :=
                  let~ _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_v1",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.read (| Value.String "Name: " |);
                                      M.read (| Value.String "
" |)
                                    ]
                                |));
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_display",
                                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                        |),
                                        [
                                          M.SubPointer.get_struct_record_field (|
                                            M.read (| account_info |),
                                            "hash_map_alternate_or_custom_key_types::AccountInfo",
                                            "name"
                                          |)
                                        ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                let~ _ :=
                  let~ _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_v1",
                              []
                            |),
                            [
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.read (| Value.String "Email: " |);
                                      M.read (| Value.String "
" |)
                                    ]
                                |));
                              (* Unsize *)
                              M.pointer_coercion
                                (M.alloc (|
                                  Value.Array
                                    [
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.path "core::fmt::rt::Argument",
                                          "new_display",
                                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                        |),
                                        [
                                          M.SubPointer.get_struct_record_field (|
                                            M.read (| account_info |),
                                            "hash_map_alternate_or_custom_key_types::AccountInfo",
                                            "email"
                                          |)
                                        ]
                                      |)
                                    ]
                                |))
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let~ _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array [ M.read (| Value.String "Login failed!
" |) ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_try_logon :
  M.IsFunction "hash_map_alternate_or_custom_key_types::try_logon" try_logon.

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
    ltac:(M.monadic
      (M.read (|
        let~ accounts :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "std::collections::hash::map::HashMap")
                  [
                    Ty.path "hash_map_alternate_or_custom_key_types::Account";
                    Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
                    Ty.path "std::hash::random::RandomState"
                  ],
                "new",
                []
              |),
              []
            |)
          |) in
        let~ account :=
          M.alloc (|
            Value.StructRecord
              "hash_map_alternate_or_custom_key_types::Account"
              [
                ("username", M.read (| Value.String "j.everyman" |));
                ("password", M.read (| Value.String "password123" |))
              ]
          |) in
        let~ account_info :=
          M.alloc (|
            Value.StructRecord
              "hash_map_alternate_or_custom_key_types::AccountInfo"
              [
                ("name", M.read (| Value.String "John Everyman" |));
                ("email", M.read (| Value.String "j.everyman@email.com" |))
              ]
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "std::collections::hash::map::HashMap")
                  [
                    Ty.path "hash_map_alternate_or_custom_key_types::Account";
                    Ty.path "hash_map_alternate_or_custom_key_types::AccountInfo";
                    Ty.path "std::hash::random::RandomState"
                  ],
                "insert",
                []
              |),
              [ accounts; M.read (| account |); M.read (| account_info |) ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "hash_map_alternate_or_custom_key_types::try_logon", [] |),
              [
                accounts;
                M.read (| Value.String "j.everyman" |);
                M.read (| Value.String "psasword123" |)
              ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "hash_map_alternate_or_custom_key_types::try_logon", [] |),
              [
                accounts;
                M.read (| Value.String "j.everyman" |);
                M.read (| Value.String "password123" |)
              ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "hash_map_alternate_or_custom_key_types::main" main.
