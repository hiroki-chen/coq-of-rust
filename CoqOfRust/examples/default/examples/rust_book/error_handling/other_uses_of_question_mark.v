(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "other_uses_of_question_mark::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [
        T;
        Ty.apply
          (Ty.path "alloc::boxed::Box")
          [
            Ty.dyn [ ("core::error::Error::Trait", []) ];
            Ty.path "alloc::alloc::Global"
          ]
      ]).

(* StructTuple
  {
    name := "EmptyVec";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
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
          "write_str"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "EmptyVec") in
      M.call_closure α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_fmt"
          [] in
      let* α1 := M.read f in
      let* α2 :=
        M.get_associated_function
          (Ty.path "core::fmt::Arguments")
          "new_const"
          [] in
      let* α5 :=
        (* Unsize *)
          let* α3 := M.read (mk_str "invalid first item to double") in
          let* α4 := M.alloc (Value.Array [ α3 ]) in
          M.pure (M.pointer_coercion α4) in
      let* α6 := M.call_closure α2 [ α5 ] in
      M.call_closure α0 [ α1; α6 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
  Definition Self : Ty.t := Ty.path "other_uses_of_question_mark::EmptyVec".
  
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [].
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    let first = vec.first().ok_or(EmptyVec)?;
    let parsed = first.parse::<i32>()?;
    Ok(2 * parsed)
}
*)
Definition double_first (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* first :=
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          (Ty.apply
            (Ty.path "core::result::Result")
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
              Ty.path "other_uses_of_question_mark::EmptyVec"
            ])
          []
          "branch"
          [] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            ])
          "ok_or"
          [ Ty.path "other_uses_of_question_mark::EmptyVec" ] in
      let* α2 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "first"
          [] in
      let* α3 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          []
          "deref"
          [] in
      let* α4 := M.call_closure α3 [ vec ] in
      let* α5 := M.call_closure α2 [ α4 ] in
      let* α6 :=
        M.call_closure
          α1
          [ α5; Value.StructTuple "other_uses_of_question_mark::EmptyVec" []
          ] in
      let* α7 := M.call_closure α0 [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Break"
                  0 in
              let* residual := M.copy γ0_0 in
              let* α0 :=
                M.get_trait_method
                  "core::ops::try_trait::FromResidual"
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.path "i32";
                      Ty.apply
                        (Ty.path "alloc::boxed::Box")
                        [
                          Ty.dyn [ ("core::error::Error::Trait", []) ];
                          Ty.path "alloc::alloc::Global"
                        ]
                    ])
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [
                        Ty.path "core::convert::Infallible";
                        Ty.path "other_uses_of_question_mark::EmptyVec"
                      ]
                  ]
                  "from_residual"
                  [] in
              let* α1 := M.read residual in
              let* α2 := M.call_closure α0 [ α1 ] in
              let* α3 := M.return_ α2 in
              let* α4 := M.read α3 in
              let* α5 := M.never_to_any α4 in
              M.alloc α5;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Continue"
                  0 in
              let* val := M.copy γ0_0 in
              M.pure val
          ] in
      M.copy α9 in
    let* parsed :=
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          (Ty.apply
            (Ty.path "core::result::Result")
            [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ])
          []
          "branch"
          [] in
      let* α1 :=
        M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
      let* α2 := M.read first in
      let* α3 := M.read α2 in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
          [
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Break"
                  0 in
              let* residual := M.copy γ0_0 in
              let* α0 :=
                M.get_trait_method
                  "core::ops::try_trait::FromResidual"
                  (Ty.apply
                    (Ty.path "core::result::Result")
                    [
                      Ty.path "i32";
                      Ty.apply
                        (Ty.path "alloc::boxed::Box")
                        [
                          Ty.dyn [ ("core::error::Error::Trait", []) ];
                          Ty.path "alloc::alloc::Global"
                        ]
                    ])
                  [
                    Ty.apply
                      (Ty.path "core::result::Result")
                      [
                        Ty.path "core::convert::Infallible";
                        Ty.path "core::num::error::ParseIntError"
                      ]
                  ]
                  "from_residual"
                  [] in
              let* α1 := M.read residual in
              let* α2 := M.call_closure α0 [ α1 ] in
              let* α3 := M.return_ α2 in
              let* α4 := M.read α3 in
              let* α5 := M.never_to_any α4 in
              M.alloc α5;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match
                  γ
                  "core::ops::control_flow::ControlFlow::Continue"
                  0 in
              let* val := M.copy γ0_0 in
              M.pure val
          ] in
      M.copy α7 in
    let* α0 := M.read parsed in
    let* α1 := BinOp.Panic.mul (Value.Integer Integer.I32 2) α0 in
    let* α0 := M.alloc (Value.StructTuple "core::result::Result::Ok" [ α1 ]) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Ok"
                0 in
            let* n := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "The first doubled is ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "i32" ] in
                  let* α7 := M.call_closure α6 [ n ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::result::Result::Err"
                0 in
            let* e := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "Error: ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.dyn [ ("core::error::Error::Trait", []) ];
                            Ty.path "alloc::alloc::Global"
                          ]
                      ] in
                  let* α7 := M.call_closure α6 [ e ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    print(double_first(numbers));
    print(double_first(empty));
    print(double_first(strings));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* numbers :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply
                    (Ty.path "array")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α2 := M.read (mk_str "42") in
          let* α3 := M.read (mk_str "93") in
          let* α4 := M.read (mk_str "18") in
          let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
          let* α6 := M.call_closure α1 [ α5 ] in
          let* α7 := M.read α6 in
          M.pure (M.pointer_coercion α7) in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
    let* empty :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α8 :=
        (* Unsize *)
          let* α1 :=
            M.get_associated_function
              (Ty.apply
                (Ty.path "alloc::boxed::Box")
                [
                  Ty.apply
                    (Ty.path "array")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                  Ty.path "alloc::alloc::Global"
                ])
              "new"
              [] in
          let* α2 := M.read (mk_str "tofu") in
          let* α3 := M.read (mk_str "93") in
          let* α4 := M.read (mk_str "18") in
          let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
          let* α6 := M.call_closure α1 [ α5 ] in
          let* α7 := M.read α6 in
          M.pure (M.pointer_coercion α7) in
      let* α9 := M.call_closure α0 [ α8 ] in
      M.alloc α9 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" [] in
      let* α1 :=
        M.get_function "other_uses_of_question_mark::double_first" [] in
      let* α2 := M.read numbers in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" [] in
      let* α1 :=
        M.get_function "other_uses_of_question_mark::double_first" [] in
      let* α2 := M.read empty in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" [] in
      let* α1 :=
        M.get_function "other_uses_of_question_mark::double_first" [] in
      let* α2 := M.read strings in
      let* α3 := M.call_closure α1 [ α2 ] in
      let* α4 := M.call_closure α0 [ α3 ] in
      M.alloc α4 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
