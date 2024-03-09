(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn checked_division(dividend: i32, divisor: i32) -> Option<i32> {
    if divisor == 0 {
        // Failure is represented as the `None` variant
        None
    } else {
        // Result is wrapped in a `Some` variant
        Some(dividend / divisor)
    }
}
*)
Definition checked_division (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ dividend; divisor ] =>
    let* dividend := M.alloc dividend in
    let* divisor := M.alloc divisor in
    let* α0 := M.read divisor in
    let* α1 := M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.I32 0)) in
    let* α2 := M.read (M.use α1) in
    let* α3 :=
      if Value.is_true α2 then
        M.alloc (Value.StructTuple "core::option::Option::None" [])
      else
        let* α0 := M.read dividend in
        let* α1 := M.read divisor in
        let* α2 := BinOp.Panic.div α0 α1 in
        M.alloc (Value.StructTuple "core::option::Option::Some" [ α2 ]) in
    M.read α3
  | _, _ => M.impossible
  end.

(*
fn try_division(dividend: i32, divisor: i32) {
    // `Option` values can be pattern matched, just like other enums
    match checked_division(dividend, divisor) {
        None => println!("{} / {} failed!", dividend, divisor),
        Some(quotient) => {
            println!("{} / {} = {}", dividend, divisor, quotient)
        }
    }
}
*)
Definition try_division (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ dividend; divisor ] =>
    let* dividend := M.alloc dividend in
    let* divisor := M.alloc divisor in
    let* α0 := M.get_function "option::checked_division" in
    let* α1 := M.read dividend in
    let* α2 := M.read divisor in
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
              | core.option.Option.None =>
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str " / ") in
                  let* α4 := M.read (mk_str " failed!
") in
                  let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α7 := M.call α6 [ dividend ] in
                  let* α8 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α9 := M.call α8 [ divisor ] in
                  let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
                  let* α11 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion (* Unsize *) α5;
                        M.pointer_coercion (* Unsize *) α10
                      ] in
                  let* α12 := M.call α0 [ α11 ] in
                  M.alloc α12 in
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end);
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | core.option.Option.Some _ =>
                let* γ0_0 :=
                  let* α0 := M.var "core::option::Option::Get_Some_0" in
                  M.pure (α0 γ) in
                let* quotient := M.copy γ0_0 in
                let* _ :=
                  let* α0 := M.get_function "std::io::stdio::_print" in
                  let* α1 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::Arguments")
                      "new_v1" in
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str " / ") in
                  let* α4 := M.read (mk_str " = ") in
                  let* α5 := M.read (mk_str "
") in
                  let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
                  let* α7 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α8 := M.call α7 [ dividend ] in
                  let* α9 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α10 := M.call α9 [ divisor ] in
                  let* α11 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display" in
                  let* α12 := M.call α11 [ quotient ] in
                  let* α13 := M.alloc (Value.Array [ α8; α10; α12 ]) in
                  let* α14 :=
                    M.call
                      α1
                      [
                        M.pointer_coercion (* Unsize *) α6;
                        M.pointer_coercion (* Unsize *) α13
                      ] in
                  let* α15 := M.call α0 [ α14 ] in
                  M.alloc α15 in
                M.alloc (Value.Tuple [])
              | _ => M.break_match
              end)
          ]) in
    M.read α5
  | _, _ => M.impossible
  end.

(*
fn main() {
    try_division(4, 2);
    try_division(1, 0);

    // Binding `None` to a variable needs to be type annotated
    let none: Option<i32> = None;
    let _equivalent_none = None::<i32>;

    let optional_float = Some(0f32);

    // Unwrapping a `Some` variant will extract the value wrapped.
    println!(
        "{:?} unwraps to {:?}",
        optional_float,
        optional_float.unwrap()
    );

    // Unwrapping a `None` variant will `panic!`
    println!("{:?} unwraps to {:?}", none, none.unwrap());
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "option::try_division" in
      let* α1 :=
        M.call
          α0
          [ Value.Integer Integer.I32 4; Value.Integer Integer.I32 2 ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "option::try_division" in
      let* α1 :=
        M.call
          α0
          [ Value.Integer Integer.I32 1; Value.Integer Integer.I32 0 ] in
      M.alloc α1 in
    let* none := M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* _equivalent_none :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* optional_float :=
      let* α0 := M.read UnsupportedLiteral in
      M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " unwraps to ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α7 := M.call α6 [ optional_float ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α9 :=
          M.get_associated_function
            (Ty.apply (Ty.path "core::option::Option") [ Ty.path "f32" ])
            "unwrap" in
        let* α10 := M.read optional_float in
        let* α11 := M.call α9 [ α10 ] in
        let* α12 := M.alloc α11 in
        let* α13 := M.call α8 [ α12 ] in
        let* α14 := M.alloc (Value.Array [ α7; α13 ]) in
        let* α15 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α14
            ] in
        let* α16 := M.call α0 [ α15 ] in
        M.alloc α16 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " unwraps to ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α7 := M.call α6 [ none ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug" in
        let* α9 :=
          M.get_associated_function
            (Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ])
            "unwrap" in
        let* α10 := M.read none in
        let* α11 := M.call α9 [ α10 ] in
        let* α12 := M.alloc α11 in
        let* α13 := M.call α8 [ α12 ] in
        let* α14 := M.alloc (Value.Array [ α7; α13 ]) in
        let* α15 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α14
            ] in
        let* α16 := M.call α0 [ α15 ] in
        M.alloc α16 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
