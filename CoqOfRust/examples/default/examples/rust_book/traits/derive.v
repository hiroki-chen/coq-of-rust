(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Centimeters";
    ty_params := [];
    fields := [ Ty.path "f64" ];
  } *)

Module Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::marker::StructuralPartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_marker_StructuralPartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialEq_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  (* PartialEq *)
  Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        BinOp.Pure.eq
          (M.read (|
            M.SubPointer.get_struct_tuple_field (| M.read (| self |), "derive::Centimeters", 0 |)
          |))
          (M.read (|
            M.SubPointer.get_struct_tuple_field (| M.read (| other |), "derive::Centimeters", 0 |)
          |))))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialEq"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("eq", InstanceField.Method eq) ].
End Impl_core_cmp_PartialEq_for_derive_Centimeters.

Module Impl_core_cmp_PartialOrd_for_derive_Centimeters.
  Definition Self : Ty.t := Ty.path "derive::Centimeters".
  
  (* PartialOrd *)
  Definition partial_cmp (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; other ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let other := M.alloc (| other |) in
        M.call_closure (|
          M.get_trait_method (|
            "core::cmp::PartialOrd",
            Ty.path "f64",
            [ Ty.path "f64" ],
            "partial_cmp",
            []
          |),
          [
            M.SubPointer.get_struct_tuple_field (| M.read (| self |), "derive::Centimeters", 0 |);
            M.SubPointer.get_struct_tuple_field (| M.read (| other |), "derive::Centimeters", 0 |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::cmp::PartialOrd"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("partial_cmp", InstanceField.Method partial_cmp) ].
End Impl_core_cmp_PartialOrd_for_derive_Centimeters.

(* StructTuple
  {
    name := "Inches";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_derive_Inches.
  Definition Self : Ty.t := Ty.path "derive::Inches".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (|
            Ty.path "core::fmt::Formatter",
            "debug_tuple_field1_finish",
            []
          |),
          [
            M.read (| f |);
            M.read (| Value.String "Inches" |);
            (* Unsize *)
            M.pointer_coercion
              (M.alloc (|
                M.SubPointer.get_struct_tuple_field (| M.read (| self |), "derive::Inches", 0 |)
              |))
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_derive_Inches.

Module Impl_derive_Inches.
  Definition Self : Ty.t := Ty.path "derive::Inches".
  
  (*
      fn to_centimeters(&self) -> Centimeters {
          let &Inches(inches) = self;
  
          Centimeters(inches as f64 * 2.54)
      }
  *)
  Definition to_centimeters (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            self,
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.read (| γ |) in
                  let γ1_0 := M.SubPointer.get_struct_tuple_field (| γ, "derive::Inches", 0 |) in
                  let inches := M.copy (| γ1_0 |) in
                  M.alloc (|
                    Value.StructTuple
                      "derive::Centimeters"
                      [
                        BinOp.Panic.mul (|
                          Integer.Usize,
                          M.rust_cast (M.read (| inches |)),
                          M.read (| UnsupportedLiteral |)
                        |)
                      ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_centimeters :
    M.IsAssociatedFunction Self "to_centimeters" to_centimeters.
End Impl_derive_Inches.

(* StructTuple
  {
    name := "Seconds";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

(*
fn main() {
    let _one_second = Seconds(1);

    // Error: `Seconds` can't be printed; it doesn't implement the `Debug` trait
    //println!("One second looks like: {:?}", _one_second);
    // TODO ^ Try uncommenting this line

    // Error: `Seconds` can't be compared; it doesn't implement the `PartialEq` trait
    //let _this_is_true = (_one_second == _one_second);
    // TODO ^ Try uncommenting this line

    let foot = Inches(12);

    println!("One foot equals {:?}", foot);

    let meter = Centimeters(100.0);

    let cmp = if foot.to_centimeters() < meter {
        "smaller"
    } else {
        "bigger"
    };

    println!("One foot is {} than one meter.", cmp);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _one_second := M.alloc (| Value.StructTuple "derive::Seconds" [ Value.Integer 1 ] |) in
        let foot := M.alloc (| Value.StructTuple "derive::Inches" [ Value.Integer 12 ] |) in
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
                              M.read (| Value.String "One foot equals " |);
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
                                  "new_debug",
                                  [ Ty.path "derive::Inches" ]
                                |),
                                [ foot ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        let meter :=
          M.alloc (|
            Value.StructTuple "derive::Centimeters" [ M.read (| UnsupportedLiteral |) ]
          |) in
        let cmp :=
          M.copy (|
            M.match_operator (|
              M.alloc (| Value.Tuple [] |),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ :=
                      M.use
                        (M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::cmp::PartialOrd",
                              Ty.path "derive::Centimeters",
                              [ Ty.path "derive::Centimeters" ],
                              "lt",
                              []
                            |),
                            [
                              M.alloc (|
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "derive::Inches",
                                    "to_centimeters",
                                    []
                                  |),
                                  [ foot ]
                                |)
                              |);
                              meter
                            ]
                          |)
                        |)) in
                    let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                    Value.String "smaller"));
                fun γ => ltac:(M.monadic (M.alloc (| M.read (| Value.String "bigger" |) |)))
              ]
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
                              M.read (| Value.String "One foot is " |);
                              M.read (| Value.String " than one meter.
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
                                [ cmp ]
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
