(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Mapping";
    ty_params := [ "K"; "V" ];
    fields :=
      [
        ("_key", Ty.apply (Ty.path "core::marker::PhantomData") [ K ]);
        ("_value", Ty.apply (Ty.path "core::marker::PhantomData") [ V ])
      ];
  } *)

Module Impl_core_default_Default_for_mother_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t := Ty.apply (Ty.path "mother::Mapping") [ K; V ].
  
  Parameter default : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    forall (K V : Ty.t),
    M.IsTraitInstance
      "core::default::Default"
      (Self K V)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method (default K V)) ].
End Impl_core_default_Default_for_mother_Mapping_K_V.

Module Impl_mother_Mapping_K_V.
  Definition Self (K V : Ty.t) : Ty.t := Ty.apply (Ty.path "mother::Mapping") [ K; V ].
  
  Parameter get : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_get :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "get" (get K V).
  
  Parameter insert : forall (K V : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_insert :
    forall (K V : Ty.t),
    M.IsAssociatedFunction (Self K V) "insert" (insert K V).
End Impl_mother_Mapping_K_V.

(* StructTuple
  {
    name := "AccountId";
    ty_params := [];
    fields := [ Ty.path "u128" ];
  } *)

Module Impl_core_default_Default_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mother_AccountId.

Module Impl_core_clone_Clone_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mother_AccountId.

Module Impl_core_marker_Copy_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_mother_AccountId.

Module Impl_core_marker_StructuralPartialEq_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_AccountId.

Module Impl_core_cmp_PartialEq_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_AccountId.

Module Impl_core_marker_StructuralEq_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_AccountId.

Module Impl_core_cmp_Eq_for_mother_AccountId.
  Definition Self : Ty.t := Ty.path "mother::AccountId".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_AccountId.

Axiom Balance : (Ty.path "mother::Balance") = (Ty.path "u128").

Axiom BlockNumber : (Ty.path "mother::BlockNumber") = (Ty.path "u32").

Axiom Hash : (Ty.path "mother::Hash") = (Ty.apply (Ty.path "array") [ Ty.path "u8" ]).

(* StructRecord
  {
    name := "Env";
    ty_params := [];
    fields := [ ("caller", Ty.path "mother::AccountId") ];
  } *)

(* StructTuple
  {
    name := "Bids";
    ty_params := [];
    fields :=
      [
        Ty.apply
          (Ty.path "alloc::vec::Vec")
          [
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply
                  (Ty.path "core::option::Option")
                  [ Ty.tuple [ Ty.path "mother::AccountId"; Ty.path "u128" ] ];
                Ty.path "alloc::alloc::Global"
              ];
            Ty.path "alloc::alloc::Global"
          ]
      ];
  } *)

Module Impl_core_default_Default_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mother_Bids.

Module Impl_core_marker_StructuralPartialEq_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Bids.

Module Impl_core_cmp_PartialEq_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_Bids.

Module Impl_core_marker_StructuralEq_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_Bids.

Module Impl_core_cmp_Eq_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_Bids.

Module Impl_core_clone_Clone_for_mother_Bids.
  Definition Self : Ty.t := Ty.path "mother::Bids".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mother_Bids.

(* Enum Outline *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "NoWinner";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "WinnerDetected";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "PayoutCompleted";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Outline.
  Definition Self : Ty.t := Ty.path "mother::Outline".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Outline.

Module Impl_core_cmp_PartialEq_for_mother_Outline.
  Definition Self : Ty.t := Ty.path "mother::Outline".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_Outline.

Module Impl_core_marker_StructuralEq_for_mother_Outline.
  Definition Self : Ty.t := Ty.path "mother::Outline".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_Outline.

Module Impl_core_cmp_Eq_for_mother_Outline.
  Definition Self : Ty.t := Ty.path "mother::Outline".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_Outline.

Module Impl_core_clone_Clone_for_mother_Outline.
  Definition Self : Ty.t := Ty.path "mother::Outline".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mother_Outline.

(* Enum Status *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "NotStarted";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "OpeningPeriod";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "EndingPeriod";
        item := StructTuple [ Ty.path "u32" ];
        discriminant := None;
      };
      {
        name := "Ended";
        item := StructTuple [ Ty.path "mother::Outline" ];
        discriminant := None;
      };
      {
        name := "RfDelay";
        item := StructTuple [ Ty.path "u32" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Status.
  Definition Self : Ty.t := Ty.path "mother::Status".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Status.

Module Impl_core_cmp_PartialEq_for_mother_Status.
  Definition Self : Ty.t := Ty.path "mother::Status".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_Status.

Module Impl_core_marker_StructuralEq_for_mother_Status.
  Definition Self : Ty.t := Ty.path "mother::Status".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_Status.

Module Impl_core_cmp_Eq_for_mother_Status.
  Definition Self : Ty.t := Ty.path "mother::Status".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_Status.

Module Impl_core_clone_Clone_for_mother_Status.
  Definition Self : Ty.t := Ty.path "mother::Status".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mother_Status.

(* StructRecord
  {
    name := "Auction";
    ty_params := [];
    fields :=
      [
        ("name", Ty.path "alloc::string::String");
        ("subject", Ty.apply (Ty.path "array") [ Ty.path "u8" ]);
        ("bids", Ty.path "mother::Bids");
        ("terms", Ty.apply (Ty.path "array") [ Ty.path "u32" ]);
        ("status", Ty.path "mother::Status");
        ("finalized", Ty.path "bool");
        ("vector",
          Ty.apply (Ty.path "alloc::vec::Vec") [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
      ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Auction.

Module Impl_core_cmp_PartialEq_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_Auction.

Module Impl_core_marker_StructuralEq_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_Auction.

Module Impl_core_cmp_Eq_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_Auction.

Module Impl_core_clone_Clone_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Parameter clone : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_mother_Auction.

Module Impl_core_default_Default_for_mother_Auction.
  Definition Self : Ty.t := Ty.path "mother::Auction".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mother_Auction.

(* Enum Failure *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Revert";
        item := StructTuple [ Ty.path "alloc::string::String" ];
        discriminant := None;
      };
      {
        name := "Panic";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_marker_StructuralPartialEq_for_mother_Failure.
  Definition Self : Ty.t := Ty.path "mother::Failure".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_mother_Failure.

Module Impl_core_cmp_PartialEq_for_mother_Failure.
  Definition Self : Ty.t := Ty.path "mother::Failure".
  
  Parameter eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_mother_Failure.

Module Impl_core_marker_StructuralEq_for_mother_Failure.
  Definition Self : Ty.t := Ty.path "mother::Failure".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralEq_for_mother_Failure.

Module Impl_core_cmp_Eq_for_mother_Failure.
  Definition Self : Ty.t := Ty.path "mother::Failure".
  
  Parameter assert_receiver_is_total_eq : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::Eq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
End Impl_core_cmp_Eq_for_mother_Failure.

(* StructRecord
  {
    name := "AuctionEchoed";
    ty_params := [];
    fields := [ ("auction", Ty.path "mother::Auction") ];
  } *)

(* Enum Event *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "AuctionEchoed";
        item := StructTuple [ Ty.path "mother::AuctionEchoed" ];
        discriminant := None;
      }
    ];
} *)

Module Impl_mother_Env.
  Definition Self : Ty.t := Ty.path "mother::Env".
  
  Parameter caller : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_caller : M.IsAssociatedFunction Self "caller" caller.
  
  Parameter emit_event : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_emit_event : M.IsAssociatedFunction Self "emit_event" emit_event.
End Impl_mother_Env.

(* StructRecord
  {
    name := "Mother";
    ty_params := [];
    fields :=
      [
        ("auction", Ty.path "mother::Auction");
        ("balances",
          Ty.apply (Ty.path "mother::Mapping") [ Ty.path "mother::AccountId"; Ty.path "u128" ])
      ];
  } *)

Module Impl_core_default_Default_for_mother_Mother.
  Definition Self : Ty.t := Ty.path "mother::Mother".
  
  Parameter default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_mother_Mother.

Module Impl_mother_Mother.
  Definition Self : Ty.t := Ty.path "mother::Mother".
  
  Parameter init_env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_init_env : M.IsAssociatedFunction Self "init_env" init_env.
  
  Parameter env : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_env : M.IsAssociatedFunction Self "env" env.
  
  Parameter new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  Parameter new_default : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_new_default : M.IsAssociatedFunction Self "new_default" new_default.
  
  Parameter failed_new : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_failed_new : M.IsAssociatedFunction Self "failed_new" failed_new.
  
  Parameter echo_auction : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_echo_auction : M.IsAssociatedFunction Self "echo_auction" echo_auction.
  
  Parameter revert_or_trap : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_revert_or_trap :
    M.IsAssociatedFunction Self "revert_or_trap" revert_or_trap.
  
  Parameter debug_log : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_debug_log : M.IsAssociatedFunction Self "debug_log" debug_log.
End Impl_mother_Mother.
