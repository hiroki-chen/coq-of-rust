(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Cardinal";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "BlueJay";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Turkey";
    ty_params := [];
  } *)

(* Trait *)
(* Empty module 'Red' *)

(* Trait *)
(* Empty module 'Blue' *)

Module Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.
  Definition Self : Ty.t :=
    Ty.path "generics_bounds_test_case_empty_bounds::Cardinal".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Red"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Red_for_generics_bounds_test_case_empty_bounds_Cardinal.

Module Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.
  Definition Self : Ty.t :=
    Ty.path "generics_bounds_test_case_empty_bounds::BlueJay".
  
  Axiom Implements :
    M.IsTraitInstance
      "generics_bounds_test_case_empty_bounds::Blue"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_generics_bounds_test_case_empty_bounds_Blue_for_generics_bounds_test_case_empty_bounds_BlueJay.

(*
fn red<T: Red>(_: &T) -> &'static str {
    "red"
}
*)
Definition red (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ β0 ] =>
    let* β0 := M.alloc β0 in
    M.match_operator β0 [ fun γ => M.read (mk_str "red") ]
  | _, _ => M.impossible
  end.

(*
fn blue<T: Blue>(_: &T) -> &'static str {
    "blue"
}
*)
Definition blue (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [ T ], [ β0 ] =>
    let* β0 := M.alloc β0 in
    M.match_operator β0 [ fun γ => M.read (mk_str "blue") ]
  | _, _ => M.impossible
  end.

(*
fn main() {
    let cardinal = Cardinal;
    let blue_jay = BlueJay;
    let _turkey = Turkey;

    // `red()` won't work on a blue jay nor vice versa
    // because of the bounds.
    println!("A cardinal is {}", red(&cardinal));
    println!("A blue jay is {}", blue(&blue_jay));
    //println!("A turkey is {}", red(&_turkey));
    // ^ TODO: Try uncommenting this line.
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* cardinal :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::Cardinal"
          []) in
    let* blue_jay :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::BlueJay"
          []) in
    let* _turkey :=
      M.alloc
        (Value.StructTuple
          "generics_bounds_test_case_empty_bounds::Turkey"
          []) in
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
            let* α2 := M.read (mk_str "A cardinal is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α7 :=
              M.get_function
                "generics_bounds_test_case_empty_bounds::red"
                [ Ty.path "generics_bounds_test_case_empty_bounds::Cardinal"
                ] in
            let* α8 := M.call_closure α7 [ cardinal ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
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
            let* α2 := M.read (mk_str "A blue jay is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α7 :=
              M.get_function
                "generics_bounds_test_case_empty_bounds::blue"
                [ Ty.path "generics_bounds_test_case_empty_bounds::BlueJay" ] in
            let* α8 := M.call_closure α7 [ blue_jay ] in
            let* α9 := M.alloc α8 in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in
            M.pure (M.pointer_coercion α11) in
        let* α13 := M.call_closure α1 [ α5; α12 ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
