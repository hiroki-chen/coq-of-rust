(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    (1, 2, 3, 4);
    vec![5, 6, 7, 8];
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
                (Value.Tuple
                  [
                    Value.Integer Integer.I32 1;
                    Value.Integer Integer.I32 2;
                    Value.Integer Integer.I32 3;
                    Value.Integer Integer.I32 4
                  ])
              |) in
          let _ :=
            M.alloc
              (|
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (|
                        (Ty.apply (Ty.path "slice") [ Ty.path "i32" ]),
                        "into_vec",
                        [ Ty.path "alloc::alloc::Global" ]
                      |)),
                    [
                      (* Unsize *)
                        M.pointer_coercion
                          (M.read
                            (|
                              (M.call_closure
                                (|
                                  (M.get_associated_function
                                    (|
                                      (Ty.apply
                                        (Ty.path "alloc::boxed::Box")
                                        [
                                          Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                                          Ty.path "alloc::alloc::Global"
                                        ]),
                                      "new",
                                      []
                                    |)),
                                  [
                                    M.alloc
                                      (|
                                        (Value.Array
                                          [
                                            Value.Integer Integer.I32 5;
                                            Value.Integer Integer.I32 6;
                                            Value.Integer Integer.I32 7;
                                            Value.Integer Integer.I32 8
                                          ])
                                      |)
                                  ]
                                |))
                            |))
                    ]
                  |))
              |) in
          M.alloc (| (Value.Tuple []) |))
        |)))
  | _, _ => M.impossible
  end.
