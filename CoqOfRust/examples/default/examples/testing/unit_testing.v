(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
*)
Definition add (a : i32.t) (b : i32.t) : M i32.t :=
  let* a := M.alloc a in
  let* b := M.alloc b in
  let* α0 : i32.t := M.read a in
  let* α1 : i32.t := M.read b in
  BinOp.Panic.add α0 α1.

(*
fn bad_add(a: i32, b: i32) -> i32 {
    a - b
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition bad_add (a : i32.t) (b : i32.t) : M i32.t :=
  let* a := M.alloc a in
  let* b := M.alloc b in
  let* α0 : i32.t := M.read a in
  let* α1 : i32.t := M.read b in
  BinOp.Panic.sub α0 α1.

Module tests.
  (*
      fn test_add() {
          assert_eq!(add(1, 2), 3);
      }
  *)
  Definition test_add : M unit :=
    let* _ : M.Val unit :=
      let* α0 : i32.t :=
        M.call
          (unit_testing.add
            ((Integer.of_Z 1) : i32.t)
            ((Integer.of_Z 2) : i32.t)) in
      let* α1 : M.Val i32.t := M.alloc α0 in
      let* α2 : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
      let* α3 : M.Val ((ref i32.t) * (ref i32.t)) :=
        M.alloc (borrow α1, borrow α2) in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 : ref i32.t := M.read left_val in
              let* α1 : i32.t := M.read (deref α0) in
              let* α2 : ref i32.t := M.read right_val in
              let* α3 : i32.t := M.read (deref α2) in
              let* α4 : M.Val bool.t :=
                M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
              let* α5 : bool.t := M.read (use α4) in
              if α5 then
                let* kind : M.Val core.panicking.AssertKind.t :=
                  M.alloc core.panicking.AssertKind.Eq in
                let* α0 : core.panicking.AssertKind.t := M.read kind in
                let* α1 : ref i32.t := M.read left_val in
                let* α2 : ref i32.t := M.read right_val in
                let* α3 : never.t :=
                  M.call
                    (core.panicking.assert_failed
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                let* α0 : M.Val never.t := M.alloc α3 in
                let* α1 := M.read α0 in
                let* α2 : unit := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            M (M.Val unit)
        ] in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  (*
      fn test_bad_add() {
          // This assert would fire and test will fail.
          // Please note, that private functions can be tested too!
          assert_eq!(bad_add(1, 2), 3);
      }
  *)
  Definition test_bad_add : M unit :=
    let* _ : M.Val unit :=
      let* α0 : i32.t :=
        M.call
          (unit_testing.bad_add
            ((Integer.of_Z 1) : i32.t)
            ((Integer.of_Z 2) : i32.t)) in
      let* α1 : M.Val i32.t := M.alloc α0 in
      let* α2 : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
      let* α3 : M.Val ((ref i32.t) * (ref i32.t)) :=
        M.alloc (borrow α1, borrow α2) in
      match_operator
        α3
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | (_, _) =>
              let γ0_0 := Tuple.Access.left γ in
              let γ0_1 := Tuple.Access.right γ in
              let* left_val := M.copy γ0_0 in
              let* right_val := M.copy γ0_1 in
              let* α0 : ref i32.t := M.read left_val in
              let* α1 : i32.t := M.read (deref α0) in
              let* α2 : ref i32.t := M.read right_val in
              let* α3 : i32.t := M.read (deref α2) in
              let* α4 : M.Val bool.t :=
                M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
              let* α5 : bool.t := M.read (use α4) in
              if α5 then
                let* kind : M.Val core.panicking.AssertKind.t :=
                  M.alloc core.panicking.AssertKind.Eq in
                let* α0 : core.panicking.AssertKind.t := M.read kind in
                let* α1 : ref i32.t := M.read left_val in
                let* α2 : ref i32.t := M.read right_val in
                let* α3 : never.t :=
                  M.call
                    (core.panicking.assert_failed
                      α0
                      α1
                      α2
                      core.option.Option.None) in
                let* α0 : M.Val never.t := M.alloc α3 in
                let* α1 := M.read α0 in
                let* α2 : unit := never_to_any α1 in
                M.alloc α2
              else
                M.alloc tt
            end) :
            M (M.Val unit)
        ] in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
End tests.

(*
    fn test_add() {
        assert_eq!(add(1, 2), 3);
    }
*)
Definition test_add : M unit :=
  let* _ : M.Val unit :=
    let* α0 : i32.t :=
      M.call
        (unit_testing.add
          ((Integer.of_Z 1) : i32.t)
          ((Integer.of_Z 2) : i32.t)) in
    let* α1 : M.Val i32.t := M.alloc α0 in
    let* α2 : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
    let* α3 : M.Val ((ref i32.t) * (ref i32.t)) :=
      M.alloc (borrow α1, borrow α2) in
    match_operator
      α3
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | (_, _) =>
            let γ0_0 := Tuple.Access.left γ in
            let γ0_1 := Tuple.Access.right γ in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 : ref i32.t := M.read left_val in
            let* α1 : i32.t := M.read (deref α0) in
            let* α2 : ref i32.t := M.read right_val in
            let* α3 : i32.t := M.read (deref α2) in
            let* α4 : M.Val bool.t :=
              M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 : ref i32.t := M.read left_val in
              let* α2 : ref i32.t := M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.

(*
    fn test_bad_add() {
        // This assert would fire and test will fail.
        // Please note, that private functions can be tested too!
        assert_eq!(bad_add(1, 2), 3);
    }
*)
Definition test_bad_add : M unit :=
  let* _ : M.Val unit :=
    let* α0 : i32.t :=
      M.call
        (unit_testing.bad_add
          ((Integer.of_Z 1) : i32.t)
          ((Integer.of_Z 2) : i32.t)) in
    let* α1 : M.Val i32.t := M.alloc α0 in
    let* α2 : M.Val i32.t := M.alloc ((Integer.of_Z 3) : i32.t) in
    let* α3 : M.Val ((ref i32.t) * (ref i32.t)) :=
      M.alloc (borrow α1, borrow α2) in
    match_operator
      α3
      [
        fun γ =>
          (let* α0 := M.read γ in
          match α0 with
          | (_, _) =>
            let γ0_0 := Tuple.Access.left γ in
            let γ0_1 := Tuple.Access.right γ in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 : ref i32.t := M.read left_val in
            let* α1 : i32.t := M.read (deref α0) in
            let* α2 : ref i32.t := M.read right_val in
            let* α3 : i32.t := M.read (deref α2) in
            let* α4 : M.Val bool.t :=
              M.alloc (UnOp.not (BinOp.Pure.eq α1 α3)) in
            let* α5 : bool.t := M.read (use α4) in
            if α5 then
              let* kind : M.Val core.panicking.AssertKind.t :=
                M.alloc core.panicking.AssertKind.Eq in
              let* α0 : core.panicking.AssertKind.t := M.read kind in
              let* α1 : ref i32.t := M.read left_val in
              let* α2 : ref i32.t := M.read right_val in
              let* α3 : never.t :=
                M.call
                  (core.panicking.assert_failed
                    α0
                    α1
                    α2
                    core.option.Option.None) in
              let* α0 : M.Val never.t := M.alloc α3 in
              let* α1 := M.read α0 in
              let* α2 : unit := never_to_any α1 in
              M.alloc α2
            else
              M.alloc tt
          end) :
          M (M.Val unit)
      ] in
  let* α0 : M.Val unit := M.alloc tt in
  M.read α0.
