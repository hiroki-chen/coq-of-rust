(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn id(x: u64) -> u64 {
    x
}
*)
Definition id (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ x ] =>
    ltac:(M.monadic
      (let x := M.alloc (| x |) in
      M.read (| x |)))
  | _, _ => M.impossible
  end.

(*
fn tri(a: u64, b: u64, c: u64) {}
*)
Definition tri (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ a; b; c ] =>
    ltac:(M.monadic
      (let a := M.alloc (| a |) in
      let b := M.alloc (| b |) in
      let c := M.alloc (| c |) in
      Value.Tuple []))
  | _, _ => M.impossible
  end.

(*
fn main() {
    id(0);
    id(id(0));
    id(id(id(0)));
    id(id(id(id(0))));
    tri(id(1), id(2), 3);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "example01::id", [] |),
                    [ Value.Integer Integer.U64 0 ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "example01::id", [] |),
                    [
                      M.call_closure (|
                          M.get_function (| "example01::id", [] |),
                          [ Value.Integer Integer.U64 0 ]
                        |)
                    ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "example01::id", [] |),
                    [
                      M.call_closure (|
                          M.get_function (| "example01::id", [] |),
                          [
                            M.call_closure (|
                                M.get_function (| "example01::id", [] |),
                                [ Value.Integer Integer.U64 0 ]
                              |)
                          ]
                        |)
                    ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "example01::id", [] |),
                    [
                      M.call_closure (|
                          M.get_function (| "example01::id", [] |),
                          [
                            M.call_closure (|
                                M.get_function (| "example01::id", [] |),
                                [
                                  M.call_closure (|
                                      M.get_function (| "example01::id", [] |),
                                      [ Value.Integer Integer.U64 0 ]
                                    |)
                                ]
                              |)
                          ]
                        |)
                    ]
                  |)
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_function (| "example01::tri", [] |),
                    [
                      M.call_closure (|
                          M.get_function (| "example01::id", [] |),
                          [ Value.Integer Integer.U64 1 ]
                        |);
                      M.call_closure (|
                          M.get_function (| "example01::id", [] |),
                          [ Value.Integer Integer.U64 2 ]
                        |);
                      Value.Integer Integer.U64 3
                    ]
                  |)
              |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
