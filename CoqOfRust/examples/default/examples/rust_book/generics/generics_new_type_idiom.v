(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Years";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

(* StructTuple
  {
    name := "Days";
    ty_params := [];
    fields := [ Ty.path "i64" ];
  } *)

Module Impl_generics_new_type_idiom_Years.
  Definition Self : Ty.t := Ty.path "generics_new_type_idiom::Years".
  
  (*
      pub fn to_days(&self) -> Days {
          Days(self.0 * 365)
      }
  *)
  Definition to_days (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_tuple_field α0 "generics_new_type_idiom::Years" 0) in
      let* α2 := BinOp.Panic.mul α1 (Value.Integer Integer.I64 365) in
      M.pure (Value.StructTuple "generics_new_type_idiom::Days" [ α2 ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_days : M.IsAssociatedFunction Self "to_days" to_days.
End Impl_generics_new_type_idiom_Years.

Module Impl_generics_new_type_idiom_Days.
  Definition Self : Ty.t := Ty.path "generics_new_type_idiom::Days".
  
  (*
      pub fn to_years(&self) -> Years {
          Years(self.0 / 365)
      }
  *)
  Definition to_years (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.read (M.get_struct_tuple_field α0 "generics_new_type_idiom::Days" 0) in
      let* α2 := BinOp.Panic.div α1 (Value.Integer Integer.I64 365) in
      M.pure (Value.StructTuple "generics_new_type_idiom::Years" [ α2 ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_to_years : M.IsAssociatedFunction Self "to_years" to_years.
End Impl_generics_new_type_idiom_Days.

(*
fn old_enough(age: &Years) -> bool {
    age.0 >= 18
}
*)
Definition old_enough (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ age ] =>
    let* age := M.alloc age in
    let* α0 := M.read age in
    let* α1 := M.read (M.get_struct_tuple_field α0 "generics_new_type_idiom::Years" 0) in
    M.pure (BinOp.Pure.ge α1 (Value.Integer Integer.I64 18))
  | _, _ => M.impossible
  end.

(*
fn main() {
    let age = Years(5);
    let age_days = age.to_days();
    println!("Old enough {}", old_enough(&age));
    println!("Old enough {}", old_enough(&age_days.to_years()));
    // println!("Old enough {}", old_enough(&age_days));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* age :=
      M.alloc
        (Value.StructTuple "generics_new_type_idiom::Years" [ Value.Integer Integer.I64 5 ]) in
    let* age_days :=
      let* α0 :=
        M.get_associated_function (Ty.path "generics_new_type_idiom::Years") "to_days" [] in
      let* α1 := M.call_closure α0 [ age ] in M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Old enough ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "bool" ] in
            let* α7 := M.get_function "generics_new_type_idiom::old_enough" [] in
            let* α8 := M.call_closure α7 [ age ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "Old enough ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α15 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "bool" ] in
            let* α7 := M.get_function "generics_new_type_idiom::old_enough" [] in
            let* α8 :=
              M.get_associated_function (Ty.path "generics_new_type_idiom::Days") "to_years" [] in
            let* α9 := M.call_closure α8 [ age_days ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α7 [ α10 ] in
            let* α12 := M.alloc α11 in
            let* α13 := M.call_closure α6 [ α12 ] in
            let* α14 := M.alloc (Value.Array [ α13 ]) in M.pure (M.pointer_coercion α14) in
        let* α16 := M.call_closure α1 [ α5; α15 ] in
        let* α17 := M.call_closure α0 [ α16 ] in M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
