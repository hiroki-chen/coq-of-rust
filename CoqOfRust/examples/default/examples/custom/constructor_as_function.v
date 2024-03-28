(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn matching(tuple: (i32, i32)) -> i32 {
    match tuple {
        (0, 0) => 0,
        (_, _) => 1,
    }
}
*)
Definition matching (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ tuple ] =>
    let* tuple := M.alloc tuple in
    let* α0 :=
      match_operator
        tuple
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 0) in
            let* _ :=
              let* α0 := M.read γ0_1 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 0) in
            M.alloc (Value.Integer Integer.I32 0);
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            M.alloc (Value.Integer Integer.I32 1)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(* StructTuple
  {
    name := "Constructor";
    ty_params := [];
    fields := [ Ty.path "i32" ];
  } *)

Module Impl_core_fmt_Debug_for_constructor_as_function_Constructor.
  Definition Self : Ty.t := Ty.path "constructor_as_function::Constructor".
  
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
      let* α2 := M.read (mk_str "Constructor") in
      let* α5 :=
        (* Unsize *)
          let* α3 := M.read self in
          let* α4 :=
            M.alloc
              (M.get_struct_tuple_field
                α3
                "constructor_as_function::Constructor"
                0) in
          M.pure (M.pointer_coercion α4) in
      M.call_closure α0 [ α1; α2; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_constructor_as_function_Constructor.

(*
fn main() {
    let v: Vec<_> = vec![1, 2, 3].into_iter().map(Constructor).collect();

    println!("{v:?}");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* v :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::map::Map")
            [
              Ty.apply
                (Ty.path "alloc::vec::into_iter::IntoIter")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
              Ty.function
                [ Ty.path "i32" ]
                (Ty.path "constructor_as_function::Constructor")
            ])
          []
          "collect"
          [
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.path "constructor_as_function::Constructor";
                Ty.path "alloc::alloc::Global"
              ]
          ] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "alloc::vec::into_iter::IntoIter")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "map"
          [
            Ty.path "constructor_as_function::Constructor";
            Ty.function
              [ Ty.path "i32" ]
              (Ty.path "constructor_as_function::Constructor")
          ] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          []
          "into_iter"
          [] in
      let* α3 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α4 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α5 :=
            M.alloc
              (Value.Array
                [
                  Value.Integer Integer.I32 1;
                  Value.Integer Integer.I32 2;
                  Value.Integer Integer.I32 3
                ]) in
          let* α6 := M.call_closure α4 [ α5 ] in
          let* α7 := M.read α6 in
          M.pure (M.pointer_coercion α7) in
      let* α9 := M.call_closure α3 [ α8 ] in
      let* α10 := M.call_closure α2 [ α9 ] in
      let* α11 :=
        M.call_closure
          α1
          [ α10; M.constructor_as_closure "constructor_as_function::Constructor"
          ] in
      let* α12 := M.call_closure α0 [ α11 ] in
      M.alloc α12 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [
                      Ty.path "constructor_as_function::Constructor";
                      Ty.path "alloc::alloc::Global"
                    ]
                ] in
            let* α7 := M.call_closure α6 [ v ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
