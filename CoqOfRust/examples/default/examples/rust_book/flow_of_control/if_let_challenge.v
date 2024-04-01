(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Foo *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let a := M.alloc (| (Value.StructTuple "if_let_challenge::Foo::Bar" []) |) in
          M.match_operator
            (|
              (M.alloc (| (Value.Tuple []) |)),
              [
                fun γ =>
                  ltac:(M.monadic
                    (let γ := a in
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
                                        (| (Ty.path "core::fmt::Arguments"), "new_const", []
                                        |)),
                                      [
                                        (* Unsize *)
                                          M.pointer_coercion
                                            (M.alloc
                                              (|
                                                (Value.Array
                                                  [ M.read (| (mk_str "a is foobar
") |) ])
                                              |))
                                      ]
                                    |)
                                ]
                              |))
                          |) in
                      M.alloc (| (Value.Tuple []) |) in
                    M.alloc (| (Value.Tuple []) |)));
                fun γ => ltac:(M.monadic (M.alloc (| (Value.Tuple []) |)))
              ]
            |))
        |)))
  | _, _ => M.impossible
  end.
