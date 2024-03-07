(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module PrintInOption.
  
End PrintInOption.

Module Impl_generics_where_clauses_PrintInOption_for_T.
  (*
      fn print_in_option(self) {
          println!("{:?}", Some(self));
      }
  *)
  Definition print_in_option (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self; T ], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 := M.read self in
          let* α5 :=
            M.alloc (Value.StructTuple "core::option::Option::Some" [ α4 ]) in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_debug"]
              [ borrow α5 ] in
          let* α7 := M.alloc [ α6 ] in
          let* α8 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α7)
              ] in
          let* α9 := M.call α0 [ α8 ] in
          M.alloc α9 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "generics_where_clauses::PrintInOption"
      (* Self *) T
      []
      [ ("print_in_option", InstanceField.Method print_in_option [ T ]) ].
End Impl_generics_where_clauses_PrintInOption_for_T.

(*
fn main() {
    let vec = vec![1, 2, 3];

    vec.print_in_option();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* vec :=
      let* α0 :=
        M.alloc
          [
            (Integer.of_Z 1) : Ty.path "i32";
            (Integer.of_Z 2) : Ty.path "i32";
            (Integer.of_Z 3) : Ty.path "i32"
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_method
          "generics_where_clauses::PrintInOption"
          "print_in_option"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
          ] in
      let* α1 := M.read vec in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
