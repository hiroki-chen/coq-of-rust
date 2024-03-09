(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Integer addition
    println!("1 + 2 = {}", 1u32 + 2);

    // Integer subtraction
    println!("1 - 2 = {}", 1i32 - 2);
    // TODO ^ Try changing `1i32` to `1u32` to see why the type is important

    // Short-circuiting boolean logic
    println!("true AND false is {}", true && false);
    println!("true OR false is {}", true || false);
    println!("NOT true is {}", !true);

    // Bitwise operations
    println!("0011 AND 0101 is {:04b}", 0b0011u32 & 0b0101);
    println!("0011 OR 0101 is {:04b}", 0b0011u32 | 0b0101);
    println!("0011 XOR 0101 is {:04b}", 0b0011u32 ^ 0b0101);
    println!("1 << 5 is {}", 1u32 << 5);
    println!("0x80 >> 2 is 0x{:x}", 0x80u32 >> 2);

    // Use underscores to improve readability!
    println!("One million is written as {}", 1_000_000u32);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "1 + 2 = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          BinOp.Panic.add
            (Value.Integer Integer.U32 1)
            (Value.Integer Integer.U32 2) in
        let* α7 := M.alloc α6 in
        let* α8 := M.call α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "1 - 2 = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          BinOp.Panic.sub
            (Value.Integer Integer.I32 1)
            (Value.Integer Integer.I32 2) in
        let* α7 := M.alloc α6 in
        let* α8 := M.call α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "true AND false is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.alloc (BinOp.Pure.and (Value.Bool true) (Value.Bool false)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "true OR false is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          M.alloc (BinOp.Pure.or (Value.Bool true) (Value.Bool false)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "NOT true is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.alloc (UnOp.not (Value.Bool true)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1_formatted" in
        let* α2 := M.read (mk_str "0011 AND 0101 is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_binary" in
        let* α6 :=
          M.alloc
            (BinOp.Pure.bit_and
              (Value.Integer Integer.U32 3)
              (Value.Integer Integer.U32 5)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Placeholder")
            "new" in
        let* α10 :=
          M.call
            α9
            [
              Value.Integer Integer.Usize 0;
              " "%char;
              Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
              Value.Integer Integer.U32 8;
              Value.StructTuple "core::fmt::rt::Count::Implied" [];
              Value.StructTuple
                "core::fmt::rt::Count::Is"
                [ Value.Integer Integer.Usize 4 ]
            ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::UnsafeArg")
            "new" in
        let* α13 := M.call α12 [] in
        let* α14 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8;
              M.pointer_coercion (* Unsize *) α11;
              α13
            ] in
        let* α15 := M.call α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1_formatted" in
        let* α2 := M.read (mk_str "0011 OR 0101 is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_binary" in
        let* α6 :=
          M.alloc
            (BinOp.Pure.bit_or
              (Value.Integer Integer.U32 3)
              (Value.Integer Integer.U32 5)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Placeholder")
            "new" in
        let* α10 :=
          M.call
            α9
            [
              Value.Integer Integer.Usize 0;
              " "%char;
              Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
              Value.Integer Integer.U32 8;
              Value.StructTuple "core::fmt::rt::Count::Implied" [];
              Value.StructTuple
                "core::fmt::rt::Count::Is"
                [ Value.Integer Integer.Usize 4 ]
            ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::UnsafeArg")
            "new" in
        let* α13 := M.call α12 [] in
        let* α14 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8;
              M.pointer_coercion (* Unsize *) α11;
              α13
            ] in
        let* α15 := M.call α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1_formatted" in
        let* α2 := M.read (mk_str "0011 XOR 0101 is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_binary" in
        let* α6 :=
          M.alloc
            (BinOp.Pure.bit_xor
              (Value.Integer Integer.U32 3)
              (Value.Integer Integer.U32 5)) in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Placeholder")
            "new" in
        let* α10 :=
          M.call
            α9
            [
              Value.Integer Integer.Usize 0;
              " "%char;
              Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
              Value.Integer Integer.U32 8;
              Value.StructTuple "core::fmt::rt::Count::Implied" [];
              Value.StructTuple
                "core::fmt::rt::Count::Is"
                [ Value.Integer Integer.Usize 4 ]
            ] in
        let* α11 := M.alloc (Value.Array [ α10 ]) in
        let* α12 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::UnsafeArg")
            "new" in
        let* α13 := M.call α12 [] in
        let* α14 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8;
              M.pointer_coercion (* Unsize *) α11;
              α13
            ] in
        let* α15 := M.call α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "1 << 5 is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 :=
          BinOp.Panic.shl
            (Value.Integer Integer.U32 1)
            (Value.Integer Integer.I32 5) in
        let* α7 := M.alloc α6 in
        let* α8 := M.call α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "0x80 >> 2 is 0x") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_lower_hex" in
        let* α6 :=
          BinOp.Panic.shr
            (Value.Integer Integer.U32 128)
            (Value.Integer Integer.I32 2) in
        let* α7 := M.alloc α6 in
        let* α8 := M.call α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "One million is written as 1000000
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "none" in
        let* α5 := M.call α4 [] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α3;
              M.pointer_coercion (* Unsize *) α6
            ] in
        let* α8 := M.call α0 [ α7 ] in
        M.alloc α8 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
