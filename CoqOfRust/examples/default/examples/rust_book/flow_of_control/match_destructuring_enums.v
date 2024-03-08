(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Color *)

(*
fn main() {
    let color = Color::RGB(122, 17, 40);
    // TODO ^ Try different variants for `color`

    println!("What color is it?");
    // An `enum` can be destructured using a `match`.
    match color {
        Color::Red => println!("The color is Red!"),
        Color::Blue => println!("The color is Blue!"),
        Color::Green => println!("The color is Green!"),
        Color::RGB(r, g, b) => println!("Red: {}, green: {}, and blue: {}!", r, g, b),
        Color::HSV(h, s, v) => println!("Hue: {}, saturation: {}, value: {}!", h, s, v),
        Color::HSL(h, s, l) => println!("Hue: {}, saturation: {}, lightness: {}!", h, s, l),
        Color::CMY(c, m, y) => println!("Cyan: {}, magenta: {}, yellow: {}!", c, m, y),
        Color::CMYK(c, m, y, k) => println!(
            "Cyan: {}, magenta: {}, yellow: {}, key (black): {}!",
            c, m, y, k
        ),
        // Don't need another arm because all variants have been examined
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* color :=
      M.alloc
        (Value.StructTuple
          "match_destructuring_enums::Color::RGB"
          [
            Value.Integer Integer.U32 122;
            Value.Integer Integer.U32 17;
            Value.Integer Integer.U32 40
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "What color is it?
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ M.pointer_coercion "Unsize" α2 ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* α0 :=
      match_operator
        color
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Red =>
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "The color is Red!
") in
                let* α2 := M.alloc [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ M.pointer_coercion "Unsize" α2 ] in
                let* α4 := M.call α0 [ α3 ] in
                M.alloc α4 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Blue =>
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "The color is Blue!
") in
                let* α2 := M.alloc [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ M.pointer_coercion "Unsize" α2 ] in
                let* α4 := M.call α0 [ α3 ] in
                M.alloc α4 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.Green =>
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "The color is Green!
") in
                let* α2 := M.alloc [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_const"]
                    [ M.pointer_coercion "Unsize" α2 ] in
                let* α4 := M.call α0 [ α3 ] in
                M.alloc α4 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.RGB _ _ _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_RGB_0" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_RGB_1" in
                M.pure (α0 γ) in
              let* γ0_2 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_RGB_2" in
                M.pure (α0 γ) in
              let* r := M.copy γ0_0 in
              let* g := M.copy γ0_1 in
              let* b := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Red: ") in
                let* α2 := M.read (mk_str ", green: ") in
                let* α3 := M.read (mk_str ", and blue: ") in
                let* α4 := M.read (mk_str "!
") in
                let* α5 := M.alloc [ α1; α2; α3; α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ r ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ g ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ b ] in
                let* α9 := M.alloc [ α6; α7; α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α5;
                      M.pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.HSV _ _ _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSV_0" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSV_1" in
                M.pure (α0 γ) in
              let* γ0_2 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSV_2" in
                M.pure (α0 γ) in
              let* h := M.copy γ0_0 in
              let* s := M.copy γ0_1 in
              let* v := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Hue: ") in
                let* α2 := M.read (mk_str ", saturation: ") in
                let* α3 := M.read (mk_str ", value: ") in
                let* α4 := M.read (mk_str "!
") in
                let* α5 := M.alloc [ α1; α2; α3; α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ h ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ s ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ v ] in
                let* α9 := M.alloc [ α6; α7; α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α5;
                      M.pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.HSL _ _ _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSL_0" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSL_1" in
                M.pure (α0 γ) in
              let* γ0_2 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_HSL_2" in
                M.pure (α0 γ) in
              let* h := M.copy γ0_0 in
              let* s := M.copy γ0_1 in
              let* l := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Hue: ") in
                let* α2 := M.read (mk_str ", saturation: ") in
                let* α3 := M.read (mk_str ", lightness: ") in
                let* α4 := M.read (mk_str "!
") in
                let* α5 := M.alloc [ α1; α2; α3; α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ h ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ s ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ l ] in
                let* α9 := M.alloc [ α6; α7; α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α5;
                      M.pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.CMY _ _ _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMY_0" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMY_1" in
                M.pure (α0 γ) in
              let* γ0_2 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMY_2" in
                M.pure (α0 γ) in
              let* c := M.copy γ0_0 in
              let* m := M.copy γ0_1 in
              let* y := M.copy γ0_2 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Cyan: ") in
                let* α2 := M.read (mk_str ", magenta: ") in
                let* α3 := M.read (mk_str ", yellow: ") in
                let* α4 := M.read (mk_str "!
") in
                let* α5 := M.alloc [ α1; α2; α3; α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ c ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ m ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ y ] in
                let* α9 := M.alloc [ α6; α7; α8 ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α5;
                      M.pointer_coercion "Unsize" α9
                    ] in
                let* α11 := M.call α0 [ α10 ] in
                M.alloc α11 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | match_destructuring_enums.Color.CMYK _ _ _ _ =>
              let* γ0_0 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMYK_0" in
                M.pure (α0 γ) in
              let* γ0_1 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMYK_1" in
                M.pure (α0 γ) in
              let* γ0_2 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMYK_2" in
                M.pure (α0 γ) in
              let* γ0_3 :=
                let* α0 :=
                  M.var "match_destructuring_enums::Color::Get_CMYK_3" in
                M.pure (α0 γ) in
              let* c := M.copy γ0_0 in
              let* m := M.copy γ0_1 in
              let* y := M.copy γ0_2 in
              let* k := M.copy γ0_3 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Cyan: ") in
                let* α2 := M.read (mk_str ", magenta: ") in
                let* α3 := M.read (mk_str ", yellow: ") in
                let* α4 := M.read (mk_str ", key (black): ") in
                let* α5 := M.read (mk_str "!
") in
                let* α6 := M.alloc [ α1; α2; α3; α4; α5 ] in
                let* α7 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ c ] in
                let* α8 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ m ] in
                let* α9 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ y ] in
                let* α10 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ k ] in
                let* α11 := M.alloc [ α7; α8; α9; α10 ] in
                let* α12 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α6;
                      M.pointer_coercion "Unsize" α11
                    ] in
                let* α13 := M.call α0 [ α12 ] in
                M.alloc α13 in
              M.alloc tt
            | _ => M.break_match 
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
