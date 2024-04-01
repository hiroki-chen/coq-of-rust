(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Temperature *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Celsius";
        item := StructTuple [ Ty.path "i32" ];
        discriminant := None;
      };
      {
        name := "Fahrenheit";
        item := StructTuple [ Ty.path "i32" ];
        discriminant := None;
      }
    ];
} *)

(*
fn main() {
    let temperature = Temperature::Celsius(35);
    // ^ TODO try different values for `temperature`

    match temperature {
        Temperature::Celsius(t) if t > 30 => println!("{}C is above 30 Celsius", t),
        // The `if condition` part ^ is a guard
        Temperature::Celsius(t) => println!("{}C is below 30 Celsius", t),

        Temperature::Fahrenheit(t) if t > 86 => println!("{}F is above 86 Fahrenheit", t),
        Temperature::Fahrenheit(t) => println!("{}F is below 86 Fahrenheit", t),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* temperature :=
      M.alloc
        (Value.StructTuple "match_guards::Temperature::Celsius" [ Value.Integer Integer.I32 35 ]) in
    let* α0 :=
      M.match_operator
        temperature
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match γ "match_guards::Temperature::Celsius" 0 in
            let* t := M.copy γ0_0 in
            let* γ :=
              let* α0 := M.read t in
              M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.I32 30)) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str "C is above 30 Celsius
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
                  let* α7 := M.call_closure α6 [ t ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match γ "match_guards::Temperature::Celsius" 0 in
            let* t := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str "C is below 30 Celsius
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
                  let* α7 := M.call_closure α6 [ t ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match γ "match_guards::Temperature::Fahrenheit" 0 in
            let* t := M.copy γ0_0 in
            let* γ :=
              let* α0 := M.read t in
              M.alloc (BinOp.Pure.gt α0 (Value.Integer Integer.I32 86)) in
            let* _ :=
              let* α0 := M.read γ in
              M.is_constant_or_break_match α0 (Value.Bool true) in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str "F is above 86 Fahrenheit
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
                  let* α7 := M.call_closure α6 [ t ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in
                  M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in
              M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match γ "match_guards::Temperature::Fahrenheit" 0 in
            let* t := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "") in
                  let* α3 := M.read (mk_str "F is below 86 Fahrenheit
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
                  let* α7 := M.call_closure α6 [ t ] in
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
