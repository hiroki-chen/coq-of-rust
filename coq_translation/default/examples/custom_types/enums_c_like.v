(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Number.
  Inductive t : Set :=
  | Zero
  | One
  | Two.
End Number.
Definition Number := Number.t.

Module Color.
  Inductive t : Set :=
  | Red
  | Green
  | Blue.
End Color.
Definition Color := Color.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"]
          (addr_of (cast enums_c_like.Number.Zero i32)) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "zero is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_display"]
          (addr_of (cast enums_c_like.Number.One i32)) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "one is "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_lower_hex"]
          (addr_of (cast enums_c_like.Color.Red i32)) in
      let* α1 := format_count::["Is"] 6 in
      let* α2 :=
        format_placeholder::["new"]
          0
          " "%char
          format_alignment::["Unknown"]
          8
          format_count::["Implied"]
          α1 in
      let* α3 := format_unsafe_arg::["new"] in
      let* α4 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ "roses are #"; "
" ])
          (addr_of [ α0 ])
          (addr_of [ α2 ])
          α3 in
      std.io.stdio._print α4 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_argument::["new_lower_hex"]
          (addr_of (cast enums_c_like.Color.Blue i32)) in
      let* α1 := format_count::["Is"] 6 in
      let* α2 :=
        format_placeholder::["new"]
          0
          " "%char
          format_alignment::["Unknown"]
          8
          format_count::["Implied"]
          α1 in
      let* α3 := format_unsafe_arg::["new"] in
      let* α4 :=
        format_arguments::["new_v1_formatted"]
          (addr_of [ "violets are #"; "
" ])
          (addr_of [ α0 ])
          (addr_of [ α2 ])
          α3 in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
