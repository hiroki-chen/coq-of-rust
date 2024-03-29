(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Because of the annotation, the compiler knows that `elem` has type u8.
    let elem = 5u8;

    // Create an empty vector (a growable array).
    let mut vec = Vec::new();
    // At this point the compiler doesn't know the exact type of `vec`, it
    // just knows that it's a vector of something (`Vec<_>`).

    // Insert `elem` in the vector.
    vec.push(elem);
    // Aha! Now the compiler knows that `vec` is a vector of `u8`s (`Vec<u8>`)
    // TODO ^ Try commenting out the `vec.push(elem)` line

    println!("{:?}", vec);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* elem := M.alloc (Value.Integer Integer.U8 5) in
    let* vec :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
          "push"
          [] in
      let* α1 := M.read elem in
      let* α2 := M.call_closure α0 [ vec; α1 ] in
      M.alloc α2 in
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
                [
                  Ty.apply
                    (Ty.path "alloc::vec::Vec")
                    [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ]
                ] in
            let* α7 := M.call_closure α6 [ vec ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
