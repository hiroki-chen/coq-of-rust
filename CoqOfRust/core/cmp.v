Require Import CoqOfRust.lib.lib.

Require CoqOfRust.core.option.
Require Import CoqOfRust.core.marker.

(* ********STRUCTS******** *)
(* [x] Reverse *)
(* pub struct Reverse<T>(pub T); *)
Module Reverse.
  Record t (T : Set) : Set := { _1 : T }.
End Reverse.
Definition Reverse := Reverse.t.

(* ********ENUMS******** *)
(* 
[x] Ordering
*)
Module Ordering.
  Inductive t : Set :=
  | Less : t
  | Greater : t
  | Equal : t.
End Ordering.
Definition Ordering : Set :=
  M.Val Ordering.t.

(* ********TRAITS******** *)
(* 
Traits
[x] Eq
[x] Ord
[x] PartialEq
[x] PartialOrd
*)
Module PartialEq.
  Module Required.
    Class Trait (Self : Set) {Rhs : Set} : Set := {
      Rhs := Rhs;
      eq : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
      ne : option (M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool));
    }.
  End Required.

  Module Provided.
    Definition ne {Self Rhs : Set}
        {H0 : Required.Trait Self (Rhs := Rhs)} :
        M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool) :=
      match Required.ne with
      | Datatypes.Some ne => ne
      | Datatypes.None => fun self other =>
        let* is_eq := Required.eq self other in
        let* is_eq := M.read is_eq in
        M.alloc (negb is_eq)
      end.
  End Provided.

  Class Trait (Self : Set) {Rhs : Set} : Set := {
    Rhs := Rhs;
    eq : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
    ne : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
  }.

  Global Instance From_Required (Self Rhs : Set)
      {H0 : Required.Trait Self (Rhs := Rhs)} :
      Trait Self (Rhs := Rhs) := {
    eq := Required.eq;
    ne := Provided.ne;
  }.

  Module Default.
    Definition Rhs (Self : Set) : Set := Self.
  End Default.

  Global Instance Method_eq `(Trait) : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  Global Instance Method_ne `(Trait) : Notation.Dot "ne" := {
    Notation.dot x y :=
      let* is_eq := eq x y in
      let* is_eq := M.read is_eq in
      M.pure (negb is_eq);
  }.

  Module Instances.
    Global Instance I_bool : Trait bool (Rhs := bool).
    Admitted.

    Global Instance I_char : Trait char (Rhs := char).
    Admitted.

    Global Instance I_f32 : Trait f32 (Rhs := f32).
    Admitted.

    Global Instance I_f64 : Trait f64 (Rhs := f64).
    Admitted.

    Global Instance I_i8 : Trait i8 (Rhs := i8).
    Admitted.

    Global Instance I_i16 : Trait i16 (Rhs := i16).
    Admitted.

    Global Instance I_i32 : Trait i32 (Rhs := i32).
    Admitted.

    Global Instance I_i64 : Trait i64 (Rhs := i64).
    Admitted.

    Global Instance I_i128 : Trait i128 (Rhs := i128).
    Admitted.

    Global Instance I_isize : Trait isize (Rhs := isize).
    Admitted.

    Global Instance I_never : Trait never.t (Rhs := never.t).
    Admitted.

    Global Instance I_str : Trait str (Rhs := str).
    Admitted.

    Global Instance I_u8 : Trait u8 (Rhs := u8).
    Admitted.

    Global Instance I_u16 : Trait u16 (Rhs := u16).
    Admitted.

    Global Instance I_u32 : Trait u32 (Rhs := u32).
    Admitted.

    Global Instance I_u64 : Trait u64 (Rhs := u64).
    Admitted.

    Global Instance I_u128 : Trait u128.t (Rhs := u128.t).
    Admitted.

    Global Instance I_unit : Trait unit (Rhs := unit).
    Admitted.

    Global Instance I_usize : Trait usize (Rhs := usize).
    Admitted.

    Global Instance I_ref_ref {A B : Set} :
      Trait A (Rhs := B) -> Trait (ref A) (Rhs := ref B).
    Admitted.
  End Instances.
End PartialEq.

Module PartialOrd.
  Module Required.
    Class Trait (Self : Set) {Rhs : Set} : Set := {
      Rhs := Rhs;
      partial_cmp : M.Val (ref Self) -> M.Val (ref Rhs) -> M (core.option.Option Ordering.t);
      lt : Datatypes.option (M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool));
      le : Datatypes.option (M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool));
      gt : Datatypes.option (M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool));
      ge : Datatypes.option (M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool));
    }.
  End Required.

  Class Trait (Self : Set) {Rhs : Set} : Set := {
    Rhs := Rhs;
    partial_cmp : M.Val (ref Self) -> M.Val (ref Rhs) -> M (core.option.Option Ordering.t);
    lt : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
    le : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
    gt : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
    ge : M.Val (ref Self) -> M.Val (ref Rhs) -> M (M.Val bool);
  }.

  Global Instance From_Required (Self Rhs : Set)
      {H0 : Required.Trait Self (Rhs := Rhs)} :
      Trait Self (Rhs := Rhs) := {
    partial_cmp := Required.partial_cmp;
    lt :=
      match Required.lt with
      | Datatypes.Some lt => lt
      | Datatypes.None => fun self other =>
        let* cmp := Required.partial_cmp self other in
        let* cmp := M.read cmp in
        match cmp with
        | core.option.Option.Some ordering =>
          match ordering with
          | Ordering.Less => M.alloc true
          | _ => M.alloc false
          end
        | _ => M.alloc false
        end
      end;
    le :=
      match Required.lt with
      | Datatypes.Some lt => lt
      | Datatypes.None => fun self other =>
        let* cmp := Required.partial_cmp self other in
        let* cmp := M.read cmp in
        match cmp with
        | core.option.Option.Some ordering =>
          match ordering with
          | Ordering.Less | Ordering.Equal => M.alloc true
          | _ => M.alloc false
          end
        | _ => M.alloc false
        end
      end;
    gt :=
      match Required.lt with
      | Datatypes.Some lt => lt
      | Datatypes.None => fun self other =>
        let* cmp := Required.partial_cmp self other in
        let* cmp := M.read cmp in
        match cmp with
        | core.option.Option.Some ordering =>
          match ordering with
          | Ordering.Greater => M.alloc true
          | _ => M.alloc false
          end
        | _ => M.alloc false
        end
      end;
    ge :=
      match Required.lt with
      | Datatypes.Some lt => lt
      | Datatypes.None => fun self other =>
        let* cmp := Required.partial_cmp self other in
        let* cmp := M.read cmp in
        match cmp with
        | core.option.Option.Some ordering =>
          match ordering with
          | Ordering.Greater | Ordering.Equal => M.alloc true
          | _ => M.alloc false
          end
        | _ => M.alloc false
        end
      end;
  }.

  Module Default.
    Definition Rhs (Self : Set) : Set := Self.
  End Default.

  Module Instances.
    Global Instance I_bool : Trait bool (Rhs := bool).
    Admitted.

    Global Instance I_char : Trait char (Rhs := char).
    Admitted.

    Global Instance I_f32 : Trait f32 (Rhs := f32).
    Admitted.

    Global Instance I_f64 : Trait f64 (Rhs := f64).
    Admitted.

    Global Instance I_i8 : Trait i8 (Rhs := i8).
    Admitted.

    Global Instance I_i16 : Trait i16 (Rhs := i16).
    Admitted.

    Global Instance I_i32 : Trait i32 (Rhs := i32).
    Admitted.

    Global Instance I_i64 : Trait i64 (Rhs := i64).
    Admitted.

    Global Instance I_i128 : Trait i128 (Rhs := i128).
    Admitted.

    Global Instance I_isize : Trait isize (Rhs := isize).
    Admitted.

    Global Instance I_never : Trait never.t (Rhs := never.t).
    Admitted.

    Global Instance I_str : Trait str (Rhs := str).
    Admitted.

    Global Instance I_u8 : Trait u8 (Rhs := u8).
    Admitted.

    Global Instance I_u16 : Trait u16 (Rhs := u16).
    Admitted.

    Global Instance I_u32 : Trait u32 (Rhs := u32).
    Admitted.

    Global Instance I_u64 : Trait u64 (Rhs := u64).
    Admitted.

    Global Instance I_u128 : Trait u128.t (Rhs := u128.t).
    Admitted.

    Global Instance I_unit : Trait unit (Rhs := unit).
    Admitted.

    Global Instance I_usize : Trait usize (Rhs := usize).
    Admitted.

    Global Instance I_ref_ref {A B : Set} :
      Trait A (Rhs := B) -> Trait (ref A) (Rhs := ref B).
    Admitted.
  End Instances.
End PartialOrd.

(* 
pub trait Eq: PartialEq<Self> { }
 *)
Module Eq.
  Module Required.
    Unset Primitive Projections.
    Class Trait (Self : Set) : Set := {
      L0 :: PartialEq.Trait Self (Rhs := PartialEq.Default.Rhs Self);
      assert_receiver_is_total_eq :
        Datatypes.option (M.Val (ref Self) -> M (M.Val unit));
    }.
    Global Set Primitive Projections.
  End Required.

  Module Provided.
    Definition assert_receiver_is_total_eq {Self : Set}
        {H0 : Required.Trait Self} :
        M.Val (ref Self) -> M (M.Val unit) :=
      match Required.assert_receiver_is_total_eq with
      | Datatypes.Some assert_receiver_is_total_eq =>
        assert_receiver_is_total_eq
      | Datatypes.None => fun _ => M.alloc tt
      end.
  End Provided.

  Unset Primitive Projections.
  Class Trait (Self : Set) : Set := {
    L0 :: PartialEq.Trait Self (Rhs := PartialEq.Default.Rhs Self);
    assert_receiver_is_total_eq : M.Val (ref Self) -> M (M.Val unit);
  }.
  Global Set Primitive Projections.

  #[refine]
  Global Instance From_Required (Self : Set)
      {H0 : Required.Trait Self} :
      Trait Self := {
    assert_receiver_is_total_eq := Provided.assert_receiver_is_total_eq;
  }.
    match goal with H : _ |- _ => apply H end.
  Defined.

  Module Impl_Eq_for_str.
    Global Instance I : Required.Trait str := {
      assert_receiver_is_total_eq := Datatypes.None;
    }.
  End Impl_Eq_for_str.
End Eq.

(* 
pub trait Ord: Eq + PartialOrd<Self> {
    // Required method
    fn cmp(&self, other: &Self) -> Ordering;

    // Provided methods
    fn max(self, other: Self) -> Self
       where Self: Sized { ... }
    fn min(self, other: Self) -> Self
       where Self: Sized { ... }
    fn clamp(self, min: Self, max: Self) -> Self
       where Self: Sized + PartialOrd<Self> { ... }
}
*)
Module Ord.
  Class Trait (Self : Set) := {
    _ :: Eq.Trait Self;
    _ :: PartialOrd.Trait Self (Rhs := Self);
    cmp : ref Self -> ref Self -> M Ordering;
  }.

  Module Impl_Ord_for_str.
    Global Instance I : Trait str. Admitted.
  End Impl_Ord_for_str.
End Ord.

(* ********FUNCTIONS******** *)
(* 
[ ] max
[ ] max_by
[ ] max_by_key
[ ] min
[ ] min_by
[ ] min_by_key
*)
