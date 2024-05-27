Require Import CoqOfRust.CoqOfRust.

Import List.ListNotations.

Local Open Scope list.

Class ToTy (A : Set) : Set := {
  Φ : Ty.t;
}.
Arguments Φ _ {_}.

Class ToValue (A : Set) : Set := {
  φ : A -> Value.t;
}.

Global Instance BoolIsToValue : ToValue bool := {
  φ b := Value.Bool b;
}.

Global Instance ZIsToValue : ToValue Z := {
  φ z := Value.Integer z;
}.

Module TupleIsToTy.
  Global Instance I0 : ToTy unit := {
    Φ := Ty.tuple [];
  }.

  Global Instance I2 (A1 A2 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2) :
      ToTy (A1 * A2) := {
    Φ := Ty.tuple [Φ A1; Φ A2];
  }.

  Global Instance I3 (A1 A2 A3 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3) :
      ToTy (A1 * A2 * A3) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3];
  }.

  Global Instance I4 (A1 A2 A3 A4 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3)
      (_ : ToTy A4) :
      ToTy (A1 * A2 * A3 * A4) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3; Φ A4];
  }.

  Global Instance I5 (A1 A2 A3 A4 A5 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3)
      (_ : ToTy A4)
      (_ : ToTy A5) :
      ToTy (A1 * A2 * A3 * A4 * A5) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3; Φ A4; Φ A5];
  }.

  Global Instance I6 (A1 A2 A3 A4 A5 A6 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3)
      (_ : ToTy A4)
      (_ : ToTy A5)
      (_ : ToTy A6) :
      ToTy (A1 * A2 * A3 * A4 * A5 * A6) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3; Φ A4; Φ A5; Φ A6];
  }.

  Global Instance I7 (A1 A2 A3 A4 A5 A6 A7 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3)
      (_ : ToTy A4)
      (_ : ToTy A5)
      (_ : ToTy A6)
      (_ : ToTy A7) :
      ToTy (A1 * A2 * A3 * A4 * A5 * A6 * A7) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3; Φ A4; Φ A5; Φ A6; Φ A7];
  }.

  Global Instance I8 (A1 A2 A3 A4 A5 A6 A7 A8 : Set)
      (_ : ToTy A1)
      (_ : ToTy A2)
      (_ : ToTy A3)
      (_ : ToTy A4)
      (_ : ToTy A5)
      (_ : ToTy A6)
      (_ : ToTy A7)
      (_ : ToTy A8) :
      ToTy (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8) := {
    Φ := Ty.tuple [Φ A1; Φ A2; Φ A3; Φ A4; Φ A5; Φ A6; Φ A7; Φ A8];
  }.
End TupleIsToTy.

Module TupleIsToValue.
  Global Instance I0 : ToValue unit := {
    φ 'tt := Value.Tuple [];
  }.

  Global Instance I2 (A1 A2 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2) :
      ToValue (A1 * A2) := {
    φ '(x1, x2) := Value.Tuple [φ x1; φ x2];
  }.

  Global Instance I3 (A1 A2 A3 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3) :
      ToValue (A1 * A2 * A3) := {
    φ '(x1, x2, x3) :=
      Value.Tuple [φ x1; φ x2; φ x3];
  }.

  Global Instance I4 (A1 A2 A3 A4 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3)
      (_ : ToValue A4) :
      ToValue (A1 * A2 * A3 * A4) := {
    φ '(x1, x2, x3, x4) :=
      Value.Tuple [φ x1; φ x2; φ x3; φ x4];
  }.

  Global Instance I5 (A1 A2 A3 A4 A5 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3)
      (_ : ToValue A4)
      (_ : ToValue A5) :
      ToValue (A1 * A2 * A3 * A4 * A5) := {
    φ '(x1, x2, x3, x4, x5) :=
      Value.Tuple [φ x1; φ x2; φ x3; φ x4; φ x5];
  }.

  Global Instance I6 (A1 A2 A3 A4 A5 A6 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3)
      (_ : ToValue A4)
      (_ : ToValue A5)
      (_ : ToValue A6) :
      ToValue (A1 * A2 * A3 * A4 * A5 * A6) := {
    φ '(x1, x2, x3, x4, x5, x6) :=
      Value.Tuple [φ x1; φ x2; φ x3; φ x4; φ x5; φ x6];
  }.

  Global Instance I7 (A1 A2 A3 A4 A5 A6 A7 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3)
      (_ : ToValue A4)
      (_ : ToValue A5)
      (_ : ToValue A6)
      (_ : ToValue A7) :
      ToValue (A1 * A2 * A3 * A4 * A5 * A6 * A7) := {
    φ '(x1, x2, x3, x4, x5, x6, x7) :=
      Value.Tuple [φ x1; φ x2; φ x3; φ x4; φ x5; φ x6; φ x7];
  }.

  Global Instance I8 (A1 A2 A3 A4 A5 A6 A7 A8 : Set)
      (_ : ToValue A1)
      (_ : ToValue A2)
      (_ : ToValue A3)
      (_ : ToValue A4)
      (_ : ToValue A5)
      (_ : ToValue A6)
      (_ : ToValue A7)
      (_ : ToValue A8) :
      ToValue (A1 * A2 * A3 * A4 * A5 * A6 * A7 * A8) := {
    φ '(x1, x2, x3, x4, x5, x6, x7, x8) :=
      Value.Tuple [φ x1; φ x2; φ x3; φ x4; φ x5; φ x6; φ x7; φ x8];
  }.
End TupleIsToValue.

Module SubPointer.
  Module Runner.
    Record t (A Sub_A : Set) {H_A : ToValue A} {H_Sub_A : ToValue Sub_A} : Set := {
      index : Pointer.Index.t;
      projection : A -> option Sub_A;
      injection : A -> Sub_A -> option A;
    }.
    Arguments index {_ _ _ _}.
    Arguments projection {_ _ _ _}.
    Arguments injection {_ _ _ _}.
  End Runner.

  Definition get_sub
      {A Sub_A : Set} `{ToValue A} `{ToValue Sub_A}
      (mutable : Pointer.Mutable.t (A := A) Value.t φ)
      (runner : Runner.t A Sub_A) :
      Pointer.Mutable.t (A := Sub_A) Value.t φ :=
    Pointer.Mutable.get_sub
      mutable
      runner.(Runner.index)
      runner.(Runner.projection)
      runner.(Runner.injection)
      φ.
End SubPointer.

Module Ref.
  Inductive t (A : Set) {IsToValue : ToValue A} : Set :=
  | Immediate (value : A)
  | Mutable {Address Big_A : Set}
    (address : Address)
    (path : Pointer.Path.t)
    (big_to_value : Big_A -> Value.t)
    (projection : Big_A -> option A)
    (injection : Big_A -> A -> option Big_A).
  Arguments Immediate {_ _}.
  Arguments Mutable {_ _ _ _}.

  Global Instance IsToValue {A : Set} `{ToValue A} : ToValue (t A) := {
    φ r :=
      Value.Pointer match r with
      | Immediate value => Pointer.Immediate (φ value)
      | Mutable address path big_to_value projection injection =>
        Pointer.Mutable (Pointer.Mutable.Make (to_value := φ)
          address path big_to_value projection injection
        )
      end;
  }.
End Ref.

(* Module IsAlloc.
  Inductive t {A : Set} (to_value : A -> Value.t) (value : A) : Ref.t A -> Set :=
  | Immediate :
    t to_value value (Ref.Immediate to_value value)
  | Mutable {Address : Set} (address : Address) :
    t to_value value (Ref.Mutable
      address []
      to_value
      (fun state => Some state)
      (fun _ new_state => Some new_state)
      to_value
    ).
End IsAlloc.

Module IsRead.
  Inductive t {A : Set} (to_value : A -> Value.t) (value : A) : Ref.t A -> A -> Set :=
  | Immediate :
    IsRead.t to_value value (Ref.Immediate to_value value) value
  | Mutable {Address Big_A : Set}
    (address : Address)
    (path : Pointer.Path.t)
    (big_to_value : Big_A -> Value.t)
    (projection : Big_A -> option A)
    (injection : Big_A -> A -> option Big_A)
    (to_value' : A -> Value.t)
    (big_value : Big_A) :
    projection big_value = Some value ->
    IsRead.t to_value value (Ref.Mutable address path big_to_value projection injection to_value') big_value.
End IsRead. *)

Module Run.
  Reserved Notation "{{ e ⇓ output_to_value }}" (at level 70, no associativity).

  Inductive t {Output : Set} (output_to_value : Output -> Value.t + Exception.t) : M -> Set :=
  | Pure
      (output : Output)
      (output' : Value.t + Exception.t) :
    output' = output_to_value output ->
    {{ LowM.Pure output' ⇓ output_to_value }}
  | CallPrimitiveStateAlloc {A : Set} `{ToValue A}
      (value : A) (value' : Value.t)
      (k : Value.t -> M) :
    value' = φ value ->
    (forall (ref : Ref.t A),
      {{ k (φ ref) ⇓ output_to_value }}
     ) ->
    {{ LowM.CallPrimitive (Primitive.StateAlloc value') k ⇓ output_to_value }}
  | CallPrimitiveStateRead {Address Big_A A : Set}
      address path projection injection to_value
      (value : A) (value' : Value.t)
      (k : Value.t -> M) :
    let pointer :=
      Pointer.Make (Address := Address) (Big_A := Big_A) (A := A)
        address path projection injection to_value in
    value' = to_value value ->
    {{ k value' ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive (Primitive.StateRead pointer) k ⇓ output_to_value }}
  | CallPrimitiveStateWrite {Address Big_A A : Set}
      address path projection injection to_value
      (value : A) (value' : Value.t)
      (k : Value.t -> M) :
    let pointer :=
      Pointer.Make (Address := Address) (Big_A := Big_A) (A := A)
        address path projection injection to_value in
    value' = to_value value ->
    {{ k (Value.Tuple []) ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive (Primitive.StateWrite pointer value') k ⇓ output_to_value }}
  | CallPrimitiveGetSubPointer {Address Big_A A Sub_A : Set}
      address path projection injection to_value
      index sub_projection sub_injection sub_to_value
      (k : Value.t -> M) :
    let pointer :=
      Pointer.Make (Address := Address) (Big_A := Big_A) (A := A)
        address path projection injection to_value in
    let sub_pointer :=
      Pointer.Make (Address := Address) (Big_A := Big_A) (A := Sub_A)
        address (path ++ [index])
        (fun big_a =>
          match projection big_a with
          | Some a => sub_projection a
          | None => None
          end
        )
        (fun big_a new_sub_a =>
          match projection big_a with
          | Some a =>
            match sub_injection a new_sub_a with
            | Some new_a => injection big_a new_a
            | None => None
            end
          | None => None
          end
        )
        sub_to_value in
    (* Communtativity of the read *)
    (forall (a : A),
      Option.map (sub_projection a) sub_to_value =
      Value.read_path (to_value a) [index]
    ) ->
    (* Communtativity of the write *)
    (forall (a : A) (sub_a : Sub_A),
      Option.map (sub_injection a sub_a) to_value =
      Value.write_value (to_value a) [index] (sub_to_value sub_a)
    ) ->
    {{ k (Value.Pointer sub_pointer) ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive (Primitive.GetSubPointer pointer index) k ⇓ output_to_value }}
  | CallPrimitiveGetFunction
      (name : string) (generic_tys : list Ty.t)
      (function : list Ty.t -> list Value.t -> M)
      (k : Value.t -> M) :
    let closure := Value.Closure (existS (_, _) (function generic_tys)) in
    M.IsFunction name function ->
    {{ k closure ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive (Primitive.GetFunction name generic_tys) k ⇓ output_to_value }}
  | CallPrimitiveGetAssociatedFunction
      (ty : Ty.t) (name : string) (generic_tys : list Ty.t)
      (associated_function : list Ty.t -> list Value.t -> M)
      (k : Value.t -> M) :
    let closure := Value.Closure (existS (_, _) (associated_function generic_tys)) in
    M.IsAssociatedFunction ty name associated_function ->
    {{ k closure ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive
        (Primitive.GetAssociatedFunction ty name generic_tys) k ⇓
        output_to_value
    }}
  | CallPrimitiveGetTraitMethod
      (trait_name : string) (self_ty : Ty.t) (trait_tys : list Ty.t)
      (method_name : string) (generic_tys : list Ty.t)
      (method : list Ty.t -> list Value.t -> M)
      (k : Value.t -> M) :
    let closure := Value.Closure (existS (_, _) (method generic_tys)) in
    IsTraitMethod.t trait_name self_ty trait_tys method_name method ->
    {{ k closure ⇓ output_to_value }} ->
    {{ LowM.CallPrimitive
        (Primitive.GetTraitMethod
          trait_name
          self_ty
          trait_tys
          method_name
          generic_tys)
        k ⇓
        output_to_value
    }}
  | CallClosure {Output' : Set}
      (output_to_value' : Output' -> Value.t + Exception.t)
      (f : list Value.t -> M) (args : list Value.t)
      (k : Value.t + Exception.t -> M) :
    let closure := Value.Closure (existS (_, _) f) in
    {{ f args ⇓ output_to_value' }} ->
    (forall (value_inter : Output'),
      {{ k (output_to_value' value_inter) ⇓ output_to_value }}
    ) ->
    {{ LowM.CallClosure closure args k ⇓ output_to_value }}
  | Let {Output' : Set}
      (output_to_value' : Output' -> Value.t + Exception.t)
      (e : M) (k : Value.t + Exception.t -> M) :
    {{ e ⇓ output_to_value' }} ->
    (forall (value_inter : Output'),
      {{ k (output_to_value' value_inter) ⇓ output_to_value }}
    ) ->
    {{ LowM.Let e k ⇓ output_to_value }}
  | Rewrite (e e' : M) :
    e = e' ->
    {{ e' ⇓ output_to_value }} ->
    {{ e ⇓ output_to_value }}

  where "{{ e ⇓ output_to_value }}" :=
    (t output_to_value e).
End Run.

Import Run.

Module Primitive.
  Inductive t : Set -> Set :=
  | StateAlloc {A : Set} (value : A) : t (Ref.t A)
  | StateRead {A : Set} (ref : Ref.t A) : t A
  | StateWrite {A : Set} (ref : Ref.t A) (value : A) : t unit
  | GetSubPointer {A Sub_A : Set}
    (ref : Ref.t A) (runner : SubPointer.Runner.t A Sub_A) :
    t (Ref.t Sub_A).
End Primitive.

Module LowM.
  Inductive t (Output : Set) : Set :=
  | Pure (value : Output)
  | CallPrimitive {A : Set} (primitive : Primitive.t A) (k : A -> t Output)
  | CallClosure {A B : Set} (closure : A -> t B) (args : A) (k : B -> t Output)
  | Let {A : Set} (e : t A) (k : A -> t Output)
  | Loop {A : Set} (body : t A) (k : A -> t Output).
  Arguments Pure {_}.
  Arguments CallPrimitive {_}.
  Arguments CallClosure {_}.
  Arguments Let {_}.
  Arguments Loop {_}.
End LowM.

(* We do not define an equivalent of [M] as the resulting term is generated, so we are not
   interested into having syntactic sugar for the error monad. *)

Fixpoint evaluate {Output : Set}
  {e : M} {output_to_value : Output -> Value.t + Exception.t}
  (run : {{ e ⇓ output_to_value }}) :
  LowM.t Output.
Proof.
  destruct run; try exact (evaluate _ _ _ run).
  { exact (LowM.Pure output). }
  { eapply LowM.Let. {
      exact (evaluate _ _ _ run).
    }
    intros output'; eapply evaluate.
    match goal with
    | H : forall _ : Output', _ |- _ => apply (H output')
    end.
  }
  { eapply LowM.Let. {
      exact (evaluate _ _ _ run).
    }
    intros output'; eapply evaluate.
    match goal with
    | H : forall _ : Output', _ |- _ => apply (H output')
    end.
  }
Defined.
