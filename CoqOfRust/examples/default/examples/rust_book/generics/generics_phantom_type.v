(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "PhantomTuple";
    ty_params := [ "A"; "B" ];
    fields := [ A; Ty.apply (Ty.path "core::marker::PhantomData") [ B ] ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ].
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (Self A B)
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomTuple_A_B.

Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_where_core_cmp_PartialEq_B_for_generics_phantom_type_PhantomTuple_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomTuple") [ A; B ].
  
  (* PartialEq *)
  Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A B in
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        LogicalOp.and (|
          M.call_closure (|
            M.get_trait_method (| "core::cmp::PartialEq", A, [ A ], "eq", [] |),
            [
              M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "generics_phantom_type::PhantomTuple",
                0
              |);
              M.SubPointer.get_struct_tuple_field (|
                M.read (| other |),
                "generics_phantom_type::PhantomTuple",
                0
              |)
            ]
          |),
          ltac:(M.monadic
            (M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "core::marker::PhantomData") [ B ],
                [ Ty.apply (Ty.path "core::marker::PhantomData") [ B ] ],
                "eq",
                []
              |),
              [
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "generics_phantom_type::PhantomTuple",
                  1
                |);
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| other |),
                  "generics_phantom_type::PhantomTuple",
                  1
                |)
              ]
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (Self A B)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method (eq A B)) ].
End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_where_core_cmp_PartialEq_B_for_generics_phantom_type_PhantomTuple_A_B.

(* StructRecord
  {
    name := "PhantomStruct";
    ty_params := [ "A"; "B" ];
    fields := [ ("first", A); ("phantom", Ty.apply (Ty.path "core::marker::PhantomData") [ B ]) ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ].
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      (Self A B)
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_generics_phantom_type_PhantomStruct_A_B.

Module Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_where_core_cmp_PartialEq_B_for_generics_phantom_type_PhantomStruct_A_B.
  Definition Self (A B : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type::PhantomStruct") [ A; B ].
  
  (* PartialEq *)
  Definition eq (A B : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self A B in
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        LogicalOp.and (|
          M.call_closure (|
            M.get_trait_method (| "core::cmp::PartialEq", A, [ A ], "eq", [] |),
            [
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "generics_phantom_type::PhantomStruct",
                "first"
              |);
              M.SubPointer.get_struct_record_field (|
                M.read (| other |),
                "generics_phantom_type::PhantomStruct",
                "first"
              |)
            ]
          |),
          ltac:(M.monadic
            (M.call_closure (|
              M.get_trait_method (|
                "core::cmp::PartialEq",
                Ty.apply (Ty.path "core::marker::PhantomData") [ B ],
                [ Ty.apply (Ty.path "core::marker::PhantomData") [ B ] ],
                "eq",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "generics_phantom_type::PhantomStruct",
                  "phantom"
                |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| other |),
                  "generics_phantom_type::PhantomStruct",
                  "phantom"
                |)
              ]
            |)))
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (A B : Ty.t),
    M.IsTraitInstance
      "core::cmp::PartialEq"
      (Self A B)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method (eq A B)) ].
End Impl_core_cmp_PartialEq_where_core_cmp_PartialEq_A_where_core_cmp_PartialEq_B_for_generics_phantom_type_PhantomStruct_A_B.

(*
fn main() {
    // Here, `f32` and `f64` are the hidden parameters.
    // PhantomTuple type specified as `<char, f32>`.
    let _tuple1: PhantomTuple<char, f32> = PhantomTuple('Q', PhantomData);
    // PhantomTuple type specified as `<char, f64>`.
    let _tuple2: PhantomTuple<char, f64> = PhantomTuple('Q', PhantomData);

    // Type specified as `<char, f32>`.
    let _struct1: PhantomStruct<char, f32> = PhantomStruct {
        first: 'Q',
        phantom: PhantomData,
    };
    // Type specified as `<char, f64>`.
    let _struct2: PhantomStruct<char, f64> = PhantomStruct {
        first: 'Q',
        phantom: PhantomData,
    };

    // Compile-time Error! Type mismatch so these cannot be compared:
    // println!("_tuple1 == _tuple2 yields: {}",
    //           _tuple1 == _tuple2);

    // Compile-time Error! Type mismatch so these cannot be compared:
    // println!("_struct1 == _struct2 yields: {}",
    //           _struct1 == _struct2);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _tuple1 :=
          M.alloc (|
            Value.StructTuple
              "generics_phantom_type::PhantomTuple"
              [ Value.UnicodeChar 81; Value.StructTuple "core::marker::PhantomData" [] ]
          |) in
        let _tuple2 :=
          M.alloc (|
            Value.StructTuple
              "generics_phantom_type::PhantomTuple"
              [ Value.UnicodeChar 81; Value.StructTuple "core::marker::PhantomData" [] ]
          |) in
        let _struct1 :=
          M.alloc (|
            Value.StructRecord
              "generics_phantom_type::PhantomStruct"
              [
                ("first", Value.UnicodeChar 81);
                ("phantom", Value.StructTuple "core::marker::PhantomData" [])
              ]
          |) in
        let _struct2 :=
          M.alloc (|
            Value.StructRecord
              "generics_phantom_type::PhantomStruct"
              [
                ("first", Value.UnicodeChar 81);
                ("phantom", Value.StructTuple "core::marker::PhantomData" [])
              ]
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "generics_phantom_type::main" main.
