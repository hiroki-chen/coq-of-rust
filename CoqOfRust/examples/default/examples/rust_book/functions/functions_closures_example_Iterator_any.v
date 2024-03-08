(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let vec1 = vec![1, 2, 3];
    let vec2 = vec![4, 5, 6];

    // `iter()` for vecs yields `&i32`. Destructure to `i32`.
    println!("2 in vec1: {}", vec1.iter().any(|&x| x == 2));
    // `into_iter()` for vecs yields `i32`. No destructuring required.
    println!("2 in vec2: {}", vec2.into_iter().any(|x| x == 2));

    // `iter()` only borrows `vec1` and its elements, so they can be used again
    println!("vec1 len: {}", vec1.len());
    println!("First element of vec1 is: {}", vec1[0]);
    // `into_iter()` does move `vec2` and its elements, so they cannot be used again
    // println!("First element of vec2 is: {}", vec2[0]);
    // println!("vec2 len: {}", vec2.len());
    // TODO: uncomment two lines above and see compiler errors.

    let array1 = [1, 2, 3];
    let array2 = [4, 5, 6];

    // `iter()` for arrays yields `&i32`.
    println!("2 in array1: {}", array1.iter().any(|&x| x == 2));
    // `into_iter()` for arrays yields `i32`.
    println!("2 in array2: {}", array2.into_iter().any(|x| *x == 2));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* vec1 :=
      let* α0 :=
        M.alloc
          [
            Value.Integer Integer.I32 1;
            Value.Integer Integer.I32 2;
            Value.Integer Integer.I32 3
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ M.pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* vec2 :=
      let* α0 :=
        M.alloc
          [
            Value.Integer Integer.I32 4;
            Value.Integer Integer.I32 5;
            Value.Integer Integer.I32 6
          ] in
      let* α1 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α0 ] in
      let* α2 := M.read α1 in
      let* α3 :=
        M.call
          (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["into_vec"]
          [ M.pointer_coercion "Unsize" α2 ] in
      M.alloc α3 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "2 in vec1: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            "any"
            [
              (* Self *)
                Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ];
              (* F *)
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                  (Ty.path "bool")
            ] in
        let* α5 :=
          M.get_trait_method
            "core::ops::deref::Deref"
            "deref"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
            ] in
        let* α6 := M.call α5 [ vec1 ] in
        let* α7 :=
          M.call
            (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter"]
            [ α6 ] in
        let* α8 := M.alloc α7 in
        let* α9 :=
          M.call
            α4
            [
              α8;
              fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "i32" ]) =>
                (let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      (let* γ :=
                        let* α0 := M.read γ in
                        M.pure (deref α0) in
                      let* x := M.copy γ in
                      let* α0 := M.read x in
                      M.pure (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2)))
                  ])
            ] in
        let* α10 := M.alloc α9 in
        let* α11 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α10 ] in
        let* α12 := M.alloc [ α11 ] in
        let* α13 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α12
            ] in
        let* α14 := M.call α0 [ α13 ] in
        M.alloc α14 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "2 in vec2: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            "any"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::vec::into_iter::IntoIter")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
              (* F *)
                Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "bool")
            ] in
        let* α5 :=
          M.get_trait_method
            "core::iter::traits::collect::IntoIterator"
            "into_iter"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
            ] in
        let* α6 := M.read vec2 in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc α7 in
        let* α9 :=
          M.call
            α4
            [
              α8;
              fun (α0 : Ty.path "i32") =>
                (let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      (let* x := M.copy γ in
                      let* α0 := M.read x in
                      M.pure (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2)))
                  ])
            ] in
        let* α10 := M.alloc α9 in
        let* α11 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α10 ] in
        let* α12 := M.alloc [ α11 ] in
        let* α13 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α12
            ] in
        let* α14 := M.call α0 [ α13 ] in
        M.alloc α14 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "vec1 len: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.apply
                (Ty.path "alloc::vec::Vec")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])::["len"]
            [ vec1 ] in
        let* α5 := M.alloc α4 in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "First element of vec1 is: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_trait_method
            "core::ops::index::Index"
            "index"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ];
              (* Idx *) Ty.path "usize"
            ] in
        let* α5 := M.call α4 [ vec1; Value.Integer Integer.Usize 0 ] in
        let* α6 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α5 ] in
        let* α7 := M.alloc [ α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α7
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* array1 :=
      M.alloc
        [
          Value.Integer Integer.I32 1;
          Value.Integer Integer.I32 2;
          Value.Integer Integer.I32 3
        ] in
    let* array2 :=
      M.alloc
        [
          Value.Integer Integer.I32 4;
          Value.Integer Integer.I32 5;
          Value.Integer Integer.I32 6
        ] in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "2 in array1: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            "any"
            [
              (* Self *)
                Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ];
              (* F *)
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                  (Ty.path "bool")
            ] in
        let* α5 :=
          M.call
            (Ty.apply (Ty.path "slice") [ Ty.path "i32" ])::["iter"]
            [ M.pointer_coercion "Unsize" array1 ] in
        let* α6 := M.alloc α5 in
        let* α7 :=
          M.call
            α4
            [
              α6;
              fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "i32" ]) =>
                (let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      (let* γ :=
                        let* α0 := M.read γ in
                        M.pure (deref α0) in
                      let* x := M.copy γ in
                      let* α0 := M.read x in
                      M.pure (BinOp.Pure.eq α0 (Value.Integer Integer.I32 2)))
                  ])
            ] in
        let* α8 := M.alloc α7 in
        let* α9 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α8 ] in
        let* α10 := M.alloc [ α9 ] in
        let* α11 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α10
            ] in
        let* α12 := M.call α0 [ α11 ] in
        M.alloc α12 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "2 in array2: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            "any"
            [
              (* Self *)
                Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "i32" ];
              (* F *)
                Ty.function
                  [ Ty.tuple [ Ty.apply (Ty.path "ref") [ Ty.path "i32" ] ] ]
                  (Ty.path "bool")
            ] in
        let* α5 :=
          M.get_trait_method
            "core::iter::traits::collect::IntoIterator"
            "into_iter"
            [
              (* Self *)
                Ty.apply
                  (Ty.path "ref")
                  [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ]
            ] in
        let* α6 := M.call α5 [ array2 ] in
        let* α7 := M.alloc α6 in
        let* α8 :=
          M.call
            α4
            [
              α7;
              fun (α0 : Ty.apply (Ty.path "ref") [ Ty.path "i32" ]) =>
                (let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      (let* x := M.copy γ in
                      let* α0 := M.read x in
                      let* α1 := M.read α0 in
                      M.pure (BinOp.Pure.eq α1 (Value.Integer Integer.I32 2)))
                  ])
            ] in
        let* α9 := M.alloc α8 in
        let* α10 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α9 ] in
        let* α11 := M.alloc [ α10 ] in
        let* α12 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α11
            ] in
        let* α13 := M.call α0 [ α12 ] in
        M.alloc α13 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
