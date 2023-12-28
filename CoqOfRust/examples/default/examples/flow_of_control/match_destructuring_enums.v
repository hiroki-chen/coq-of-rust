(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Color.
  Inductive t : Set :=
  | Red
  | Blue
  | Green
  | RGB (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | HSV (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | HSL (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | CMY (_ : u32.t) (_ : u32.t) (_ : u32.t)
  | CMYK (_ : u32.t) (_ : u32.t) (_ : u32.t) (_ : u32.t).
  
  Global Instance Get_RGB_0 : Notations.Dot "RGB.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | RGB α0 _ _ => Some α0 | _ => None end)
        (fun β α =>
          match α with | RGB _ α1 α2 => Some (RGB β α1 α2) | _ => None end);
  }.
  
  Global Instance Get_RGB_1 : Notations.Dot "RGB.1" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | RGB _ α1 _ => Some α1 | _ => None end)
        (fun β α =>
          match α with | RGB α0 _ α2 => Some (RGB α0 β α2) | _ => None end);
  }.
  
  Global Instance Get_RGB_2 : Notations.Dot "RGB.2" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | RGB _ _ α2 => Some α2 | _ => None end)
        (fun β α =>
          match α with | RGB α0 α1 _ => Some (RGB α0 α1 β) | _ => None end);
  }.
  
  Global Instance Get_HSV_0 : Notations.Dot "HSV.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSV α0 _ _ => Some α0 | _ => None end)
        (fun β α =>
          match α with | HSV _ α1 α2 => Some (HSV β α1 α2) | _ => None end);
  }.
  
  Global Instance Get_HSV_1 : Notations.Dot "HSV.1" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSV _ α1 _ => Some α1 | _ => None end)
        (fun β α =>
          match α with | HSV α0 _ α2 => Some (HSV α0 β α2) | _ => None end);
  }.
  
  Global Instance Get_HSV_2 : Notations.Dot "HSV.2" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSV _ _ α2 => Some α2 | _ => None end)
        (fun β α =>
          match α with | HSV α0 α1 _ => Some (HSV α0 α1 β) | _ => None end);
  }.
  
  Global Instance Get_HSL_0 : Notations.Dot "HSL.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSL α0 _ _ => Some α0 | _ => None end)
        (fun β α =>
          match α with | HSL _ α1 α2 => Some (HSL β α1 α2) | _ => None end);
  }.
  
  Global Instance Get_HSL_1 : Notations.Dot "HSL.1" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSL _ α1 _ => Some α1 | _ => None end)
        (fun β α =>
          match α with | HSL α0 _ α2 => Some (HSL α0 β α2) | _ => None end);
  }.
  
  Global Instance Get_HSL_2 : Notations.Dot "HSL.2" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | HSL _ _ α2 => Some α2 | _ => None end)
        (fun β α =>
          match α with | HSL α0 α1 _ => Some (HSL α0 α1 β) | _ => None end);
  }.
  
  Global Instance Get_CMY_0 : Notations.Dot "CMY.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMY α0 _ _ => Some α0 | _ => None end)
        (fun β α =>
          match α with | CMY _ α1 α2 => Some (CMY β α1 α2) | _ => None end);
  }.
  
  Global Instance Get_CMY_1 : Notations.Dot "CMY.1" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMY _ α1 _ => Some α1 | _ => None end)
        (fun β α =>
          match α with | CMY α0 _ α2 => Some (CMY α0 β α2) | _ => None end);
  }.
  
  Global Instance Get_CMY_2 : Notations.Dot "CMY.2" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMY _ _ α2 => Some α2 | _ => None end)
        (fun β α =>
          match α with | CMY α0 α1 _ => Some (CMY α0 α1 β) | _ => None end);
  }.
  
  Global Instance Get_CMYK_0 : Notations.Dot "CMYK.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMYK α0 _ _ _ => Some α0 | _ => None end)
        (fun β α =>
          match α with
          | CMYK _ α1 α2 α3 => Some (CMYK β α1 α2 α3)
          | _ => None
          end);
  }.
  
  Global Instance Get_CMYK_1 : Notations.Dot "CMYK.1" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMYK _ α1 _ _ => Some α1 | _ => None end)
        (fun β α =>
          match α with
          | CMYK α0 _ α2 α3 => Some (CMYK α0 β α2 α3)
          | _ => None
          end);
  }.
  
  Global Instance Get_CMYK_2 : Notations.Dot "CMYK.2" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMYK _ _ α2 _ => Some α2 | _ => None end)
        (fun β α =>
          match α with
          | CMYK α0 α1 _ α3 => Some (CMYK α0 α1 β α3)
          | _ => None
          end);
  }.
  
  Global Instance Get_CMYK_3 : Notations.Dot "CMYK.3" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | CMYK _ _ _ α3 => Some α3 | _ => None end)
        (fun β α =>
          match α with
          | CMYK α0 α1 α2 _ => Some (CMYK α0 α1 α2 β)
          | _ => None
          end);
  }.
End Color.

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
Definition main : M unit :=
  let* color : M.Val match_destructuring_enums.Color.t :=
    M.alloc
      (match_destructuring_enums.Color.RGB
        (Integer.of_Z 122)
        (Integer.of_Z 17)
        (Integer.of_Z 40)) in
  let* _ : M.Val unit :=
    let* _ : M.Val unit :=
      let* α0 : ref str.t := M.read (mk_str "What color is it?
") in
      let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
      let* α2 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α1) in
      let* α3 : ref (slice (ref str.t)) :=
        M.read (pointer_coercion "Unsize" α2) in
      let* α4 : core.fmt.Arguments.t :=
        M.call (core.fmt.Arguments.t::["new_const"] α3) in
      let* α5 : unit := M.call (std.io.stdio._print α4) in
      M.alloc α5 in
    M.alloc tt in
  let* α0 : match_destructuring_enums.Color.t := M.read color in
  let* α0 : M.Val unit :=
    match_operator
      α0
      [
        fun α =>
          match α with
          | match_destructuring_enums.Color.Red =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "The color is Red!
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.Blue =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "The color is Blue!
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.Green =>
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "The color is Green!
") in
              let* α1 : M.Val (array (ref str.t)) := M.alloc [ α0 ] in
              let* α2 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α1) in
              let* α3 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α2) in
              let* α4 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_const"] α3) in
              let* α5 : unit := M.call (std.io.stdio._print α4) in
              M.alloc α5 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.RGB r g b =>
            let* r := M.alloc r in
            let* g := M.alloc g in
            let* b := M.alloc b in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Red: ") in
              let* α1 : ref str.t := M.read (mk_str ", green: ") in
              let* α2 : ref str.t := M.read (mk_str ", and blue: ") in
              let* α3 : ref str.t := M.read (mk_str "!
") in
              let* α4 : M.Val (array (ref str.t)) :=
                M.alloc [ α0; α1; α2; α3 ] in
              let* α5 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α4) in
              let* α6 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α5) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow r)) in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow g)) in
              let* α9 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow b)) in
              let* α10 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α7; α8; α9 ] in
              let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α10) in
              let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α11) in
              let* α13 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α6 α12) in
              let* α14 : unit := M.call (std.io.stdio._print α13) in
              M.alloc α14 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.HSV h s v =>
            let* h := M.alloc h in
            let* s := M.alloc s in
            let* v := M.alloc v in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Hue: ") in
              let* α1 : ref str.t := M.read (mk_str ", saturation: ") in
              let* α2 : ref str.t := M.read (mk_str ", value: ") in
              let* α3 : ref str.t := M.read (mk_str "!
") in
              let* α4 : M.Val (array (ref str.t)) :=
                M.alloc [ α0; α1; α2; α3 ] in
              let* α5 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α4) in
              let* α6 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α5) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow h)) in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow s)) in
              let* α9 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow v)) in
              let* α10 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α7; α8; α9 ] in
              let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α10) in
              let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α11) in
              let* α13 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α6 α12) in
              let* α14 : unit := M.call (std.io.stdio._print α13) in
              M.alloc α14 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.HSL h s l =>
            let* h := M.alloc h in
            let* s := M.alloc s in
            let* l := M.alloc l in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Hue: ") in
              let* α1 : ref str.t := M.read (mk_str ", saturation: ") in
              let* α2 : ref str.t := M.read (mk_str ", lightness: ") in
              let* α3 : ref str.t := M.read (mk_str "!
") in
              let* α4 : M.Val (array (ref str.t)) :=
                M.alloc [ α0; α1; α2; α3 ] in
              let* α5 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α4) in
              let* α6 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α5) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow h)) in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow s)) in
              let* α9 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow l)) in
              let* α10 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α7; α8; α9 ] in
              let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α10) in
              let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α11) in
              let* α13 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α6 α12) in
              let* α14 : unit := M.call (std.io.stdio._print α13) in
              M.alloc α14 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.CMY c m y =>
            let* c := M.alloc c in
            let* m := M.alloc m in
            let* y := M.alloc y in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Cyan: ") in
              let* α1 : ref str.t := M.read (mk_str ", magenta: ") in
              let* α2 : ref str.t := M.read (mk_str ", yellow: ") in
              let* α3 : ref str.t := M.read (mk_str "!
") in
              let* α4 : M.Val (array (ref str.t)) :=
                M.alloc [ α0; α1; α2; α3 ] in
              let* α5 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α4) in
              let* α6 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α5) in
              let* α7 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow c)) in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow m)) in
              let* α9 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow y)) in
              let* α10 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α7; α8; α9 ] in
              let* α11 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α10) in
              let* α12 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α11) in
              let* α13 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α6 α12) in
              let* α14 : unit := M.call (std.io.stdio._print α13) in
              M.alloc α14 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit);
        fun α =>
          match α with
          | match_destructuring_enums.Color.CMYK c m y k =>
            let* c := M.alloc c in
            let* m := M.alloc m in
            let* y := M.alloc y in
            let* k := M.alloc k in
            let* _ : M.Val unit :=
              let* α0 : ref str.t := M.read (mk_str "Cyan: ") in
              let* α1 : ref str.t := M.read (mk_str ", magenta: ") in
              let* α2 : ref str.t := M.read (mk_str ", yellow: ") in
              let* α3 : ref str.t := M.read (mk_str ", key (black): ") in
              let* α4 : ref str.t := M.read (mk_str "!
") in
              let* α5 : M.Val (array (ref str.t)) :=
                M.alloc [ α0; α1; α2; α3; α4 ] in
              let* α6 : M.Val (ref (array (ref str.t))) :=
                M.alloc (borrow α5) in
              let* α7 : ref (slice (ref str.t)) :=
                M.read (pointer_coercion "Unsize" α6) in
              let* α8 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow c)) in
              let* α9 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow m)) in
              let* α10 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow y)) in
              let* α11 : core.fmt.rt.Argument.t :=
                M.call (core.fmt.rt.Argument.t::["new_display"] (borrow k)) in
              let* α12 : M.Val (array core.fmt.rt.Argument.t) :=
                M.alloc [ α8; α9; α10; α11 ] in
              let* α13 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
                M.alloc (borrow α12) in
              let* α14 : ref (slice core.fmt.rt.Argument.t) :=
                M.read (pointer_coercion "Unsize" α13) in
              let* α15 : core.fmt.Arguments.t :=
                M.call (core.fmt.Arguments.t::["new_v1"] α7 α14) in
              let* α16 : unit := M.call (std.io.stdio._print α15) in
              M.alloc α16 in
            M.alloc tt
          | _ => M.break_match
          end :
          M (M.Val unit)
      ] in
  M.read α0.
