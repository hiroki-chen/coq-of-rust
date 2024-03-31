(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Ref";
    ty_params := [ "T" ];
    fields := [ Ty.apply (Ty.path "&") [ T ] ];
  } *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ T ].
  
  (*
  Debug
  *)
  Definition fmt (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T in
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function (Ty.path "core::fmt::Formatter") "debug_tuple_field1_finish" [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Ref") in
      let* α5 :=
        (* Unsize *)
          let* α3 := M.read self in
          let* α4 :=
            M.alloc (M.get_struct_tuple_field α3 "scoping_rules_lifetimes_bounds::Ref" 0) in
          M.pure (M.pointer_coercion α4) in
      M.call_closure α0 [ α1; α2; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method (fmt T)) ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.

(*
fn print<T>(t: T)
where
    T: Debug,
{
    println!("`print`: t is {:?}", t);
}
*)
Definition print (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "`print`: t is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function (Ty.path "core::fmt::rt::Argument") "new_debug" [ T ] in
            let* α7 := M.call_closure α6 [ t ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.

(*
fn print_ref<'a, T>(t: &'a T)
where
    T: Debug + 'a,
{
    println!("`print_ref`: t is {:?}", t);
}
*)
Definition print_ref (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "`print_ref`: t is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ T ] ] in
            let* α7 := M.call_closure α6 [ t ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;
    let ref_x = Ref(&x);

    print_ref(&ref_x);
    print(ref_x);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 7) in
    let* ref_x := M.alloc (Value.StructTuple "scoping_rules_lifetimes_bounds::Ref" [ x ]) in
    let* _ :=
      let* α0 :=
        M.get_function
          "scoping_rules_lifetimes_bounds::print_ref"
          [ Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ Ty.path "i32" ] ] in
      let* α1 := M.call_closure α0 [ ref_x ] in M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function
          "scoping_rules_lifetimes_bounds::print"
          [ Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ Ty.path "i32" ] ] in
      let* α1 := M.read ref_x in let* α2 := M.call_closure α0 [ α1 ] in M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
