(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  Account.
Section Account.
  Record t : Set := {
    username : ref str.t;
    password : ref str.t;
  }.
  
  Global Instance Get_username : Notations.Dot "username" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(username))
        (fun β α => Some (α <| username := β |>));
  }.
  Global Instance Get_AF_username : Notations.DoubleColon t "username" := {
    Notations.double_colon (α : M.Val t) := α.["username"];
  }.
  Global Instance Get_password : Notations.Dot "password" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(password))
        (fun β α => Some (α <| password := β |>));
  }.
  Global Instance Get_AF_password : Notations.DoubleColon t "password" := {
    Notations.double_colon (α : M.Val t) := α.["password"];
  }.
End Account.
End Account.

Module  Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.t.
  
  Global Instance ℐ : core.marker.StructuralPartialEq.Trait Self := {
  }.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_marker_StructuralPartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  PartialEq
  *)
  Definition eq
      (self : ref Self)
      (other : ref hash_map_alternate_or_custom_key_types.Account.t)
      : M bool.t :=
    let* self := M.alloc self in
    let* other := M.alloc other in
    let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      M.read self in
    let* α1 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      M.read other in
    let* α2 : bool.t :=
      M.call
        ((core.cmp.PartialEq.eq (Self := ref str.t) (Trait := ltac:(refine _)))
          (borrow (deref α0).["username"])
          (borrow (deref α1).["username"])) in
    let* α3 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      M.read self in
    let* α4 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      M.read other in
    let* α5 : bool.t :=
      M.call
        ((core.cmp.PartialEq.eq (Self := ref str.t) (Trait := ltac:(refine _)))
          (borrow (deref α3).["password"])
          (borrow (deref α4).["password"])) in
    M.pure (BinOp.Pure.and α2 α5).
  
  Global Instance AssociatedFunction_eq : Notations.DoubleColon Self "eq" := {
    Notations.double_colon := eq;
  }.
  
  Global Instance ℐ :
    core.cmp.PartialEq.Required.Trait Self
      (Rhs := core.cmp.PartialEq.Default.Rhs Self) := {
    core.cmp.PartialEq.eq := eq;
    core.cmp.PartialEq.ne := Datatypes.None;
  }.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_cmp_PartialEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.t.
  
  Global Instance ℐ : core.marker.StructuralEq.Trait Self := {
  }.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_marker_StructuralEq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  Eq
  *)
  Definition assert_receiver_is_total_eq (self : ref Self) : M unit :=
    let* self := M.alloc self in
    let _ : unit := tt in
    let _ : unit := tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_assert_receiver_is_total_eq :
    Notations.DoubleColon Self "assert_receiver_is_total_eq" := {
    Notations.double_colon := assert_receiver_is_total_eq;
  }.
  
  Global Instance ℐ : core.cmp.Eq.Required.Trait Self := {
    core.cmp.Eq.assert_receiver_is_total_eq :=
      Datatypes.Some assert_receiver_is_total_eq;
  }.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_cmp_Eq_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
Section Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
  Definition Self : Set := hash_map_alternate_or_custom_key_types.Account.t.
  
  (*
  Hash
  *)
  Definition hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H}
      (self : ref Self)
      (state : mut_ref __H)
      : M unit :=
    let* self := M.alloc self in
    let* state := M.alloc state in
    let* _ : M.Val unit :=
      let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
        M.read self in
      let* α1 : mut_ref __H := M.read state in
      let* α2 : unit :=
        M.call
          ((core.hash.Hash.hash (Self := ref str.t) (Trait := ltac:(refine _)))
            (borrow (deref α0).["username"])
            α1) in
      M.alloc α2 in
    let* α0 : ref hash_map_alternate_or_custom_key_types.Account.t :=
      M.read self in
    let* α1 : mut_ref __H := M.read state in
    let* α2 : unit :=
      M.call
        ((core.hash.Hash.hash (Self := ref str.t) (Trait := ltac:(refine _)))
          (borrow (deref α0).["password"])
          α1) in
    let* α0 : M.Val unit := M.alloc α2 in
    M.read α0.
  
  Global Instance AssociatedFunction_hash
      {__H : Set}
      {ℋ_0 : core.hash.Hasher.Trait __H} :
    Notations.DoubleColon Self "hash" := {
    Notations.double_colon := hash (__H := __H);
  }.
  
  Global Instance ℐ : core.hash.Hash.Required.Trait Self := {
    core.hash.Hash.hash {__H : Set} {ℋ_0 : core.hash.Hasher.Trait __H} :=
      hash (__H := __H);
    core.hash.Hash.hash_slice := Datatypes.None;
  }.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.
End Impl_core_hash_Hash_for_hash_map_alternate_or_custom_key_types_Account_t.

Module  AccountInfo.
Section AccountInfo.
  Record t : Set := {
    name : ref str.t;
    email : ref str.t;
  }.
  
  Global Instance Get_name : Notations.Dot "name" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(name)) (fun β α => Some (α <| name := β |>));
  }.
  Global Instance Get_AF_name : Notations.DoubleColon t "name" := {
    Notations.double_colon (α : M.Val t) := α.["name"];
  }.
  Global Instance Get_email : Notations.Dot "email" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(email)) (fun β α => Some (α <| email := β |>));
  }.
  Global Instance Get_AF_email : Notations.DoubleColon t "email" := {
    Notations.double_colon (α : M.Val t) := α.["email"];
  }.
End AccountInfo.
End AccountInfo.

Ltac Accounts :=
  exact
    (std.collections.hash.map.HashMap.t
      hash_map_alternate_or_custom_key_types.Account.t
      hash_map_alternate_or_custom_key_types.AccountInfo.t
      std.collections.hash.map.HashMap.Default.S).

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
Definition try_logon
    (accounts : ref ltac:(hash_map_alternate_or_custom_key_types.Accounts))
    (username : ref str.t)
    (password : ref str.t)
    : M unit :=
  let* accounts := M.alloc accounts in
  let* username := M.alloc username in
  let* password := M.alloc password in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Username: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow username)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Password: ") in
      let* α1 : ref str.t := M.read (mk_str "
") in
      let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
      let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
      let* α4 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α3) in
      let* α5 : core.fmt.rt.Argument.t :=
        M.call (core.fmt.rt.Argument.t::["new_display"] (borrow password)) in
      let* α6 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α5 ] in
      let* α7 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
        M.alloc (borrow α6) in
      let* α8 : ref (slice core.fmt.rt.Argument.t) :=
        M.read (pointer_coercion "Unsize" α7) in
      let* α9 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_v1"] α4 α8) in
      let* α10 : unit := M.call (std.io.stdio._print α9) in
      M.alloc α10 in
    M.alloc tt in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "Attempting logon...
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* logon : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
    let* α0 : ref str.t := M.read username in
    let* α1 : ref str.t := M.read password in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.Account.username := α0;
        hash_map_alternate_or_custom_key_types.Account.password := α1;
      |} in
  let* α0 :
      ref
        (std.collections.hash.map.HashMap.t
          hash_map_alternate_or_custom_key_types.Account.t
          hash_map_alternate_or_custom_key_types.AccountInfo.t
          std.collections.hash.map.RandomState.t) :=
    M.read accounts in
  let* α1 :
      core.option.Option.t
        (ref hash_map_alternate_or_custom_key_types.AccountInfo.t) :=
    M.call
      ((std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t)::["get"]
        α0
        (borrow logon)) in
  let* α0 : M.Val unit :=
    match α1 with
    | core.option.Option.Some account_info =>
      let* account_info := M.alloc account_info in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Successful logon!
") in
          let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
          let* α3 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α2) in
          let* α4 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_const"] α3) in
          let* α5 : unit := M.call (std.io.stdio._print α4) in
          M.alloc α5 in
        M.alloc tt in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Name: ") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : ref hash_map_alternate_or_custom_key_types.AccountInfo.t :=
            M.read account_info in
          let* α6 : core.fmt.rt.Argument.t :=
            M.call
              (core.fmt.rt.Argument.t::["new_display"]
                (borrow (deref α5).["name"])) in
          let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
          let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α7) in
          let* α9 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α8) in
          let* α10 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
          let* α11 : unit := M.call (std.io.stdio._print α10) in
          M.alloc α11 in
        M.alloc tt in
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : ref str.t := M.read (mk_str "Email: ") in
          let* α1 : ref str.t := M.read (mk_str "
") in
          let* α2 : M.Val (array (ref str.t)) := M.alloc [ α0; α1 ] in
          let* α3 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α2) in
          let* α4 : ref (slice (ref str.t)) :=
            M.read (pointer_coercion "Unsize" α3) in
          let* α5 : ref hash_map_alternate_or_custom_key_types.AccountInfo.t :=
            M.read account_info in
          let* α6 : core.fmt.rt.Argument.t :=
            M.call
              (core.fmt.rt.Argument.t::["new_display"]
                (borrow (deref α5).["email"])) in
          let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α6 ] in
          let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
            M.alloc (borrow α7) in
          let* α9 : ref (slice core.fmt.rt.Argument.t) :=
            M.read (pointer_coercion "Unsize" α8) in
          let* α10 : core.fmt.Arguments.t :=
            M.call (core.fmt.Arguments.t::["new_v1"] α4 α9) in
          let* α11 : unit := M.call (std.io.stdio._print α10) in
          M.alloc α11 in
        M.alloc tt in
      M.alloc tt
    | _ =>
      let* _ : M.Val unit :=
        let* α0 : ref str.t := M.read (mk_str "Login failed!
") in
        let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
        let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
        let* α3 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α2) in
        let* α4 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_const"] α3) in
        let* α5 : unit := M.call (std.io.stdio._print α4) in
        M.alloc α5 in
      M.alloc tt
    end in
  M.read α0.

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
Definition main : M unit :=
  let* accounts :
      M.Val
        (std.collections.hash.map.HashMap.t
          hash_map_alternate_or_custom_key_types.Account.t
          hash_map_alternate_or_custom_key_types.AccountInfo.t
          std.collections.hash.map.RandomState.t) :=
    let* α0 :
        std.collections.hash.map.HashMap.t
          hash_map_alternate_or_custom_key_types.Account.t
          hash_map_alternate_or_custom_key_types.AccountInfo.t
          std.collections.hash.map.RandomState.t :=
      M.call
        (std.collections.hash.map.HashMap.t
            hash_map_alternate_or_custom_key_types.Account.t
            hash_map_alternate_or_custom_key_types.AccountInfo.t
            std.collections.hash.map.RandomState.t)::["new"] in
    M.alloc α0 in
  let* account : M.Val hash_map_alternate_or_custom_key_types.Account.t :=
    let* α0 : ref str.t := M.read (mk_str "j.everyman") in
    let* α1 : ref str.t := M.read (mk_str "password123") in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.Account.username := α0;
        hash_map_alternate_or_custom_key_types.Account.password := α1;
      |} in
  let* account_info :
      M.Val hash_map_alternate_or_custom_key_types.AccountInfo.t :=
    let* α0 : ref str.t := M.read (mk_str "John Everyman") in
    let* α1 : ref str.t := M.read (mk_str "j.everyman@email.com") in
    M.alloc
      {|
        hash_map_alternate_or_custom_key_types.AccountInfo.name := α0;
        hash_map_alternate_or_custom_key_types.AccountInfo.email := α1;
      |} in
  let* _ :
      M.Val
        (core.option.Option.t
          hash_map_alternate_or_custom_key_types.AccountInfo.t) :=
    let* α0 : hash_map_alternate_or_custom_key_types.Account.t :=
      M.read account in
    let* α1 : hash_map_alternate_or_custom_key_types.AccountInfo.t :=
      M.read account_info in
    let* α2 :
        core.option.Option.t
          hash_map_alternate_or_custom_key_types.AccountInfo.t :=
      M.call
        ((std.collections.hash.map.HashMap.t
              hash_map_alternate_or_custom_key_types.Account.t
              hash_map_alternate_or_custom_key_types.AccountInfo.t
              std.collections.hash.map.RandomState.t)::["insert"]
          (borrow_mut accounts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : ref str.t := M.read (mk_str "j.everyman") in
    let* α1 : ref str.t := M.read (mk_str "psasword123") in
    let* α2 : unit :=
      M.call
        (hash_map_alternate_or_custom_key_types.try_logon
          (borrow accounts)
          α0
          α1) in
    M.alloc α2 in
  let* _ : M.Val unit :=
    let* α0 : ref str.t := M.read (mk_str "j.everyman") in
    let* α1 : ref str.t := M.read (mk_str "password123") in
    let* α2 : unit :=
      M.call
        (hash_map_alternate_or_custom_key_types.try_logon
          (borrow accounts)
          α0
          α1) in
    M.alloc α2 in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
