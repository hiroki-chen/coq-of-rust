(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Foo";
    ty_params := [];
    fields := [ ("x", Ty.tuple [ Ty.path "u32"; Ty.path "u32" ]); ("y", Ty.path "u32") ];
  } *)

(*
fn main() {
    // Try changing the values in the struct to see what happens
    let foo = Foo { x: (1, 2), y: 3 };

    match foo {
        Foo { x: (1, b), y } => println!("First of x is 1, b = {},  y = {} ", b, y),

        // you can destructure structs and rename the variables,
        // the order is not important
        Foo { y: 2, x: i } => println!("y is 2, i = {:?}", i),

        // and you can also ignore some variables:
        Foo { y, .. } => println!("y = {}, we don't care about x", y),
        // this will give an error: pattern does not mention field `x`
        //Foo { y } => println!("y = {}", y),
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* foo :=
      M.alloc
        (Value.StructRecord
          "match_destructuring_structs::Foo"
          [
            ("x", Value.Tuple [ Value.Integer Integer.U32 1; Value.Integer Integer.U32 2 ]);
            ("y", Value.Integer Integer.U32 3)
          ]) in
    let* α0 :=
      M.match_operator
        foo
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_record_field_or_break_match γ "match_destructuring_structs::Foo" "x" in
            let* γ0_1 :=
              M.get_struct_record_field_or_break_match γ "match_destructuring_structs::Foo" "y" in
            let γ1_0 := M.get_tuple_field γ0_0 0 in
            let γ1_1 := M.get_tuple_field γ0_0 1 in
            let* _ :=
              let* α0 := M.read γ1_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.U32 1) in
            let* b := M.copy γ1_1 in
            let* y := M.copy γ0_1 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α6 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "First of x is 1, b = ") in
                  let* α3 := M.read (mk_str ",  y = ") in
                  let* α4 := M.read (mk_str " 
") in
                  let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
                  M.pure (M.pointer_coercion α5) in
              let* α12 :=
                (* Unsize *)
                  let* α7 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "u32" ] in
                  let* α8 := M.call_closure α7 [ b ] in
                  let* α9 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "u32" ] in
                  let* α10 := M.call_closure α9 [ y ] in
                  let* α11 := M.alloc (Value.Array [ α8; α10 ]) in
                  M.pure (M.pointer_coercion α11) in
              let* α13 := M.call_closure α1 [ α6; α12 ] in
              let* α14 := M.call_closure α0 [ α13 ] in M.alloc α14 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_record_field_or_break_match γ "match_destructuring_structs::Foo" "y" in
            let* γ0_1 :=
              M.get_struct_record_field_or_break_match γ "match_destructuring_structs::Foo" "x" in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.U32 2) in
            let* i := M.copy γ0_1 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "y is 2, i = ") in
                  let* α3 := M.read (mk_str "
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_debug"
                      [ Ty.tuple [ Ty.path "u32"; Ty.path "u32" ] ] in
                  let* α7 := M.call_closure α6 [ i ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 :=
              M.get_struct_record_field_or_break_match γ "match_destructuring_structs::Foo" "y" in
            let* y := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
              let* α5 :=
                (* Unsize *)
                  let* α2 := M.read (mk_str "y = ") in
                  let* α3 := M.read (mk_str ", we don't care about x
") in
                  let* α4 := M.alloc (Value.Array [ α2; α3 ]) in M.pure (M.pointer_coercion α4) in
              let* α9 :=
                (* Unsize *)
                  let* α6 :=
                    M.get_associated_function
                      (Ty.path "core::fmt::rt::Argument")
                      "new_display"
                      [ Ty.path "u32" ] in
                  let* α7 := M.call_closure α6 [ y ] in
                  let* α8 := M.alloc (Value.Array [ α7 ]) in M.pure (M.pointer_coercion α8) in
              let* α10 := M.call_closure α1 [ α5; α9 ] in
              let* α11 := M.call_closure α0 [ α10 ] in M.alloc α11 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
