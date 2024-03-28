(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Borrowed";
    ty_params := [];
    fields := [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ];
  } *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_structs::Borrowed".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Borrowed") in
      let* α3 := M.read self in
      let* α4 :=
        M.alloc
          (M.get_struct_tuple_field
            α3
            "scoping_rules_lifetimes_structs::Borrowed"
            0) in
      M.call_closure α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Borrowed.

(* StructRecord
  {
    name := "NamedBorrowed";
    ty_params := [];
    fields :=
      [
        ("x", Ty.apply (Ty.path "&") [ Ty.path "i32" ]);
        ("y", Ty.apply (Ty.path "&") [ Ty.path "i32" ])
      ];
  } *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.
  Definition Self : Ty.t :=
    Ty.path "scoping_rules_lifetimes_structs::NamedBorrowed".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_struct_field2_finish"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "NamedBorrowed") in
      let* α3 := M.read (mk_str "x") in
      let* α4 := M.read self in
      let* α5 := M.read (mk_str "y") in
      let* α6 := M.read self in
      let* α7 :=
        M.alloc
          (M.get_struct_record_field
            α6
            "scoping_rules_lifetimes_structs::NamedBorrowed"
            "y") in
      M.call_closure
        α0
        [
          α1;
          α2;
          α3;
          M.pointer_coercion
            (* Unsize *)
            (M.get_struct_record_field
              α4
              "scoping_rules_lifetimes_structs::NamedBorrowed"
              "x");
          α5;
          M.pointer_coercion (* Unsize *) α7
        ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_NamedBorrowed.

(* Enum Either *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Num";
        item := StructTuple [ Ty.path "i32" ];
        discriminant := None;
      };
      {
        name := "Ref";
        item := StructTuple [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.
  Definition Self : Ty.t := Ty.path "scoping_rules_lifetimes_structs::Either".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        match_operator
          self
          [
            fun γ =>
              let* γ := M.read γ in
              let* γ1_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "scoping_rules_lifetimes_structs::Either::Num"
                  0 in
              let* __self_0 := M.alloc γ1_0 in
              let* α0 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Formatter")
                  "debug_tuple_field1_finish"
                  [] in
              let* α1 := M.read f in
              let* α2 := M.read (mk_str "Num") in
              let* α3 :=
                M.call_closure
                  α0
                  [ α1; α2; M.pointer_coercion (* Unsize *) __self_0 ] in
              M.alloc α3;
            fun γ =>
              let* γ := M.read γ in
              let* γ1_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "scoping_rules_lifetimes_structs::Either::Ref"
                  0 in
              let* __self_0 := M.alloc γ1_0 in
              let* α0 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Formatter")
                  "debug_tuple_field1_finish"
                  [] in
              let* α1 := M.read f in
              let* α2 := M.read (mk_str "Ref") in
              let* α3 :=
                M.call_closure
                  α0
                  [ α1; α2; M.pointer_coercion (* Unsize *) __self_0 ] in
              M.alloc α3
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_structs_Either.

(*
fn main() {
    let x = 18;
    let y = 15;

    let single = Borrowed(&x);
    let double = NamedBorrowed { x: &x, y: &y };
    let reference = Either::Ref(&x);
    let number = Either::Num(y);

    println!("x is borrowed in {:?}", single);
    println!("x and y are borrowed in {:?}", double);
    println!("x is borrowed in {:?}", reference);
    println!("y is *not* borrowed in {:?}", number);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 18) in
    let* y := M.alloc (Value.Integer Integer.I32 15) in
    let* single :=
      M.alloc
        (Value.StructTuple "scoping_rules_lifetimes_structs::Borrowed" [ x ]) in
    let* double :=
      M.alloc
        (Value.StructRecord
          "scoping_rules_lifetimes_structs::NamedBorrowed"
          [ ("x", x); ("y", y) ]) in
    let* reference :=
      M.alloc
        (Value.StructTuple
          "scoping_rules_lifetimes_structs::Either::Ref"
          [ x ]) in
    let* number :=
      let* α0 := M.read y in
      M.alloc
        (Value.StructTuple
          "scoping_rules_lifetimes_structs::Either::Num"
          [ α0 ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "x is borrowed in ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "scoping_rules_lifetimes_structs::Borrowed" ] in
        let* α6 := M.call_closure α5 [ single ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "x and y are borrowed in ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "scoping_rules_lifetimes_structs::NamedBorrowed" ] in
        let* α6 := M.call_closure α5 [ double ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "x is borrowed in ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "scoping_rules_lifetimes_structs::Either" ] in
        let* α6 := M.call_closure α5 [ reference ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "y is *not* borrowed in ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "scoping_rules_lifetimes_structs::Either" ] in
        let* α6 := M.call_closure α5 [ number ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
