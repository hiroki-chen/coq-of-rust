(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let x = 5u32;

    let y = {
        let x_squared = x * x;
        let x_cube = x_squared * x;

        // This expression will be assigned to `y`
        x_cube + x_squared + x
    };

    let z = {
        // The semicolon suppresses this expression and `()` is assigned to `z`
        2 * x;
    };

    println!("x is {:?}", x);
    println!("y is {:?}", y);
    println!("z is {:?}", z);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let x := M.alloc (| (Value.Integer Integer.U32 5) |) in
          let y :=
            M.copy
              (|
                (let x_squared :=
                  M.alloc (| (BinOp.Panic.mul (| (M.read (| x |)), (M.read (| x |)) |)) |) in
                let x_cube :=
                  M.alloc
                    (| (BinOp.Panic.mul (| (M.read (| x_squared |)), (M.read (| x |)) |))
                    |) in
                M.alloc
                  (|
                    (BinOp.Panic.add
                      (|
                        (BinOp.Panic.add (| (M.read (| x_cube |)), (M.read (| x_squared |)) |)),
                        (M.read (| x |))
                      |))
                  |))
              |) in
          let z :=
            M.copy
              (|
                (let _ :=
                  M.alloc
                    (| (BinOp.Panic.mul (| (Value.Integer Integer.U32 2), (M.read (| x |)) |))
                    |) in
                M.alloc (| (Value.Tuple []) |))
              |) in
          let _ :=
            let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "std::io::stdio::_print", [] |)),
                      [
                        M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                              |)),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [ M.read (| (mk_str "x is ") |); M.read (| (mk_str "
") |)
                                        ])
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_debug",
                                                  [ Ty.path "u32" ]
                                                |)),
                                              [ x ]
                                            |)
                                        ])
                                    |))
                            ]
                          |)
                      ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |) in
          let _ :=
            let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "std::io::stdio::_print", [] |)),
                      [
                        M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                              |)),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [ M.read (| (mk_str "y is ") |); M.read (| (mk_str "
") |)
                                        ])
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_debug",
                                                  [ Ty.path "u32" ]
                                                |)),
                                              [ y ]
                                            |)
                                        ])
                                    |))
                            ]
                          |)
                      ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |) in
          let _ :=
            let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "std::io::stdio::_print", [] |)),
                      [
                        M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                              |)),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [ M.read (| (mk_str "z is ") |); M.read (| (mk_str "
") |)
                                        ])
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_debug",
                                                  [ Ty.tuple [] ]
                                                |)),
                                              [ z ]
                                            |)
                                        ])
                                    |))
                            ]
                          |)
                      ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |) in
          M.alloc (| (Value.Tuple []) |))
        |)))
  | _, _ => M.impossible
  end.
