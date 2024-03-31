(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Inch *)
(* {
  ty_params := [];
  variants := [];
} *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Inch.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Inch".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := M.match_operator α0 [] in let* α2 := M.read α1 in M.never_to_any α2
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
  
  (*
  Clone
  *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] => let* self := M.alloc self in let* α0 := M.read self in M.read α0
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

(* Enum Mm *)
(* {
  ty_params := [];
  variants := [];
} *)

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Mm.
  Definition Self : Ty.t := Ty.path "generics_phantom_type_test_case_unit_clarification::Mm".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read self in
      let* α1 := M.match_operator α0 [] in let* α2 := M.read α1 in M.never_to_any α2
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
  
  (*
  Clone
  *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] => let* self := M.alloc self in let* α0 := M.read self in M.read α0
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

Module Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (*
  Debug
  *)
  Definition fmt (Unit : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self Unit in
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function (Ty.path "core::fmt::Formatter") "debug_tuple_field2_finish" [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Length") in
      let* α4 :=
        (* Unsize *)
          let* α3 := M.read self in
          M.pure
            (M.pointer_coercion
              (M.get_struct_tuple_field
                α3
                "generics_phantom_type_test_case_unit_clarification::Length"
                0)) in
      let* α7 :=
        (* Unsize *)
          let* α5 := M.read self in
          let* α6 :=
            M.alloc
              (M.get_struct_tuple_field
                α5
                "generics_phantom_type_test_case_unit_clarification::Length"
                1) in
          M.pure (M.pointer_coercion α6) in
      M.call_closure α0 [ α1; α2; α4; α7 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt Unit)) ].
End Impl_core_fmt_Debug_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (*
  Clone
  *)
  Definition clone (Unit : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self Unit in
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.get_trait_method "core::clone::Clone" (Ty.path "f64") [] "clone" [] in
      let* α1 := M.read self in
      let* α2 :=
        M.call_closure
          α0
          [
            M.get_struct_tuple_field
              α1
              "generics_phantom_type_test_case_unit_clarification::Length"
              0
          ] in
      let* α3 :=
        M.get_trait_method
          "core::clone::Clone"
          (Ty.apply (Ty.path "core::marker::PhantomData") [ Unit ])
          []
          "clone"
          [] in
      let* α4 := M.read self in
      let* α5 :=
        M.call_closure
          α3
          [
            M.get_struct_tuple_field
              α4
              "generics_phantom_type_test_case_unit_clarification::Length"
              1
          ] in
      M.pure
        (Value.StructTuple "generics_phantom_type_test_case_unit_clarification::Length" [ α2; α5 ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::clone::Clone"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method (clone Unit)) ].
End Impl_core_clone_Clone_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  Axiom Implements :
    forall (Unit : Ty.t),
    M.IsTraitInstance
      "core::marker::Copy"
      (Self Unit)
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_Copy_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.

Module Impl_core_ops_arith_Add_for_generics_phantom_type_test_case_unit_clarification_Length_Unit.
  Definition Self (Unit : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_phantom_type_test_case_unit_clarification::Length") [ Unit ].
  
  (*
      type Output = Length<Unit>;
  *)
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
      let* self := M.alloc self in
      let* rhs := M.alloc rhs in
      let* α0 :=
        M.read
          (M.get_struct_tuple_field
            self
            "generics_phantom_type_test_case_unit_clarification::Length"
            0) in
      let* α1 :=
        M.read
          (M.get_struct_tuple_field
            rhs
            "generics_phantom_type_test_case_unit_clarification::Length"
            0) in
      let* α2 := BinOp.Panic.add α0 α1 in
      M.pure
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α2; Value.StructTuple "core::marker::PhantomData" [] ])
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
    let* one_foot :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α0; Value.StructTuple "core::marker::PhantomData" [] ]) in
    let* one_meter :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc
        (Value.StructTuple
          "generics_phantom_type_test_case_unit_clarification::Length"
          [ α0; Value.StructTuple "core::marker::PhantomData" [] ]) in
    let* two_feet :=
      let* α0 :=
        M.get_trait_method
          "core::ops::arith::Add"
          (Ty.apply
            (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
            [ Ty.path "generics_phantom_type_test_case_unit_clarification::Inch" ])
          [
            Ty.apply
              (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
              [ Ty.path "generics_phantom_type_test_case_unit_clarification::Inch" ]
          ]
          "add"
          [] in
      let* α1 := M.read one_foot in
      let* α2 := M.read one_foot in let* α3 := M.call_closure α0 [ α1; α2 ] in M.alloc α3 in
    let* two_meters :=
      let* α0 :=
        M.get_trait_method
          "core::ops::arith::Add"
          (Ty.apply
            (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
            [ Ty.path "generics_phantom_type_test_case_unit_clarification::Mm" ])
          [
            Ty.apply
              (Ty.path "generics_phantom_type_test_case_unit_clarification::Length")
              [ Ty.path "generics_phantom_type_test_case_unit_clarification::Mm" ]
          ]
          "add"
          [] in
      let* α1 := M.read one_meter in
      let* α2 := M.read one_meter in let* α3 := M.call_closure α0 [ α1; α2 ] in M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "one foot + one_foot = ") in
            let* α3 := M.read (mk_str " in
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.path "f64" ] in
            let* α7 :=
              M.call_closure
                α6
                [
                  M.get_struct_tuple_field
                    two_feet
                    "generics_phantom_type_test_case_unit_clarification::Length"
                    0
                ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "one meter + one_meter = ") in
            let* α3 := M.read (mk_str " mm
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.path "f64" ] in
            let* α7 :=
              M.call_closure
                α6
                [
                  M.get_struct_tuple_field
                    two_meters
                    "generics_phantom_type_test_case_unit_clarification::Length"
                    0
                ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
