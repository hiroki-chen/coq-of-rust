(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module HashMap := std.collections.HashMap.

Module Account.
  Record t : Set := {
    username : ref str;
    password : ref str;
  }.
End Account.
Definition Account : Set := Account.t.

Module Impl__crate_marker_StructuralPartialEq_for_Account.
  Definition Self := Account.
  
  Global Instance I : _crate.marker.StructuralPartialEq.Class Self :=
      _crate.marker.StructuralPartialEq.Build_Class _.
Module ImplAccount.

Module Impl__crate_cmp_PartialEq_for_Account.
  Definition Self := Account.
  
  Global Instance I : _crate.cmp.PartialEq.Class Self := {|
    _crate.cmp.PartialEq.eq (self : ref Account<'a>) (other : ref Account) :=
      andb
        (eqb self.username other.username)
        (eqb self.password other.password);
  |}.
Module ImplAccount.

Module Impl__crate_marker_StructuralEq_for_Account.
  Definition Self := Account.
  
  Global Instance I : _crate.marker.StructuralEq.Class Self :=
      _crate.marker.StructuralEq.Build_Class _.
Module ImplAccount.

Module Impl__crate_cmp_Eq_for_Account.
  Definition Self := Account.
  
  Global Instance I : _crate.cmp.Eq.Class Self := {|
    _crate.cmp.Eq.assert_receiver_is_total_eq (self : ref Account<'a>) :=
      let _ := tt in
      let _ := tt in
      tt;
  |}.
Module ImplAccount.

Module Impl__crate_hash_Hash_for_Account.
  Definition Self := Account.
  
  Global Instance I : _crate.hash.Hash.Class Self := {|
    _crate.hash.Hash.hash (self : ref Account<'a>) (state : mut_ref __H) :=
      _crate.hash.Hash.hash self.username state ;;
      _crate.hash.Hash.hash self.password state;
  |}.
Module ImplAccount.

Module AccountInfo.
  Record t : Set := {
    name : ref str;
    email : ref str;
  }.
End AccountInfo.
Definition AccountInfo : Set := AccountInfo.t.

Error TyAlias.

Definition try_logon
    (accounts : ref Accounts)
    (username : ref str)
    (password : ref str)
    : unit :=
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Username: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display username ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1
      [ "Password: "; "\n" ]
      [ _crate.fmt.ImplArgumentV1.new_display password ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.ImplArguments.new_v1 [ "Attempting logon...\n" ] [  ]) ;;
  tt ;;
  let logon :=
    {| Account.username := username; Account.password := password; |} in
  match method "get" accounts logon with
  | Some (account_info) =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1 [ "Successful logon!\n" ] [  ]) ;;
    tt ;;
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "Name: "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display account_info.name ]) ;;
    tt ;;
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ "Email: "; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_display account_info.email ]) ;;
    tt ;;
    tt
  | _ =>
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1 [ "Login failed!\n" ] [  ]) ;;
    tt
  end.

Definition main (_ : unit) : unit :=
  let accounts := ImplHashMap.new tt in
  let account :=
    {| Account.username := "j.everyman"; Account.password := "password123";
    |} in
  let account_info :=
    {|
      AccountInfo.name := "John Everyman";
      AccountInfo.email := "j.everyman@email.com";
    |} in
  method "insert" accounts account account_info ;;
  try_logon accounts "j.everyman" "psasword123" ;;
  try_logon accounts "j.everyman" "password123" ;;
  tt.
