(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Temperature *)

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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* temperature :=
      M.alloc
        (Value.StructTuple
          "match_guards::Temperature::Celsius"
          [ Value.Integer Integer.I32 35 ]) in
    let* α0 :=
      match_operator
        temperature
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_guards.Temperature.Celsius _ =>
              let* γ0_0 :=
                let* α0 := M.var "match_guards::Temperature::Get_Celsius_0" in
                M.pure (α0 γ) in
              let* t := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "") in
                let* α2 := M.read (mk_str "C is above 30 Celsius
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ t ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_guards.Temperature.Celsius _ =>
              let* γ0_0 :=
                let* α0 := M.var "match_guards::Temperature::Get_Celsius_0" in
                M.pure (α0 γ) in
              let* t := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "") in
                let* α2 := M.read (mk_str "C is below 30 Celsius
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ t ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_guards.Temperature.Fahrenheit _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_guards::Temperature::Get_Fahrenheit_0" in
                M.pure (α0 γ) in
              let* t := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "") in
                let* α2 := M.read (mk_str "F is above 86 Fahrenheit
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ t ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_guards.Temperature.Fahrenheit _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_guards::Temperature::Get_Fahrenheit_0" in
                M.pure (α0 γ) in
              let* t := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "") in
                let* α2 := M.read (mk_str "F is below 86 Fahrenheit
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ t ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
