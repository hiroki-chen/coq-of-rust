Require Export Coq.Strings.Ascii.
Require Export Coq.Strings.String.
Require Export Coq.ZArith.ZArith.

(* Global settings for files importing this file *)
Global Set Primitive Projections.
Global Set Printing Projections.
Global Open Scope list_scope.
Global Open Scope string_scope.
Global Open Scope Z_scope.
Global Open Scope type_scope.

Export List.ListNotations.

Require Export CoqOfRust.M.
Export M.Notations.

Module Notations.
  (** A class to represent the notation [e1.e2]. This is mainly used to call
      methods, or access to named or indexed fields of structures. *)
  Class Dot (name : string) {T : Set} : Set := {
    dot : T;
  }.
  Arguments dot name {T Dot}.

  (** A class to represent associated functions (the notation [e1::e2]). The
      kind might be [Set] functions associated to a type, or [Set -> Set] for
      functions associated to a trait. *)
  Class DoubleColon {Kind : Type} (type : Kind) (name : string) {T : Set} :
    Set := {
    double_colon : T;
  }.
  Arguments double_colon {Kind} type name {T DoubleColon}.

  (* A class to represent types in a trait. *)
  Class DoubleColonType {Kind : Type} (type : Kind) (name : string) : Type := {
    double_colon_type : Set;
  }.
  Arguments double_colon_type {Kind} type name {DoubleColonType}.
End Notations.

(** Note that we revert the arguments in this notation. *)
Notation "e1 .[ e2 ]" := (Notations.dot e2 e1)
  (at level 0).

Notation "e1 ::[ e2 ]" := (Notations.double_colon e1 e2)
  (at level 0).

Notation "e1 ::type[ e2 ]" := (Notations.double_colon_type e1 e2)
  (at level 0).

(** A method is also an associated function for its type. *)
Global Instance AssociatedFunctionFromMethod
  (type : Set) (name : string) (T : Set)
  `(Notations.Dot name (T := type -> T)) :
  Notations.DoubleColon type name (T := type -> T) := {
  Notations.double_colon := Notations.dot name;
}.

Definition defaultType (T : option Set) (Default : Set) : Set :=
  match T with
  | Some T => T
  | None => Default
  end.

Parameter axiom : forall {A : Set}, A.

Definition assign {A : Set} (target source : M.Val A) : M (M.Val unit) :=
  let* source := M.read source in
  let* _ := M.write target source in
  M.alloc tt.

Module bool.
  Definition t : Set := bool.
End bool.

Module u8.
  Definition t : Set := Z.
End u8.

Module u16.
  Definition t : Set := Z.
End u16.

Module u32.
  Definition t : Set := Z.
End u32.

Module u64.
  Definition t : Set := Z.
End u64.

Module u128.
  Definition t : Set := Z.
End u128.

Module usize.
  Definition t : Set := Z.
End usize.

Module i8.
  Definition t : Set := Z.
End i8.

Module i16.
  Definition t : Set := Z.
End i16.

Module i32.
  Definition t : Set := Z.
End i32.

Module i64.
  Definition t : Set := Z.
End i64.

Module i128.
  Definition t : Set := Z.
End i128.

Module isize.
  Definition t : Set := Z.
End isize.

(* We approximate floating point numbers with integers *)
Module f32.
  Definition t : Set := Z.
End f32.

Module f64.
  Definition t : Set := Z.
End f64.

Module str.
  Definition t : Set := Coq.Strings.String.string.
End str.

Module char.
  Definition t : Set := Coq.Strings.Ascii.ascii.
End char.

Definition ref (A : Set) : Set := M.Val A.
Definition mut_ref (A : Set) : Set := M.Val A.

Definition slice (A : Set) : Set := list A.
Definition array (A : Set) : Set := list A.

Module never.
  Definition t : Set := Empty_set.
End never.

Definition never_to_any {A B : Set} (x : A) : M B :=
  M.impossible.

Definition use {A : Set} (x : A) : M A := M.pure x.

Definition mk_str (s : Coq.Strings.String.string) : M.Val (ref str.t) :=
  M.Ref.Imm (M.Ref.Imm s).

Module UnOp.
  Parameter not : M.Val bool -> M (M.Val bool).
  Parameter neg : forall {A : Set}, M.Val A -> M (M.Val A).
End UnOp.

Module BinOp.
  Definition add (z1 z2 : M.Val Z) : M (M.Val Z) :=
    let* z1 := M.read z1 in
    let* z2 := M.read z2 in
    M.alloc (z1 + z2)%Z.

  Definition sub (z1 z2 : M.Val Z) : M (M.Val Z) :=
    let* z1 := M.read z1 in
    let* z2 := M.read z2 in
    M.alloc (z1 - z2)%Z.

  Parameter mul : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter div : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter rem : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter bit_xor : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter bit_and : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter bit_or : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter shl : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).
  Parameter shr : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val A).

  Parameter eq : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).
  Parameter ne : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).

  Definition lt (z1 z2 : M.Val Z) : M (M.Val bool.t) :=
    let* z1 := M.read z1 in
    let* z2 := M.read z2 in
    M.alloc (z1 <? z2).

  Parameter le : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).
  Parameter ge : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).
  Parameter gt : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).

  Parameter and : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).
  Parameter or : forall {A : Set}, M.Val A -> M.Val A -> M (M.Val bool.t).
End BinOp.
