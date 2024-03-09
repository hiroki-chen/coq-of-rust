(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "other_uses_of_question_mark::Result") =
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

(* Struct EmptyVec *)

Module Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "EmptyVec") in
      M.call α0 [ α1; α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "other_uses_of_question_mark::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_fmt" in
      let* α1 := M.read f in
      let* α2 :=
        M.get_associated_function
          (Ty.path "core::fmt::Arguments")
          "new_const" in
      let* α3 := M.read (mk_str "invalid first item to double") in
      let* α4 := M.alloc (Value.Array [ α3 ]) in
      let* α5 := M.call α2 [ M.pointer_coercion (* Unsize *) α4 ] in
      M.call α0 [ α1; α5 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "other_uses_of_question_mark::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Display_for_other_uses_of_question_mark_EmptyVec.

Module Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      (* Self *) (Ty.path "other_uses_of_question_mark::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
End Impl_core_error_Error_for_other_uses_of_question_mark_EmptyVec.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    let first = vec.first().ok_or(EmptyVec)?;
    let parsed = first.parse::<i32>()?;
    Ok(2 * parsed)
}
*)
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* first :=
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          "branch"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::result::Result")
                [
                  Ty.apply
                    (Ty.path "&")
                    [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                  Ty.path "other_uses_of_question_mark::EmptyVec"
                ]
          ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
            ])
          "ok_or" in
      let* α2 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "first" in
      let* α3 :=
        M.get_trait_method
          "core::ops::deref::Deref"
          "deref"
          [
            (* Self *)
              Ty.apply
                (Ty.path "alloc::vec::Vec")
                [
                  Ty.apply (Ty.path "&") [ Ty.path "str" ];
                  Ty.path "alloc::alloc::Global"
                ]
          ] in
      let* α4 := M.call α3 [ vec ] in
      let* α5 := M.call α2 [ α4 ] in
      let* α6 :=
        M.call
          α1
          [ α5; Value.StructTuple "other_uses_of_question_mark::EmptyVec" []
          ] in
      let* α7 := M.call α0 [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_trait_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.apply
                                (Ty.path "alloc::boxed::Box")
                                [
                                  Ty.dyn [ ("core::error::Error::Trait", []) ];
                                  Ty.path "alloc::alloc::Global"
                                ]
                            ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "core::convert::Infallible";
                              Ty.path "other_uses_of_question_mark::EmptyVec"
                            ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := M.return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := M.never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match
                end);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match
                end)
            ]) in
      M.copy α9 in
    let* parsed :=
      let* α0 :=
        M.get_trait_method
          "core::ops::try_trait::Try"
          "branch"
          [
            (* Self *)
              Ty.apply
                (Ty.path "core::result::Result")
                [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ]
          ] in
      let* α1 := M.get_associated_function (Ty.path "str") "parse" in
      let* α2 := M.read first in
      let* α3 := M.read α2 in
      let* α4 := M.call α1 [ α3 ] in
      let* α5 := M.call α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Break _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Break_0" in
                    M.pure (α0 γ) in
                  let* residual := M.copy γ0_0 in
                  let* α0 :=
                    M.get_trait_method
                      "core::ops::try_trait::FromResidual"
                      "from_residual"
                      [
                        (* Self *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "i32";
                              Ty.apply
                                (Ty.path "alloc::boxed::Box")
                                [
                                  Ty.dyn [ ("core::error::Error::Trait", []) ];
                                  Ty.path "alloc::alloc::Global"
                                ]
                            ];
                        (* R *)
                          Ty.apply
                            (Ty.path "core::result::Result")
                            [
                              Ty.path "core::convert::Infallible";
                              Ty.path "core::num::error::ParseIntError"
                            ]
                      ] in
                  let* α1 := M.read residual in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := M.return_ α2 in
                  let* α4 := M.read α3 in
                  let* α5 := M.never_to_any α4 in
                  M.alloc α5
                | _ => M.break_match
                end);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.ops.control_flow.ControlFlow.Continue _ =>
                  let* γ0_0 :=
                    let* α0 :=
                      M.var
                        "core::ops::control_flow::ControlFlow::Get_Continue_0" in
                    M.pure (α0 γ) in
                  let* val := M.copy γ0_0 in
                  M.pure val
                | _ => M.break_match
                end)
            ]) in
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
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        (Value.Array
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Ok _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::result::Result::Get_Ok_0" in
                  M.pure (α0 γ) in
                let* n := M.copy γ0_0 in
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "The first doubled is ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α6 := M.call α5 [ n ] in
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
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.result.Result.Err _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::result::Result::Get_Err_0" in
                  M.pure (α0 γ) in
                let* e := M.copy γ0_0 in
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "Error: ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                  let* α5 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α6 := M.call α5 [ e ] in
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
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end)
          ]) in
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* numbers :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec" in
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
          "new" in
      let* α2 := M.read (mk_str "42") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* empty :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [
              Ty.apply (Ty.path "&") [ Ty.path "str" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* strings :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ])
          "into_vec" in
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
          "new" in
      let* α2 := M.read (mk_str "tofu") in
      let* α3 := M.read (mk_str "93") in
      let* α4 := M.read (mk_str "18") in
      let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
      let* α6 := M.call α1 [ α5 ] in
      let* α7 := M.read α6 in
      let* α8 := M.call α0 [ M.pointer_coercion (* Unsize *) α7 ] in
      M.alloc α8 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" in
      let* α1 := M.get_function "other_uses_of_question_mark::double_first" in
      let* α2 := M.read numbers in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" in
      let* α1 := M.get_function "other_uses_of_question_mark::double_first" in
      let* α2 := M.read empty in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.get_function "other_uses_of_question_mark::print" in
      let* α1 := M.get_function "other_uses_of_question_mark::double_first" in
      let* α2 := M.read strings in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
