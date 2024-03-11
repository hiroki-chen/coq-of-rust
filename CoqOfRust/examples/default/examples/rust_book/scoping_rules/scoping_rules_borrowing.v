(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn eat_box_i32(boxed_i32: Box<i32>) {
    println!("Destroying box that contains {}", boxed_i32);
}
*)
Definition eat_box_i32 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ boxed_i32 ] =>
    let* boxed_i32 := M.alloc boxed_i32 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "Destroying box that contains ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ boxed_i32 ] in
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
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn borrow_i32(borrowed_i32: &i32) {
    println!("This int is: {}", borrowed_i32);
}
*)
Definition borrow_i32 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ borrowed_i32 ] =>
    let* borrowed_i32 := M.alloc borrowed_i32 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "This int is: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.call α5 [ borrowed_i32 ] in
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
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Create a boxed i32, and a stacked i32
    let boxed_i32 = Box::new(5_i32);
    let stacked_i32 = 6_i32;

    // Borrow the contents of the box. Ownership is not taken,
    // so the contents can be borrowed again.
    borrow_i32(&boxed_i32);
    borrow_i32(&stacked_i32);

    {
        // Take a reference to the data contained inside the box
        let _ref_to_i32: &i32 = &boxed_i32;

        // Error!
        // Can't destroy `boxed_i32` while the inner value is borrowed later in scope.
        // eat_box_i32(boxed_i32);
        // FIXME ^ Comment out this line

        // Attempt to borrow `_ref_to_i32` after inner value is destroyed
        borrow_i32(_ref_to_i32);
        // `_ref_to_i32` goes out of scope and is no longer borrowed.
    }

    // `boxed_i32` can now give up ownership to `eat_box` and be destroyed
    eat_box_i32(boxed_i32);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* boxed_i32 :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new" in
      let* α1 := M.call α0 [ Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* stacked_i32 := M.alloc (Value.Integer Integer.I32 6) in
    let* _ :=
      let* α0 := M.get_function "scoping_rules_borrowing::borrow_i32" [] in
      let* α1 := M.read boxed_i32 in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "scoping_rules_borrowing::borrow_i32" [] in
      let* α1 := M.call α0 [ stacked_i32 ] in
      M.alloc α1 in
    let* _ :=
      let* _ref_to_i32 :=
        let* α0 := M.read boxed_i32 in
        M.alloc α0 in
      let* _ :=
        let* α0 := M.get_function "scoping_rules_borrowing::borrow_i32" [] in
        let* α1 := M.read _ref_to_i32 in
        let* α2 := M.call α0 [ α1 ] in
        M.alloc α2 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 := M.get_function "scoping_rules_borrowing::eat_box_i32" [] in
      let* α1 := M.read boxed_i32 in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
