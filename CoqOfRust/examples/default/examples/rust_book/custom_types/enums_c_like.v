(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Number *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Zero";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "One";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Two";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

(* Enum Color *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Red";
        item := StructTuple [];
        discriminant := Some 16711680;
      };
      {
        name := "Green";
        item := StructTuple [];
        discriminant := Some 65280;
      };
      {
        name := "Blue";
        item := StructTuple [];
        discriminant := Some 255;
      }
    ];
} *)

(*
fn main() {
    // `enums` can be cast as integers.
    println!("zero is {}", Number::Zero as i32);
    println!("one is {}", Number::One as i32);

    println!("roses are #{:06x}", Color::Red as i32);
    println!("violets are #{:06x}", Color::Blue as i32);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "zero is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α10 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α7 := M.alloc (M.rust_cast (Value.Integer Integer.Isize 0)) in
            let* α8 := M.call_closure α6 [ α7 ] in
            let* α9 := M.alloc (Value.Array [ α8 ]) in M.pure (M.pointer_coercion α9) in
        let* α11 := M.call_closure α1 [ α5; α10 ] in
        let* α12 := M.call_closure α0 [ α11 ] in M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "one is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α10 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α7 := M.alloc (M.rust_cast (Value.Integer Integer.Isize 1)) in
            let* α8 := M.call_closure α6 [ α7 ] in
            let* α9 := M.alloc (Value.Array [ α8 ]) in M.pure (M.pointer_coercion α9) in
        let* α11 := M.call_closure α1 [ α5; α10 ] in
        let* α12 := M.call_closure α0 [ α11 ] in M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1_formatted" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "roses are #") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_lower_hex"
                [ Ty.path "i32" ] in
            let* α7 := M.get_constant "enums_c_like::Color::Red_discriminant" in
            let* α8 := BinOp.Panic.add α7 (Value.Integer Integer.Isize 0) in
            let* α9 := M.alloc (M.rust_cast α8) in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α16 :=
          (* Unsize *)
            let* α13 := M.get_associated_function (Ty.path "core::fmt::rt::Placeholder") "new" [] in
            let* α14 :=
              M.call_closure
                α13
                [
                  Value.Integer Integer.Usize 0;
                  Value.UnicodeChar 32;
                  Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
                  Value.Integer Integer.U32 8;
                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                  Value.StructTuple "core::fmt::rt::Count::Is" [ Value.Integer Integer.Usize 6 ]
                ] in
            let* α15 := M.alloc (Value.Array [ α14 ]) in M.pure (M.pointer_coercion α15) in
        let* α17 := M.get_associated_function (Ty.path "core::fmt::rt::UnsafeArg") "new" [] in
        let* α18 := M.call_closure α17 [] in
        let* α19 := M.call_closure α1 [ α5; α12; α16; α18 ] in
        let* α20 := M.call_closure α0 [ α19 ] in M.alloc α20 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1_formatted" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "violets are #") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
        let* α12 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_lower_hex"
                [ Ty.path "i32" ] in
            let* α7 := M.get_constant "enums_c_like::Color::Blue_discriminant" in
            let* α8 := BinOp.Panic.add α7 (Value.Integer Integer.Isize 0) in
            let* α9 := M.alloc (M.rust_cast α8) in
            let* α10 := M.call_closure α6 [ α9 ] in
            let* α11 := M.alloc (Value.Array [ α10 ]) in M.pure (M.pointer_coercion α11) in
        let* α16 :=
          (* Unsize *)
            let* α13 := M.get_associated_function (Ty.path "core::fmt::rt::Placeholder") "new" [] in
            let* α14 :=
              M.call_closure
                α13
                [
                  Value.Integer Integer.Usize 0;
                  Value.UnicodeChar 32;
                  Value.StructTuple "core::fmt::rt::Alignment::Unknown" [];
                  Value.Integer Integer.U32 8;
                  Value.StructTuple "core::fmt::rt::Count::Implied" [];
                  Value.StructTuple "core::fmt::rt::Count::Is" [ Value.Integer Integer.Usize 6 ]
                ] in
            let* α15 := M.alloc (Value.Array [ α14 ]) in M.pure (M.pointer_coercion α15) in
        let* α17 := M.get_associated_function (Ty.path "core::fmt::rt::UnsafeArg") "new" [] in
        let* α18 := M.call_closure α17 [] in
        let* α19 := M.call_closure α1 [ α5; α12; α16; α18 ] in
        let* α20 := M.call_closure α0 [ α19 ] in M.alloc α20 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
