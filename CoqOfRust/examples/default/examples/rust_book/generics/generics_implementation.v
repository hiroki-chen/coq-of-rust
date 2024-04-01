(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Val";
    ty_params := [];
    fields := [ ("val", Ty.path "f64") ];
  } *)

(* StructRecord
  {
    name := "GenVal";
    ty_params := [ "T" ];
    fields := [ ("gen_val", T) ];
  } *)

Module Impl_generics_implementation_Val.
  Definition Self : Ty.t := Ty.path "generics_implementation::Val".
  
  (*
      fn value(&self) -> &f64 {
          &self.val
      }
  *)
  Definition value (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure (M.get_struct_record_field α0 "generics_implementation::Val" "val")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_value : M.IsAssociatedFunction Self "value" value.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Definition Self (T : Ty.t) : Ty.t := Ty.apply (Ty.path "generics_implementation::GenVal") [ T ].
  
  (*
      fn value(&self) -> &T {
          &self.gen_val
      }
  *)
  Definition value (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T in
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.pure (M.get_struct_record_field α0 "generics_implementation::GenVal" "gen_val")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_value :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "value" (value T).
End Impl_generics_implementation_GenVal_T.

(*
fn main() {
    let x = Val { val: 3.0 };
    let y = GenVal { gen_val: 3i32 };

    println!("{}, {}", x.value(), y.value());
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* x :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc (Value.StructRecord "generics_implementation::Val" [ ("val", α0) ]) in
    let* y :=
      M.alloc
        (Value.StructRecord
          "generics_implementation::GenVal"
          [ ("gen_val", Value.Integer Integer.I32 3) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α6 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str ", ") in
            let* α4 := M.read (mk_str "
") in
            let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
            M.pure (M.pointer_coercion α5) in
        let* α18 :=
          (* Unsize *)
            let* α7 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "f64" ] ] in
            let* α8 :=
              M.get_associated_function (Ty.path "generics_implementation::Val") "value" [] in
            let* α9 := M.call_closure α8 [ x ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α7 [ α10 ] in
            let* α12 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] in
            let* α13 :=
              M.get_associated_function
                (Ty.apply (Ty.path "generics_implementation::GenVal") [ Ty.path "i32" ])
                "value"
                [] in
            let* α14 := M.call_closure α13 [ y ] in
            let* α15 := M.alloc α14 in
            let* α16 := M.call_closure α12 [ α15 ] in
            let* α17 := M.alloc (Value.Array [ α11; α16 ]) in
            M.pure (M.pointer_coercion α17) in
        let* α19 := M.call_closure α1 [ α6; α18 ] in
        let* α20 := M.call_closure α0 [ α19 ] in
        M.alloc α20 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
