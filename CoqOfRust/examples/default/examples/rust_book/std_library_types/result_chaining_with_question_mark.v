(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module checked.
  (* Enum MathError *)
  
  Module Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
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
        let* α2 :=
          match_operator
            self
            (Value.Array
              [
                fun γ =>
                  (let* γ :=
                    let* α0 := M.read γ in
                    M.pure (deref α0) in
                  let* α0 := M.read γ in
                  match α0 with
                  |
                      result_chaining_with_question_mark.checked.MathError.DivisionByZero
                      =>
                    let* α0 := M.read (mk_str "DivisionByZero") in
                    M.alloc α0
                  | _ => M.break_match
                  end);
                fun γ =>
                  (let* γ :=
                    let* α0 := M.read γ in
                    M.pure (deref α0) in
                  let* α0 := M.read γ in
                  match α0 with
                  |
                      result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                      =>
                    let* α0 := M.read (mk_str "NonPositiveLogarithm") in
                    M.alloc α0
                  | _ => M.break_match
                  end);
                fun γ =>
                  (let* γ :=
                    let* α0 := M.read γ in
                    M.pure (deref α0) in
                  let* α0 := M.read γ in
                  match α0 with
                  |
                      result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                      =>
                    let* α0 := M.read (mk_str "NegativeSquareRoot") in
                    M.alloc α0
                  | _ => M.break_match
                  end)
              ]) in
        let* α3 := M.read α2 in
        M.call α0 [ α1; α3 ]
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        (* Self *)
          (Ty.path "result_chaining_with_question_mark::checked::MathError")
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
        (* Instance polymorphic types *) [].
  End Impl_core_fmt_Debug_for_result_chaining_with_question_mark_checked_MathError.
  
  Axiom MathResult :
    (Ty.path "result_chaining_with_question_mark::checked::MathResult") =
      (Ty.apply
        (Ty.path "core::result::Result")
        [
          Ty.path "f64";
          Ty.path "result_chaining_with_question_mark::checked::MathError"
        ]).
  
  (*
      fn div(x: f64, y: f64) -> MathResult {
          if y == 0.0 {
              Err(MathError::DivisionByZero)
          } else {
              Ok(x / y)
          }
      }
  *)
  Definition div (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ x; y ] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 := M.read y in
      let* α1 := M.read UnsupportedLiteral in
      let* α2 := M.alloc (BinOp.Pure.eq α0 α1) in
      let* α3 := M.read (M.use α2) in
      let* α4 :=
        if Value.is_true α3 then
          M.alloc
            (Value.StructTuple
              "core::result::Result::Err"
              [
                Value.StructTuple
                  "result_chaining_with_question_mark::checked::MathError::DivisionByZero"
                  []
              ])
        else
          let* α0 := M.read x in
          let* α1 := M.read y in
          let* α2 := BinOp.Panic.div α0 α1 in
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ α2 ]) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn sqrt(x: f64) -> MathResult {
          if x < 0.0 {
              Err(MathError::NegativeSquareRoot)
          } else {
              Ok(x.sqrt())
          }
      }
  *)
  Definition sqrt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ x ] =>
      let* x := M.alloc x in
      let* α0 := M.read x in
      let* α1 := M.read UnsupportedLiteral in
      let* α2 := M.alloc (BinOp.Pure.lt α0 α1) in
      let* α3 := M.read (M.use α2) in
      let* α4 :=
        if Value.is_true α3 then
          M.alloc
            (Value.StructTuple
              "core::result::Result::Err"
              [
                Value.StructTuple
                  "result_chaining_with_question_mark::checked::MathError::NegativeSquareRoot"
                  []
              ])
        else
          let* α0 := M.get_associated_function (Ty.path "f64") "sqrt" in
          let* α1 := M.read x in
          let* α2 := M.call α0 [ α1 ] in
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ α2 ]) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn ln(x: f64) -> MathResult {
          if x <= 0.0 {
              Err(MathError::NonPositiveLogarithm)
          } else {
              Ok(x.ln())
          }
      }
  *)
  Definition ln (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ x ] =>
      let* x := M.alloc x in
      let* α0 := M.read x in
      let* α1 := M.read UnsupportedLiteral in
      let* α2 := M.alloc (BinOp.Pure.le α0 α1) in
      let* α3 := M.read (M.use α2) in
      let* α4 :=
        if Value.is_true α3 then
          M.alloc
            (Value.StructTuple
              "core::result::Result::Err"
              [
                Value.StructTuple
                  "result_chaining_with_question_mark::checked::MathError::NonPositiveLogarithm"
                  []
              ])
        else
          let* α0 := M.get_associated_function (Ty.path "f64") "ln" in
          let* α1 := M.read x in
          let* α2 := M.call α0 [ α1 ] in
          M.alloc (Value.StructTuple "core::result::Result::Ok" [ α2 ]) in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      fn op_(x: f64, y: f64) -> MathResult {
          // if `div` "fails", then `DivisionByZero` will be `return`ed
          let ratio = div(x, y)?;
  
          // if `ln` "fails", then `NonPositiveLogarithm` will be `return`ed
          let ln = ln(ratio)?;
  
          sqrt(ln)
      }
  *)
  Definition op_ (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ x; y ] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* ratio :=
        let* α0 :=
          M.get_trait_method
            "core::ops::try_trait::Try"
            "branch"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "core::result::Result")
                  [
                    Ty.path "f64";
                    Ty.path
                      "result_chaining_with_question_mark::checked::MathError"
                  ]
            ] in
        let* α1 :=
          M.get_function "result_chaining_with_question_mark::checked::div" in
        let* α2 := M.read x in
        let* α3 := M.read y in
        let* α4 := M.call α1 [ α2; α3 ] in
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
                                Ty.path "f64";
                                Ty.path
                                  "result_chaining_with_question_mark::checked::MathError"
                              ];
                          (* R *)
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "core::convert::Infallible";
                                Ty.path
                                  "result_chaining_with_question_mark::checked::MathError"
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
      let* ln :=
        let* α0 :=
          M.get_trait_method
            "core::ops::try_trait::Try"
            "branch"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "core::result::Result")
                  [
                    Ty.path "f64";
                    Ty.path
                      "result_chaining_with_question_mark::checked::MathError"
                  ]
            ] in
        let* α1 :=
          M.get_function "result_chaining_with_question_mark::checked::ln" in
        let* α2 := M.read ratio in
        let* α3 := M.call α1 [ α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          match_operator
            α5
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
                                Ty.path "f64";
                                Ty.path
                                  "result_chaining_with_question_mark::checked::MathError"
                              ];
                          (* R *)
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.path "core::convert::Infallible";
                                Ty.path
                                  "result_chaining_with_question_mark::checked::MathError"
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
        M.copy α6 in
      let* α0 :=
        M.get_function "result_chaining_with_question_mark::checked::sqrt" in
      let* α1 := M.read ln in
      let* α2 := M.call α0 [ α1 ] in
      let* α0 := M.alloc α2 in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      pub fn op(x: f64, y: f64) {
          match op_(x, y) {
              Err(why) => panic!(
                  "{}",
                  match why {
                      MathError::NonPositiveLogarithm => "logarithm of non-positive number",
                      MathError::DivisionByZero => "division by zero",
                      MathError::NegativeSquareRoot => "square root of negative number",
                  }
              ),
              Ok(value) => println!("{}", value),
          }
      }
  *)
  Definition op (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ x; y ] =>
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 :=
        M.get_function "result_chaining_with_question_mark::checked::op_" in
      let* α1 := M.read x in
      let* α2 := M.read y in
      let* α3 := M.call α0 [ α1; α2 ] in
      let* α4 := M.alloc α3 in
      let* α5 :=
        match_operator
          α4
          (Value.Array
            [
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Err _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Err_0" in
                    M.pure (α0 γ) in
                  let* why := M.copy γ0_0 in
                  let* α0 := M.get_function "core::panicking::panic_display" in
                  let* α1 :=
                    match_operator
                      why
                      (Value.Array
                        [
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            |
                                result_chaining_with_question_mark.checked.MathError.NonPositiveLogarithm
                                =>
                              M.pure (mk_str "logarithm of non-positive number")
                            | _ => M.break_match
                            end);
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            |
                                result_chaining_with_question_mark.checked.MathError.DivisionByZero
                                =>
                              let* α0 := M.read (mk_str "division by zero") in
                              M.alloc α0
                            | _ => M.break_match
                            end);
                          fun γ =>
                            (let* α0 := M.read γ in
                            match α0 with
                            |
                                result_chaining_with_question_mark.checked.MathError.NegativeSquareRoot
                                =>
                              let* α0 :=
                                M.read
                                  (mk_str "square root of negative number") in
                              M.alloc α0
                            | _ => M.break_match
                            end)
                        ]) in
                  let* α2 := M.call α0 [ α1 ] in
                  let* α3 := M.never_to_any α2 in
                  M.alloc α3
                | _ => M.break_match
                end);
              fun γ =>
                (let* α0 := M.read γ in
                match α0 with
                | core.result.Result.Ok _ =>
                  let* γ0_0 :=
                    let* α0 := M.var "core::result::Result::Get_Ok_0" in
                    M.pure (α0 γ) in
                  let* value := M.copy γ0_0 in
                  let* _ :=
                    let* α0 := M.get_function "std::io::stdio::_print" in
                    let* α1 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::Arguments")
                        "new_v1" in
                    let* α2 := M.read (mk_str "") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    let* α5 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_display" in
                    let* α6 := M.call α5 [ value ] in
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
      M.read α5
    | _, _ => M.impossible
    end.
End checked.

(*
fn main() {
    checked::op(1.0, 10.0);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 :=
        M.get_function "result_chaining_with_question_mark::checked::op" in
      let* α1 := M.read UnsupportedLiteral in
      let* α2 := M.read UnsupportedLiteral in
      let* α3 := M.call α0 [ α1; α2 ] in
      M.alloc α3 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
