(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum WebEvent *)

(*
fn inspect(event: WebEvent) {
    match event {
        WebEvent::PageLoad => println!("page loaded, réfé"),
        WebEvent::PageUnload => println!("page unloaded"),
        // Destructure `c` from inside the `enum`.
        WebEvent::KeyPress(c) => println!("pressed '{}'.", c),
        WebEvent::Paste(s) => println!("pasted \"{}\".", s),
        // Destructure `Click` into `x` and `y`.
        WebEvent::Click { x, y } => {
            println!("clicked at x={}, y={}.", x, y);
        }
    }
}
*)
Definition inspect (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ event ] =>
    let* event := M.alloc event in
    let* α0 :=
      match_operator
        event
        [
          fun γ =>
            (let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 :=
                M.read
                  (mk_str
                    ("page loaded, r" ++
                      String.String "233" ("f" ++ String.String "233" "
"))) in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "page unloaded
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "enums::WebEvent::KeyPress"
                0 in
            let* c := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "pressed '") in
              let* α3 := M.read (mk_str "'.
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.call α5 [ c ] in
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
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "enums::WebEvent::Paste"
                0 in
            let* s := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "pasted """) in
              let* α3 := M.read (mk_str """.
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display" in
              let* α6 := M.call α5 [ s ] in
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
            M.alloc (Value.Tuple []));
          fun γ =>
            (let* γ0_0 :=
              M.get_struct_record_field_or_break_match
                γ
                "enums::WebEvent::Click"
                "x" in
            let* γ0_1 :=
              M.get_struct_record_field_or_break_match
                γ
                "enums::WebEvent::Click"
                "y" in
            let* x := M.copy γ0_0 in
            let* y := M.copy γ0_1 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1" in
                let* α2 := M.read (mk_str "clicked at x=") in
                let* α3 := M.read (mk_str ", y=") in
                let* α4 := M.read (mk_str ".
") in
                let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                let* α6 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display" in
                let* α7 := M.call α6 [ x ] in
                let* α8 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::rt::Argument")
                    "new_display" in
                let* α9 := M.call α8 [ y ] in
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
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple []))
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let pressed = WebEvent::KeyPress('x');
    // `to_owned()` creates an owned `String` from a string slice.
    let pasted = WebEvent::Paste("my text".to_owned());
    let click = WebEvent::Click { x: 20, y: 80 };
    let load = WebEvent::PageLoad;
    let unload = WebEvent::PageUnload;

    inspect(pressed);
    inspect(pasted);
    inspect(click);
    inspect(load);
    inspect(unload);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* pressed :=
      M.alloc
        (Value.StructTuple
          "enums::WebEvent::KeyPress"
          [ Value.UnicodeChar 120 ]) in
    let* pasted :=
      let* α0 :=
        M.get_trait_method
          "alloc::borrow::ToOwned"
          "to_owned"
          [ (* Self *) Ty.path "str" ] in
      let* α1 := M.read (mk_str "my text") in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc (Value.StructTuple "enums::WebEvent::Paste" [ α2 ]) in
    let* click :=
      M.alloc
        (Value.StructRecord
          "enums::WebEvent::Click"
          [
            ("x", Value.Integer Integer.I64 20);
            ("y", Value.Integer Integer.I64 80)
          ]) in
    let* load := M.alloc (Value.StructTuple "enums::WebEvent::PageLoad" []) in
    let* unload :=
      M.alloc (Value.StructTuple "enums::WebEvent::PageUnload" []) in
    let* _ :=
      let* α0 := M.get_function "enums::inspect" [] in
      let* α1 := M.read pressed in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "enums::inspect" [] in
      let* α1 := M.read pasted in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "enums::inspect" [] in
      let* α1 := M.read click in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "enums::inspect" [] in
      let* α1 := M.read load in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "enums::inspect" [] in
      let* α1 := M.read unload in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
