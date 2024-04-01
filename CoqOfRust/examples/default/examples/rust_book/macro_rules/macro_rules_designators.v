(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition foo (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let _ :=
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
                                        [
                                          M.read (| (mk_str "You called ") |);
                                          M.read (| (mk_str "()
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
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |)),
                                              [ mk_str "foo" ]
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

(*
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition bar (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let _ :=
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
                                        [
                                          M.read (| (mk_str "You called ") |);
                                          M.read (| (mk_str "()
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
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |)),
                                              [ mk_str "bar" ]
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

(*
fn main() {
    foo();
    bar();

    print_result!(1u32 + 1);

    // Recall that blocks are expressions too!
    print_result!({
        let x = 1u32;

        x * x + 2 * x - 1
    });
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let _ :=
            M.alloc
              (|
                (M.call_closure (| (M.get_function (| "macro_rules_designators::foo", [] |)), [] |))
              |) in
          let _ :=
            M.alloc
              (|
                (M.call_closure (| (M.get_function (| "macro_rules_designators::bar", [] |)), [] |))
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
                                        [
                                          M.read (| (mk_str "") |);
                                          M.read (| (mk_str " = ") |);
                                          M.read (| (mk_str "
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
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |)),
                                              [ mk_str "1u32 + 1" ]
                                            |);
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_debug",
                                                  [ Ty.path "u32" ]
                                                |)),
                                              [
                                                M.alloc
                                                  (|
                                                    (BinOp.Panic.add
                                                      (|
                                                        (Value.Integer Integer.U32 1),
                                                        (Value.Integer Integer.U32 1)
                                                      |))
                                                  |)
                                              ]
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
                                        [
                                          M.read (| (mk_str "") |);
                                          M.read (| (mk_str " = ") |);
                                          M.read (| (mk_str "
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
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |)),
                                              [ mk_str "{ let x = 1u32; x * x + 2 * x - 1 }" ]
                                            |);
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_debug",
                                                  [ Ty.path "u32" ]
                                                |)),
                                              [
                                                let x :=
                                                  M.alloc (| (Value.Integer Integer.U32 1) |) in
                                                M.alloc
                                                  (|
                                                    (BinOp.Panic.sub
                                                      (|
                                                        (BinOp.Panic.add
                                                          (|
                                                            (BinOp.Panic.mul
                                                              (| (M.read (| x |)), (M.read (| x |))
                                                              |)),
                                                            (BinOp.Panic.mul
                                                              (|
                                                                (Value.Integer Integer.U32 2),
                                                                (M.read (| x |))
                                                              |))
                                                          |)),
                                                        (Value.Integer Integer.U32 1)
                                                      |))
                                                  |)
                                              ]
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
