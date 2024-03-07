(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Note that this is not actually a `&str`
    let bytestring: &[u8; 21] = b"this is a byte string";

    // Byte arrays don't have the `Display` trait, so printing them is a bit limited
    println!("A byte string: {:?}", bytestring);

    // Byte strings can have byte escapes...
    let escaped = b"\x52\x75\x73\x74 as bytes";
    // ...but no unicode escapes
    // let escaped = b"\u{211D} is not allowed";
    println!("Some escaped bytes: {:?}", escaped);

    // Raw byte strings work just like raw strings
    let raw_bytestring = br"\u{211D} is not escaped here";
    println!("{:?}", raw_bytestring);

    // Converting a byte array to `str` can fail
    if let Ok(my_str) = str::from_utf8(raw_bytestring) {
        println!("And the same as text: '{}'", my_str);
    }

    let _quotes = br#"You can also use "fancier" formatting, \
                    like with normal raw strings"#;

    // Byte strings don't have to be UTF-8
    let shift_jis = b"\x82\xe6\x82\xa8\x82\xb1\x82\xbb"; // "ようこそ" in SHIFT-JIS

    // But then they can't always be converted to `str`
    match str::from_utf8(shift_jis) {
        Ok(my_str) => println!("Conversion successful: '{}'", my_str),
        Err(e) => println!("Conversion failed: {:?}", e),
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* bytestring :=
      let* α0 :=
        M.read
          (UnsupportedLiteral :
            Ty.apply
              (Ty.path "ref")
              [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]) in
      M.alloc α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "A byte string: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow bytestring ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* escaped :=
      M.copy
        (UnsupportedLiteral :
          Ty.apply
            (Ty.path "ref")
            [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "Some escaped bytes: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow escaped ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* raw_bytestring :=
      M.copy
        (UnsupportedLiteral :
          Ty.apply
            (Ty.path "ref")
            [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow raw_bytestring ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* α0 := M.var "core::str::converts::from_utf8" in
      let* α1 := M.read raw_bytestring in
      let* α2 := M.call α0 [ pointer_coercion "Unsize" α1 ] in
      let* α3 := M.alloc α2 in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Ok_0" in
                M.pure (α0 γ) in
              let* my_str := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "And the same as text: '") in
                  let* α2 := M.read (mk_str "'
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ borrow my_str ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" (borrow α3);
                        pointer_coercion "Unsize" (borrow α5)
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ => (M.alloc tt) : Ty.path "unit"
        ] in
    let* _quotes :=
      M.copy
        (UnsupportedLiteral :
          Ty.apply
            (Ty.path "ref")
            [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]) in
    let* shift_jis :=
      M.copy
        (UnsupportedLiteral :
          Ty.apply
            (Ty.path "ref")
            [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ]) in
    let* _ :=
      let* α0 := M.var "core::str::converts::from_utf8" in
      let* α1 := M.read shift_jis in
      let* α2 := M.call α0 [ pointer_coercion "Unsize" α1 ] in
      let* α3 := M.alloc α2 in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Ok_0" in
                M.pure (α0 γ) in
              let* my_str := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Conversion successful: '") in
                let* α2 := M.read (mk_str "'
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ borrow my_str ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α3);
                      pointer_coercion "Unsize" (borrow α5)
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple [];
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Err_0" in
                M.pure (α0 γ) in
              let* e := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Conversion failed: ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                    [ borrow e ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      pointer_coercion "Unsize" (borrow α3);
                      pointer_coercion "Unsize" (borrow α5)
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end) :
            Ty.tuple []
        ] in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
