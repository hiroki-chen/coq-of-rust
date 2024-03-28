(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn reverse(pair: (i32, bool)) -> (bool, i32) {
    // `let` can be used to bind the members of a tuple to variables
    let (int_param, bool_param) = pair;

    (bool_param, int_param)
}
*)
Definition reverse (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ pair_ ] =>
    let* pair_ := M.alloc pair_ in
    let* α0 :=
      match_operator
        pair_
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* int_param := M.copy γ0_0 in
            let* bool_param := M.copy γ0_1 in
            let* α0 := M.read bool_param in
            let* α1 := M.read int_param in
            M.alloc (Value.Tuple [ α0; α1 ])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(* StructTuple
  {
    name := "Matrix";
    ty_params := [];
    fields := [ Ty.path "f32"; Ty.path "f32"; Ty.path "f32"; Ty.path "f32" ];
  } *)

Module Impl_core_fmt_Debug_for_tuples_Matrix.
  Definition Self : Ty.t := Ty.path "tuples::Matrix".
  
  (*
  Debug
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field4_finish"
          [] in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Matrix") in
      let* α4 :=
        (* Unsize *)
          let* α3 := M.read self in
          M.pure
            (M.pointer_coercion
              (M.get_struct_tuple_field α3 "tuples::Matrix" 0)) in
      let* α6 :=
        (* Unsize *)
          let* α5 := M.read self in
          M.pure
            (M.pointer_coercion
              (M.get_struct_tuple_field α5 "tuples::Matrix" 1)) in
      let* α8 :=
        (* Unsize *)
          let* α7 := M.read self in
          M.pure
            (M.pointer_coercion
              (M.get_struct_tuple_field α7 "tuples::Matrix" 2)) in
      let* α11 :=
        (* Unsize *)
          let* α9 := M.read self in
          let* α10 :=
            M.alloc (M.get_struct_tuple_field α9 "tuples::Matrix" 3) in
          M.pure (M.pointer_coercion α10) in
      M.call_closure α0 [ α1; α2; α4; α6; α8; α11 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_tuples_Matrix.

(*
fn main() {
    // A tuple with a bunch of different types
    let long_tuple = (1u8, 2u16, 3u32, 4u64,
                      -1i8, -2i16, -3i32, -4i64,
                      0.1f32, 0.2f64,
                      'a', true);

    // Values can be extracted from the tuple using tuple indexing
    println!("long tuple first value: {}", long_tuple.0);
    println!("long tuple second value: {}", long_tuple.1);

    // Tuples can be tuple members
    let tuple_of_tuples = ((1u8, 2u16, 2u32), (4u64, -1i8), -2i16);

    // Tuples are printable
    println!("tuple of tuples: {:?}", tuple_of_tuples);
    
    // But long Tuples (more than 12 elements) cannot be printed
    // let too_long_tuple = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
    // println!("too long tuple: {:?}", too_long_tuple);
    // TODO ^ Uncomment the above 2 lines to see the compiler error

    let pair = (1, true);
    println!("pair is {:?}", pair);

    println!("the reversed pair is {:?}", reverse(pair));

    // To create one element tuples, the comma is required to tell them apart
    // from a literal surrounded by parentheses
    println!("one element tuple: {:?}", (5u32,));
    println!("just an integer: {:?}", (5u32));

    //tuples can be destructured to create bindings
    let tuple = (1, "hello", 4.5, true);

    let (a, b, c, d) = tuple;
    println!("{:?}, {:?}, {:?}, {:?}", a, b, c, d);

    let matrix = Matrix(1.1, 1.2, 2.1, 2.2);
    println!("{:?}", matrix);

}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* long_tuple :=
      let* α0 := M.read UnsupportedLiteral in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.Tuple
          [
            Value.Integer Integer.U8 1;
            Value.Integer Integer.U16 2;
            Value.Integer Integer.U32 3;
            Value.Integer Integer.U64 4;
            Value.Integer Integer.I8 (-1);
            Value.Integer Integer.I16 (-2);
            Value.Integer Integer.I32 (-3);
            Value.Integer Integer.I64 (-4);
            α0;
            α1;
            Value.UnicodeChar 97;
            Value.Bool true
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "long tuple first value: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "u8" ] in
            let* α7 := M.call_closure α6 [ M.get_tuple_field long_tuple 0 ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "long tuple second value: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "u16" ] in
            let* α7 := M.call_closure α6 [ M.get_tuple_field long_tuple 1 ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* tuple_of_tuples :=
      M.alloc
        (Value.Tuple
          [
            Value.Tuple
              [
                Value.Integer Integer.U8 1;
                Value.Integer Integer.U16 2;
                Value.Integer Integer.U32 2
              ];
            Value.Tuple
              [ Value.Integer Integer.U64 4; Value.Integer Integer.I8 (-1) ];
            Value.Integer Integer.I16 (-2)
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "tuple of tuples: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [
                  Ty.tuple
                    [
                      Ty.tuple [ Ty.path "u8"; Ty.path "u16"; Ty.path "u32" ];
                      Ty.tuple [ Ty.path "u64"; Ty.path "i8" ];
                      Ty.path "i16"
                    ]
                ] in
            let* α7 := M.call_closure α6 [ tuple_of_tuples ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* pair_ :=
      M.alloc (Value.Tuple [ Value.Integer Integer.I32 1; Value.Bool true ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "pair is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.tuple [ Ty.path "i32"; Ty.path "bool" ] ] in
            let* α7 := M.call_closure α6 [ pair_ ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "the reversed pair is ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α13 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.tuple [ Ty.path "bool"; Ty.path "i32" ] ] in
            let* α7 := M.get_function "tuples::reverse" [] in
            let* α8 := M.read pair_ in
            let* α9 := M.call_closure α7 [ α8 ] in
            let* α10 := M.alloc α9 in
            let* α11 := M.call_closure α6 [ α10 ] in
            let* α12 := M.alloc (Value.Array [ α11 ]) in
            M.pure (M.pointer_coercion α12) in
        let* α14 := M.call_closure α1 [ α5; α13 ] in
        let* α15 := M.call_closure α0 [ α14 ] in
        M.alloc α15 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "one element tuple: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α10 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.tuple [ Ty.path "u32" ] ] in
            let* α7 := M.alloc (Value.Tuple [ Value.Integer Integer.U32 5 ]) in
            let* α8 := M.call_closure α6 [ α7 ] in
            let* α9 := M.alloc (Value.Array [ α8 ]) in
            M.pure (M.pointer_coercion α9) in
        let* α11 := M.call_closure α1 [ α5; α10 ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "just an integer: ") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α10 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.path "u32" ] in
            let* α7 := M.alloc (Value.Integer Integer.U32 5) in
            let* α8 := M.call_closure α6 [ α7 ] in
            let* α9 := M.alloc (Value.Array [ α8 ]) in
            M.pure (M.pointer_coercion α9) in
        let* α11 := M.call_closure α1 [ α5; α10 ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* tuple :=
      let* α0 := M.read (mk_str "hello") in
      let* α1 := M.read UnsupportedLiteral in
      M.alloc
        (Value.Tuple
          [ Value.Integer Integer.I32 1; α0; α1; Value.Bool true ]) in
    let* α0 :=
      match_operator
        tuple
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let γ0_2 := M.get_tuple_field γ 2 in
            let γ0_3 := M.get_tuple_field γ 3 in
            let* a := M.copy γ0_0 in
            let* b := M.copy γ0_1 in
            let* c := M.copy γ0_2 in
            let* d := M.copy γ0_3 in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α8 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "") in
                    let* α3 := M.read (mk_str ", ") in
                    let* α4 := M.read (mk_str ", ") in
                    let* α5 := M.read (mk_str ", ") in
                    let* α6 := M.read (mk_str "
") in
                    let* α7 := M.alloc (Value.Array [ α2; α3; α4; α5; α6 ]) in
                    M.pure (M.pointer_coercion α7) in
                let* α18 :=
                  (* Unsize *)
                    let* α9 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "i32" ] in
                    let* α10 := M.call_closure α9 [ a ] in
                    let* α11 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                    let* α12 := M.call_closure α11 [ b ] in
                    let* α13 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "f64" ] in
                    let* α14 := M.call_closure α13 [ c ] in
                    let* α15 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "bool" ] in
                    let* α16 := M.call_closure α15 [ d ] in
                    let* α17 := M.alloc (Value.Array [ α10; α12; α14; α16 ]) in
                    M.pure (M.pointer_coercion α17) in
                let* α19 := M.call_closure α1 [ α8; α18 ] in
                let* α20 := M.call_closure α0 [ α19 ] in
                M.alloc α20 in
              M.alloc (Value.Tuple []) in
            let* matrix :=
              let* α0 := M.read UnsupportedLiteral in
              let* α1 := M.read UnsupportedLiteral in
              let* α2 := M.read UnsupportedLiteral in
              let* α3 := M.read UnsupportedLiteral in
              M.alloc (Value.StructTuple "tuples::Matrix" [ α0; α1; α2; α3 ]) in
            let* _ :=
              let* _ :=
                let* α0 := M.get_function "std::io::stdio::_print" [] in
                let* α1 :=
                  M.get_associated_function
                    (Ty.path "core::fmt::Arguments")
                    "new_v1"
                    [] in
                let* α5 :=
                  (* Unsize *)
                    let* α2 := M.read (mk_str "") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                    M.pure (M.pointer_coercion α4) in
                let* α9 :=
                  (* Unsize *)
                    let* α6 :=
                      M.get_associated_function
                        (Ty.path "core::fmt::rt::Argument")
                        "new_debug"
                        [ Ty.path "tuples::Matrix" ] in
                    let* α7 := M.call_closure α6 [ matrix ] in
                    let* α8 := M.alloc (Value.Array [ α7 ]) in
                    M.pure (M.pointer_coercion α8) in
                let* α10 := M.call_closure α1 [ α5; α9 ] in
                let* α11 := M.call_closure α0 [ α10 ] in
                M.alloc α11 in
              M.alloc (Value.Tuple []) in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
