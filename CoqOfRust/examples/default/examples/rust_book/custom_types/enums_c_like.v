(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Number *)

(* Enum Color *)

(*
fn main() {
    // `enums` can be cast as integers.
    println!("zero is {}", Number::Zero as i32);
    println!("one is {}", Number::One as i32);

    println!("roses are #{:06x}", Color::Red as i32);
    println!("violets are #{:06x}", Color::Blue as i32);
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
        let* α2 := M.read (mk_str "zero is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.alloc (M.rust_cast (Value.Integer Integer.Isize 0)) in
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
        let* α2 := M.read (mk_str "one is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.alloc (M.rust_cast (Value.Integer Integer.Isize 1)) in
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
        let* α2 := M.read (mk_str "roses are #") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_lower_hex" in
        let* α6 := M.var "enums_c_like::Color::Red_discriminant" in
        let* α7 := BinOp.Panic.add α6 (Value.Integer Integer.Isize 0) in
        let* α8 := M.alloc (M.rust_cast α7) in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Placeholder")
            "new" in
        let* α12 :=
          M.call
            α11
            [
              Value.Integer Integer.Usize 0;
              " "%char;
              Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
              Value.Integer Integer.U32 8;
              Value.StructTuple "core::fmt::rt::Count::Implied" [];
              Value.StructTuple
                "core::fmt::rt::Count::Is"
                [ Value.Integer Integer.Usize 6 ]
            ] in
        let* α13 := M.alloc (Value.Array [ α12 ]) in
        let* α14 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::UnsafeArg")
            "new" in
        let* α15 := M.call α14 [] in
        let* α16 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10;
              M.pointer_coercion (* Unsize *) α13;
              α15
            ] in
        let* α17 := M.call α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1_formatted" in
        let* α2 := M.read (mk_str "violets are #") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_lower_hex" in
        let* α6 := M.var "enums_c_like::Color::Blue_discriminant" in
        let* α7 := BinOp.Panic.add α6 (Value.Integer Integer.Isize 0) in
        let* α8 := M.alloc (M.rust_cast α7) in
        let* α9 := M.call α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Placeholder")
            "new" in
        let* α12 :=
          M.call
            α11
            [
              Value.Integer Integer.Usize 0;
              " "%char;
              Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
              Value.Integer Integer.U32 8;
              Value.StructTuple "core::fmt::rt::Count::Implied" [];
              Value.StructTuple
                "core::fmt::rt::Count::Is"
                [ Value.Integer Integer.Usize 6 ]
            ] in
        let* α13 := M.alloc (Value.Array [ α12 ]) in
        let* α14 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::UnsafeArg")
            "new" in
        let* α15 := M.call α14 [] in
        let* α16 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10;
              M.pointer_coercion (* Unsize *) α13;
              α15
            ] in
        let* α17 := M.call α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
