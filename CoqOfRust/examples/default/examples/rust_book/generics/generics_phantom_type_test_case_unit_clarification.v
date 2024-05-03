(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Inch
{
  ty_params := [];
  variants := [];
}
*)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.never_to_any (| M.read (| M.match_operator (| M.read (| self |), [] |) |) |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (| M.read (| self |) |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Inch.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Inch.

(*
Enum Mm
{
  ty_params := [];
  variants := [];
}
*)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.never_to_any (| M.read (| M.match_operator (| M.read (| self |), [] |) |) |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (| M.read (| self |) |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Mm.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  Axiom Implements :
    M.IsTraitInstance "core::marker::Copy" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Mm.

(* StructTuple
  {
    name := "Length";
    ty_params := [ "Unit" ];
    fields := [ Ty.path "f64"; Ty.apply (Ty.path "core::marker::PhantomData") [ Unit ] ];
  } *)

Module Impl_core_fmt_Debug_where_core_fmt_Debug_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (* Debug *)
  Definition fmt (Unit : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self Unit in
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field2_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Length" |);
            (* Unsize *)
            M.pointer_coercion
              (M.SubPointer.get_struct_tuple_field (|
                M.read (| self |),
                "generics_phantom_type_test_case_unit_clarification::Length",
                0
              |));
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "generics_phantom_type_test_case_unit_clarification::Length",
                  1
                |)
              |))
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt Unit)) ].
End Impl_core_fmt_Debug_where_core_fmt_Debug_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_clone_Clone_where_core_clone_Clone_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (* Clone *)
  Definition clone (Unit : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self Unit in
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [
            M.call_closure (|
              M.get_trait_method (| "core::clone::Clone", Ty.path "f64", [], "clone", [] |),
              [
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "generics_phantom_type_test_case_unit_clarification::Length",
                  0
                |)
              ]
            |);
            M.call_closure (|
              M.get_trait_method (|
                "core::clone::Clone",
                Ty.apply (Ty.path "core::marker::PhantomData") [ Unit ],
                [],
                "clone",
                []
              |),
              [
                M.SubPointer.get_struct_tuple_field (|
                  M.read (| self |),
                  "generics_phantom_type_test_case_unit_clarification::Length",
                  1
                |)
              ]
            |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::clone::Clone"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method (clone Unit)) ].
End Impl_core_clone_Clone_where_core_clone_Clone_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_marker_Copy_where_core_marker_Copy_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::marker::Copy"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_where_core_marker_Copy_Unit_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (*     type Output = Length<Unit>; *)
  Definition _Output (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (*
      fn add(self, rhs: Length<Unit>) -> Length<Unit> {
          // `+` calls the `Add` implementation for `f64`.
          Length(self.0 + rhs.0, PhantomData)
      }
  *)
  Definition add (Unit : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self Unit in
    match τ, α with
    | [], [ self; rhs ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let rhs := M.alloc (| rhs |) in
        Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [
            BinOp.Panic.add (|
              M.read (|
                M.SubPointer.get_struct_tuple_field (|
                  self,
                  "generics_phantom_type_test_case_unit_clarification::Length",
                  0
                |)
              |),
              M.read (|
                M.SubPointer.get_struct_tuple_field (|
                  rhs,
                  "generics_phantom_type_test_case_unit_clarification::Length",
                  0
                |)
              |)
            |);
            Value.StructTuple "core::marker::PhantomData" []
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::ops::arith::Add"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *)
      [ ("Output", InstanceField.Ty (_Output Unit)); ("add", InstanceField.Method (add Unit)) ].
End Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

(*
fn main() {
    // Specifies `one_foot` to have phantom type parameter `Inch`.
    let one_foot: Length<Inch> = Length(12.0, PhantomData);
    // `one_meter` has phantom type parameter `Mm`.
    let one_meter: Length<Mm> = Length(1000.0, PhantomData);

    // `+` calls the `add()` method we implemented for `Length<Unit>`.
    //
    // Since `Length` implements `Copy`, `add()` does not consume
    // `one_foot` and `one_meter` but copies them into `self` and `rhs`.
    let two_feet = one_foot + one_foot;
    let two_meters = one_meter + one_meter;

    // Addition works.
    println!("one foot + one_foot = {:?} in", two_feet.0);
    println!("one meter + one_meter = {:?} mm", two_meters.0);

    // Nonsensical operations fail as they should:
    // Compile-time Error: type mismatch.
    //let one_feter = one_foot + one_meter;
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let one_foot :=
          M.alloc (|
            Value.StructTuple
              "generics_phantom_type_test_case_unit_clarification::Length"
              [ M.read (| UnsupportedLiteral |); Value.StructTuple "core::marker::PhantomData" [] ]
          |) in
        let one_meter :=
          M.alloc (|
            Value.StructTuple
              "generics_phantom_type_test_case_unit_clarification::Length"
              [ M.read (| UnsupportedLiteral |); Value.StructTuple "core::marker::PhantomData" [] ]
          |) in
        let two_feet :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::arith::Add",
                Ty.apply
                  (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
                  [ Ty.path "generics_phantom_type_test_case_unit_clarification::Inch" ],
                [
                  Ty.apply
                    (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
                    [ Ty.path "generics_phantom_type_test_case_unit_clarification::Inch" ]
                ],
                "add",
                []
              |),
              [ M.read (| one_foot |); M.read (| one_foot |) ]
            |)
          |) in
        let two_meters :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::arith::Add",
                Ty.apply
                  (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
                  [ Ty.path "generics_phantom_type_test_case_unit_clarification::Mm" ],
                [
                  Ty.apply
                    (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
                    [ Ty.path "generics_phantom_type_test_case_unit_clarification::Mm" ]
                ],
                "add",
                []
              |),
              [ M.read (| one_meter |); M.read (| one_meter |) ]
            |)
          |) in
        let _ :=
          let _ :=
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
                            [
                              M.read (| Value.String "one foot + one_foot = " |);
                              M.read (| Value.String " in
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
                                  "new_debug",
                                  [ Ty.path "f64" ]
                                |),
                                [
                                  M.SubPointer.get_struct_tuple_field (|
                                    two_feet,
                                    "generics_phantom_type_test_case_unit_clarification::Length",
                                    0
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
        let _ :=
          let _ :=
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
                            [
                              M.read (| Value.String "one meter + one_meter = " |);
                              M.read (| Value.String " mm
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
                                  "new_debug",
                                  [ Ty.path "f64" ]
                                |),
                                [
                                  M.SubPointer.get_struct_tuple_field (|
                                    two_meters,
                                    "generics_phantom_type_test_case_unit_clarification::Length",
                                    0
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
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
