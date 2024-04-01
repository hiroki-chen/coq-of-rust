(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn eat_box_i32(boxed_i32: Box<i32>) {
    println!("Destroying box that contains {}", boxed_i32);
}
*)
Definition eat_box_i32 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ boxed_i32 ] =>
    ltac:(M.monadic
      (let boxed_i32 := M.alloc (| boxed_i32 |) in
      M.read (|
          let _ :=
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                            M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.read (| mk_str "Destroying box that contains " |);
                                          M.read (| mk_str "
" |)
                                        ]
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.call_closure (|
                                              M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_display",
                                                  [
                                                    Ty.apply
                                                      (Ty.path "alloc::boxed::Box")
                                                      [
                                                        Ty.path "i32";
                                                        Ty.path "alloc::alloc::Global"
                                                      ]
                                                  ]
                                                |),
                                              [ boxed_i32 ]
                                            |)
                                        ]
                                    |))
                            ]
                          |)
                      ]
                    |)
                |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.

(*
fn borrow_i32(borrowed_i32: &i32) {
    println!("This int is: {}", borrowed_i32);
}
*)
Definition borrow_i32 (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ borrowed_i32 ] =>
    ltac:(M.monadic
      (let borrowed_i32 := M.alloc (| borrowed_i32 |) in
      M.read (|
          let _ :=
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                            M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.read (| mk_str "This int is: " |);
                                          M.read (| mk_str "
" |)
                                        ]
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.call_closure (|
                                              M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_display",
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ]
                                                |),
                                              [ borrowed_i32 ]
                                            |)
                                        ]
                                    |))
                            ]
                          |)
                      ]
                    |)
                |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
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
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let boxed_i32 :=
            M.alloc (|
                M.call_closure (|
                    M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                        "new",
                        []
                      |),
                    [ Value.Integer Integer.I32 5 ]
                  |)
              |) in
          let stacked_i32 := M.alloc (| Value.Integer Integer.I32 6 |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "scoping_rules_borrowing::borrow_i32", [] |),
                    [ M.read (| boxed_i32 |) ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "scoping_rules_borrowing::borrow_i32", [] |),
                    [ stacked_i32 ]
                  |)
              |) in
          let _ :=
            let _ref_to_i32 := M.alloc (| M.read (| boxed_i32 |) |) in
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "scoping_rules_borrowing::borrow_i32", [] |),
                      [ M.read (| _ref_to_i32 |) ]
                    |)
                |) in
            M.alloc (| Value.Tuple [] |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "scoping_rules_borrowing::eat_box_i32", [] |),
                    [ M.read (| boxed_i32 |) ]
                  |)
              |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
