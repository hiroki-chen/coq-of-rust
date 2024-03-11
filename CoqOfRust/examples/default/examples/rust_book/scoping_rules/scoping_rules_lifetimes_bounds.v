(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct Ref *)

Module Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; T ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Ref") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *)
        (Ty.apply (Ty.path "scoping_rules_lifetimes_bounds::Ref") [ T ])
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [ T ].
End Impl_core_fmt_Debug_for_scoping_rules_lifetimes_bounds_Ref_T.

(*
fn print<T>(t: T)
where
    T: Debug,
{
    println!("`print`: t is {:?}", t);
}
*)
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "`print`: t is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ t ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
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
Definition print_ref (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ t ] =>
    let* t := M.alloc t in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "`print_ref`: t is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α6 := M.call α5 [ t ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 7) in
    let* ref_x :=
      M.alloc (Value.StructTuple "scoping_rules_lifetimes_bounds::Ref" [ x ]) in
    let* _ :=
      let* α0 :=
        M.get_function
          "scoping_rules_lifetimes_bounds::print_ref"
          [
            Ty.apply
              (Ty.path "scoping_rules_lifetimes_bounds::Ref")
              [ Ty.path "i32" ]
          ] in
      let* α1 := M.call α0 [ ref_x ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function
          "scoping_rules_lifetimes_bounds::print"
          [
            Ty.apply
              (Ty.path "scoping_rules_lifetimes_bounds::Ref")
              [ Ty.path "i32" ]
          ] in
      let* α1 := M.read ref_x in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
