(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Color.
  Inductive t : Set :=
  | Red
  | Blue
  | Green
  | RGB (_ : u32) (_ : u32) (_ : u32)
  | HSV (_ : u32) (_ : u32) (_ : u32)
  | HSL (_ : u32) (_ : u32) (_ : u32)
  | CMY (_ : u32) (_ : u32) (_ : u32)
  | CMYK (_ : u32) (_ : u32) (_ : u32) (_ : u32).
End Color.
Definition Color : Set := Color.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let color := match_destructuring_enums.Color.RGB 122 17 40 in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "What color is it?
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  match color with
  | match_destructuring_enums.Color.Red =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "The color is Red!
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | match_destructuring_enums.Color.Blue =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "The color is Blue!
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | match_destructuring_enums.Color.Green =>
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "The color is Green!
" ]) in
      std.io.stdio._print α0 in
    Pure tt
  | match_destructuring_enums.Color.RGB r g b =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of r) in
      let* α1 := format_argument::["new_display"] (addr_of g) in
      let* α2 := format_argument::["new_display"] (addr_of b) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Red: "; ", green: "; ", and blue: "; "!
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt
  | match_destructuring_enums.Color.HSV h s v =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of h) in
      let* α1 := format_argument::["new_display"] (addr_of s) in
      let* α2 := format_argument::["new_display"] (addr_of v) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Hue: "; ", saturation: "; ", value: "; "!
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt
  | match_destructuring_enums.Color.HSL h s l =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of h) in
      let* α1 := format_argument::["new_display"] (addr_of s) in
      let* α2 := format_argument::["new_display"] (addr_of l) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Hue: "; ", saturation: "; ", lightness: "; "!
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt
  | match_destructuring_enums.Color.CMY c m y =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of c) in
      let* α1 := format_argument::["new_display"] (addr_of m) in
      let* α2 := format_argument::["new_display"] (addr_of y) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Cyan: "; ", magenta: "; ", yellow: "; "!
" ])
          (addr_of [ α0; α1; α2 ]) in
      std.io.stdio._print α3 in
    Pure tt
  | match_destructuring_enums.Color.CMYK c m y k =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of c) in
      let* α1 := format_argument::["new_display"] (addr_of m) in
      let* α2 := format_argument::["new_display"] (addr_of y) in
      let* α3 := format_argument::["new_display"] (addr_of k) in
      let* α4 :=
        format_arguments::["new_v1"]
          (addr_of
            [ "Cyan: "; ", magenta: "; ", yellow: "; ", key (black): "; "!
" ])
          (addr_of [ α0; α1; α2; α3 ]) in
      std.io.stdio._print α4 in
    Pure tt
  end.
